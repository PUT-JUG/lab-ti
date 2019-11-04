# 10 - obliczenia numeryczne, Jupyter

## Jupyter Notebook

Jupyter Notebook to wygodne środowisko do tworzenia dokumentów zawierających wykonywalny kod źródłowy, opisy tekstowe, równania czy wizualizacje, najczęściej wykorzystywane w połączeniu z językiem Python. Taka forma pozwala na łatwe testowanie fragmentów kodu, sprawdzanie rozwiązań i czytelną prezentację wyników. Obsługa narzędzia odbywa się przez przeglądarkę internetową.

Po zainstalowaniu pakietów zgodnie z instrukcją *Instalacja Python na domowym komputerze*, aby uruchomić środowisko *Jupyter Notebook* otwórz terminal systemowy (w systemie Windows: `Win`+`R`, wpisz `cmd`):

```bash
jupyter notebook
```

Jeśli korzystasz z systemu *macOS*, a pakiety instalujesz z repozytorium *macports*, polecenie ma następującą postać:

```bash
jupyter-3.7 notebook
```

Uruchomienie powyższego polecenia spowoduje uruchomienie *serwera* Jupyter w terminalu i jednocześnie otwarcie domyślnej przeglądarki internetowej z interfejsem środowiska. Nie zamykaj okna terminala, pozostaw je uruchomione w tle. Zwróć uwagę na adres w przeglądarce - adresem serwera jest `localhost` czyli komputer lokalny. Możliwa jest również praca zdalna - serwer może być uruchomiony na maszynie o dużej mocy obliczeniowej, podczas gdy pracujemy w innym miejscu np. na komputerze przenośnym czy nawet urządzeniu mobilnym. Cały program będzie wykonywany na serwerze w tzw. *kernelu*, a nasz komputer wyświetli jedynie jego wyniki.

**Pamiętaj, że Jupyter Notebook to tylko środowisko** - składnia i zasady języka Python pozostają niezmienione, zatem cała Twoja wiedza z poprzednich będzie mieć tu zastosowanie.

### Interfejs

Po uruchomieniu Jupytera, w przeglądarce powinnna załadować się strona podobna do poniższej, zawierająca przeglądarkę plików:

![Jupyter](_images/10/jupyter.png)

Przejdź do folderu, w którym chcesz pracować, np `Documents`. Utwórz nowy *notatnik* klikając *New*, a następnie wybierając kernel - *Python 3*:

![Jupyter - new notebook](_images/10/jupyter-new-notebook.png)

Notatnik otworzy się w nowej karcie przeglądarki. Będzie zawierał puste pole tekstowe - wklej do niego poniższy kod źródłowy, a następnie wykonaj go naciskając `Ctrl` + `Enter`.

```python
name = "Jakub"
print("Hello", name)
```

Powinieneś uzyskać następujący wynik:

![Jupyter - hello world](_images/10/jupyter-hello.png)

Możesz zapisać swój notatnik pod stosowną nazwą wybierając `File` → `Save as...` (**Uwaga** - mowa o menu w obrębie interfejsu Jupytera, a nie o pasku menu przeglądarki). Jupyter będzie cyklicznie tworzył kopie zapasowe, ale warto pamiętać o ręcznym zapisywaniu kodu. Notatnik przechowywany jest w pliku z rozszerzeniem `ipynb`.

Pole tekstowe, do którego został wklejony kod to *komórka* (ang. *cell*). Notatnik może być zbudowany z wielu takich komórek, z których każda może zostać uruchomiona oddzielnie. Komórki mogą zawierać kod źródłowy przeznaczony do uruchomienia (*code cell*) lub tekst sformatowany wraz z grafikami, tabelami itp. (*Markdown cell*). W ramach zajęć będziemy korzystać głównie z komórek z kodem źródłowym. Komórka taka może zawierać wiele linii kodu i koncepcyjnie powinna odpowiadać za jedną czynność - np. wczytanie danych, poszczególne etapy ich przetwarzania czy prezentację wyników. Wszystkie komórki współdzielą jeden **interpreter** Pythona - oznacza to, że dane zapisane do zmiennych w jednej komórce można ponownie wykorzystać w kolejnych.

Dodaj kolejną komórkę przyciskiem **+** w pasku narzędziowym lub naciskając `Alt` + `Enter`. Umieść w niej poniższy kod źródłowy i uruchom:

```python
print(name, "has", len(name), "letters")
```

Zwróć uwagę na napisy umieszczone po lewej stronie od komórek (`In [1]:`, `In [2]:` itd.). Oznaczają one kolejność, w jakiej zostały wykonane. Dodaj trzecią komórkę i umieść w niej poniższy kod:

```python
name = "Joaquin"
```

Wykonaj komórkę trzecią, a następnie podświetl komórkę drugą (możesz do niej przejść klawiszami kursora na klawiaturze bądź użyć myszy) i wykonaj ponownie jej zawartość. Jaki jest efekt?

**Uwaga!** Oczywiście kod powinien być pisany w notatniku z założeniem, że komórki wykonywane są kolejno, od góry do dołu - analogicznie do zwykłego pliku źródłowego. Jednak pracując nad nowym programem czy algorytmem często spotkasz się z sytuacją, gdzie poprawek i ponownego uruchomienia wymaga tylko jedna komórka, a uruchomienie całego kodu byłoby np. kosztowne czasowo. Jupyter daje możliwość poprawienia i uruchomienia pojedynczych komórek, jednak należy mieć na uwadze czy w zmiennych w interpreterze znajduje się to, czego oczekujemy.

