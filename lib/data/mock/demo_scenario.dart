import "dart:async";

import "package:latlong2/latlong.dart";

import "package:tarcza_polska/core/push/push_event.dart";
import "package:tarcza_polska/core/push/push_service.dart";
import "package:tarcza_polska/data/mock/geo_shapes.dart";
import "package:tarcza_polska/data/mock/mock_backend.dart";
import "package:tarcza_polska/data/mock/mock_seed.dart";
import "package:tarcza_polska/data/models/models.dart";

/// Kroki scenariusza z `docs/09-demo-scenariusz.md`.
enum DemoStep {
  idle("Start — brak awarii"),
  detected("1. Pierwsze zgłoszenia braku prądu"),
  cluster("2–3. Klaster (42%) i pytanie weryfikacyjne"),
  verified("4. Odpowiedzi NIE — confidence 76%"),
  boundary("5–6. Granica strefy wyznaczona"),
  confirmed("7. Potwierdzone przez operatora (96%)"),
  alerted("8–9. Alert do mieszkańców obszaru");

  DemoStep(this.label);

  final String label;

  DemoStep? get next => index + 1 < values.length ? values[index + 1] : null;
}

/// Odgrywa scenariusz demo na [MockBackend]: ręcznie (`next`) albo timerem
/// (`autoplay`). Odpowiedź użytkownika na pytanie przesuwa scenariusz dalej.
class DemoScenario {
  DemoScenario(this._backend, this._push) {
    _answerSubscription = _backend.answers.listen((record) {
      final (question, _) = record;
      if (question.incidentId == incidentId && _step == DemoStep.cluster) {
        // „System analizuje odpowiedzi” — po chwili confidence rośnie.
        _schedule(const Duration(seconds: 3), next);
      }
    });
  }

  static const incidentId = "incident-demo-power";
  static const verificationId = "verification-demo-1";
  static const alertId = "alert-demo-1";
  static const LatLng center = MockSeed.demoCenter;

  final MockBackend _backend;
  final MockPushService _push;
  late final StreamSubscription<Object?> _answerSubscription;

  final _steps = StreamController<DemoStep>.broadcast();
  DemoStep _step = DemoStep.idle;
  Timer? _autoplayTimer;
  Timer? _pendingTimer;

  DemoStep get step => _step;

  Stream<DemoStep> get steps => _steps.stream;

  bool get autoplay => _autoplayTimer != null;

  void setAutoplay({required bool enabled}) {
    _autoplayTimer?.cancel();
    _autoplayTimer = null;
    if (!enabled) return;
    _autoplayTimer = Timer.periodic(const Duration(seconds: 8), (_) {
      // Na kroku z pytaniem czekamy na odpowiedź (albo wygaśnięcie pytania).
      final waiting = _step == DemoStep.cluster && _backend.pendingQuestions().isNotEmpty;
      if (_step.next == null) {
        setAutoplay(enabled: false);
      } else if (!waiting) {
        next();
      }
    });
    _steps.add(_step);
  }

  void next() {
    final target = _step.next;
    if (target != null) goTo(target);
  }

  void reset() {
    _pendingTimer?.cancel();
    setAutoplay(enabled: false);
    _backend.reset();
    _step = DemoStep.idle;
    _steps.add(_step);
  }

  void goTo(DemoStep target) {
    _pendingTimer?.cancel();
    _step = target;
    _apply(target);
    _backend.notify();
    _steps.add(target);
  }

  void _schedule(Duration delay, void Function() action) {
    _pendingTimer?.cancel();
    _pendingTimer = Timer(delay, action);
  }

