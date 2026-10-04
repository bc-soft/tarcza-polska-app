import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_pl.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('pl')];

  /// No description provided for @appTitle.
  ///
  /// In pl, this message translates to:
  /// **'Tarcza'**
  String get appTitle;

  /// No description provided for @navMap.
  ///
  /// In pl, this message translates to:
  /// **'Mapa'**
  String get navMap;

  /// No description provided for @navReport.
  ///
  /// In pl, this message translates to:
  /// **'Zgłoś'**
  String get navReport;

  /// No description provided for @navAlerts.
  ///
  /// In pl, this message translates to:
  /// **'Alerty'**
  String get navAlerts;

  /// No description provided for @navMore.
  ///
  /// In pl, this message translates to:
  /// **'Więcej'**
  String get navMore;

  /// No description provided for @commonRetry.
  ///
  /// In pl, this message translates to:
  /// **'Spróbuj ponownie'**
  String get commonRetry;

  /// No description provided for @commonCancel.
  ///
  /// In pl, this message translates to:
  /// **'Anuluj'**
  String get commonCancel;

  /// No description provided for @commonClose.
  ///
  /// In pl, this message translates to:
  /// **'Zamknij'**
  String get commonClose;

  /// No description provided for @commonContinue.
  ///
  /// In pl, this message translates to:
  /// **'Dalej'**
  String get commonContinue;

  /// No description provided for @commonBack.
  ///
  /// In pl, this message translates to:
  /// **'Wstecz'**
  String get commonBack;

  /// No description provided for @commonSkip.
  ///
  /// In pl, this message translates to:
  /// **'Pomiń'**
  String get commonSkip;

  /// No description provided for @commonNotNow.
  ///
  /// In pl, this message translates to:
  /// **'Nie teraz'**
  String get commonNotNow;

  /// No description provided for @commonSave.
  ///
  /// In pl, this message translates to:
  /// **'Zapisz'**
  String get commonSave;

  /// No description provided for @commonOk.
  ///
  /// In pl, this message translates to:
  /// **'OK'**
  String get commonOk;

  /// No description provided for @errorNetwork.
  ///
  /// In pl, this message translates to:
  /// **'Brak połączenia z internetem. Sprawdź sieć i spróbuj ponownie.'**
  String get errorNetwork;

  /// No description provided for @errorGeneric.
  ///
  /// In pl, this message translates to:
  /// **'Coś poszło nie tak. Spróbuj ponownie.'**
  String get errorGeneric;

  /// No description provided for @errorNotFound.
  ///
  /// In pl, this message translates to:
  /// **'Nie znaleziono — informacja mogła już wygasnąć.'**
  String get errorNotFound;

  /// No description provided for @timeJustNow.
  ///
  /// In pl, this message translates to:
  /// **'przed chwilą'**
  String get timeJustNow;

  /// No description provided for @timeMinutesAgo.
  ///
  /// In pl, this message translates to:
  /// **'{count} min temu'**
  String timeMinutesAgo(int count);

  /// No description provided for @timeHoursAgo.
  ///
  /// In pl, this message translates to:
  /// **'{count} godz. temu'**
  String timeHoursAgo(int count);

  /// No description provided for @timeDaysAgo.
  ///
  /// In pl, this message translates to:
  /// **'{count, plural, =1{wczoraj} other{{count} dni temu}}'**
  String timeDaysAgo(int count);

  /// No description provided for @distanceMeters.
  ///
  /// In pl, this message translates to:
  /// **'{meters} m'**
  String distanceMeters(int meters);

  /// No description provided for @distanceKm.
  ///
  /// In pl, this message translates to:
  /// **'{km} km'**
  String distanceKm(String km);

  /// No description provided for @confidencePercent.
  ///
  /// In pl, this message translates to:
  /// **'{percent}%'**
  String confidencePercent(int percent);

  /// No description provided for @communityAgreement.
  ///
  /// In pl, this message translates to:
  /// **'Problem zgłasza {percent}% odpowiadających'**
  String communityAgreement(int percent);

  /// No description provided for @communityReports.
  ///
  /// In pl, this message translates to:
  /// **'{count, plural, =1{1 zgłoszenie} few{{count} zgłoszenia} many{{count} zgłoszeń} other{{count} zgłoszenia}}'**
  String communityReports(int count);

  /// No description provided for @communityAnswers.
  ///
  /// In pl, this message translates to:
  /// **'{count, plural, =0{brak odpowiedzi} =1{1 odpowiedź} few{{count} odpowiedzi} many{{count} odpowiedzi} other{{count} odpowiedzi}}'**
  String communityAnswers(int count);

  /// No description provided for @communityNoAnswers.
  ///
  /// In pl, this message translates to:
  /// **'Czekamy na odpowiedzi mieszkańców'**
  String get communityNoAnswers;

  /// No description provided for @statusDetected.
  ///
  /// In pl, this message translates to:
  /// **'Wykryte'**
  String get statusDetected;

  /// No description provided for @statusVerifying.
  ///
  /// In pl, this message translates to:
  /// **'Trwa weryfikacja'**
  String get statusVerifying;

  /// No description provided for @statusActive.
  ///
  /// In pl, this message translates to:
  /// **'Zasięg ustalony'**
  String get statusActive;

  /// No description provided for @statusResolved.
  ///
  /// In pl, this message translates to:
  /// **'Zakończone'**
  String get statusResolved;

  /// No description provided for @shelterOpen.
  ///
  /// In pl, this message translates to:
  /// **'Otwarty'**
  String get shelterOpen;

  /// No description provided for @shelterFull.
  ///
  /// In pl, this message translates to:
  /// **'Pełny'**
  String get shelterFull;

  /// No description provided for @shelterClosed.
  ///
  /// In pl, this message translates to:
  /// **'Zamknięty'**
  String get shelterClosed;

  /// No description provided for @shelterUnknown.
  ///
  /// In pl, this message translates to:
  /// **'Brak danych'**
  String get shelterUnknown;

  /// No description provided for @severityInfo.
  ///
  /// In pl, this message translates to:
  /// **'Informacja'**
  String get severityInfo;

  /// No description provided for @severityWarning.
  ///
  /// In pl, this message translates to:
  /// **'Ostrzeżenie'**
  String get severityWarning;

  /// No description provided for @severityDanger.
  ///
  /// In pl, this message translates to:
  /// **'Zagrożenie'**
  String get severityDanger;

  /// No description provided for @confidenceHintUnverified.
  ///
  /// In pl, this message translates to:
  /// **'Pojedyncze zgłoszenie — traktuj ostrożnie.'**
  String get confidenceHintUnverified;

  /// No description provided for @confidenceHintLikely.
  ///
  /// In pl, this message translates to:
  /// **'Wiele niezależnych zgłoszeń z obszaru.'**
  String get confidenceHintLikely;

  /// No description provided for @confidenceHintHigh.
  ///
  /// In pl, this message translates to:
  /// **'Potwierdzone przez wielu mieszkańców.'**
  String get confidenceHintHigh;

  /// No description provided for @confidenceHintConfirmed.
  ///
  /// In pl, this message translates to:
  /// **'Potwierdzone przez społeczność i źródło oficjalne.'**
  String get confidenceHintConfirmed;

  /// No description provided for @onbWelcomeTitle.
  ///
  /// In pl, this message translates to:
  /// **'Tarcza — siła jest w nas'**
  String get onbWelcomeTitle;

  /// No description provided for @onbWelcomeBody.
  ///
  /// In pl, this message translates to:
  /// **'Jedna osoba widzi fragment sytuacji. Razem widzimy całość. Zgłaszaj problemy w okolicy, potwierdzaj zgłoszenia innych i otrzymuj lokalne alerty.'**
  String get onbWelcomeBody;

  /// No description provided for @onbWelcomeAnon.
  ///
  /// In pl, this message translates to:
  /// **'Bez konta i bez danych osobowych — aplikacja rejestruje anonimowe urządzenie.'**
  String get onbWelcomeAnon;

  /// No description provided for @onbStart.
  ///
  /// In pl, this message translates to:
  /// **'Zaczynamy'**
  String get onbStart;

  /// No description provided for @onbNotificationsTitle.
  ///
  /// In pl, this message translates to:
  /// **'Powiadomienia'**
  String get onbNotificationsTitle;

  /// No description provided for @onbNotificationsBody.
  ///
  /// In pl, this message translates to:
  /// **'Tarcza czasem zapyta Cię o sytuację w okolicy (np. „Czy masz prąd?”) i wyśle alert, gdy zagrożenie zostanie potwierdzone. Odpowiedź zajmuje jedno tapnięcie.'**
  String get onbNotificationsBody;

  /// No description provided for @onbNotificationsAllow.
  ///
  /// In pl, this message translates to:
  /// **'Zezwól na powiadomienia'**
  String get onbNotificationsAllow;

  /// No description provided for @onbHomeTitle.
  ///
  /// In pl, this message translates to:
  /// **'Twój adres domowy'**
  String get onbHomeTitle;

  /// No description provided for @onbHomeBody.
  ///
  /// In pl, this message translates to:
  /// **'To Twoja pozycja bazowa — dzięki niej dostaniesz pytania i alerty dla okolicy, w której spędzasz najwięcej czasu. Adres zostaje w telefonie, do Tarczy trafiają tylko współrzędne.'**
  String get onbHomeBody;

  /// No description provided for @onbHomeHint.
  ///
  /// In pl, this message translates to:
  /// **'np. Dąbrowskiego 42, Poznań'**
  String get onbHomeHint;

  /// No description provided for @onbHomeSearch.
  ///
  /// In pl, this message translates to:
  /// **'Znajdź adres'**
  String get onbHomeSearch;

  /// No description provided for @onbHomeSearching.
  ///
  /// In pl, this message translates to:
  /// **'Szukamy adresu…'**
  String get onbHomeSearching;

  /// No description provided for @onbHomeNotFound.
  ///
  /// In pl, this message translates to:
  /// **'Nie znaleźliśmy tego adresu. Dodaj miasto albo ustaw pinezkę na mapie.'**
  String get onbHomeNotFound;

  /// No description provided for @onbHomeAdjust.
  ///
  /// In pl, this message translates to:
  /// **'Dotknij mapy, aby poprawić położenie pinezki.'**
  String get onbHomeAdjust;

  /// No description provided for @onbHomeConfirm.
  ///
  /// In pl, this message translates to:
  /// **'Potwierdź adres'**
  String get onbHomeConfirm;

  /// No description provided for @onbHomeUseDemo.
  ///
  /// In pl, this message translates to:
  /// **'Użyj adresu demo (Poznań, Jeżyce)'**
  String get onbHomeUseDemo;

  /// No description provided for @onbHomePinLabel.
  ///
  /// In pl, this message translates to:
  /// **'Pinezka na mapie'**
  String get onbHomePinLabel;

  /// No description provided for @onbLocationTitle.
  ///
  /// In pl, this message translates to:
  /// **'Lokalizacja podczas używania'**
  String get onbLocationTitle;

  /// No description provided for @onbLocationBody.
  ///
  /// In pl, this message translates to:
  /// **'Gdy otworzysz aplikację poza domem, Tarcza zaktualizuje Twoją okolicę na podstawie GPS — z dokładnością do ok. 150 m i bez zapisywania historii.'**
  String get onbLocationBody;

  /// No description provided for @onbLocationAllow.
  ///
  /// In pl, this message translates to:
  /// **'Zezwól na lokalizację'**
  String get onbLocationAllow;

  /// No description provided for @onbLocationSkip.
  ///
  /// In pl, this message translates to:
  /// **'Korzystaj tylko z adresu domowego'**
  String get onbLocationSkip;

  /// No description provided for @onbWatchTitle.
  ///
  /// In pl, this message translates to:
  /// **'Tryb czuwania'**
  String get onbWatchTitle;

  /// No description provided for @onbWatchBody.
  ///
  /// In pl, this message translates to:
  /// **'Włącz tryb czuwania, aby dostawać alerty i pytania tam, gdzie właśnie jesteś — nie tylko w domu. Tarcza nie zapisuje historii Twoich lokalizacji.'**
  String get onbWatchBody;

  /// No description provided for @onbWatchDetail.
  ///
  /// In pl, this message translates to:
  /// **'Wymaga zgody na lokalizację „zawsze”. Możesz go wyłączyć w ustawieniach jednym przełącznikiem.'**
  String get onbWatchDetail;

  /// No description provided for @onbWatchEnable.
  ///
  /// In pl, this message translates to:
  /// **'Włącz'**
  String get onbWatchEnable;

  /// No description provided for @onbFinishing.
  ///
  /// In pl, this message translates to:
  /// **'Przygotowujemy Tarczę…'**
  String get onbFinishing;

  /// No description provided for @onbRegisterError.
  ///
  /// In pl, this message translates to:
  /// **'Nie udało się połączyć z Tarczą. Sprawdź połączenie i spróbuj ponownie.'**
  String get onbRegisterError;

  /// No description provided for @onbStepOf.
  ///
  /// In pl, this message translates to:
  /// **'Krok {step} z {total}'**
  String onbStepOf(int step, int total);

  /// No description provided for @mapMyLocation.
  ///
  /// In pl, this message translates to:
  /// **'Moja pozycja'**
  String get mapMyLocation;

  /// No description provided for @mapHome.
  ///
  /// In pl, this message translates to:
  /// **'Dom'**
  String get mapHome;

  /// No description provided for @mapRefresh.
  ///
  /// In pl, this message translates to:
  /// **'Odśwież mapę'**
  String get mapRefresh;

  /// No description provided for @mapNoIncidents.
  ///
  /// In pl, this message translates to:
  /// **'Brak aktywnych zagrożeń w widocznym obszarze.'**
  String get mapNoIncidents;

  /// No description provided for @mapPendingQuestion.
  ///
  /// In pl, this message translates to:
  /// **'Tarcza pyta o Twoją okolicę'**
  String get mapPendingQuestion;

  /// No description provided for @mapPendingAnswer.
  ///
  /// In pl, this message translates to:
  /// **'Odpowiedz'**
  String get mapPendingAnswer;

  /// No description provided for @mapRefreshFailed.
  ///
  /// In pl, this message translates to:
  /// **'Nie udało się odświeżyć mapy. Pokazujemy ostatni stan.'**
  String get mapRefreshFailed;

  /// No description provided for @mapAreaUndetermined.
  ///
  /// In pl, this message translates to:
  /// **'Zasięg jeszcze niewyznaczony'**
  String get mapAreaUndetermined;

  /// No description provided for @mapActiveAlert.
  ///
  /// In pl, this message translates to:
  /// **'Aktywny alert w Twojej okolicy'**
  String get mapActiveAlert;

  /// No description provided for @mapLocationUpdated.
  ///
  /// In pl, this message translates to:
  /// **'Zaktualizowano Twoją okolicę.'**
  String get mapLocationUpdated;

  /// No description provided for @mapIncidentsCount.
  ///
  /// In pl, this message translates to:
  /// **'{count, plural, =1{1 zagrożenie w widocznym obszarze} few{{count} zagrożenia w widocznym obszarze} many{{count} zagrożeń w widocznym obszarze} other{{count} zagrożenia w widocznym obszarze}}'**
  String mapIncidentsCount(int count);

  /// No description provided for @statLive.
  ///
  /// In pl, this message translates to:
  /// **'Na żywo'**
  String get statLive;

  /// No description provided for @mapSituational.
  ///
  /// In pl, this message translates to:
  /// **'Mapa sytuacyjna'**
  String get mapSituational;

  /// No description provided for @mapCommandCenter.
  ///
  /// In pl, this message translates to:
  /// **'Tarcza Polska'**
  String get mapCommandCenter;

  /// No description provided for @incidentIncident.
  ///
  /// In pl, this message translates to:
  /// **'Incydent'**
  String get incidentIncident;

  /// No description provided for @incidentCell.
  ///
  /// In pl, this message translates to:
  /// **'Komórka'**
  String get incidentCell;

  /// No description provided for @incidentTitle.
  ///
  /// In pl, this message translates to:
  /// **'Szczegóły zagrożenia'**
  String get incidentTitle;

  /// No description provided for @incidentConfidence.
  ///
  /// In pl, this message translates to:
  /// **'Wiarygodność'**
  String get incidentConfidence;

  /// No description provided for @incidentStatus.
  ///
  /// In pl, this message translates to:
  /// **'Status'**
  String get incidentStatus;

  /// No description provided for @incidentCommunity.
  ///
  /// In pl, this message translates to:
  /// **'Społeczność'**
  String get incidentCommunity;

  /// No description provided for @incidentStarted.
  ///
  /// In pl, this message translates to:
  /// **'Wykryto'**
  String get incidentStarted;

  /// No description provided for @incidentLastActivity.
  ///
  /// In pl, this message translates to:
  /// **'Ostatnia aktywność'**
  String get incidentLastActivity;

  /// No description provided for @incidentLastConfirmed.
  ///
  /// In pl, this message translates to:
  /// **'Ostatnie potwierdzenie'**
  String get incidentLastConfirmed;

  /// No description provided for @incidentArea.
  ///
  /// In pl, this message translates to:
  /// **'Zasięg'**
  String get incidentArea;

  /// No description provided for @incidentAreaPolygon.
  ///
  /// In pl, this message translates to:
  /// **'Obszar wyznaczony na podstawie odpowiedzi mieszkańców. Może się zmieniać.'**
  String get incidentAreaPolygon;

  /// No description provided for @incidentAreaPoint.
  ///
  /// In pl, this message translates to:
  /// **'Zasięg nie jest jeszcze wyznaczony — system dopytuje mieszkańców.'**
  String get incidentAreaPoint;

  /// No description provided for @incidentShowOnMap.
  ///
  /// In pl, this message translates to:
  /// **'Pokaż na mapie'**
  String get incidentShowOnMap;

  /// No description provided for @incidentNearestShelter.
  ///
  /// In pl, this message translates to:
  /// **'Najbliższy schron'**
  String get incidentNearestShelter;

  /// No description provided for @incidentReportToo.
  ///
  /// In pl, this message translates to:
  /// **'Też to widzę — zgłoś'**
  String get incidentReportToo;

  /// No description provided for @incidentPrivacyNote.
  ///
  /// In pl, this message translates to:
  /// **'Widzisz dane zagregowane. Nie pokazujemy lokalizacji pojedynczych zgłoszeń.'**
  String get incidentPrivacyNote;

  /// No description provided for @reportTitle.
  ///
  /// In pl, this message translates to:
  /// **'Nowe zgłoszenie'**
  String get reportTitle;

  /// No description provided for @reportStepType.
  ///
  /// In pl, this message translates to:
  /// **'Co się dzieje?'**
  String get reportStepType;

  /// No description provided for @reportStepTypeHint.
  ///
  /// In pl, this message translates to:
  /// **'Wybierz rodzaj problemu.'**
  String get reportStepTypeHint;

  /// No description provided for @reportStepLocation.
  ///
  /// In pl, this message translates to:
  /// **'Gdzie?'**
  String get reportStepLocation;

  /// No description provided for @reportStepLocationHint.
  ///
  /// In pl, this message translates to:
  /// **'Domyślnie Twoja pozycja. Dotknij mapy, aby przesunąć pinezkę.'**
  String get reportStepLocationHint;

  /// No description provided for @reportUseMyLocation.
  ///
  /// In pl, this message translates to:
  /// **'Moja pozycja'**
  String get reportUseMyLocation;

  /// No description provided for @reportUseHome.
  ///
  /// In pl, this message translates to:
  /// **'Adres domowy'**
  String get reportUseHome;

  /// No description provided for @reportStepDescription.
  ///
  /// In pl, this message translates to:
  /// **'Opis (opcjonalnie)'**
  String get reportStepDescription;

  /// No description provided for @reportDescriptionHint.
  ///
  /// In pl, this message translates to:
  /// **'np. Cała ulica bez światła od 14:30'**
  String get reportDescriptionHint;

  /// No description provided for @reportSend.
  ///
  /// In pl, this message translates to:
  /// **'Wyślij zgłoszenie'**
  String get reportSend;

  /// No description provided for @reportSuccessTitle.
  ///
  /// In pl, this message translates to:
  /// **'Dziękujemy'**
  String get reportSuccessTitle;

  /// No description provided for @reportSuccessBody.
  ///
  /// In pl, this message translates to:
  /// **'Dziękujemy, sprawdzamy to z innymi mieszkańcami.'**
  String get reportSuccessBody;

  /// No description provided for @reportSuccessPending.
  ///
  /// In pl, this message translates to:
  /// **'Łączymy Twoje zgłoszenie z innymi z okolicy…'**
  String get reportSuccessPending;

  /// No description provided for @reportSuccessShowMap.
  ///
  /// In pl, this message translates to:
  /// **'Pokaż na mapie'**
  String get reportSuccessShowMap;

  /// No description provided for @reportAnother.
  ///
  /// In pl, this message translates to:
  /// **'Nowe zgłoszenie'**
  String get reportAnother;

  /// No description provided for @reportRateLimited.
  ///
  /// In pl, this message translates to:
  /// **'Wysłano zbyt wiele zgłoszeń w krótkim czasie. Spróbuj ponownie za kilka minut.'**
  String get reportRateLimited;

  /// No description provided for @reportDescriptionTooLong.
  ///
  /// In pl, this message translates to:
  /// **'Opis może mieć maksymalnie 1000 znaków.'**
  String get reportDescriptionTooLong;

  /// No description provided for @reportNoLocation.
  ///
  /// In pl, this message translates to:
  /// **'Nie znamy Twojej pozycji — dotknij mapy, aby wskazać miejsce.'**
  String get reportNoLocation;

  /// No description provided for @reportSuccessJoined.
  ///
  /// In pl, this message translates to:
  /// **'Zgłoszenie dołączono do zagrożenia „{type}” ({confidence}).'**
  String reportSuccessJoined(String type, String confidence);

  /// No description provided for @verificationTitle.
  ///
  /// In pl, this message translates to:
  /// **'Pytanie od Tarczy'**
  String get verificationTitle;

  /// No description provided for @verificationYes.
  ///
  /// In pl, this message translates to:
  /// **'TAK'**
  String get verificationYes;

  /// No description provided for @verificationNo.
  ///
  /// In pl, this message translates to:
  /// **'NIE'**
  String get verificationNo;

  /// No description provided for @verificationUnknown.
  ///
  /// In pl, this message translates to:
  /// **'NIE WIEM'**
  String get verificationUnknown;

  /// No description provided for @verificationExpired.
  ///
  /// In pl, this message translates to:
  /// **'Czas na odpowiedź minął. Dziękujemy — zapytamy ponownie, jeśli Twoja odpowiedź będzie potrzebna.'**
  String get verificationExpired;

  /// No description provided for @verificationAlreadyAnswered.
  ///
  /// In pl, this message translates to:
  /// **'Twoja odpowiedź jest już zapisana. Dziękujemy!'**
  String get verificationAlreadyAnswered;

  /// No description provided for @verificationWhy.
  ///
  /// In pl, this message translates to:
  /// **'Twoja odpowiedź pomaga ustalić, gdzie dokładnie występuje problem. „NIE WIEM” też pomaga.'**
  String get verificationWhy;

  /// No description provided for @verificationLater.
  ///
  /// In pl, this message translates to:
  /// **'Odpowiem później'**
  String get verificationLater;

  /// No description provided for @verificationDone.
  ///
  /// In pl, this message translates to:
  /// **'Gotowe'**
  String get verificationDone;

  /// No description provided for @verificationLoadError.
  ///
  /// In pl, this message translates to:
  /// **'Nie udało się pobrać pytania.'**
  String get verificationLoadError;

  /// No description provided for @verificationExpiresIn.
  ///
  /// In pl, this message translates to:
  /// **'Pytanie wygaśnie za {seconds} s'**
  String verificationExpiresIn(int seconds);

  /// No description provided for @alertsTitle.
  ///
  /// In pl, this message translates to:
  /// **'Alerty'**
  String get alertsTitle;

  /// No description provided for @alertsEmpty.
  ///
  /// In pl, this message translates to:
  /// **'Brak aktywnych alertów dla Twojej okolicy.'**
  String get alertsEmpty;

  /// No description provided for @alertsEmptyHint.
  ///
  /// In pl, this message translates to:
  /// **'Jeśli w Twoim obszarze zostanie potwierdzone zagrożenie, zobaczysz tu komunikat.'**
  String get alertsEmptyHint;

  /// No description provided for @alertShowOnMap.
  ///
  /// In pl, this message translates to:
  /// **'Pokaż na mapie'**
  String get alertShowOnMap;

  /// No description provided for @alertNearestShelter.
  ///
  /// In pl, this message translates to:
  /// **'Najbliższy schron'**
  String get alertNearestShelter;

  /// No description provided for @alertFrom.
  ///
  /// In pl, this message translates to:
  /// **'Komunikat dla Twojego obszaru'**
  String get alertFrom;

  /// No description provided for @alertExpires.
  ///
  /// In pl, this message translates to:
  /// **'Ważny do {time}'**
  String alertExpires(String time);

  /// No description provided for @sheltersTitle.
  ///
  /// In pl, this message translates to:
  /// **'Schrony'**
  String get sheltersTitle;

  /// No description provided for @shelterTitle.
  ///
  /// In pl, this message translates to:
  /// **'Schron'**
  String get shelterTitle;

  /// No description provided for @shelterName.
  ///
  /// In pl, this message translates to:
  /// **'Nazwa'**
  String get shelterName;

  /// No description provided for @sheltersEmpty.
  ///
  /// In pl, this message translates to:
  /// **'Brak schronów w pobliżu.'**
  String get sheltersEmpty;

  /// No description provided for @shelterCapacity.
  ///
  /// In pl, this message translates to:
  /// **'Pojemność'**
  String get shelterCapacity;

  /// No description provided for @shelterNever.
  ///
  /// In pl, this message translates to:
  /// **'brak'**
  String get shelterNever;

  /// No description provided for @shelterConfirm.
  ///
  /// In pl, this message translates to:
  /// **'Potwierdź status'**
  String get shelterConfirm;

  /// No description provided for @shelterConfirmTitle.
  ///
  /// In pl, this message translates to:
  /// **'Jaki jest teraz stan schronu?'**
  String get shelterConfirmTitle;

  /// No description provided for @shelterConfirmComment.
  ///
  /// In pl, this message translates to:
  /// **'Komentarz (opcjonalnie)'**
  String get shelterConfirmComment;

  /// No description provided for @shelterConfirmCommentHint.
  ///
  /// In pl, this message translates to:
  /// **'np. Wejście od podwórza'**
  String get shelterConfirmCommentHint;

  /// No description provided for @shelterConfirmSend.
  ///
  /// In pl, this message translates to:
  /// **'Wyślij potwierdzenie'**
  String get shelterConfirmSend;

  /// No description provided for @shelterConfirmed.
  ///
  /// In pl, this message translates to:
  /// **'Dziękujemy za potwierdzenie statusu.'**
  String get shelterConfirmed;

  /// No description provided for @shelterAddress.
  ///
  /// In pl, this message translates to:
  /// **'Adres'**
  String get shelterAddress;

  /// No description provided for @shelterNearestBadge.
  ///
  /// In pl, this message translates to:
  /// **'Najbliższy'**
  String get shelterNearestBadge;

  /// No description provided for @shelterCapacityValue.
  ///
  /// In pl, this message translates to:
  /// **'{count} osób'**
  String shelterCapacityValue(int count);

  /// No description provided for @shelterDistance.
  ///
  /// In pl, this message translates to:
  /// **'{distance} od Ciebie'**
  String shelterDistance(String distance);

  /// No description provided for @moreTitle.
  ///
  /// In pl, this message translates to:
  /// **'Więcej'**
  String get moreTitle;

  /// No description provided for @moreShelters.
  ///
  /// In pl, this message translates to:
  /// **'Schrony'**
  String get moreShelters;

  /// No description provided for @moreSheltersSub.
  ///
  /// In pl, this message translates to:
  /// **'Najbliższe schrony i ich status'**
  String get moreSheltersSub;

  /// No description provided for @moreSettings.
  ///
  /// In pl, this message translates to:
  /// **'Ustawienia'**
  String get moreSettings;

  /// No description provided for @moreSettingsSub.
  ///
  /// In pl, this message translates to:
  /// **'Adres domowy, lokalizacja, powiadomienia'**
  String get moreSettingsSub;

  /// No description provided for @moreDemo.
  ///
  /// In pl, this message translates to:
  /// **'Scenariusz demo'**
  String get moreDemo;

  /// No description provided for @moreDemoSub.
  ///
  /// In pl, this message translates to:
  /// **'Sterowanie symulacją awarii (tryb mock)'**
  String get moreDemoSub;

  /// No description provided for @moreAbout.
  ///
  /// In pl, this message translates to:
  /// **'O Tarczy'**
  String get moreAbout;

  /// No description provided for @moreAboutBody.
  ///
  /// In pl, this message translates to:
  /// **'Tarcza przekształca tysiące pojedynczych obserwacji mieszkańców w jeden wspólny, zweryfikowany obraz sytuacji — aby wykrywać zagrożenia, określać ich rzeczywisty zasięg i dostarczać właściwą informację właściwym osobom. Aplikacja demonstracyjna, nie jest oficjalną aplikacją rządową.'**
  String get moreAboutBody;

  /// No description provided for @settingsTitle.
  ///
  /// In pl, this message translates to:
  /// **'Ustawienia'**
  String get settingsTitle;

  /// No description provided for @settingsHome.
  ///
  /// In pl, this message translates to:
  /// **'Adres domowy'**
  String get settingsHome;

  /// No description provided for @settingsHomeChange.
  ///
  /// In pl, this message translates to:
  /// **'Zmień adres'**
  String get settingsHomeChange;

  /// No description provided for @settingsHomeMissing.
  ///
  /// In pl, this message translates to:
  /// **'Nie ustawiono'**
  String get settingsHomeMissing;

  /// No description provided for @settingsNeighbourhood.
  ///
  /// In pl, this message translates to:
  /// **'Twoja okolica'**
  String get settingsNeighbourhood;

  /// No description provided for @settingsNeighbourhoodHint.
  ///
  /// In pl, this message translates to:
  /// **'Tarcza zna tylko obszar ok. 175 m, w którym jesteś — nie dokładny punkt.'**
  String get settingsNeighbourhoodHint;

  /// No description provided for @settingsLocationSource.
  ///
  /// In pl, this message translates to:
  /// **'Ostatnia aktualizacja okolicy'**
  String get settingsLocationSource;

  /// No description provided for @settingsSourceHome.
  ///
  /// In pl, this message translates to:
  /// **'adres domowy'**
  String get settingsSourceHome;

  /// No description provided for @settingsSourceGps.
  ///
  /// In pl, this message translates to:
  /// **'GPS przy otwarciu'**
  String get settingsSourceGps;

  /// No description provided for @settingsSourceBackground.
  ///
  /// In pl, this message translates to:
  /// **'tryb czuwania'**
  String get settingsSourceBackground;

  /// No description provided for @settingsNeverSent.
  ///
  /// In pl, this message translates to:
  /// **'jeszcze nie wysłano'**
  String get settingsNeverSent;

  /// No description provided for @settingsUseHomeNow.
  ///
  /// In pl, this message translates to:
  /// **'Wróć do adresu domowego'**
  String get settingsUseHomeNow;

  /// No description provided for @settingsUpdateNow.
  ///
  /// In pl, this message translates to:
  /// **'Zaktualizuj okolicę teraz'**
  String get settingsUpdateNow;

  /// No description provided for @settingsWatchMode.
  ///
  /// In pl, this message translates to:
  /// **'Tryb czuwania'**
  String get settingsWatchMode;

  /// No description provided for @settingsWatchModeSub.
  ///
  /// In pl, this message translates to:
  /// **'Aktualizuj okolicę w tle (zgoda „zawsze”)'**
  String get settingsWatchModeSub;

  /// No description provided for @settingsWatchDenied.
  ///
  /// In pl, this message translates to:
  /// **'Tryb czuwania wymaga zgody na lokalizację „zawsze”. Zmień ją w ustawieniach systemu.'**
  String get settingsWatchDenied;

  /// No description provided for @settingsOpenSystemSettings.
  ///
  /// In pl, this message translates to:
  /// **'Ustawienia systemu'**
  String get settingsOpenSystemSettings;

  /// No description provided for @settingsNotifications.
  ///
  /// In pl, this message translates to:
  /// **'Powiadomienia'**
  String get settingsNotifications;

  /// No description provided for @settingsNotificationsSub.
  ///
  /// In pl, this message translates to:
  /// **'Pytania weryfikacyjne i alerty'**
  String get settingsNotificationsSub;

  /// No description provided for @settingsNotificationsAllow.
  ///
  /// In pl, this message translates to:
  /// **'Zezwól'**
  String get settingsNotificationsAllow;

  /// No description provided for @settingsLocationReminders.
  ///
  /// In pl, this message translates to:
  /// **'Przypomnienia o lokalizacji'**
  String get settingsLocationReminders;

  /// No description provided for @settingsLocationRemindersSub.
  ///
  /// In pl, this message translates to:
  /// **'Rzadkie przypomnienia, aby otworzyć Tarczę poza domem'**
  String get settingsLocationRemindersSub;

  /// No description provided for @settingsDeveloper.
  ///
  /// In pl, this message translates to:
  /// **'Dla deweloperów'**
  String get settingsDeveloper;

  /// No description provided for @settingsMode.
  ///
  /// In pl, this message translates to:
  /// **'Tryb danych'**
  String get settingsMode;

  /// No description provided for @settingsModeMock.
  ///
  /// In pl, this message translates to:
  /// **'Mock (bez backendu)'**
  String get settingsModeMock;

  /// No description provided for @settingsResetApp.
  ///
  /// In pl, this message translates to:
  /// **'Zresetuj aplikację'**
  String get settingsResetApp;

  /// No description provided for @settingsResetConfirm.
  ///
  /// In pl, this message translates to:
  /// **'Usunąć dane lokalne i wrócić do onboardingu?'**
  String get settingsResetConfirm;

  /// No description provided for @settingsLocationUpdated.
  ///
  /// In pl, this message translates to:
  /// **'Okolica zaktualizowana.'**
  String get settingsLocationUpdated;

  /// No description provided for @settingsLocationNoGps.
  ///
  /// In pl, this message translates to:
  /// **'Brak dostępu do GPS — używamy adresu domowego.'**
  String get settingsLocationNoGps;

  /// No description provided for @settingsLocationSection.
  ///
  /// In pl, this message translates to:
  /// **'Lokalizacja'**
  String get settingsLocationSection;

  /// No description provided for @settingsAddressTitle.
  ///
  /// In pl, this message translates to:
  /// **'Adres domowy'**
  String get settingsAddressTitle;

  /// No description provided for @demoTitle.
  ///
  /// In pl, this message translates to:
  /// **'Scenariusz demo'**
  String get demoTitle;

  /// No description provided for @demoCurrentStep.
  ///
  /// In pl, this message translates to:
  /// **'Bieżący krok'**
  String get demoCurrentStep;

  /// No description provided for @demoNext.
  ///
  /// In pl, this message translates to:
  /// **'Następny krok'**
  String get demoNext;

  /// No description provided for @demoAutoplay.
  ///
  /// In pl, this message translates to:
  /// **'Odtwarzaj automatycznie'**
  String get demoAutoplay;

  /// No description provided for @demoAutoplaySub.
  ///
  /// In pl, this message translates to:
  /// **'Krok co 8 s; przy pytaniu czeka na odpowiedź'**
  String get demoAutoplaySub;

  /// No description provided for @demoReset.
  ///
  /// In pl, this message translates to:
  /// **'Od początku'**
  String get demoReset;

  /// No description provided for @demoShowOnMap.
  ///
  /// In pl, this message translates to:
  /// **'Pokaż obszar demo na mapie'**
  String get demoShowOnMap;

  /// No description provided for @demoOnlyMock.
  ///
  /// In pl, this message translates to:
  /// **'Scenariusz działa tylko w trybie mock (USE_MOCKS=true). Na prawdziwym backendzie użyj make simulate (docs/09).'**
  String get demoOnlyMock;

  /// No description provided for @demoFinished.
  ///
  /// In pl, this message translates to:
  /// **'Scenariusz zakończony.'**
  String get demoFinished;

  /// No description provided for @settingsModeRemote.
  ///
  /// In pl, this message translates to:
  /// **'Backend: {url}'**
  String settingsModeRemote(String url);

  /// No description provided for @settingsLastSent.
  ///
  /// In pl, this message translates to:
  /// **'{source}, {time}'**
  String settingsLastSent(String source, String time);

  /// No description provided for @onbHomeEnterHint.
  ///
  /// In pl, this message translates to:
  /// **'Wpisz adres i wyszukaj albo dotknij mapy, aby wskazać dom.'**
  String get onbHomeEnterHint;

  /// No description provided for @shelterDistanceLabel.
  ///
  /// In pl, this message translates to:
  /// **'Odległość'**
  String get shelterDistanceLabel;

  /// No description provided for @commonClear.
  ///
  /// In pl, this message translates to:
  /// **'Wyczyść'**
  String get commonClear;

  /// No description provided for @reportRateLimitedFor.
  ///
  /// In pl, this message translates to:
  /// **'Wysłano zbyt wiele zgłoszeń w krótkim czasie. Spróbuj ponownie za {minutes} min.'**
  String reportRateLimitedFor(int minutes);

  /// No description provided for @incidentDetectedAt.
  ///
  /// In pl, this message translates to:
  /// **'Wykryto {date} ({ago})'**
  String incidentDetectedAt(String date, String ago);

  /// No description provided for @mapZoomIn.
  ///
  /// In pl, this message translates to:
  /// **'Przybliż'**
  String get mapZoomIn;

  /// No description provided for @mapZoomOut.
  ///
  /// In pl, this message translates to:
  /// **'Oddal'**
  String get mapZoomOut;

  /// No description provided for @mapAllIncidents.
  ///
  /// In pl, this message translates to:
  /// **'Wszystkie ({count})'**
  String mapAllIncidents(int count);

  /// No description provided for @incidentsTitle.
  ///
  /// In pl, this message translates to:
  /// **'Problemy w okolicy'**
  String get incidentsTitle;

  /// No description provided for @incidentsEmpty.
  ///
  /// In pl, this message translates to:
  /// **'Brak aktywnych problemów w widocznym obszarze mapy.'**
  String get incidentsEmpty;

  /// No description provided for @incidentsHint.
  ///
  /// In pl, this message translates to:
  /// **'Problemy w obszarze widocznym na mapie, od najbardziej wiarygodnych.'**
  String get incidentsHint;

  /// No description provided for @reportTypePowerOutageDesc.
  ///
  /// In pl, this message translates to:
  /// **'Brak zasilania w domu, budynku lub na ulicy'**
  String get reportTypePowerOutageDesc;

  /// No description provided for @reportTypePowerOutageHint.
  ///
  /// In pl, this message translates to:
  /// **'np. Cała ulica bez światła od 14:30, sąsiednie bloki też'**
  String get reportTypePowerOutageHint;

  /// No description provided for @reportTypeWaterOutageDesc.
  ///
  /// In pl, this message translates to:
  /// **'Z kranów nie leci woda albo jest jej bardzo mało'**
  String get reportTypeWaterOutageDesc;

  /// No description provided for @reportTypeWaterOutageHint.
  ///
  /// In pl, this message translates to:
  /// **'np. Brak wody w całym budynku od rana'**
  String get reportTypeWaterOutageHint;

  /// No description provided for @reportTypeFuelShortageDesc.
  ///
  /// In pl, this message translates to:
  /// **'Stacja nie ma paliwa lub są bardzo długie kolejki'**
  String get reportTypeFuelShortageDesc;

  /// No description provided for @reportTypeFuelShortageHint.
  ///
  /// In pl, this message translates to:
  /// **'np. Stacja przy rondzie — brak benzyny, kolejka ok. 30 aut'**
  String get reportTypeFuelShortageHint;

  /// No description provided for @reportTypeRoadBlockedDesc.
  ///
  /// In pl, this message translates to:
  /// **'Droga jest zablokowana albo nie da się przejechać'**
  String get reportTypeRoadBlockedDesc;

  /// No description provided for @reportTypeRoadBlockedHint.
  ///
  /// In pl, this message translates to:
  /// **'np. Powalone drzewo blokuje oba pasy'**
  String get reportTypeRoadBlockedHint;

  /// No description provided for @reportTypeShelterIssueDesc.
  ///
  /// In pl, this message translates to:
  /// **'Schron jest zamknięty, pełny albo niedostępny'**
  String get reportTypeShelterIssueDesc;

  /// No description provided for @reportTypeShelterIssueHint.
  ///
  /// In pl, this message translates to:
  /// **'np. Wejście do schronu zamknięte, brak informacji'**
  String get reportTypeShelterIssueHint;

  /// No description provided for @reportTypeOtherThreatDesc.
  ///
  /// In pl, this message translates to:
  /// **'Inna sytuacja zagrażająca mieszkańcom'**
  String get reportTypeOtherThreatDesc;

  /// No description provided for @reportTypeOtherThreatHint.
  ///
  /// In pl, this message translates to:
  /// **'Opisz krótko, co widzisz i gdzie dokładnie'**
  String get reportTypeOtherThreatHint;

  /// No description provided for @verificationPowerYes.
  ///
  /// In pl, this message translates to:
  /// **'Mam prąd'**
  String get verificationPowerYes;

  /// No description provided for @verificationPowerNo.
  ///
  /// In pl, this message translates to:
  /// **'Nie mam prądu'**
  String get verificationPowerNo;

  /// No description provided for @verificationWaterYes.
  ///
  /// In pl, this message translates to:
  /// **'Mam wodę'**
  String get verificationWaterYes;

  /// No description provided for @verificationWaterNo.
  ///
  /// In pl, this message translates to:
  /// **'Nie mam wody'**
  String get verificationWaterNo;

  /// No description provided for @verificationFuelYes.
  ///
  /// In pl, this message translates to:
  /// **'Paliwo jest'**
  String get verificationFuelYes;

  /// No description provided for @verificationFuelNo.
  ///
  /// In pl, this message translates to:
  /// **'Brak paliwa'**
  String get verificationFuelNo;

  /// No description provided for @verificationRoadYes.
  ///
  /// In pl, this message translates to:
  /// **'Przejezdna'**
  String get verificationRoadYes;

  /// No description provided for @verificationRoadNo.
  ///
  /// In pl, this message translates to:
  /// **'Nieprzejezdna'**
  String get verificationRoadNo;

  /// No description provided for @verificationShelterYes.
  ///
  /// In pl, this message translates to:
  /// **'Schron dostępny'**
  String get verificationShelterYes;

  /// No description provided for @verificationShelterNo.
  ///
  /// In pl, this message translates to:
  /// **'Niedostępny'**
  String get verificationShelterNo;

  /// No description provided for @previewTitle.
  ///
  /// In pl, this message translates to:
  /// **'Podgląd ekranów'**
  String get previewTitle;

  /// No description provided for @previewSub.
  ///
  /// In pl, this message translates to:
  /// **'Ekrany ze stałymi danymi — bez backendu'**
  String get previewSub;

  /// No description provided for @previewHint.
  ///
  /// In pl, this message translates to:
  /// **'Stałe dane demo (awaria prądu na Jeżycach, 96%). Nic nie trafia do backendu.'**
  String get previewHint;

  /// No description provided for @previewVerification.
  ///
  /// In pl, this message translates to:
  /// **'Pytanie weryfikacyjne'**
  String get previewVerification;

  /// No description provided for @previewScreens.
  ///
  /// In pl, this message translates to:
  /// **'Ekrany'**
  String get previewScreens;

  /// No description provided for @previewQuestionPower.
  ///
  /// In pl, this message translates to:
  /// **'Brak prądu'**
  String get previewQuestionPower;

  /// No description provided for @previewQuestionWater.
  ///
  /// In pl, this message translates to:
  /// **'Brak wody'**
  String get previewQuestionWater;

  /// No description provided for @previewQuestionGeneric.
  ///
  /// In pl, this message translates to:
  /// **'Pytanie ogólne (TAK / NIE)'**
  String get previewQuestionGeneric;

  /// No description provided for @verificationCardLabel.
  ///
  /// In pl, this message translates to:
  /// **'Pytanie o Twoją okolicę'**
  String get verificationCardLabel;

  /// No description provided for @fuelPb95.
  ///
  /// In pl, this message translates to:
  /// **'Benzyna 95'**
  String get fuelPb95;

  /// No description provided for @fuelPb98.
  ///
  /// In pl, this message translates to:
  /// **'Benzyna 98'**
  String get fuelPb98;

  /// No description provided for @fuelDiesel.
  ///
  /// In pl, this message translates to:
  /// **'Diesel'**
  String get fuelDiesel;

  /// No description provided for @fuelLpg.
  ///
  /// In pl, this message translates to:
  /// **'LPG'**
  String get fuelLpg;

  /// No description provided for @occupancyPlenty.
  ///
  /// In pl, this message translates to:
  /// **'Dużo miejsc'**
  String get occupancyPlenty;

  /// No description provided for @occupancyLimited.
  ///
  /// In pl, this message translates to:
  /// **'Mało miejsc'**
  String get occupancyLimited;

  /// No description provided for @occupancyFull.
  ///
  /// In pl, this message translates to:
  /// **'Pełny'**
  String get occupancyFull;

  /// No description provided for @occupancyUnknown.
  ///
  /// In pl, this message translates to:
  /// **'Brak danych o miejscach'**
  String get occupancyUnknown;

  /// No description provided for @fuelStationTitle.
  ///
  /// In pl, this message translates to:
  /// **'Stacja paliw'**
  String get fuelStationTitle;

  /// No description provided for @fuelStationFuels.
  ///
  /// In pl, this message translates to:
  /// **'Dostępność paliw'**
  String get fuelStationFuels;

  /// No description provided for @fuelStationShortage.
  ///
  /// In pl, this message translates to:
  /// **'Brak części paliw'**
  String get fuelStationShortage;

  /// No description provided for @fuelStationOk.
  ///
  /// In pl, this message translates to:
  /// **'Paliwa dostępne'**
  String get fuelStationOk;

  /// No description provided for @fuelStationNoData.
  ///
  /// In pl, this message translates to:
  /// **'Brak danych o paliwach'**
  String get fuelStationNoData;

  /// No description provided for @fuelStationConfirm.
  ///
  /// In pl, this message translates to:
  /// **'Potwierdź stan na stacji'**
  String get fuelStationConfirm;

  /// No description provided for @fuelStationConfirmTitle.
  ///
  /// In pl, this message translates to:
  /// **'Które paliwa są teraz dostępne?'**
  String get fuelStationConfirmTitle;

  /// No description provided for @fuelStationConfirmHint.
  ///
  /// In pl, this message translates to:
  /// **'Zaznacz paliwa, które można teraz zatankować. Jeśli czegoś brakuje, użyj „Zgłoś brak paliwa”.'**
  String get fuelStationConfirmHint;

  /// No description provided for @fuelStationConfirmed.
  ///
  /// In pl, this message translates to:
  /// **'Dziękujemy za potwierdzenie stanu paliw.'**
  String get fuelStationConfirmed;

  /// No description provided for @fuelStationAddress.
  ///
  /// In pl, this message translates to:
  /// **'Adres'**
  String get fuelStationAddress;

  /// No description provided for @fuelStationLastConfirmed.
  ///
  /// In pl, this message translates to:
  /// **'Ostatnie potwierdzenie'**
  String get fuelStationLastConfirmed;

  /// No description provided for @shelterOccupancy.
  ///
  /// In pl, this message translates to:
  /// **'Zapełnienie'**
  String get shelterOccupancy;

  /// No description provided for @shelterAvailability.
  ///
  /// In pl, this message translates to:
  /// **'Tryb otwarcia'**
  String get shelterAvailability;

  /// No description provided for @shelterConfirmOccupancy.
  ///
  /// In pl, this message translates to:
  /// **'Ile jest miejsc?'**
  String get shelterConfirmOccupancy;

  /// No description provided for @reportObjectFuelTitle.
  ///
  /// In pl, this message translates to:
  /// **'Która stacja?'**
  String get reportObjectFuelTitle;

  /// No description provided for @reportObjectShelterTitle.
  ///
  /// In pl, this message translates to:
  /// **'Który schron?'**
  String get reportObjectShelterTitle;

  /// No description provided for @reportObjectHint.
  ///
  /// In pl, this message translates to:
  /// **'Zaznaczyliśmy najbliższy obiekt — zmień, jeśli chodzi o inny.'**
  String get reportObjectHint;

  /// No description provided for @reportObjectNone.
  ///
  /// In pl, this message translates to:
  /// **'Nie znaleźliśmy takich obiektów w pobliżu Twojej pozycji.'**
  String get reportObjectNone;

  /// No description provided for @reportFuelTypesTitle.
  ///
  /// In pl, this message translates to:
  /// **'Czego brakuje?'**
  String get reportFuelTypesTitle;

  /// No description provided for @reportFuelTypesRequired.
  ///
  /// In pl, this message translates to:
  /// **'Zaznacz co najmniej jedno paliwo.'**
  String get reportFuelTypesRequired;

  /// No description provided for @verificationPoiLabel.
  ///
  /// In pl, this message translates to:
  /// **'Pytanie dotyczy obiektu'**
  String get verificationPoiLabel;

  /// No description provided for @incidentPoiTitle.
  ///
  /// In pl, this message translates to:
  /// **'Dotyczy obiektu'**
  String get incidentPoiTitle;

  /// No description provided for @incidentMissingFuels.
  ///
  /// In pl, this message translates to:
  /// **'Brakuje: {fuels}'**
  String incidentMissingFuels(String fuels);

  /// No description provided for @incidentAreaObject.
  ///
  /// In pl, this message translates to:
  /// **'Zgłoszenie dotyczy jednego obiektu — bez strefy na mapie.'**
  String get incidentAreaObject;

  /// No description provided for @proceduresTitle.
  ///
  /// In pl, this message translates to:
  /// **'Co robić'**
  String get proceduresTitle;

  /// No description provided for @timelineTitle.
  ///
  /// In pl, this message translates to:
  /// **'Historia'**
  String get timelineTitle;

  /// No description provided for @previewQuestionFuel.
  ///
  /// In pl, this message translates to:
  /// **'Brak paliwa (pytanie o stację)'**
  String get previewQuestionFuel;

  /// No description provided for @fuelStationConfirmSend.
  ///
  /// In pl, this message translates to:
  /// **'Potwierdź dostępne paliwa'**
  String get fuelStationConfirmSend;

  /// No description provided for @fuelStationReport.
  ///
  /// In pl, this message translates to:
  /// **'Zgłoś brak paliwa'**
  String get fuelStationReport;

  /// No description provided for @shelterReport.
  ///
  /// In pl, this message translates to:
  /// **'Zgłoś problem ze schronem'**
  String get shelterReport;

  /// No description provided for @reportObjectMapHint.
  ///
  /// In pl, this message translates to:
  /// **'Zaznaczyliśmy najbliższy obiekt — dotknij innego na mapie, aby zmienić.'**
  String get reportObjectMapHint;

  /// No description provided for @reportObjectChangeHint.
  ///
  /// In pl, this message translates to:
  /// **'Dotknij innego obiektu na mapie, aby zmienić wybór.'**
  String get reportObjectChangeHint;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['pl'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'pl':
      return AppLocalizationsPl();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
