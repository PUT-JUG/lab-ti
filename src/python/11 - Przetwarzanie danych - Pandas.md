# 10 - Przetwarzanie danych

## Pandas

Pandas to biblioteka służąca do zarządzania i przetwarzania danych tabelarycznych. Pozwala na tworzenie dwuwymiarowych tabel z danymi wraz z nagłówkami i wygodną manipulację nimi: m.in. wycinanie określonych fragmentów, sklejanie wielu zestawów danych, interpolację czy import/eksport do wielu formatów plików. Biblioteka jest mocno powiązana z NumPy, chociaż przechowywane dane nie muszą być liczbami.

Utwórz nowy notatnik i zaimportuj Pandas, NumPy oraz Matplotlib. Pandas zwyczajowo importowany jest pod skróconą nazwą `pd`.

```python
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
```

Podstawowym typem wykorzystywanym przez bibliotekę jest obiekt `pd.DataFrame`. Utworzenie tabeli możliwe jest na podstawie danych przechowywanych w macierzach NumPy:

```python
vals = np.random.randn(6, 4)
df = pd.DataFrame(vals, index=[0.0, 0.2, 0.3, 0.7, 1.0, 1.3], columns=["A", "B", "C", "D"])
df
```

Pominięcie parametrów `index` lub `columns` przy tworzeniu tabeli spowoduje przydzielenie wierszom/kolumnom indeksów całkowitych rozpoczynających się od 0.

Ponieważ najczęściej przetwarzanym typem danych są przebiegi czasowe, wiersze mają zazwyczaj wartości indeksów wyrażone w liczbach lub jako datę i czas. Nagłówki kolumn zwyczajowo są ciągami znaków.

W odróżnieniu od macierzy NumPy, poszczególne kolumny mogą przechowywać różne typy danych. Możliwe jest również przekazanie jako wartości **słownika** - klucze staną się wtedy nagłówkami kolumn. Przekazanie pojedynczej wartości spowoduje wypełnienie całej kolumny stałą.

```python
dates = pd.date_range("20130101", periods=5, freq="1D")
rain = np.array([0, 0, 10, 30, 0])

pd.DataFrame({"Temperatura": [3.0, 2.1, -1.0, 2.0, 1.0],
              "Opady": rain,
              "Zachmurzenie": ["częściowe", "całkowite", "brak", "brak", "częściowe"],
              "Pora roku": "zima"}, index=dates)
```

W ramach tutorialu będziemy się posługiwać głównie tabelami przechowującymi dane numeryczne.

Jupyter obsługuje tabele Pandas, w związku z czym w przeglądarce wyświetlają się one w czytelnej formie, podobnej do arkusza kalkulacyjnego. W przypadku długich tabel domyślnie zostanie wyświetlony tylko skrót:

```python
long_dataframe = pd.DataFrame(np.random.random((100,50)), columns=np.linspace(10, 500, 50))
long_dataframe
```

Możliwy jest szybki podgląd początku oraz końca tabeli metodami `head()` oraz `tail()`, z opcjonalnym argumentem oznaczającym liczbę wierszy. Przydatną funkcją jest też `describe()`, która zwraca krótkie podsumowanie statystyczne każdej z kolumn:

```python
long_dataframe.head()
```

```python
long_dataframe.tail(3)
```

```python
long_dataframe.describe()
```

---

#### :hammer: 🔥 Zadanie 🔥 :hammer:

Poniższa tabela zawiera notatki ze spożycia kalorii i czasu ćwiczeń Dionizego.

| Dzień tygodnia | Kalorie [kcal] | Ćwiczenia [min] |
| -------------- | :-----: | :-------: |
| Poniedziałek   | 1800    |  45       |
| Wtorek         | 2200    |   0       |
| Środa          | 2300    |  45       |
| Czwartek       | 2000    |  60       |
| Piątek         | 2500    |   0       |
| Sobota         | 5000    |   1       |
| Niedziela      |  500    |   0       |


Stwórz `DataFrame` zawierający informacje o liczbie kalorii i czasie ćwiczeń. Jako indeksy wierszy przyjmij liczby od 1 do 7, odpowiadające kolejnym dniom tygodnia. Wyświetl w notatniku jego zawartość oraz podsumowanie statystyki.

---

### Dostęp do danych, indeksowanie

Dostęp do indeksów możliwy jest przez właściwość `index`:

```python
df.index
```

Dostęp do zbioru kolumn poprzez właściwość `columns`:

```python
df.columns
```

Obie te metody zwracają specjalny obiekt `Index`, w zależności od typu. Możliwa jest łatwa konwersja na Pythonową listę:

```python
list_of_columns = list(df.columns)
for c in list_of_columns:
    print(c)
```

Korzystając z właściwości `values` uzyskamy dostęp do danych w przechowywanych tabeli w postaci macierzy NumPy:

```python
df.values
```

#### Indeksowanie

Główną przewagą przechowywania danych w postaci `DataFrame` w stosunku do zwykłej tablicy dwuwymiarowej/macierzy jest możliwość dostępu do danych po przydzielonych etykietach kolumn/wieszy. Poniższe metody zwracają nowy `DataFrame` będący fragmentem oryginalnego, obiekt `Series` (w przypadku pojedynczych wierszy lub kolumn) lub pojedynczy skalar.

Możliwe jest proste wybranie jednej lub kilku kolumn operatorem `[]`:

```python
df["B"]
```

```python
df[["C", "D"]]
```

Lub wierszy:

```python
df[0.2:1.0]
```

Dla uniknięcia możliwych pomyłek (w powyższych przykładach nie widać jednoznacznie czy wybór odbywa się po kolumnach czy po wierszach) zaleca się korzystanie z metod `loc[]` oraz `iloc[]`.

