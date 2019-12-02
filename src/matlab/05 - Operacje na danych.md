# 05 - Operacje na danych

## Wyświetlanie

Domyślnie, jeżeli po komendzie nie umieścimy średnika (`;`) MATLAB wyświetli wynik operacji i pokaże nazwę zmiennej do której został przypisany wynik operacji:

```matlab
1 + 1
```

> ans =  
>  
> &emsp;2

Bardzo często zachodzi jednak konieczność wyświetlenia wyniku nie w domyślnej formie, lecz jako sformatowany tekst, lub po prostu bez dodatkowych znaków. Najłatwiejszą w wykorzystaniu jest funkcja `disp()`, której można użyć do wyświetlenia dowolnej zmiennej z dodanym znakiem końca linii:

```matlab
a = [1 5 3; 63 22.6 2; 12.9 5 3];

disp('Matrix:');
disp(a);

disp('Single element:');
disp(a(3, 2));

disp('First row:');
disp(a(1, :));
```

> Matrix:  
> &emsp;1.0000&emsp;&nbsp;&nbsp;5.0000&emsp;&nbsp;&nbsp;3.0000  
> &emsp;63.0000&emsp;22.6000&emsp;2.0000  
> &emsp;12.9000&emsp;5.0000&emsp;&nbsp;&nbsp;3.0000  
>  
> Single element:  
> &emsp;5  
>  
> First row:  
> &emsp;1&emsp;5&emsp;3

Bardziej zaawansowane formatowanie możemy uzyskać korzystając z funkcji `fprintf()` mającej format bardzo zbliżony do jego odpowiednika z języka **C**. Wybrane ciągi formatujące przedstawiono w tabeli poniżej (więcej informacji o `fprintf()` uzyskasz wywołując komendę `doc fprintf`):

|Ciąg formatujący|Opis|
|-|-|
|`%s`|Formatuj jako ciąg znaków (string).|
|`%d`|Formatuj jako liczba całkowita (integer).|
|`%f`|Formatuj jako liczba zmiennoprzecinkowa (float)|
|`%e`|Formatuj jako liczba zmiennoprzecinkowa w notacji naukowej|
|`%g`|Formatuj w jak najbardziej kompaktowej formie: `%f` lub `%e`|
|`\n`|Wstawia znak nowej linii|
|`\t`|Wstawia znak tabulatora|

Na przykład:

```matlab
numbers = [3 32.5 42 22 11 434 10 30 4.22];

max_val = max(numbers);
min_val = min(numbers);

fprintf('Vector statistics:\n');
fprintf('\tMinimum value: %d\n\tMaximum value: %d\n', min_val, max_val);
```

> Vector statistics:  
> &emsp;Minimum value: 3  
> &emsp;Maximum value: 424

## Instrukcja warunkowa `if .. elseif .. else .. end`

Instrukcje warunkowe pozwalają na wykonywanie części kodu, jeżeli został spełniony zadany warunek. W przypadku Matlab przykładowe wykorzystanie konstrukcji `if` wygląda następująco:

```matlab
if x < 0
    disp('Negative value')
elseif x == 0
    disp('Zero')
elseif x == 1
    disp('One')
else
    disp('More than zero but not one')
end
```

Zwróć uwagę, że każde wyrażenie `if`, niezależnie czy zawiera bloki `elseif` lub `else`, musi zostać zakończone przez znacznik `end`. Podstawowa wersja instrukcji warunkowej musi zawierać jedynie `if .. end`, znaczniki `elseif` i `else` są opcjonalne. Jeżeli warunek `if` nie zostanie spełniony sprawdzane są kolejne warunki zawarte w `elseif`, na końcu jeżeli żaden warunek nie został spełniony program może wykonać instrukcje zawarte w sekcji `else`.

W treści warunku możemy wykorzystywać podstawowe operatory porównawcze: `<`, `<=`, `>`, `>=`, `==` (równe), `~=` (różne), oraz budować bardziej zaawansowane wyrażenia za pomocą operatorów logicznych: `&&` (i), `||` (lub), `~` (nie - negacja).

---

#### :hammer: :fire: Zadanie :fire: :hammer:

1. Napisz skrypt, który za pomocą funkcji `rand()` wylosuje pojedynczą liczbę.
2. Napisz instrukcję warunkową, która wyświetli:
    - "Za mało" - jeżeli wylosowana liczba jest mniejsze od 0.25.
    - "Idealnie!" - jeżeli wylosowana liczba jest większa równa 0.25 i mniejsza równa od 0.75.
    - "Za dużo" - jeżeli wylosowana liczba jest większa od 0.75.

---

## Operacje logiczne na wektorach i macierzach

### Operatory porównawcze

Istotnym elementem Matlab jest możliwość stosowania operatorów porównawczych (`<`, `<=`, `>`, `>=`, `==`, `~=`) także na wektorach i macierzach. Można wykonać porównanie z pojedynczym skalarem, lub z wektorem lub macierzą o tym samym wymiarze. Wynikiem jest wektor lub macierz zawierająca `0` lub `1` w zależności od wyniku operacji porównania:

