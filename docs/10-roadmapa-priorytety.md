# 10. Roadmapa i priorytety (mobile)

## Fazy

### Faza 1 — Fundament
- theme w stylu mObywatela, nawigacja, DI (`get_it`), klient Retrofit z `openapi.json`,
- onboarding: rejestracja urządzenia, adres domowy, lokalizacja,
- mapa (`GET /map`), ekran zgłoszenia.

**Cel:** użytkownik zgłasza problem i widzi go w systemie.

### Faza 2 — Core Tarczy (najważniejsza)
- push FCM / APNs (`verification`, `alert`, `location_refresh`) + polling `pending`,
- verification prompt i odpowiedzi TAK / NIE / NIE WIEM,
- wyświetlanie stref incydentów,
- confidence / status incydentu.

**Cel:** system sam aktywnie ustala, gdzie występuje problem.

### Faza 3 — Alerty i schrony
- alerty dla obszaru,
- mapa schronów, status schronu, potwierdzanie,
- tryb czuwania: lokalizacja w tle (iOS Significant Location Change, Android foreground service + `workmanager`).

**Cel:** pokazać pętlę społeczeństwo → system → operator → społeczeństwo.

### Faza 4 — AI
Brak większych zmian po stronie mobile (ewentualnie wyświetlenie źródeł/streszczenia jeśli backend je udostępni).

### Faza 5 — Polish & Demo
- poprawa UX, animacje / loading,
- kolory statusów, ekran alertu,
- dopracowanie mapy,
- przygotowanie danych seed i scenariusza demo.

**Cel:** całość wygląda jak jeden spójny produkt.

## Priorytety (gdy brakuje czasu)

| Priorytet | Zakres | Uwaga |
|---|---|---|
| **1** | Report → Incident → Verification → Dynamic Area | Bez tego tracimy clue projektu |
| **2** | Alert (odbiór i ekran) | Pokazuje realną wartość operacyjną |
| **3** | Prezentacja wyników AI research | Wzmacnia wiarygodność |
| **4** | Schrony | Przydatne i efektowne wizualnie |
| **5** | Zdjęcia, offline, reputacja, mObywatel | Jeśli zostanie czas |

## Po MVP (mobile)

- **Zdjęcia** jako materiał weryfikacyjny (z usuwaniem EXIF).
- **Offline / degraded mode**: cache schronów, podstawowych procedur, ostatnich alertów i ostatniego stanu mapy.
- **Historia incydentu**: kiedy wykryto, kiedy potwierdzono, jak zmieniał się zasięg.
- **Zasięg incydentu jako komórki H3** z confidence na komórkę (jeśli backend udostępni).

## Nice to have

- Integracja z mObywatelem (unikalna osoba, ochrona przed botami).
- Inteligentne routowanie: do schronu, do punktu pomocy, poza obszar zakłóceń.
- Multilingual (turyści, uchodźcy, obcokrajowcy).
- Prediction / anomaly detection (po stronie backendu; mobile tylko prezentuje).

## Test każdej nowej funkcji

> Czy pomaga szybciej wykryć problem, lepiej go zweryfikować, określić zasięg albo skuteczniej poinformować zagrożonych ludzi?

Jeśli nie — odłóż.
