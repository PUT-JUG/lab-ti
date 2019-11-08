# 06 - Simulink, prezentacja wyników w LaTeX

## Simulink

Simulink jest graficznym środowiskiem do przeprowadzania symulacji komputerowych, będący częścią pakietu Matlab. Simulink **NIE** jest dostępny w GNU Octave.

### Rozpoczęcie pracy z Simulink

Aby uruchomić Simulink należy w linii polecań Matlab należy wpisać komendę `simulink`, lub kliknąć przycisk **HOME** &rarr; **Simulink**

![start_simulink](./_images/06/start_simulink.png)

Zostanie otwarta strona startowa. Aby utworzyć nowy pusty model Simulink klikamy **New** (1), następnie wybieramy zakładkę **Simulink** (2) i klikamy **Blank Model** (3):

![simulink_start_page](./_images/06/simulink_start_page.png)

Otwarte zostanie puste okno z miejscem gdzie możemy zacząć budować symulację za pomocą zestawu bloczków. W celu otwarcia biblioteki Simulink wybieramy z menu **View** &rarr; **Library Browser** (`Ctrl+Shift+L`) lub klikając przycisk:

![simulink_start_library](./_images/06/simulink_start_library.png)

### Pierwszy model w Simulink

Większość podstawowych bloczków wykorzystywanych w Simulink znajdziemy w kategorii ***Simulink***, najpopularniejsze znajdują się w podkategorii ***Commonly Used Blocks***. Bloczki pozwalające na generowanie sygnału znajdziemy w podkategorii ***Sources***. W podkategorii ***Sinks*** znajdziemy bloczki pozwalające wyświetlać i eksportować dane z Simulink. Dodawanie bloczków do symulacji odbywa się za pomocą metody *przeciągnij i upuść*. W podobny sposób łączymy bloczki ze sobą za pomocą strzałek.

---

#### :hammer: :fire: Zadanie :fire: :hammer:

Z biblioteki z kategorii *Sources* dodaj bloczek *Random Numer*. Z kategorii *Sinks* dodaj bloczek *Scope* i połącz wyjście z generatora liczb losowych z wyświetlaczem. Jak na przykładzie poniżej:

![simulink_first_model](./_images/06/simulink_first_model.png)

---

W celu uruchomienia symulacji, w pierwszej kolejności należy ustalić czas symulacji (1), a następnie uruchomić symulację klikając **Run** (2):

![simulink_run](./_images/06/simulink_run.png)

---

#### :hammer: :fire: Zadanie :fire: :hammer:

1. Uruchom symulację swojego modelu na 5 sekund.
2. Podejrzyj wynik wyświetlony poprzez dwukrotne kliknięcie obiektu *Scope*.

---

### Zmiana parametrów bloczków

Każdy bloczek w Simulinku posiada zestaw parametrów, do którego uzyskujemy dostęp dwukrotnie klikając na zadany bloczek. Każdy bloczek będzie oferował inny zestaw parametrów, zależnie od swojego przeznaczenia. Na przykład, w przypadku generatora liczb losowych, możliwe będzie ustawienie m.in. wartości średniej i wariancji sygnału:

![simulink_parameters](./_images/06/simulink_parameters.png)

---

#### :hammer: :fire: Zadanie :fire: :hammer:

1. Wyedytuj parametry generatora liczb losowych, tak aby średnia wartość sygnału wynosiła -10, a wariancja 5. Uruchom ponownie symulację i podejrzyj wybnik w bloczku *Scope*.
2. Utwórz nowy model na podstawie przykładu widocznego poniżej. Parametry generowanych sygnałów sinusoidalnych ustaw w następujący sposób:
    - 1: f = 10 rad/s, A = 3
    - 2: f = 2 rad/s, A = 7

![simulink_to_recreate](./_images/06/simulink_to_recreate.png)

3. Uruchom symulację na 10 sekund. Podejrzyj wykres w elemencie *Scope*.
4. Element *To Workspace* eksportuje do głównego *workspace* Matlaba wynik symulacji danego sygnału i zapisuje pod zadaną nazwą. Korzystając z funkcji `plot()` wykreśl zawartość wektora `sum_of_sines`.
5. Zmień parametry ***Sample time*** obu generowanych sygnałów na 0.01. Wykonaj ponownie symulację. Podejrzyj *Scope* i wygenerowany wektor `sum_of_sines`.

---



## Zadanie końcowe :fire: :hammer:

1. Bla

## Zadanie domowe :boom: :house:

#### Zadanie 1

Bla

---

Autorzy: *Tomasz Mańkowski*