##### Indeksowanie po etykietach (loc)

Metoda `loc[]` pozwala wybrać fragment `DataFrame` korzystając z **etykiet**:

Wybór wiersza o etykiecie (indeksie) 0.7:

```python
df.loc[0.7, :]
```

Wybór kolumn o etykietach "A" oraz "B" (lista etykiet):

```python
df.loc[:, ["A", "B"]]
```

Możliwe jest podawanie również przedziałów i jednoczesny wybór po kolumnach i wierszach:

```python
df.loc[0.2:0.3, "A":"C"]
```

Wybór pojedynczej wartości (skalar):

```python
df.loc[0.2, ["B"]]
```

##### Indeksowanie po pozycjach (iloc)

Metoda `iloc[]` pozwala wybrać fragment `DataFrame` korzystając z **pozycji** opisanych liczbami całkowitymi - na identycznych zasadach jak w przypadku list czy macierzy NumPy:

Pojedyncze pozycje:

```python
df.iloc[2, 3]
```

Zakresy pozycji:

```python
df.iloc[3:5, 0:2] # wiersze 3,4; kolumny 0,1
```

Listy pozycji:

```python
df.iloc[[1, 2, 4], :] # wiersze 1,2,4, wszystkie kolumny
```

##### Indeksowanie logiczne

Indeksowanie logiczne pozwala w bardzo szybki sposób wybrać fragmenty tabeli, które spełniają określony warunek. Przykładowo:

```python
df.loc[df["A"] > 0, :] # wybierz wszystkie wiersze, gdzie "A" jest większe od 0
```

Możliwe jest też budowanie bardziej złożonych warunków, na przykład:

```python
df.loc[(df["A"] > -0.75) & (df["B"] < 0.25), :]
```

##### Modyfikacja zawartości

Po wyborze fragmentu `DataFrame` możliwe jest przypisanie nowych wartości wybranej części operatorem przypisania `=`.

Przygotujmy nowy zbiór danych:

```python
alpha = np.array([0, np.pi/4, np.pi/2, np.pi*3/4, np.pi])

trig = pd.DataFrame({"sinus": np.round(np.sin(alpha), 10),
                     "cosinus" : np.round(np.cos(alpha), 10),
                     "x^2" : alpha**2,
                     "random" : np.random.randn(len(alpha))}, index=alpha)
trig
```

Możliwe jest przypisanie skalara - wartość zostanie wpisana pod wszystkie pasujące elementy:

```python
trig.loc[1:4, "random"] = 0
trig
```

Lub zbioru nowych wartości, na przykład w postaci macierzy NumPy, przy czym należy pamiętać o podaniu macierzy o

```python
trig.loc[trig["cosinus"] >= 0, "random"] = np.array([1, 3, 5])
trig
```

##### Dodawanie kolumn

Najprostszym sposobem na dodanie kolumny do struktury `DataFrame` jest przypisanie wartości do nieistniejącej kolumny, przykładowo:

```python
trig["New column"] = -1
trig
```

---

#### :hammer: 🔥 Zadanie 🔥 :hammer:

Dana jest tabela z informacjami atmosferycznymi:

```python
days = 10
weather = pd.DataFrame({"Temperatura": np.random.randn(days)*6+20,
                        "Opady": np.floor(np.random.random(days)*5)*50,
                        "Ciśnienie": np.random.randn(days)*5 + 1000}, index=range(1,days+1))
```

* Dodaj do tabeli kolumnę "Biometr", wypełnij początkowo napisem "nieznany"

* W wierszach, w których temperatura przekracza 23 wpisz wartość biometru "gorąco"

* Następnie, w dniach, w których temperatura przekracza 21, a opady przekraczają wynoszą minimum 100 wpisz biometr "duszno"

---

### Import i eksport danych

Pandas obsługuje odczyt i zapis danych z wielu różnych formatów. Najczęściej wykorzystywane to pliki tekstowe `CSV`, ze względu na prostotę i przenośność pomiędzy różnym oprogramowaniem oraz `HDF5`, który oferuje więcej możliwości.

Eksport do pliku CSV możliwy jest metodą `to_csv(filename)` na obiekcie `DataFrame`:

```python
trig.to_csv("trig.csv")
```

Wczytanie istniejącego pliku odbywa się funkcją `pd.read_csv(filename)`. Jeśli chcemy, aby kolumna w pliku została potraktowana jako indeks, musimy przekazać jej położenie do opcjonalnego argumentu `index_col`:

```python
new_trig = pd.read_csv("trig.csv", index_col=0)
```

### Wyświetlanie na wykresie

Pandas jest bezpośrednio zintegrowany z biblioteką matplotlib, dzięki czemu możliwe jest wykreślenie bezpośrednio `DataFrame`, z poprawnymi indeksami i automatyczną legendą:

```python
df.plot()
plt.show()
```

---

## Zadanie końcowe 🔥

W pliku `power_consumption.csv` dostępnym do pobrania [tutaj](./_resources/11/power_consumption.csv) dostarczono przebieg napięcia, prądu oraz przesunięcia fazowego. Pierwszą kolumną w pliku jest wektor czasu.

* Wczytaj dane do obiektu `DataFrame` z czasem jako indeksem, wyświetl go na wykresie w notatniku.

* Dodaj do tabeli kolumny *cos phi* oraz *Power [W]*

* P = U * I * cos(phi)

* Wybierz fragmenty, gdzie cos(phi) > 0, zapisz do nowej zmiennej

* Zapisz do nowego pliku `power_consumption_calcualted.csv`


---

## Zadanie domowe :house:



---

Autor: *Jakub Tomczyński*