  void _apply(DemoStep step) {
    final t = _backend.now;
    switch (step) {
      case DemoStep.idle:
        _backend.incidents.remove(incidentId);
        _backend.timelines.remove(incidentId);
        _backend.alerts.remove(alertId);
        _backend.questions.remove(verificationId);
      case DemoStep.detected:
        _backend.timelines.remove(incidentId);
        _backend.addTimeline(incidentId, "created", "Wykryto skupisko zgłoszeń", {"reports": 3});
        _putIncident(
          status: IncidentStatus.detected,
          level: ConfidenceLevel.unverified,
          score: 0.24,
          community: const Community(reports: 3),
          area: const GeoArea.point(center),
        );
      case DemoStep.cluster:
        _putIncident(
          status: IncidentStatus.verifying,
          level: ConfidenceLevel.likely,
          score: 0.42,
          community: const Community(reports: 5),
          area: GeoShapes.hexArea(center, radiusMeters: 380, radial: const [1, 0.85, 1.1, 0.95]),
        );
        _backend
          ..addTimeline(incidentId, "confidence_changed", "Zmienił się poziom wiarygodności", {
            "from": "unverified",
            "to": "likely",
          })
          ..addTimeline(incidentId, "wave_started", "Wysłano falę pytań weryfikacyjnych", {
            "ring": 0,
            "cells": 7,
          });
        _askQuestion(t);
      case DemoStep.verified:
        _backend
          ..addTimeline(incidentId, "wave_closed", "Zakończono falę pytań")
          ..addTimeline(incidentId, "confidence_changed", "Zmienił się poziom wiarygodności", {
            "from": "likely",
            "to": "high",
          });
        _putIncident(
          status: IncidentStatus.verifying,
          level: ConfidenceLevel.high,
          score: 0.76,
          community: const Community(reports: 7, answers: 38, agreementPct: 84),
          area: GeoShapes.hexArea(
            center,
            radiusMeters: 650,
            radial: const [1, 0.9, 1.15, 1.05, 0.9, 1],
          ),
        );
      case DemoStep.boundary:
        _backend.addTimeline(incidentId, "area_changed", "Zmienił się zasięg incydentu");
        // Część pytanych dalej od centrum odpowiada TAK — granica zawęża się na wschodzie.
        _putIncident(
          status: IncidentStatus.active,
          level: ConfidenceLevel.high,
          score: 0.81,
          community: const Community(reports: 8, answers: 64, agreementPct: 86),
          area: GeoShapes.hexArea(
            GeoShapes.offset(center, northMeters: 60, eastMeters: -90),
            radiusMeters: 640,
            radial: const [0.55, 0.8, 1.25, 1.2, 1.05, 0.95, 0.75, 0.6],
          ),
        );
      case DemoStep.confirmed:
        _backend
          ..addTimeline(incidentId, "source_added", "Dodano źródło: operator sieci energetycznej")
          ..addTimeline(incidentId, "confidence_changed", "Zmienił się poziom wiarygodności", {
            "from": "high",
            "to": "confirmed",
          });
        final current = _backend.incidents[incidentId];
        _putIncident(
          status: IncidentStatus.active,
          level: ConfidenceLevel.confirmed,
          score: 0.96,
          community: const Community(reports: 9, answers: 71, agreementPct: 86),
          area: current?.area ?? GeoShapes.hexArea(center, radiusMeters: 640),
          summary:
              "Operator sieci energetycznej potwierdza awarię. "
              "Przewidywany czas usunięcia: ok. 3 godziny.",
          lastConfirmedAt: t,
        );
      case DemoStep.alerted:
        _backend.addTimeline(incidentId, "alert_published", "Wysłano komunikat do obszaru");
        final incident = _backend.incidents[incidentId];
        _backend.alerts[alertId] = Alert(
          id: alertId,
          title: "Potwierdzono awarię prądu",
          body:
              "Problem zgłasza 86% odpowiadających użytkowników w Twojej okolicy. "
              "Najbliższy otwarty punkt pomocy: Schron — Szkoła Podstawowa, ul. Kościelna 12.",
          severity: AlertSeverity.warning,
          incidentId: incidentId,
          createdAt: t,
          expiresAt: t.add(const Duration(hours: 3)),
          area: incident?.area,
        );
        unawaited(
          _push.simulate(
            const AlertPushEvent(alertId: alertId),
            title: "Potwierdzono awarię prądu",
            body: "Problem zgłasza większość użytkowników w Twojej okolicy.",
          ),
        );
    }
  }

  void _putIncident({
    required IncidentStatus status,
    required ConfidenceLevel level,
    required double score,
    required Community community,
    required GeoArea area,
    String? summary,
    DateTime? lastConfirmedAt,
  }) {
    final t = _backend.now;
    final existing = _backend.incidents[incidentId];
    _backend.incidents[incidentId] = Incident(
      id: incidentId,
      type: IncidentType.powerOutage,
      typeLabel: MockSeed.typeLabel(IncidentType.powerOutage),
      status: status,
      confidenceLevel: level,
      confidenceLabel: MockSeed.confidenceLabels[level]!,
      confidenceScore: score,
      startedAt: existing?.startedAt ?? t,
      lastActivityAt: t,
      lastConfirmedAt: lastConfirmedAt ?? existing?.lastConfirmedAt,
      community: community,
      summary: summary,
      area: area,
    );
  }

  void _askQuestion(DateTime t) {
    _backend.questions[verificationId] = VerificationQuestion(
      verificationId: verificationId,
      incidentId: incidentId,
      type: IncidentType.powerOutage,
      typeLabel: MockSeed.typeLabel(IncidentType.powerOutage),
      question: "Czy w tej chwili masz dostęp do prądu?",
      context: "W Twojej okolicy zgłoszono: brak prądu.",
      sentAt: t,
      expiresAt: t.add(const Duration(seconds: 90)),
    );
    unawaited(
      _push.simulate(
        VerificationPushEvent(
          verificationId: verificationId,
          incidentId: incidentId,
          incidentType: IncidentType.powerOutage.apiValue,
          expiresAt: t.add(const Duration(seconds: 90)),
        ),
        title: "Tarcza pyta o Twoją okolicę",
        body: "Czy w tej chwili masz dostęp do prądu?",
      ),
    );
  }

  Future<void> dispose() async {
    _autoplayTimer?.cancel();
    _pendingTimer?.cancel();
    await _answerSubscription.cancel();
    await _steps.close();
  }
}
