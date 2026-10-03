# 02. Mechanizm core

## Cykl działania

```
DETECT → VERIFY → MAP → INFORM
```

| Etap | Co robi system | Rola aplikacji mobilnej |
|---|---|---|
| **DETECT** | Użytkownicy zgłaszają problemy | Ekran zgłoszenia (typ → lokalizacja → opis → wyślij) |
| **VERIFY** | Łączy zgłoszenia, odpowiedzi użytkowników z okolicy, zdjęcia, źródła publiczne, komunikaty oficjalne, research AI i wylicza wiarygodność | Odbiera Verification Request, wysyła TAK / NIE / NIE WIEM |
| **MAP** | Wyznacza rzeczywisty zasięg problemu, nie tylko punkt | Rysuje strefę incydentu na mapie |
| **INFORM** | Wysyła konkretną informację osobom na obszarze zagrożenia | Wyświetla alert i status incydentu |

## Active Crowd Verification (krok po kroku)

1. System wykrywa skupisko podobnych zgłoszeń.
2. Tworzy hipotezę o zdarzeniu.
3. Pyta użytkowników w okolicy.
4. Analizuje odpowiedzi.
5. Rozszerza lub zawęża badany obszar.
6. Wybiera kolejnych użytkowników, głównie przy niepewnej granicy problemu.
7. Tworzy dynamiczną strefę zdarzenia.

Wyznaczanie granicy: najpierw pytani są użytkownicy tuż przy problemie, potem coraz dalej. Odpowiedzi TAK i NIE stopniowo wyznaczają granicę awarii.

Po stronie backendu użytkownicy są wybierani z trzech grup: wewnątrz potencjalnego obszaru, na jego granicy, tuż poza nim.

## Co to oznacza dla aplikacji mobilnej

- Aplikacja **musi** umieć odebrać pytanie weryfikacyjne w dowolnym momencie (push + in-app) i odpowiedzieć w 1–2 tapnięciach.
- Aplikacja **musi** przekazywać backendowi swoją przybliżoną lokalizację, żeby backend mógł wybrać, kogo zapytać. **[DO UZGODNIENIA]**: częstotliwość, dokładność i sposób (patrz `08-bezpieczenstwo-prywatnosc.md`).
- Odpowiedź „NIE WIEM” jest pełnoprawną odpowiedzią i musi być równie łatwa do wybrania jak TAK i NIE.
- Strefa incydentu może się zmieniać w czasie — mapa musi umieć odświeżyć obszar bez przeładowania ekranu.

## Rola AI (kontekst, nie zadanie mobile)

AI to *research & correlation engine*, nie centralny decydent: grupuje podobne raporty, wykrywa duplikaty opisane inaczej, szuka potwierdzeń w źródłach publicznych, streszcza dla operatora, klasyfikuje zdjęcia, wykrywa sprzeczności, proponuje pytania weryfikacyjne.

Confidence **nie** jest liczbą wymyśloną przez LLM — wynika z modelu deterministycznego (patrz `03-model-danych.md`). Mobile tylko prezentuje wynik, nic nie liczy.

## Przykład INFORM

> Potwierdzono rozległą awarię energetyczną w Twoim obszarze.
> Problem zgłasza 86% odpowiadających użytkowników.
> Najbliższy działający punkt pomocy znajduje się 1,2 km od Ciebie.
