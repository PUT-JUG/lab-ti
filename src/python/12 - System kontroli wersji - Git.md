# 12 - System kontroli wersji - Git

## System kontroli wersji

System kontroli wersji (ang. *version/revision control system*) jest to oprogramowanie służące do śledzenia zmian (najczęściej w kodzie źródłowym) oraz pomocy programistom w łączeniu zmian dokonanych przez wiele osób w różnych momentach ([http://pl.wikipedia.org/wiki/System_kontroli_wersji](http://pl.wikipedia.org/wiki/System_kontroli_wersji)). Jednym z popularnych rozproszonych systemów kontroli wersji jest Git stworzony przez Linusa Torvaldsa na potrzeby rozwoju jądra Linuxa ([http://pl.wikipedia.org/wiki/Git_(oprogramowanie)](http://pl.wikipedia.org/wiki/Git_(oprogramowanie))).

Dodatkowe materiały:

- Strona projektu git: [http://git-scm.com/](http://git-scm.com/)
- Darmowa książka: [http://git-scm.com/book](http://git-scm.com/book)
- Tutorial GitHub: [https://guides.github.com/](https://guides.github.com/)

## Serwis GitHub i program GitHub Desktop

[GitHub](https://github.com/) jest serwisem hostingowym wykorzystującym system kontroli wersji Git. [GitHub](https://github.com/) jest bardzo popularnym serwisem wśród społeczności open-source pozwala na tworzenie zarówno publicznych jak i prywatnych repozytoriów.

---

#### :hammer: :fire: Zadanie :fire: :hammer:

Jeżeli nie masz konta na [GitHub](https://github.com/) utwórz nowe konto. Rozważnie wybierz alias pod którym będziesz widoczny w serwisie. Wszystkie treści publikowane na GitHub, włącznie z projektami i kodem, są domyślnie publiczne. Profil GitHub może być Twoją wizytówką!

---

Zwyczajowo obsługa systemu kontroli wersji odbywa się za pomocą programu `git` wywoływanego z linii poleceń. Istnieje jednak szereg GUI ułatwiających pracę z programem git. Jednym z nich jest GitHub Desktop. Celem instalacji programu na domowym komputerze można go pobrać ze strony: [https://desktop.github.com/](https://desktop.github.com/).

Jeżeli jest to pierwsze uruchomienie programu zostaniesz poproszony o zalogowanie się swoim kontem GitHub. W przeciwnym wypadku otwórz menu **File** (1) &rarr; **Options..** (2) (jeśli menu nie jest widoczne, możesz użyć skrótu *Ctrl*+*,*):

![git_options](./_images/12/git_options.png)

Następnie wybierz zakładkę **Accounts** (1) i zaloguj program *GitHub Desktop* do serwisu *GitHub* klikając **Sign in** (2), konieczne będzie podanie danych do logowania:

![git_accounts](./_images/12/git_accounts.png)

---

#### :hammer: :fire: Zadanie :fire: :hammer:

1. Zaloguj *GitHub Desktop* w serwisie *GitHub*.
2. **Pamiętaj aby po skończonych laboratoriach wylogować się w programie!** Operację tę wykonasz w tym samym menu klikając **Sign Out**.

---

Warto upewnić się, że program GitHub Desktop ma odpowiednio ustawioną tożsamość użytkownika (w laboratorium z programu korzysta wiele osób). Dzięki temu wgrywane do repozytorium zmiany będą markowane naszą nazwą użytkownika i adresem e-mail. W tym celu otwórz menu **File** (1) &rarr; **Options..** (2):

![git_options](./_images/12/git_options.png)

Następnie w zakładce **Git** (1) wyedytuj nazwę (2) oraz adres email (3). Zatwierdź klikając **Save** (4):

![git_credentials](./_images/12/git_credentials.png)

---

#### :hammer: :fire: Zadanie :fire: :hammer:

Wyedytuj tożsamość w programie *GitHub Desktop* zgodnie z powyższą instrukcją.

---

## Moje pierwsze repo

### Tworzenie repozytorium

*GitHub Desktop* służy do zarządzania lokalnymi repozytoriami znajdującymi się na dysku komputera. Pierwszym krokiem umożliwiającym nam pracę jest utworzenie lokalnego repozytorium w folderze naszego projektu. W tym celu klikamy:

![git_create](./_images/12/git_create.png)

Następnie nadajemy nazwę swojemu repozytorium (1) (nie używaj w nazwie repozytorium "polskich" znaków!) i wybierz lokalizację (2), w której zostanie utworzony nasz projekt. Następnie wybierz konfigurację **Git Ignore** (3). Warto wskazać używany język, np. Python. Utwórz lokalne repozytorium klikając *Create Repository* (4).

![git_repo_creator](./_images/12/git_repo_creator.png)

---

#### :hammer: :fire: Zadanie :fire: :hammer:

1. Utwórz nowe repozytorium o nazwie: *hello-git-nazwisko* (nie używaj w nazwie repozytorium "polskich" znaków!). Jako konfigurację *Git ignore* wybierz *Python*.
2. Obejrzyj zawartość folderu z utworzonym repozytorium. Zauważ, że pojawił się ukryty folder *.git*. Zastanów się co zawiera?
3. Dowiedz się czym jest plik *.gitignore*

---

W górnym lewym rogu znajduje się rozwijana lista repozytoriów:

![git_repo_list](./_images/12/git_repo_list.png)

Z niej masz możliwość wybrania aktualnego repozytorium z którym pracujesz. W tym momencie nasze repozytorium istnieje tylko na lokalnym komputerze. Należy umieścić je na serwerze GitHub. W tym celu klikamy:

![git_publish](./_images/12/git_publish.png)

Jeżeli dotychczas nie wykonaliśmy logowania programu do serwisu GitHub, zostaniemy o to poproszeni.

Jeśli nie chcemy, aby repozytorium było publiczne, pozostawiamy zaznaczone pole *Keep this code private* (1). Zachęcamy do tworzenia publicznych repozytoriów i dzielenia się swoją pracą! Darmowe konto w portalu GitHub pozwala na tworzenie prywatnych repozytoriów współdzielonych maksymalnie przez 3 użytkowników. Potwierdzamy chęć opublikowania repozytorium (2) i czekamy na wysłanie danych na serwer.

![git_publish_window](./_images/12/git_publish_window.png)

---

#### :hammer: :fire: Zadanie :fire: :hammer:

1. Opublikuj swoje repozytorium jako publiczne.
2. Przejdź do swojego profilu na [GitHub.com](https://github.com/) i obejrzyj utworzone repozytorium.

---

### Pierwszy commit

Nadajmy sens naszemu pierwszemu repozytorium!

---

#### :hammer: :fire: Zadanie :fire: :hammer:

1. Otwórz folder zawierający repozytorium *hello-git-nazwisko* w środowisku **PyCharm**.
2. Dodaj do projektu nowy skrypt: *colaborative_script.py*. *PyCharm* automatycznie wykryje istnienie repozytorium *Git* w podanym folderze i zapyta się czy chcemy dodać pliki do repozytorium. W tym momencie możemy wcisnąć **Cancel**.

---

*GitHub Desktop* automatycznie wykryje wprowadzone zmiany w plikach. Wyświetlana jest lista zmodyfikowanych plików i treść modyfikacji:

![git_changes](./_images/12/git_changes.png)

Jak widać powyżej, poza dodanym przez nas skryptem *colaborative_script.py* oprogramowanie *PyCharm* utworzyło także dodatkowe pliki konfiguracji środowiska, które zostały zapisane w folderze *.idea*. Pliki te są specyficzne dla danego komputera i dla danej konfiguracji *PyCharm* i nie powinny znaleźć się w repozytorium.

Jedną z opcji ominięcia jest, aby przy każdym wysyłaniu zmian na serwer wykluczać poszczególne pliki odklikująć poszczególne ptaszki przy plikach. Takie rozwiązanie jest uciążliwe i może prowadzić do powstania błędów. Dużo lepszym rozwiązaniem jest dodanie stałego wykluczenia przez wyedytowanie pliku *.gitignore* (1). Tworząc repozytorium dodaliśmy domyślną konfigurację dla języka Python, teraz wystarczy do pliku dodać wpis ***.idea*** (2). Plik *.gitignore* możemy swobodnie edytować w środowisku *PyCharm*:

![git_edit_gitignore](./_images/12/git_edit_gitignore.png)

Po zapisaniu pliku *.gitignore* w *GitHub Desktop* powinny zostać wyświetlone jedynie zmiany dotyczące dodania pliku *colaborative_script.py* oraz edycji samego pliku *.gitignore*:

![git_after_gitignore_edit](./_images/12/git_after_gitignore_edit.png)

Aby wysłać zmiany do serwisu *GitHub* należy wprowadzić opis zmian w polu **Summary** (1), a następnie kliknąć **Commit to master** (2):

![git_commit](./_images/12/git_commit.png)

W tym momencie poinformowaliśmy lokalne repozytorium o wprowadzonych zmianach, należy jeszcze je wysłać na serwer (push). W tym celu klikamy:

![git_push](./_images/12/git_push.png)

Wykonane powyżej czynności odpowiadają wykonaniu komend:

```bash
git commit
git push
```

---

#### :hammer: :fire: Zadanie :fire: :hammer:

1. Wykonaj commit i wyślij utworzony skrypt na serwer *GitHub*.
2. Wróć na stronę serwisu GitHub, otwórz repozytorium i przejrzyj czy wszystkie pliki zostały poprawnie wgrane.

---

### Zarządzanie przez WWW, plik README

Każde repozytorium powinno zawierać plik *README*. Serwis GitHub.com udostępnia proste narzędzie online ułatwiające jego edycję. Aby dodać plik *README* należy zalogować się na serwisie *GitHub*, otworzyć repozytorium i kliknąć:

![git_add_readme](./_images/12/git_add_readme.png)

Po wypełnieniu treści dokumentu *README* można wykonać jego commit do repozytorium klikając:

![git_commit_new_file](./_images/12/git_commit_new_file.png)

---

#### :hammer: :fire: Zadanie :fire: :hammer:

Wypełnij plik *README* treścią zawierającą nazwę repozytorium, autora, wykorzystane narzędzia etc. W plikach *README* możliwe jest wykorzystanie prostych znaczników do formatowania tekstu typu [Markdown](https://help.github.com/articles/basic-writing-and-formatting-syntax/).

---

### Pobieranie zmian z zdalnego repozytorium

Wykonane na zdalnym repozytorium zmiany można natychmiast ściągnąć do lokalnego repozytorium. W tym celu w programie *GitHub Desktop* wybierz opcję **Fetch** w celu ściągnięcia informacji o aktualnym stanie zdalnego repozytorium:

![git_fetch](./_images/12/git_fetch.png)

a następnie:

![git_pull](./_images/12/git_pull.png)

Wykonanie tych operacji odpowiada wykonaniu komend `git fetch` oraz `git merge`.

---

#### :hammer: :fire: Zadanie :fire: :hammer:

Ściągnij zmiany zgodnie z powyższą instrukcją. W folderze naszego projektu powinien być już widoczny plik *README*.

---

### Wysyłanie kolejnych zmian

Wysyłanie kolejnych zmian do zdalnego repozytorium jest równie proste. Wszystkie zmiany wprowadzane w folderze zawierającym repozytorium pojawią się w programie *GitHub Desktop* (z wykluczeniem ignorowanych pików). Aby wykonać wysłanie kolejnych zmian wykonujemy kolejny *commit* (wraz z opisem zmian) i wypychamy (*push*) zmiany na serwer.

---

#### :hammer: :fire: Zadanie :fire: :hammer:

1. Zmodyfikuj skrypt *colaborative_script.py* tak aby wyświetlał wiadomość: *This is my first Python repository*. A następnie wypisze kody ASCII kolejnych liter z powyższego napisu.
2. Wykonaj *commit* powyższych zmian i wyślij zmiany na serwer *GitHub*.

---

Na stronie GitHub w zakładce *Commits* swojego repozytorium możesz obserwować zmiany dokonane w poszczególnych commitach, przywrócić wcześniejszą wersję i wiele innych. Zapoznaj się z nimi samodzielnie.

Podobnie jak inne serwisy społecznościowe GitHub umożliwia komunikację między użytkownikami. Znajdź profil kolegi/koleżanki i zacznij go obserwować (*follow*). Poszukaj interesujących projektów i oznacz je jako jako obserwowane (*watch*/*star*).

## Współpraca nad projektami

Jedną z najważniejszych funkcjonalności gita jest możliwość kooperacji wielu autorów przy jednym projekcie. W celu dodania osoby współpracującej na stronie danego repozytorium (bezpośrednio w serwisie [GitHub.com](https://github.com) należy wybrać zakładkę **Setiings** a następnie **Collaborators**. Następnie korzystając z paska wyszukiwania można wyszukać innych użytkowników *GitHub* i dodać je jako osoby współpracujące. Od tego momentu wybrany użytkownik ma możliwość modyfikowania Twojego repozytorium.

---

#### :hammer: :fire: Zadanie :fire: :hammer:

Połącz się w grupę dwuosobową z kolegą/koleżanką obok i wzajemnie dodajcie swoje profile do swoich repozytoriów.

---

Aby rozpocząć pracę nad zmianą projektu innego użytkownika należy *sklonować* jego projekt (`git clone`). W tym celu przechodzimy do programu *GitHub Desktop* i z menu wybieramy *Clone repository*:

![git_clone_repository](./_images/12/git_clone_repository.png)

Następnie wyszukujemy repozytorium współautora programu i klikamy:

![git_clone](./_images/12/git_clone.png)

---

#### :hammer: :fire: Zadanie :fire: :hammer:

1. Wykonaj *clone* repozytorium kolegi/koleżanki z grupy.
2. Zmodyfikuj program, tak aby poza kodami ASCII poszczególnych liter w każdej linijce program prezentował właściwy znak. Na końcu program powinien wyświetlić napis: *This changes were made by Imię Nazwisko*. Np.:

> This is my first Python repository  
> T - 84  
> h - 104  
> i - 105  
> s - 115  
>  
> ...  
>  
> This changes were made by Franek Kowalski

3. W GitHub Desktop wybierz zmienione lokalne repozytorium i dodaj nowy *commit* oraz wyślij go na serwer.
4. Ściągnij zmiany do swojego repozytorium wykonane przez kolegę/koleżankę.

---

## Funkcje w Python

W celu zdefiniowania funkcji w Python korzystamy z słowa kluczowego `def`:

```python
def display_hello():
    print("Hello Python!")
```

W celu wywołania funkcji używamy jej nazwy, a następie `()`:

```python
display_hello()
```

> Hello Python!

Do funkcji możemy przekazać dowolną liczbę parametrów:

```python
def multi_display(string, count):
    for i in range(count):
        print(string)

multi_display("Hello!", 4)
```

> Hello!  
> Hello!  
> Hello!  
> Hello!

Funkcje w Python mogą zwracać wartość, także więcej niż jedną:

```python
def third_power(val):
    return val ** 3


def powers(val):
    second = val ** 2
    third = val ** 3
    fourth = val ** 4
    return second, third, fourth


print(third_power(2))

p2, p3, p4 = powers(3)
print(p2, p3, p4)
```

> 8  
> 9 27 81

## Zadanie końcowe :fire: :hammer:

1. Utwórz na swoim koncie *GitHub* nowe publiczne repozytorium o nazwie: *euler-calculations*, zainicjalizuj dodaj *.gitignore* konfiguracją dla Python, otwórz projekt w *PyCharm* i wedytuj *.gitignore* dodając wykluczenie dla folderu *.idea*. Dodaj plik *euler.py*.

2. Napisz funkcję `factorial(value)`, która zwracać będzie silnię (x!) z wartości `value`. Nie korzystaj z *numpy*. Dodaj przykładowe wywołanie funkcji i wyświetl wynik dla wartości 0, 5 i 8.

3. Wykonaj *commit* zmian i wyślij na serwis *GitHub*.

4. Dodaj funkcję zwracającą wartość liczby Eulera za pomocą sumy szeregu: `euler_from_series(precision)`. Gdzie `precision` określa dokładność przybliżenia wartości liczby Eulera. Do obliczania silni z liczby wykorzystaj stworzoną wcześniej funkcję `factorial`. Dodaj przykład użycia funkcji.

![euler](./_images/12/euler.png)

5. Wykonaj *commit* zmian i wyślij na serwis *GitHub*.

6. **Pamiętaj aby po skończonych laboratoriach wylogować się z programu GitHub Desktop!** W tym celu wybierz *File* &rarr; *Options…* , a następnie w zakładce *Accounts* kliknij *Sign Out*. Warto także usunąć lokalne repozytoria z dysku komputera i z programu GitHub Desktop. W tym celu wybierz odpowiednie repozytorium i z menu *Repository* wybierz *Remove*.

## Zadanie domowe :boom: :house:

#### Zadanie 0

Możesz usunąć repozytorium stworzone w czasie laboratorium, aby nie zaśmiecać swojego profilu na GitHub (*Settings* &rarr; *Options* &rarr; *Danger Zone* &rarr; *Delete this repository*).

#### Zadanie 1

Czasami w czasie wspólnej pracy nad jednym plikiem może dojść do konfliktu. Dlaczego? W takiej sytuacji wykonywana jest operacja *merge*. Dowiedz czym jest *merge*, jak się go stosuje i jak sobie z tym radzić!

#### Zadanie 2

Zastanów się jakie pliki mogą znaleźć się w repozytorium? Czy odpowiednie jest wrzucanie plików .exe lub .bin? Czy można wrzucić do repozytorium projekt spakowany za pomocą .zip? Dlaczego odpowiedź na powyższe pytania jest przecząca? Które pliki definiujące projekt/środowisko programistyczne powinny znaleźć się w repozytorium?

---

Autorzy: *Tomasz Mańkowski*, *Jakub Tomczyński*
