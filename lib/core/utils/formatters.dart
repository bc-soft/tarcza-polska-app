import "package:flutter/widgets.dart";
import "package:intl/intl.dart";

import "package:tarcza_polska/core/error/failures.dart";
import "package:tarcza_polska/l10n/app_localizations.dart";

extension L10nContext on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}

abstract final class Formatters {
  static String relative(AppLocalizations l10n, DateTime time, {DateTime? now}) {
    final diff = (now ?? DateTime.now()).difference(time);
    if (diff.inMinutes < 1) return l10n.timeJustNow;
    if (diff.inHours < 1) return l10n.timeMinutesAgo(diff.inMinutes);
    if (diff.inDays < 1) return l10n.timeHoursAgo(diff.inHours);
    return l10n.timeDaysAgo(diff.inDays);
  }

  static String clock(DateTime time) => DateFormat.Hm("pl").format(time.toLocal());

  static String dateTime(DateTime time) => DateFormat("d MMM, HH:mm", "pl").format(time.toLocal());

  static String distance(AppLocalizations l10n, double meters) {
    if (meters < 1000) return l10n.distanceMeters((meters / 10).round() * 10);
    return l10n.distanceKm(NumberFormat("0.0", "pl").format(meters / 1000));
  }

  static int percent(double score) => (score * 100).round();

  /// Komunikat UI dla błędu domenowego.
  static String failure(AppLocalizations l10n, Object error) => switch (error) {
    NetworkFailure() => l10n.errorNetwork,
    NotFoundFailure() => l10n.errorNotFound,
    RateLimitedFailure() => l10n.reportRateLimited,
    _ => l10n.errorGeneric,
  };
}
