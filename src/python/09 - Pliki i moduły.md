# 09 - Pliki i moduły

## Pliki

W Python otwarcie pliku i zapis do niego wykonywany jest w bardzo łatwy sposób. Do otwarcie pliku wykorzystywana jest funkcja `open()`, do której jako argumenty podajemy ścieżkę do pliku i argumenty z jakimi ma zostać otwarty plik (`r` - odczyt, `w` - zapis (kasuje zawartość pliku), `a` - dopisuje do końca pliku, `r+` - odczyt i zapis):

```python
file_r = open('data.txt', 'r')      # otwiera plik do odczytu
data = file_r.read()                # czyta cały plik i przypisuje zawartość do zmiennej
file_r.close()                      # zamyka plik

file_w = open('new_data.txt', 'w')  # otwiera plik do zapisu
file_w.write(data)                  # zapisuje do nowego pliku zawartość odczytaną z pierwszego
file_w.close()                      # zamyka plik
```

Dużo wygodniejsze jest jednak czytanie pliku linia po linii. Otwarty plik może zostać potraktowany jako kolekcja:

```python
file = open('data.txt', 'r')

for line in file:
    print(line)

file.close()
```

Bardzo często dane zapisywane są w plikach tekstowych, w których kolejne wartości oddzielone są konkretnym znakiem, na przykład:

> 1;2;3;4  
> 45;34;12;32;54;21  
> 4;5;6332;23;2

W powyższym przykładzie kolejne liczby oddzielono znakiem średnika (';'). Najprostszym sposobem na odseparowanie kolejnych wartości jest rozdzielenie ciągu znaków odczytanej linii za pomocą funkcji `split()`. Funkcja ta zwraca listę ciągów znaków, które były odseparowane wskazanym znakiem. Poniższy skrypt sumuje liczby w każdej linii pliku:

```python
file = open('numbers_to_sum.txt', 'r')

for line in file:
    numbers_strings = line.split(';')   # dla każdej linii wykonaj pocięcie ciągu na listę
                                        # separatorem kolejnych elementów w linii jest znak: ';'
                                        # zwrócone elementy listy są ciągami znaków
                                        # należy je przekonwertować na wartości liczbowe

    numbers = []                        # utwórz pustą listę

    for nbr in numbers_strings:         # dla każdego elementu z podzielonej linii
        numbers.append(int(nbr))        # dodaj do listy "numbers" element przekonwertowany na liczbę całkowitą
                                        # konwersja na liczbę całkwitą wykonywana jest za pomocą funkcji: `int()`

    print(sum(numbers))                 # wyświetla sumę elementów listy

file.close()
```

> 10  
> 198  
> 6366

---

#### :hammer: :fire: Zadanie :fire: :hammer:

1. Dany jest plik z ocenami cząstkowymi studentów: [students.txt](./_resources/09/students.txt). Wczytaj dane poszczególnych studentów i oblicz ocenę końcową będącą średnią wszystkich ocen cząstkowych.
2. Wypisz imiona, nazwiska i ocenę końcową studentów, w następującym formacie (**PODPOWIEDŹ** Znak końca linii, tzw. Enter, można uzyskać dodając do zapisywanego ciągu znaków: `\n`):

> Kowalski Jan: 4.5  
> Niekowalski Mariusz: 2.0  
> Nieprzygotowany Stefan: 2.0  
> Super Janusz: 5.0

---

## Moduły

Bardzo duża część przydatnych funkcji wykorzystywanych w Python zamknięta jest w formie modułów. Moduł jest swoistą biblioteką narzędziową zawierającą pogrupowany tematycznie zestaw funkcji. Część modułów jest dystrybuowana wraz z podstawową instalacją Pythona, a inne instalujemy na przykład przy wykorzystaniu menadżera modułów *pip*. Zaawansowany programista ma także możliwość tworzenia własnych modułów. Nie każdy skrypt musi korzystać ze wszystkich modułów, dlatego wskazujemy te moduły, z których będziemy korzystać. Ładowanie modułów zwyczajowo wykonujemy na początku skryptu, na przykład:

```python
import os
import glob

# [...]
```

Dostępne, wbudowane, moduły są bardzo zróżnicowane. Poniżej zaprezentowane są jedynie pojedyncze przykłady wykorzystania pojedynczych modułów.

### Moduł `os`