```matlab
x = [0.3188 0.4242 0.5079 0.0855 0.2625 0.8010 0.0292];

y = x < 0.5;

disp('Values smaller than 0.5 at:');
disp(y);

a = [1 2 3; 4 5 6; 7 8 9];
b = [2 3 3; 4 3 8; 1 8 3];

disp('Matrices are not equal at:');
disp(a ~= b);
```

> Values smaller than 0.5 at:  
> &emsp;1&emsp;1&emsp;0&emsp;1&emsp;1&emsp;0&emsp;1  
>  
> Matrices are not equal at:  
> &emsp;1&emsp;1&emsp;0  
> &emsp;0&emsp;1&emsp;1  
> &emsp;1&emsp;0&emsp;1  

Następnie istnieje możliwość wybrania elementów spełniających (lub niespełniających) dany warunek korzystając z wyniku operacji jako wektora indeksującego:

```matlab
x = [0.3188 0.4242 0.5079 0.0855 0.2625 0.8010 0.0292];

disp('Values smaller than 0.5:');
disp(x(x < 0.5));
```

> Values smaller than 0.5:  
> &emsp;0.3188&emsp;0.4242&emsp;0.0855&emsp;0.2625&emsp;0.0292

### Operatory logiczne

Na wektorach logicznych możemy wykorzystywać operacje logiczne (`&` (i), `|` (lub), `~` (nie - negacja)) do budowania bardziej skomplikowanych wyrażeń:

```matlab
x = [0.3188 0.4242 0.5079 0.0855 0.2625 0.8010 0.0292];

x_logic = (x > 0.25) & (x < 0.75);

disp('Numbers higher than 0.25 and lower than 0.75:');
disp(x(x_logic));
```

> Numbers higher than 0.25 and lower than 0.75:  
> &emsp;0.3188&emsp;0.4242&emsp;0.5079&emsp;0.2625

### Funkcje operacji na wektorach logicznych

Często zachodzi konieczność znalezienia indeksu wartości spełniających dany warunek logiczny. Można do tego wykorzystać funkcję `find()`, która zwraca indeksy niezerowych elementów:

```matlab
x = [0.3188 0.4242 0.5079 0.0855 0.2625 0.8010 0.0292];

x_indexes = find(x < 0.4);

disp('Indexes of values lower than 0.4:');
disp(x_indexes);
```

> Indexes of values lower than 0.4:  
> &emsp;1&emsp;4&emsp;5&emsp;7

Aby sprawdzić czy wszystkie elementy spełniają warunek można wykorzystać funkcję `all()`, która zwraca prawdę jeżeli wszystkie elementy wektora są niezerowe. Jeżeli chcemy sprawdzić czy którykolwiek z elementów spełnił warunek, można wykorzystać funkcję `any()`:

```matlab
x = [0.3188 0.4242 0.5079 0.0855 0.2625 0.8010 0.0292];

if all(x < 0.9)
    disp('All values are lover than 0.9');
else
    disp('Some elements are higher or equal to 0.9');
end

if any(x > 0.32 & x < 0.35)
    disp('There is a value in range of (0.32, 0.35)');
else
    disp('There is no value in range of (0.32, 0.35)');
end
```

> All values are lover than 0.9  
> There is no value in range of (0.32, 0.35)

---

#### :hammer: :fire: Zadanie :fire: :hammer:

1. Dla wielomianu danego wzorem poniżej oblicz wartości dla x w przedziale <-3, 3>, z krokiem 0.01.

![poly](./_images/05/poly.svg)

2. Wyznacz:
    - Wektor logiczny dla których wartość funkcji jest większa od 50.
    - Wektor logiczny dla których wartość funkcji jest mniejsza od 20.
3. Wyświetl na jednym wykresie:
    - Cały wielomian w zakresie <-3, 3> za pomocą niebieskiej ciągłej linii.
    - Za pomocą czerwonych kółek (bez linii łączącej) wielomian w zakresie dla którego wartości są większe od 50.
    - Za pomocą zielonych krzyżyków (bez linii łączącej) wielomian w zakresie dla którego wartości są mniejsze od 20.

---

## Wczytywanie plików CSV

Popularnym tekstowym formatem zapisu danych tabelarycznych jest plik *CSV - Comma Separated Value*, w których elementy wiersza oddzielone są przecinkami, natomiast znak nowej linii oznacza nowy wiersz. Na przykład:

> 0.48,400,3.2,2.90367  
> 1,2,3,4  
> 73.2,75.2,723,222.3

Matlab posiada gotowe narzędzie `csvread()` wczytujące pliki CSV, które przeprowadza parsowanie do formy numerycznej:

```matlab
data = csvread('sample.csv');
disp(data)
```

