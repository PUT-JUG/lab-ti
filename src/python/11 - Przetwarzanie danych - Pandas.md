# 10 - Przetwarzanie danych

## Pandas

Pandas to biblioteka służąca do zarządzania i przetwarzania danych tabelarycznych. Pozwala na tworzenie dwuwymiarowych tabel z danymi wraz z nagłówkami i wygodną manipulację nimi: m.in. wycinanie określonych fragmentów, sklejanie wielu zestawów danych, interpolację czy import/eksport do wielu formatów plików. Biblioteka jest mocno powiązana z NumPy, chociaż przechowywane dane nie muszą być liczbami.

Utwórz nowy notatnik i zaimportuj Pandas oraz NumPy. Pandas zwyczajowo importowany jest pod skróconą nazwą `pd`.

```python
import numpy as np
import pandas as pd
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

Możliwy jest szybki podgląd początku oraz końca tabeli metodami `head()` oraz `tail()`, z opcjonalnym argumentem oznaczającym liczbę wierszy:

```python
long_dataframe.head()
```

```python
long_dataframe.tail(3)
```

---

#### :hammer: :fire: Zadanie :fire: :hammer:

Poniższa tabela zawiera notatki ze spożycia kalorii i czasu ćwiczeń Dionizego.

```
| Dzień tygodnia | Kalorie | Ćwiczenia |
| -------------- | :-----: | :-------: |
| Poniedziałek   | 1800    |  45       |
| Wtorek         | 2200    |   0       |
| Środa          | 2300    |  45       |
| Czwartek       | 2000    |  60       |
| Piątek         | 2500    |   0       |
| Sobota         | 5000    |   1       |
| Niedziela      |  500    |   0       |
```

Stwórz `DataFrame` zawierający informacje o liczbie kalorii i czasie ćwiczeń. Jako indeksy wierszy przyjmij liczby od 1 do 7, odpowiadające kolejnym dniom tygodnia.

---

## Zadanie końcowe :fire: :hammer:

Krzywa gaussa opisana jest równaniem:

![Równanie krzywej Gaussa](_images/10/gauss.svg)

1. Wygeneruj na wspólnym wykresie serię krzywych Gaussa o parametrach

![Parametry krzywych Gaussa](_images/10/gauss_params.svg)

dla wartości *x* od -5 do 5, z krokiem 0.1.

W/w parametry przechowaj w programie w wygodny sposób, np. jako listę słowników.

2. Zmodyfikuj program tak, aby zapisywał wartości funkcji dla każdej krzywej we wspólnej macierzy, gdzie kolumnom odpowiadają kolejne krzywe, a w wierszom kolejne próbki. Pamiętaj o przygotowaniu macierzy o odpowiednim rozmiarze. Wykreśl wykresy pojedynczym wywołaniem funkcji `plt.plot()`.

3. Dodaj legendę. Listę opisów do legendy wygeneruj automatycznie na podstawie zmiennej przechowującej parametry krzywych. Opisy powinny zawierać wartości parametrów zaprezentowane w czytelny sposób.

4. Dodaj do wykresu czwartą krzywą, narysowaną linią przerywaną i kolorem czerwonym, reprezentującą maksymalną wartość dla danego argumentu *t* ze wszystkich składowych funcji. **Podpowiedź:** zajrzyj do dokumentacji funkcji `numpy.amax`, gdzie znajdziesz przykłady użycia.





---

## Zadanie domowe :home:

1. Przetestuj działanie poznanych dzisiaj funkcji w środowisku PyCharm:

    * Utwórz skrypt, zaimportuj w nim niezbędne biblioteki.
    
    * Przygotuj wektor czasu *t* od 0 do 2π, z krokiem 0.01.
    
    * Wykreśl na wspólnym wykresie, w pętli, serię trzech krzywych Lissajous, opisanych zestawem równań: 
![Matplotlib](_images/10/lissajous.png)

    * Przyjmij parametry *A*, *B* i *a* równe 1, parametr *b* ustal inny dla każdej z krzywych: 2, 4 oraz 6.
    
    * Dodaj do wykresu legendę zawierającą wartość parametru *b* dla każdej z krzywych, opisy osi oraz tytuł.

2. Napisz program wyświetlający zmiany w kursach walut na przestrzeni lat. Możesz wykorzystać środowisko PyCharm lub Jupyter Notebook.

    * Korzysytając z biblioteki `requests` i API na stronie *exchangeratesapi.io* pobierz kursy walut z 1 stycznia każdego roku, począwszy od 2000 do 2019.

    Adres zapytania zwracający kurs z danego dnia w formacie JSON:
    
    `https://api.exchangeratesapi.io/YYYY-MM-DD?base=PLN`

    * Odczytaj z pobranego JSON-a kursy PLN w stosunku do USD, EUR i GBP z każdego roku i umieść jako elementy w macierzy `np.array`, gdzie kolumny odpowiadają walutom, a wiersze kolejnym datom.

    * Wykreśl wszystkie kursy na wspólnym wykresie w różnych kolorach, dodaj opisy osi i legendę. Pamiętaj o wyświetleniu lat na osi x.

 
---

Autor: *Jakub Tomczyński*
