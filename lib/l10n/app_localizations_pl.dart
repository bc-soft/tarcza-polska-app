// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class AppLocalizationsPl extends AppLocalizations {
  AppLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get appTitle => 'Tarcza';

  @override
  String get navMap => 'Mapa';

  @override
  String get navReport => 'Zgłoś';

  @override
  String get navAlerts => 'Alerty';

  @override
  String get navMore => 'Więcej';

  @override
  String get commonRetry => 'Spróbuj ponownie';

  @override
  String get commonCancel => 'Anuluj';

  @override
  String get commonClose => 'Zamknij';

  @override
  String get commonContinue => 'Dalej';

  @override
  String get commonBack => 'Wstecz';

  @override
  String get commonSkip => 'Pomiń';

  @override
  String get commonNotNow => 'Nie teraz';

  @override
  String get commonSave => 'Zapisz';

  @override
  String get commonOk => 'OK';

  @override
  String get errorNetwork => 'Brak połączenia z internetem. Sprawdź sieć i spróbuj ponownie.';

  @override
  String get errorGeneric => 'Coś poszło nie tak. Spróbuj ponownie.';

  @override
  String get errorNotFound => 'Nie znaleziono — informacja mogła już wygasnąć.';

  @override
  String get timeJustNow => 'przed chwilą';

  @override
  String timeMinutesAgo(int count) {
    return '$count min temu';
  }

  @override
  String timeHoursAgo(int count) {
    return '$count godz. temu';
  }

  @override
  String timeDaysAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dni temu',
      one: 'wczoraj',
    );
    return '$_temp0';
  }

  @override
  String distanceMeters(int meters) {
    return '$meters m';
  }

  @override
  String distanceKm(String km) {
    return '$km km';
  }

  @override
  String confidencePercent(int percent) {
    return '$percent%';
  }

  @override
  String communityAgreement(int percent) {
    return 'Problem zgłasza $percent% odpowiadających';
  }

  @override
  String communityReports(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count zgłoszenia',
      many: '$count zgłoszeń',
      few: '$count zgłoszenia',
      one: '1 zgłoszenie',
    );
    return '$_temp0';
  }

  @override
  String communityAnswers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count odpowiedzi',
      many: '$count odpowiedzi',
      few: '$count odpowiedzi',
      one: '1 odpowiedź',
      zero: 'brak odpowiedzi',
    );
    return '$_temp0';
  }

  @override
  String get communityNoAnswers => 'Czekamy na odpowiedzi mieszkańców';

  @override
  String get statusDetected => 'Wykryte';

  @override
  String get statusVerifying => 'Trwa weryfikacja';

  @override
  String get statusActive => 'Zasięg ustalony';

  @override
  String get statusResolved => 'Zakończone';

  @override
  String get shelterOpen => 'Otwarty';

  @override
  String get shelterFull => 'Pełny';

  @override
  String get shelterClosed => 'Zamknięty';

  @override
  String get shelterUnknown => 'Brak danych';

  @override
  String get severityInfo => 'Informacja';

  @override
  String get severityWarning => 'Ostrzeżenie';

  @override
  String get severityDanger => 'Zagrożenie';

  @override
  String get confidenceHintUnverified => 'Pojedyncze zgłoszenie — traktuj ostrożnie.';

  @override
  String get confidenceHintLikely => 'Wiele niezależnych zgłoszeń z obszaru.';

  @override
  String get confidenceHintHigh => 'Potwierdzone przez wielu mieszkańców.';

  @override
  String get confidenceHintConfirmed => 'Potwierdzone przez społeczność i źródło oficjalne.';

  @override
  String get onbWelcomeTitle => 'Tarcza — siła jest w nas';

  @override
  String get onbWelcomeBody =>
      'Jedna osoba widzi fragment sytuacji. Razem widzimy całość. Zgłaszaj problemy w okolicy, potwierdzaj zgłoszenia innych i otrzymuj lokalne alerty.';

  @override
  String get onbWelcomeAnon =>
      'Bez konta i bez danych osobowych — aplikacja rejestruje anonimowe urządzenie.';

  @override
  String get onbStart => 'Zaczynamy';

  @override
  String get onbNotificationsTitle => 'Powiadomienia';

  @override
  String get onbNotificationsBody =>
      'Tarcza czasem zapyta Cię o sytuację w okolicy (np. „Czy masz prąd?”) i wyśle alert, gdy zagrożenie zostanie potwierdzone. Odpowiedź zajmuje jedno tapnięcie.';

  @override
  String get onbNotificationsAllow => 'Zezwól na powiadomienia';

  @override
  String get onbHomeTitle => 'Twój adres domowy';

  @override
  String get onbHomeBody =>
      'To Twoja pozycja bazowa — dzięki niej dostaniesz pytania i alerty dla okolicy, w której spędzasz najwięcej czasu. Adres zostaje w telefonie, do Tarczy trafiają tylko współrzędne.';

  @override
  String get onbHomeHint => 'np. Dąbrowskiego 42, Poznań';

  @override
  String get onbHomeSearch => 'Znajdź adres';

  @override
  String get onbHomeSearching => 'Szukamy adresu…';

  @override
  String get onbHomeNotFound =>
      'Nie znaleźliśmy tego adresu. Dodaj miasto albo ustaw pinezkę na mapie.';

  @override
  String get onbHomeAdjust => 'Dotknij mapy, aby poprawić położenie pinezki.';

  @override
  String get onbHomeConfirm => 'Potwierdź adres';

  @override
  String get onbHomeUseDemo => 'Użyj adresu demo (Poznań, Jeżyce)';

  @override
  String get onbHomePinLabel => 'Pinezka na mapie';

  @override
  String get onbLocationTitle => 'Lokalizacja podczas używania';

  @override
  String get onbLocationBody =>
      'Gdy otworzysz aplikację poza domem, Tarcza zaktualizuje Twoją okolicę na podstawie GPS — z dokładnością do ok. 150 m i bez zapisywania historii.';

  @override
  String get onbLocationAllow => 'Zezwól na lokalizację';

  @override
  String get onbLocationSkip => 'Korzystaj tylko z adresu domowego';

  @override
  String get onbWatchTitle => 'Tryb czuwania';

  @override
  String get onbWatchBody =>
      'Włącz tryb czuwania, aby dostawać alerty i pytania tam, gdzie właśnie jesteś — nie tylko w domu. Tarcza nie zapisuje historii Twoich lokalizacji.';

  @override
  String get onbWatchDetail =>
      'Wymaga zgody na lokalizację „zawsze”. Możesz go wyłączyć w ustawieniach jednym przełącznikiem.';

  @override
  String get onbWatchEnable => 'Włącz';

  @override
  String get onbFinishing => 'Przygotowujemy Tarczę…';

  @override
  String get onbRegisterError =>
      'Nie udało się połączyć z Tarczą. Sprawdź połączenie i spróbuj ponownie.';

  @override
  String onbStepOf(int step, int total) {
    return 'Krok $step z $total';
  }

  @override
  String get mapMyLocation => 'Moja pozycja';

  @override
  String get mapHome => 'Dom';

  @override
  String get mapRefresh => 'Odśwież mapę';

  @override
  String get mapNoIncidents => 'Brak aktywnych zagrożeń w widocznym obszarze.';

  @override
  String get mapPendingQuestion => 'Tarcza pyta o Twoją okolicę';

  @override
  String get mapPendingAnswer => 'Odpowiedz';

  @override
  String get mapRefreshFailed => 'Nie udało się odświeżyć mapy. Pokazujemy ostatni stan.';

  @override
  String get mapAreaUndetermined => 'Zasięg jeszcze niewyznaczony';

  @override
  String get mapActiveAlert => 'Aktywny alert w Twojej okolicy';

  @override
  String get mapLocationUpdated => 'Zaktualizowano Twoją okolicę.';

  @override
  String mapIncidentsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count zagrożenia w widocznym obszarze',
      many: '$count zagrożeń w widocznym obszarze',
      few: '$count zagrożenia w widocznym obszarze',
      one: '1 zagrożenie w widocznym obszarze',
    );
    return '$_temp0';
  }

  @override
  String get incidentTitle => 'Szczegóły zagrożenia';

  @override
  String get incidentConfidence => 'Wiarygodność';

  @override
  String get incidentStatus => 'Status';

  @override
  String get incidentCommunity => 'Społeczność';

  @override
  String get incidentStarted => 'Wykryto';

  @override
  String get incidentLastActivity => 'Ostatnia aktywność';

  @override
  String get incidentLastConfirmed => 'Ostatnie potwierdzenie';

  @override
  String get incidentArea => 'Zasięg';

  @override
  String get incidentAreaPolygon =>
      'Obszar wyznaczony na podstawie odpowiedzi mieszkańców. Może się zmieniać.';

  @override
  String get incidentAreaPoint =>
      'Zasięg nie jest jeszcze wyznaczony — system dopytuje mieszkańców.';

  @override
  String get incidentShowOnMap => 'Pokaż na mapie';

  @override
  String get incidentNearestShelter => 'Najbliższy schron';

  @override
  String get incidentReportToo => 'Też to widzę — zgłoś';

  @override
  String get incidentPrivacyNote =>
      'Widzisz dane zagregowane. Nie pokazujemy lokalizacji pojedynczych zgłoszeń.';

  @override
  String get reportTitle => 'Nowe zgłoszenie';

  @override
  String get reportStepType => 'Co się dzieje?';

  @override
  String get reportStepTypeHint => 'Wybierz rodzaj problemu.';

  @override
  String get reportStepLocation => 'Gdzie?';

  @override
  String get reportStepLocationHint =>
      'Domyślnie Twoja pozycja. Dotknij mapy, aby przesunąć pinezkę.';

  @override
  String get reportUseMyLocation => 'Moja pozycja';

  @override
  String get reportUseHome => 'Adres domowy';

  @override
  String get reportStepDescription => 'Opis (opcjonalnie)';

  @override
  String get reportDescriptionHint => 'np. Cała ulica bez światła od 14:30';

  @override
  String get reportSend => 'Wyślij zgłoszenie';

  @override
  String get reportSuccessTitle => 'Dziękujemy';

  @override
  String get reportSuccessBody => 'Dziękujemy, sprawdzamy to z innymi mieszkańcami.';

  @override
  String get reportSuccessPending => 'Łączymy Twoje zgłoszenie z innymi z okolicy…';

  @override
  String get reportSuccessShowMap => 'Pokaż na mapie';

  @override
  String get reportAnother => 'Nowe zgłoszenie';

  @override
  String get reportRateLimited =>
      'Wysłano zbyt wiele zgłoszeń w krótkim czasie. Spróbuj ponownie za kilka minut.';

  @override
  String get reportDescriptionTooLong => 'Opis może mieć maksymalnie 1000 znaków.';

  @override
  String get reportNoLocation => 'Nie znamy Twojej pozycji — dotknij mapy, aby wskazać miejsce.';

  @override
  String reportSuccessJoined(String type, String confidence) {
    return 'Zgłoszenie dołączono do zagrożenia „$type” ($confidence).';
  }

  @override
  String get verificationTitle => 'Pytanie od Tarczy';

  @override
  String get verificationYes => 'TAK';

  @override
  String get verificationNo => 'NIE';

  @override
  String get verificationUnknown => 'NIE WIEM';

  @override
  String get verificationExpired =>
      'Czas na odpowiedź minął. Dziękujemy — zapytamy ponownie, jeśli Twoja odpowiedź będzie potrzebna.';

  @override
  String get verificationAlreadyAnswered => 'Twoja odpowiedź jest już zapisana. Dziękujemy!';

  @override
  String get verificationWhy =>
      'Twoja odpowiedź pomaga ustalić, gdzie dokładnie występuje problem. „NIE WIEM” też pomaga.';

  @override
  String get verificationLater => 'Odpowiem później';

  @override
  String get verificationDone => 'Gotowe';

  @override
  String get verificationLoadError => 'Nie udało się pobrać pytania.';

  @override
  String verificationExpiresIn(int seconds) {
    return 'Pytanie wygaśnie za $seconds s';
  }

  @override
  String get alertsTitle => 'Alerty';

  @override
  String get alertsEmpty => 'Brak aktywnych alertów dla Twojej okolicy.';

  @override
  String get alertsEmptyHint =>
      'Jeśli w Twoim obszarze zostanie potwierdzone zagrożenie, zobaczysz tu komunikat.';

  @override
  String get alertShowOnMap => 'Pokaż na mapie';

  @override
  String get alertNearestShelter => 'Najbliższy schron';

  @override
  String get alertFrom => 'Komunikat dla Twojego obszaru';

  @override
  String alertExpires(String time) {
    return 'Ważny do $time';
  }

  @override
  String get sheltersTitle => 'Schrony';

  @override
  String get sheltersEmpty => 'Brak schronów w pobliżu.';

  @override
  String get shelterCapacity => 'Pojemność';

  @override
  String get shelterLastConfirmed => 'Ostatnie potwierdzenie';

  @override
  String get shelterConfirmations => 'Potwierdzenia';

  @override
  String get shelterNever => 'brak';

  @override
  String get shelterConfirm => 'Potwierdź status';

  @override
  String get shelterConfirmTitle => 'Jaki jest teraz stan schronu?';

  @override
  String get shelterConfirmComment => 'Komentarz (opcjonalnie)';

  @override
  String get shelterConfirmCommentHint => 'np. Wejście od podwórza';

  @override
  String get shelterConfirmSend => 'Wyślij potwierdzenie';

  @override
  String get shelterConfirmed => 'Dziękujemy za potwierdzenie statusu.';

  @override
  String get shelterAddress => 'Adres';

  @override
  String get shelterNearestBadge => 'Najbliższy';

  @override
  String shelterCapacityValue(int count) {
    return '$count osób';
  }

  @override
  String shelterDistance(String distance) {
    return '$distance od Ciebie';
  }

  @override
  String get moreTitle => 'Więcej';

  @override
  String get moreShelters => 'Schrony';

  @override
  String get moreSheltersSub => 'Najbliższe schrony i ich status';

  @override
  String get moreSettings => 'Ustawienia';

  @override
  String get moreSettingsSub => 'Adres domowy, lokalizacja, powiadomienia';

  @override
  String get moreDemo => 'Scenariusz demo';

  @override
  String get moreDemoSub => 'Sterowanie symulacją awarii (tryb mock)';

  @override
  String get moreAbout => 'O Tarczy';

  @override
  String get moreAboutBody =>
      'Tarcza przekształca tysiące pojedynczych obserwacji mieszkańców w jeden wspólny, zweryfikowany obraz sytuacji — aby wykrywać zagrożenia, określać ich rzeczywisty zasięg i dostarczać właściwą informację właściwym osobom. Aplikacja demonstracyjna, nie jest oficjalną aplikacją rządową.';

  @override
  String get settingsTitle => 'Ustawienia';

  @override
  String get settingsHome => 'Adres domowy';

  @override
  String get settingsHomeChange => 'Zmień adres';

  @override
  String get settingsHomeMissing => 'Nie ustawiono';

  @override
  String get settingsNeighbourhood => 'Twoja okolica';

  @override
  String get settingsNeighbourhoodHint =>
      'Tarcza zna tylko obszar ok. 175 m, w którym jesteś — nie dokładny punkt.';

  @override
  String get settingsLocationSource => 'Ostatnia aktualizacja okolicy';

  @override
  String get settingsSourceHome => 'adres domowy';

  @override
  String get settingsSourceGps => 'GPS przy otwarciu';

  @override
  String get settingsSourceBackground => 'tryb czuwania';

  @override
  String get settingsNeverSent => 'jeszcze nie wysłano';

  @override
  String get settingsUseHomeNow => 'Wróć do adresu domowego';

  @override
  String get settingsUpdateNow => 'Zaktualizuj okolicę teraz';

  @override
  String get settingsWatchMode => 'Tryb czuwania';

  @override
  String get settingsWatchModeSub => 'Aktualizuj okolicę w tle (zgoda „zawsze”)';

  @override
  String get settingsWatchDenied =>
      'Tryb czuwania wymaga zgody na lokalizację „zawsze”. Zmień ją w ustawieniach systemu.';

  @override
  String get settingsOpenSystemSettings => 'Ustawienia systemu';

  @override
  String get settingsNotifications => 'Powiadomienia';

  @override
  String get settingsNotificationsSub => 'Pytania weryfikacyjne i alerty';

  @override
  String get settingsNotificationsAllow => 'Zezwól';

  @override
  String get settingsLocationReminders => 'Przypomnienia o lokalizacji';

  @override
  String get settingsLocationRemindersSub =>
      'Rzadkie przypomnienia, aby otworzyć Tarczę poza domem';

  @override
  String get settingsDeveloper => 'Dla deweloperów';

  @override
  String get settingsMode => 'Tryb danych';

  @override
  String get settingsModeMock => 'Mock (bez backendu)';

  @override
  String get settingsResetApp => 'Zresetuj aplikację';

  @override
  String get settingsResetConfirm => 'Usunąć dane lokalne i wrócić do onboardingu?';

  @override
  String get settingsLocationUpdated => 'Okolica zaktualizowana.';

  @override
  String get settingsLocationNoGps => 'Brak dostępu do GPS — używamy adresu domowego.';

  @override
  String get settingsLocationSection => 'Lokalizacja';

  @override
  String get settingsAddressTitle => 'Adres domowy';

  @override
  String get demoTitle => 'Scenariusz demo';

  @override
  String get demoCurrentStep => 'Bieżący krok';

  @override
  String get demoNext => 'Następny krok';

  @override
  String get demoAutoplay => 'Odtwarzaj automatycznie';

  @override
  String get demoAutoplaySub => 'Krok co 8 s; przy pytaniu czeka na odpowiedź';

  @override
  String get demoReset => 'Od początku';

  @override
  String get demoShowOnMap => 'Pokaż obszar demo na mapie';

  @override
  String get demoOnlyMock =>
      'Scenariusz działa tylko w trybie mock (USE_MOCKS=true). Na prawdziwym backendzie użyj make simulate (docs/09).';

  @override
  String get demoFinished => 'Scenariusz zakończony.';

  @override
  String settingsModeRemote(String url) {
    return 'Backend: $url';
  }

  @override
  String settingsLastSent(String source, String time) {
    return '$source, $time';
  }

  @override
  String get onbHomeEnterHint => 'Wpisz adres i wyszukaj albo dotknij mapy, aby wskazać dom.';

  @override
  String get shelterDistanceLabel => 'Odległość';

  @override
  String get commonClear => 'Wyczyść';
}
