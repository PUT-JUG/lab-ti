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

| Dzień tygodnia | Kalorie | Ćwiczenia |
| -------------- | :-----: | :-------: |
| Poniedziałek   | 1800    |  45       |
| Wtorek         | 2200    |   0       |
| Środa          | 2300    |  45       |
| Czwartek       | 2000    |  60       |
| Piątek         | 2500    |   0       |
| Sobota         | 5000    |   1       |
| Niedziela      |  500    |   0       |


Stwórz `DataFrame` zawierający informacje o liczbie kalorii i czasie ćwiczeń. Jako indeksy wierszy przyjmij liczby od 1 do 7, odpowiadające kolejnym dniom tygodnia.

---

## Zadanie końcowe :fire: :hammer:




---

## Zadanie domowe :house:



---

Autor: *Jakub Tomczyński*