Wszystkie operacje edycji struktury notatnika można wykonywać z menu graficznego, jednak przy częstym używaniu warto zapoznać się ze skrótami klawiszowymi dla przyspieszenia obsługi. Podczas obsługi interfejs ma dwa tryby - *command mode* (niebieski pasek po lewej) oraz *edit mode* (zielony pasek po lewej), aktywowane odpowiednio klawiszami `Escape` oraz `Enter`.

Najprzydatniejsze skróty to:

* w *command mode*:
    * `A`/`B` - wtaw komórkę powyżej/poniżej bieżącej
    * `D`, `D` (dwukrotne naciśnięcie) - usunięcie bieżącej komórki
    * `Z` - cofnięcie usunięcia
* w *edit mode*:
    * `Tab` - autouzupełnienie (przy pierwszym użyciu może działać z opóźnieniem)
    * `Ctrl` + `Enter` - uruchom komórkę
    * `Shift` + `Enter` - uruchom komórkę i przejdź do komórki poniżej
    * `Alt` + `Enter` - uruchom komórkę i wstaw nową poniżej
    * `Ctrl` + `Shift` + `-` - podziel komórkę na dwie (w miejscu kursora)

Pełną ściągę ze skrótami można znaleźć tutaj: https://www.cheatography.com/weidadeyue/cheat-sheets/jupyter-notebook/pdf_bw/

Zamknij swój pierwszy notatnik wybierając polecenie `File` → `Close and Halt`, co spowoduje zatrzymanie kernela na serwerze i zamknięcie strony.

## NumPy

NumPy to bardzo popularna biblioteka dodająca do Pythona możliwość prowadzenia obliczeń na macierzach w wygodny sposób.

Utwórz nowy notatnik, zapisz go pod stosowną nazwą, np. `hello_numpy`. W pierwszej komórce zaimportuj bibliotekę NumPy poleceniem:

```python
import numpy as np
```

Powyższe polecenie różni się od wywołań `import` używanych na poprzednich zajęciach - biblioteka została zaimportowana pod nazwą `np`. Oznacza to, że do jej funkcji będziemy się odwoływać przez `np.nazwa_funkcji`, a nie `numpy.nazwa_funkcji`, dla skrócenia kodu. Podana konwencja (`np` jako alias dla `numpy`) jest ogólnie przyjętym standardem. Nie należy tworzyć własnych skrótów, 

**Hint:** pierwsza komórka często służy tylko wczytaniu wymaganych bibliotek. Kolejne bloki kodu z zadań do wykonania w instrukcji, a także zadania do samodzielnego wykonania umieszczaj w oddzielnych komórkach.

### Tworzenie macierzy

Macierze numpy najprościej utworzyć na podstawie *listy* funkcją `np.array()`. Dostęp do elementów jest podobny jak w przypadku listy. Pamiętaj, że w przeciwieństwie do MATLABa, indeksowanie elementów zaczyna się od 0:

```python
a = np.array([-1, 3.14, 0]) # tworzy 1-wymiarowa macierz (wektor)
print("Wymiary:", a.shape)
print(a)
a[0] = 5
print(a)
```

Analogicznie możliwe jest stworzenie dwuwymiarowej macierzy na podstawie listy list:

```python
b = np.array([[10,20,30],[41,51,61]]) # tworzy macierz 2 x 3
print("Wymiary:", b.shape)
print("Liczba wierszy:", b.shape[0])
print("Liczba kolumn:", b.shape[1])
print("Różne elementy:", b[0, 0], b[0, 1], b[1, 0])
```

Często używane typy macierzy (jednotkową, wypełnione zerami czy stałą liczbą) można uzyskać poniższymi funkcjami: 

```python
c = np.zeros((2,2))         # macierz zer
print("zeros:")
print(c)
print()

d = np.ones((1,2))          # macierz jedynek
print("ones:")
print(d)
print()

e = np.full((2,2), 7)       # macierz wypelniona stałą
print("full:")
print(e)
print()

f = np.eye(4)               # macierz jednostkowa
print("eye:")
print(f)
print()

g = np.random.random((2,3)) # macierz z losowymi elementami z przedziału <0...1>
print("random:")
print(g)
print()
```

Metoda `shape` macierzy zwraca *krotkę*, którą na bieżące potrzeby możesz traktować tak samo jak listę, odwołując się do jej elementów nawiasami kwadratowymi. Funkcje `zeros`, `ones` itp. przyjmują jako pierwszy argument również krotkę - jej utworzenie różni się od listy tylko typem nawiasów (okrągłe zamiast kwadratowych).

#### :hammer: :fire: Zadanie :fire: :hammer:

* Stwórz zmienną `n`, przypisz jej wartość całkowitą, np. 4.
* Utwórz losową macierz o wymiarach `n` x `n`, wyświetl ją.
* Korzystając z pętli `for` wyświetl elementy leżące na przekątnej wylosowanej macierzy.




---

Autor: *Jakub Tomczyński*