Jednym z przydatnych modułów jest `os`. Jest to biblioteka pozwalająca na wykonywanie operacji systemowych, takich jak operacje na plikach czy listowanie folderów, niezależnie od systemu operacyjnego na którym został uruchomiony. Pełną dokumentację modułu `os` znajdziesz: [https://docs.python.org/3/library/os.html](https://docs.python.org/3/library/os.html). Na zajęciach wykorzystamy następujące funkcje:

- `os.listdir(path='.')` - zwraca listę elementów (plików i folderów) znajdujących się pod podaną ścieżką *path*,
- `os.path.isdir(path)` - sprawdza czy pod wskazaną ścieżką (*path*) znajduje się istniejący folder,
- `os.path.isfile(path)` - sprawdza czy pod wskazaną ścieżką (*path*) znajduje się istniejący plik,
- `os.path.join(path, *paths)` - łączy poszczególne elementy ścieżki do folderu lub pliku, przewagą *join* nad łączeniem łańcuchów znaków za pomocą operatora `+` jest poprawne działanie funkcji na różnych systemach operacyjnych, nawet jeżeli format ścieżki jest inny.

Przykładowy program załączający bibliotekę `os` oraz listujący pliki w zadanym folderze:

```python
import os                                           # załącza bibliotekę os

path = 'C:/Users/lab'                               # url do przeszukiwanego folderu

for entry in os.listdir(path):                      # dla każdego elementu w folderze
    if os.path.isfile(os.path.join(path, entry)):   # sprawdź czy element jest plikiem, użyto "join",
        print(entry)                                # ponieważ "listdir" zwraca tylko nazwę pliku/folderu,
                                                    # a konieczna jest pełna ścieżka do pliku/folderu
```

---

#### :hammer: :fire: Zadanie :fire: :hammer:

1. Dany jest folder zwierający różnorodne pliki. Ściągnij archiwum .zip: [multiple_files.zip](./_resources/09/multiple_files.zip), następnie **RĘCZNIE** rozpakuj archiwum w wygodnym dla Ciebie miejscu.
2. Napisz skrypt, który wylistuje zawartość rozpakowanego folderu, a następnie połączy zawartość wszystkich znajdujących się w nim plików w jeden wspólny plik: *my_super_file.txt*. Plik docelowy powinien się znajdować w katalogu nadrzędnym do folderu zawierającego odczytywane pliki.

---

### Moduł `requests`

Moduł `requests` pozwala w bardzo prosty i przyjemny dla użytkownika sposób wykonać zapytanie HTTP (protokołu, który wykorzystują przeglądarki internetowe). Aby odczytać i wypisać treść strony internetowej, wystarczy bardzo prosty kod:

```python
import requests

req = requests.get("http://google.com")
print(req.text)
```

---

#### :hammer: :fire: Zadanie :fire: :hammer:

Twój kolega z akademika kopie Bitcoin. Napisz dla niego skrypt, który wykorzystuje interfejs HTTP (API) strony [https://blockchain.info/](https://blockchain.info/) i sprawdza aktualny kurs BTC względem poszczególnych światowych walut. Link HTTP sprawdzający przelicznik z zadanej waluty na BTC wygląda następująco (wejdź przeglądarką na podany link i zobacz jaki jest efekt):

[https://blockchain.info/tobtc?currency=USD&value=1](https://blockchain.info/tobtc?currency=USD&value=1)

Podany link składa się z następujących elementów: `https://blockchain.info/tobtc?currency=` + *oznaczenie waluty* + `&value=` + *kwota waluty*. Twój skrypt powinien sprawdzać wartość BTC jednej jednostki następujących walut: USD, EUR, RUB, GBP, CHF i zapisywać do pliku *BTC.txt* w następującym formacie:

> USD to BTC: 0.0001249  
> EUR to BTC: 0.00013677  
> RUB to BTC: 0.00000192  
> GBP to BTC: 0.0001536  
> CHF to BTC: 0.00012545

---

### Moduł `json`

JSON (JavaScript Object Notation) to popularny tekstowy format wymiany danych bazujący na języku JavaScript. Format pliku JSON jest słownikowy, każdemu wpisowy (o dowolnej formie) towarzyszy klucz, który identyfikuje dane pole i pozwala na dostęp do danych. Przykładowy plik JSON (*my_class.json*):

```json
{
  "class_name": "Techniki Informacyjne",
  "number_of_students": 3,
  "topics": ["LaTeX", "Matlab", "Python"],
  "student_grades": {
    "Marek": 2.0,
    "Zofia": 5.0,
    "Jan": 4.5
  }
}
```

#### Odczyt JSON

Wykorzystując moduł `json` odczytanie pliku wygląda w następujący sposób:

```python
import json

json_file = open('my_class.json', 'r')
data = json.load(json_file)

print(data)
print(data['class_name'])
print(data['topics'])
print(data['student_grades']['Marek'])
```

> {'class_name': 'Techniki Informacyjne', 'number_of_students': 3, 'topics': ['LaTeX', 'Matlab', 'Python'], 'student_grades': {'Marek': 2.0, 'Zofia': 5.0, 'Jan': 4.5}}  
> Techniki Informacyjne  
> ['LaTeX', 'Matlab', 'Python']  
> 2.0

#### Słownik (`Dict`) w Python

Po odczytaniu pliku JSON jego obsługa w Python jest niezwykle prosta, ponieważ Python posiada wbudowany typ słownikowy. Każdemu polu słownika przypisany jest klucz, który identyfikuje pole. Klucz musi być unikatowy, nie może się powtarzać. Tak samo jak w przypadku list wpisem w słowniku może być także drugi słownik, lista czy każdy inny obiekt.

Słownik w Python tworzymy za pomocą nawiasów klamrowych `{}` wewnątrz których kolejne wpisy oddzielamy przecinkami `,`. Każdy wpis składa się z pary: klucza (po którym następuje `:`) oraz wpisu, na przykład:

```python
>>> tel = {'Jan': 41235232, 'Alicja': 32464355, 'Krystyna': 63456234, 'Wojtek': 412354235}
```

Dostęp do pól wykonywany jest za pomocą operatora `[]` wewnątrz którego umieszczamy klucz:

```python
>>> tel['Jan']
41235232
```

Istnieje możliwość tworzenia nowych, nieistniejących, wpisów w słowniku oraz ich modyfikację korzystając z operatora `[]`:

```python
>>> tel['Maria'] = 34682138
>>> tel['Alicja'] = 111111111
>>> tel
{'Jan': 41235232,
 'Alicja': 111111111,
 'Krystyna': 63456234,
 'Wojtek': 412354235,
 'Maria': 34682138}
```

#### Zapis JSON

Konwersję słownika Python do pliku JSON możemy wykonać korzystając z funkcji `json.dumps()`:

```python
import json

tel = {'Jan': 41235232, 'Alicja': 111111111, 'Krystyna': 63456234,
       'Wojtek': 412354235, 'Maria': 34682138}

json_file = open('my_phonebook.json', 'w')

json_file.write(json.dumps(tel))

json_file.close()
```

---

#### :hammer: :fire: Zadanie :fire: :hammer:

Dany jest plik JSON: [citybikes_networks.json](./_resources/09/citybikes_networks.json) - źródło: [http://api.citybik.es/v2/](http://api.citybik.es/v2/). Plik zawiera informacje o wypożyczalniach publicznych rowerów na całym świecie.

1. Załaduj zawartość pliku korzystając z modułu `json`.
2. Podstawowym elementem danych jest klucz **networks** wewnątrz którego znajduje się lista lokacji pod którą dostępne są wypożyczalnie rowerów miejskich. Wyświetl przykładową pierwszą lokację i przeanalizuj strukturę przykładowego wpisu. **PODPOWIEDŹ** `bike_networks["networks"][0]`.
3. Wypisz wszystkie lokacje w Polsce w których dostępne są wypożyczalnie rowerów oraz firmy, które świadczą w nim usługi - poniżej przykładowe wyjście z programu. **PODPOWIEDŹ** Listę można przeglądać korzystając z pętli: `for net in bike_networks["networks"]`.

> Bielsko-Biała  -  ['Bike U Sp. z o.o.']  
> Bydgoszcz  -  ['Bike U Sp. z o.o.']  
> Kraków  -  ['Social Bicycles Inc.']

---

## Zadanie końcowe :fire: :hammer:

*The Star Wars API* dostarcza informacje o filmach z uniwersum *Star Wars*. Można uzyskać informacje o następujących tematach:

- Bohaterzy - [https://swapi.co/api/people/](https://swapi.co/api/people/)
- Planety - [https://swapi.co/api/planets/](https://swapi.co/api/planets/)
- Statki kosmiczne - [https://swapi.co/api/starships](https://swapi.co/api/starships)
- Pojazdy - [https://swapi.co/api/vehicles](https://swapi.co/api/vehicles)
- Rasy - [https://swapi.co/api/species](https://swapi.co/api/species)
- Filmy - [https://swapi.co/api/films](https://swapi.co/api/films)

Wchodząc na którykolwiek z powyższych linków zobaczymy stronę z informacjami na poszczególne tematy. Jeżeli wykonamy zapytanie za pomocą innego klienta (na przykład modułu `requests`) otrzymamy zawartość w postaci zgodnej z JSON.

1. Wczytaj z SWAPI informacje o bohaterach. `requests.get()` zwraca łańcuch znaków, zamiast uchwyty do pliku, dlatego do przetworzenia JSON do formy słownika należy skorzystać z `json.loads()` - z *s* na końcu oznaczający *string*.
2. Wypisz imiona najcięższego, najlżejszego, najniższego i najwyższego bohatera w uniwersum.
3. Wypisz imiona i kolor oczu wszystkich bohaterów urodzony po Bitwie o Yavin (ABB - After Battle of Yavin).

---

Autorzy: *Tomasz Mańkowski*, *Jakub Tomczyński*
