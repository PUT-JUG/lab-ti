# 04b - Matlab podstawy

## Czym jest Matlab?

**Matlab** to zintegrowane środowisko do obliczeń matematycznych, inżynierskich i prowadzenia symulacji oraz powiązanego z nim języka programowania. Jego nazwa wywodzi się od **MATrix LABoratory**, czyli laboratorium macierzy. Obecnie jednak jego możliwości wykraczają daleko poza obliczenia macierzowe, a sam program stosowany jest w wielu różnych dziedzinach. Poza podstawowym środowiskiem dostępne są liczne specjalizowane biblioteki narzędzi nazywane **toolbox**ami. Pośród alternatyw dla **Matlaba** wyróżnia się otwarto-źródłowy pakiet **GNU Octave**, którego jednym z celów jest kompatybilność z językiem **Matlab**.

Ponieważ pierwotnym przeznaczeniem środowiska było prowadzenie interaktywnych obliczeń, **Matlab** jest językiem interpretowanym a nie kompilowanym w przeciwieństwie do na przykład języków **C**, **C++**. 

---

#### :hammer: :fire: Zadanie :fire: :hammer:

Uruchom środowisko Matlab.

---

## Interfejs Matlab i GUI dla GNU Octave

Poniżej przedstawiono główne okno graficznego środowiska Matlab:

![Matlab_Okno1](./_images/04/Matlab_Okno1.png)

Narzędzia pogrupowane są w tak zwane wstążki, znajdujące się u góry okna (1). Linia komend (2) znajdująca się u dołu okna służy do prowadzenia interaktywnych obliczeń. Bardziej rozbudowane obliczenia umieścić można w plikach skryptów. Edytor takich plików znajduje się pośrodku (3). Po prawej stronie znajduje się przestrzeń robocza (4), a po lewej podgląd plików w bieżącym folderze (5).

Jeżeli wygląd okna został zmieniony względem domyślnego, można go przywrócić. Służy do tego narzędzie **Layout** znajdujące się po środku wstążki **Home**:

![Matlab_Okno2](./_images/04/Matlab_Okno2.png)

Główne okno GUI dla GNU Octave ma zbliżoną konfigurację:

![Octave_Okno1](./_images/04/Octave_Okno1.png)

Podstawowe narzędzia dostępne są u góry okna (1). Linia komend (2) znajduje się po prawej. Może ona być jednak przełączona między innymi na edytor skryptów za pomocą zakładek dostępnych u dołu okna (3). Po lewej stronie, po środku znajduje się przestrzeń robocza (4). Nad nią z kolei umieszczono podgląd plików w bieżącym folderze (5). Pod przestrzenią roboczą znajduje się sub-okno z historią komend.

Jeżeli wygląd okna został zmieniony względem domyślnego, można go przywrócić. Służy do tego ostatnia opcja z menu **Window**:

![Octave_Okno2](./_images/04/Octave_Okno2.png)

## Podstawy Matlab

### Podstawowe operacje na liczbach

W Matlab możemy korzystać z podstawowych matematycznych operatorów: `+`, `-`, `*`, `/` itp. przy zachowaniu standardowej kolejności wykonywania działać. Do zmiany kolejności działań wykorzystujemy nawiasy okrągłe `()`:

```matlab
>> 3+5

ans =
     8

>> 9 - 8 * 100

ans =
  -791

>> (9 - 8) * 100

ans =
   100

>> 100 / 6

ans =
   16.6667
```

Potęgowanie wykonywane jest z użyciem operatora `^`:

```matlab
>> 2 ^ 16

ans =
       65536
```

---

#### :hammer: :fire: Zadanie :fire: :hammer:

1. W konsoli Matlab sprawdź działanie powyższych operatorów.

2. Rakieta przyspiesza jednostajnie z przyspieszeniem 100 m/s^2. Oblicz jaką drogę przebędzie w przeciągu 10 s.

---

Kolejne polecenia wpisane w linii komend zapisywane są do historii. Można się do nich odwołać za pomocą strzałek góra/dół na klawiaturze. W Matlabie wciśnięcie strzałki w górę wywołuje sub-okno historii, w Octave jest ono domyślnie widoczne cały czas po lewej stronie. Wywołane z historii komendy można edytować.

---

#### :hammer: :fire: Zadanie :fire: :hammer:

Sprawdź działanie historii w Matlab.

---

### Zmienne

Matlab umożliwia przechowywanie wartości w zmiennych. Przypisanie wartości do zmiennej odbywa się za pomocą operatora `=`. Typ zmiennym nadawany jest automatycznie przez środowisko zależnie od tego co zostanie do nich przypisane:

```matlab
>> base = 20

base =
    20

>> height = 3

height =
     3

>> base * height / 2

ans =
    30
```

Można także zapisać wynik działania do zmiennej:

```matlab
>> netto = 100

netto =
   100

>> tax = 1.23

tax =
    1.2300

>> brutto = netto * tax

brutto =
   123
```

Ciągi znakowe definiuje się za pomocą znaków apostrofu `'` na początku i na końcu. Jeżeli w ciągu znaków chcemy zastosować znak `'` konieczne będzie poprzedzenie go drugim apostrofem `''`:

```matlab
>> s1 = 'Ala ma kota'

s1 =
    'Ala ma kota'

>> s2 = 'This is Ala''s cat'

s2 =

    'This is Ala's cat'
```

---

#### :hammer: :fire: Zadanie :fire: :hammer:

1. Korzystając z konsoli przypisz do zmiennej `d` wartość przekątnej kwadratu.
2. Oblicz i zapisz do zmiennej `a` wartość boku kwadratu. **PODPOWIEDŹ** ![przekatna](./_images/04/przekatna.svg) **PODPOWIEDŹ 2** Pamiętaj, że pierwiastek kwadratowy z liczby, to to samo co podniesienie tej liczby do potęgi 0.5.
3. Na podstawie uzyskanego wyniku oblicz pole koła wpisanego w kwadrat. **PODPOWIEDŹ** Wartość π można uzyskać używając komendy `pi`.

---

### Operacje na wektorach macierzach

#### Wektory

#### Macierze

#### Definiowanie podstawowych macierzy

### Podstawowe funkcje matematyczne

## Skrypty wykonywalne

## Wykresy

## Zadanie końcowe :fire: :hammer:

Bla

## Zadanie domowe :boom: :house:

Bla

---

Autorzy: *Tomasz Mańkowski* *Rafał Kabaciński*
