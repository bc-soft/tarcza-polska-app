# 10. Roadmapa i priorytety (mobile)

## Fazy

### Faza 1 — Fundament
- podstawowe UI, mapa, lokalizacja użytkownika,
- ekran zgłoszenia, podstawowe kategorie incydentów.

**Cel:** użytkownik zgłasza problem i widzi go w systemie.

### Faza 2 — Core Tarczy (najważniejsza)
- verification prompt i odpowiedzi TAK / NIE / NIE WIEM,
- wyświetlanie stref incydentów,
- confidence / status incydentu.

**Cel:** system sam aktywnie ustala, gdzie występuje problem.

### Faza 3 — Alerty i schrony
- alerty dla obszaru,
- mapa schronów, status schronu, potwierdzanie.

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
- **Dostępność schronów**: dużo miejsc / mało miejsc / pełny.
- **Historia incydentu**: kiedy wykryto, kiedy potwierdzono, jak zmieniał się zasięg.
- **Powiadomienia push** — automatyczne alerty geograficzne.

## Nice to have

- Integracja z mObywatelem (unikalna osoba, ochrona przed botami).
- Inteligentne routowanie: do schronu, do punktu pomocy, poza obszar zakłóceń.
- Multilingual (turyści, uchodźcy, obcokrajowcy).
- Prediction / anomaly detection (po stronie backendu; mobile tylko prezentuje).

## Test każdej nowej funkcji

> Czy pomaga szybciej wykryć problem, lepiej go zweryfikować, określić zasięg albo skuteczniej poinformować zagrożonych ludzi?

Jeśli nie — odłóż.