> &emsp;0.4800&emsp;&nbsp;&nbsp;400.&emsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3.2000&emsp;&nbsp;&nbsp;&nbsp;&nbsp;2.9037  
> &emsp;1.0000&emsp;&nbsp;&nbsp;2.0000&emsp;&nbsp;&nbsp;3.0000&emsp;&nbsp;&nbsp;&nbsp;&nbsp;4.0000  
> &emsp;73.2000&emsp;75.2000&emsp;723.0000&emsp;222.3000

---

#### :hammer: :fire: Zadanie :fire: :hammer:

1. Dany jest plik CSV [emg.csv](./_resources/05/emg.csv), zawierający zapis sygnału aktywności mięśniowej z 5 kanałów pomiarowych. Zapisz plik w aktualnym folderze roboczym Matlab i wczytaj do macierzy korzystając z funkcji `csvread()`.
2. Wyświetl na jednym wykresie przebieg wszystkich sygnałów. **PODPOWIEDŹ:** przekazując do `plot()` macierz uzyskamy wykres wszystkich kolumn w macierzy, kolory wykresów zostaną automatycznie dobrane.
3. Wybierz cały pierwszy kanał. Wykonaj progowanie: wszystkim elementom wektora o wartości mniejszej niż 40 i większej niż -40 przypisz wartość 0. Na nowym wykresie wyświetl przebieg sprogowanego kanału. **PODPOWIEDŹ:** Możesz wykorzystać `abs()` aby wykonać tylko jedną operację porównania. Nowe okno wykresu otworzysz wywołując komendę `figure`.
4. Wykonaj progowanie jednocześnie na całej macierzy, na wszystkich kanałach. Wyświetl przebiegi po progowaniu na nowym wykresie.

---

## Pętla `for .. end`

W Matlab pętla `for` służy do wielokrotnego powtarzania zadanego bloku kodu. W czasie definiowania pętli `for` konieczne jest określenie wektora dla którego elementów zostanie wykonana pętla:

```matlab
for odd = [1:2:10]      % definicja elementów do iteracji
    fprintf('%d ', odd) % do iteratora odwołujemy się po nazwie zdefiniowanej powyżej
end
fprintf('\n')

even = [2:2:10];
for e = even            % iterację można wykonać po istniejącym wektorze
    fprintf('%d ', e)
end
fprintf('\n')
```

> 1 3 5 7 9  
> 2 4 6 8 10

---

#### :hammer: :fire: Zadanie :fire: :hammer:

1. Wylosuj macierz o rozmiarach 10x6 (wiersze x kolumny) i przypisz do zmiennej.
2. Korzystając z pętli `for` do każdej kolumny macierzy dodaj kolejną liczbę naturalną z zakresu od 1 do 6.

---

## Zadanie końcowe :fire: :hammer:

1. Dany jest plik CSV [data.csv](./_resources/05/data.csv). Wczytaj dane. W pierwszej kolumnie znajduje się wektor czasu, zapisz go do zmiennej `t`. W kolumnach 2 do 5 znajdują się 4 sygnały sinusoidalne, zapisz je jako macierz do zmiennej `signals`. Wyświetl na jednym wykresie poszczególne składowe sygnału.
2. Korzystając z pętli `for` wykonaj sumowanie wszystkich 4 składowych sinusoidalnych i zapisz do zmiennej `sin_sum`. Wyświetl na wykresie. **PODPOWIEDŹ:** Aby wykonać poprawnie pierwsze sumowanie w pętli możesz zainicjalizować zmienną za pomocą zer. Długość dla nowego wektora możesz sprawdzić korzystając z `length()`.
3. Wykonaj obcięcie sygnału `sin_sum`, tak aby wszystkie wartości powyżej 10 zastąpić za pomocą 10, a wszystkie wartości poniżej -10 zastąpić za pomocą -10.
4. Wyświetl na nowym wykresie sygnał `sin_sum` (czerwony, linia kropkowana) oraz `sin_sum` (czarny, linia przerywana) po wykonaniu obcięcia. Dodaj opisy osi, tytuł wykresu oraz legendę.

## Zadanie domowe :boom: :house:

#### Zadanie 1

Dany jest monochromatyczny obrazek w formacie *.bmp*: [lenna.bmp](./_resources/05/lenna.bmp). Wczytaj obrazek do Matlab/GNU Octave i wyświetl. **PODPOWIEDŹ:** Skorzystaj z funkcji `imread()` oraz `imshow()`.

#### Zadanie 2

Wyświetl negatyw obrazka wczytanego w zadaniu 1. Następnie wykadruj uzyskany obraz, tak aby w nowym obrazie znalazła się środkowa część obrazka, a długość boków była połową pierwotnego rozmiaru obrazu. Nowy obraz zapisz do nowej zmiennej i wyświetl.

#### Zadanie 3

Wykonaj sklejanie obrazu otrzymanego w zadaniu 2, tak aby w nowej macierzy obraz pojawił się wielokrotnie, 3 wiersze i 5 kolumn. Obraz można zapisać używają funkcji `imwrite()`.

![lenna_multiple](./_images/05/lenna_multiple.bmp)

---

Autorzy: *Tomasz Mańkowski*
