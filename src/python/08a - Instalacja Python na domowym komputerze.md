# 08a - Instalacja Python na domowym komputerze

### Wersje Pythona: Python 3 czy Python 2?

**Zdecydowanie Python 3!**. Aktualnie utrzymywane są dwie główne wersje interpretera: 3 oraz 2 (Python 3.74 i Python 2.7.16 w momencie pisania instrukcji). Dzieje się tak ze względu na konieczność utrzymania kompatybilności wstecznej. Obie wersje różnią się na tyle, że uruchomienie skryptu w nieprawidłowej wersji skończy się niepowodzeniem. Dla nowych projektów Python 3 jest najlepszym wyborem.

## Instalacja interpretera *python3*

### Microsoft Windows 10

**UWAGA** Instalacja Pythona z *Microsoft Store* wymaga aktualizacji systemu do najnowszej wersji. W większości wypadków *Windows Update* wbudowany w system jest wystarczający. W przypadku problemów z ściągnięciem Pythona z *Microsoft Store* zaktualizuj system używając programu dostępnego pod przyciskiem ***Update Now*** na stronie: https://www.microsoft.com/en-us/software-download/windows10

Aktualnie Microsoft udostępnia instalację najnowszej wersji Pythona wprost z *Microsoft Store*, jest to zalecany sposób instalacji. W tym celu odszukaj w systemie *Microsoft Store*: wciśnij przycisk **Windows** (1), zacznij wpisywać na klawiaturze **Microsoft Store** (2), a następnie z znalezionych wyników wybierz aplikację (3).

![1_otworz_store](_images/08a/1_otworz_store.png)

Za pomocą wyszukiwarki w prawym górnym rogu wyszukaj frazę **python**, wciśnij `ENTER`.

![2_wyszukaj_python](_images/08a/2_wyszukaj_python.png)

Z wyników wyszukiwania, z kategorii **Apki** wybierz najnowszą wersję Pythona (**bez Beta!**). W momencie pisania instrukcji jest to Python 3.7.

![3_wybierz_python](_images/08a/3_wybierz_python.png)

Kliknij **Pobierz**. W przypadku braku konta *Microsoft* na używanym przez nas komputerze zostaniemy zapytani o chęć zalogowania, nie musimy tego robić i klikamy *Nie, dziękuję*.

![4_pobierz](_images/08a/4_pobierz.png)

Czekamy na zakończenie procesu instalacji i zamykamy *Microsoft Store*.

### Linux Ubuntu 18.04

W Ubuntu od wersji 18.04 Python 3 jest zainstalowany domyślnie razem z instalacją systemu. Konieczne jest jedynie instalacja menadżera pakietów dla Pythona 3 czyli *pip3*.

W celu instalacji otwórz terminal wciskając na klawiaturze kombinację klawiszy: `Ctrl + Alt + T`. Następnie wykonaj następujące komendy (przepisz/wklej i zatwierdź wciskając `ENTER`):

1. Zacznij od zaktualizowania listy pakietów (przy wykonaniu pierwszej komendy pojawi się pytanie o hasło użytkownika, należy je wpisać i zatwierdzić klawiszem `ENTER`):

```shell
sudo apt update
```

2. Zainstaluj menadżer *pip* dla Python 3:

```shell
sudo apt install python3-pip
```

### macOS

TODO

## Instalacja pakietów dla Python 3

Czysta instalacja Pythona dostarcza jedynie podstawowej funkcjonalności języka. Pomimo, że jest to rozbudowany i wielozadaniowy język skryptowy możliwe jest rozszerzenie jego funkcjonalności poprzez instalację pakietów. Istnieje cały szereg pakietów, począwszy od pakietu automatyzującego wyświetlanie pasków postępu ([tqdm](https://github.com/tqdm/tqdm)), na narzędziach do uczenia głębokich sieci neuronowych ([PyTorch](https://pytorch.org/)) skończywszy.

Instalacja pakietów zazwyczaj wykonywana jest za pomocą menażera pakietów dla Pythona czyli *pip*. Wywołanie menadżera pakietów odbywa się z linii poleceń. Uruchomienie linii poleceń różni się zależnie od systemu. Uruchom terminal zgodnie z poniższą instrukcją, zależnie od wykorzystywanego systemu operacyjnego:

### Microsoft Windows 10

Na klawiaturze wciśnij kombinację klawiszy: `Windows + R`. Pojawi się okienko *Uruchamianie*. Wpisz na klawiaturze frazę **cmd** (1), a następnie zatwierdź wciskając `ENTER` lub **OK** (2).

![5_windows_cmd](_images/08a/5_windows_cmd.png)

### Linux Ubuntu

Wciśnij na klawiaturze kombinację klawiszy: `Ctrl + Alt + T`.

### macOS

TODO

### Właściwa instalacja pakietów

W otwartym terminalu wykonaj następujące komendy (przepisz/wklej i zatwierdź wciskając `ENTER`):

1. Wykonaj aktualizację menadżera pakietów *pip*:

```shell
pip3 install --upgrade pip
```

2. Zainstaluj wykorzystywane na zajęciach pakiety:

```shell
pip3 install numpy pandas matplotlib jupyter
```

Powyższa komenda zainstaluje następujące pakiety:

- [NumPy](https://numpy.org/) - podstawowy pakiet do obliczeń, zawiera między innymi operacje macierzowe,
- [Pandas](https://pandas.pydata.org/) - zaawansowana biblioteka struktur danych oparta na NumPy,
- [Matplotlib](https://matplotlib.org/) - pakiet rysujący wykresy,
- [Jupyter](https://jupyter.org/) - interaktywne środowisko programistyczne i obliczeniowe.

## Instalacja PyCharm

PyCharm jest integrowanym środowiskiem programistycznym dla języka Python stworzonym przez firmę JetBrains. Jest to oprogramowanie wieloplatformowe, którego można używać na systemach Windows, GNU/Linux i macOS.

### Microsoft Windows 10

1. Wejdź na stronę: [https://www.jetbrains.com/pycharm/download/#section=windows](https://www.jetbrains.com/pycharm/download/#section=windows)

2. Ściągnij wersję *Community* klikając czarny przycisk **Download**:

![6_download_pycharm](_images/08a/6_download_pycharm.png)

3. Uruchom ściągnięty instalator. Przeprowadź instalację z domyślnymi ustawieniami.

### Linux Ubuntu

W celu instalacji otwórz terminal wciskając na klawiaturze kombinację klawiszy: `Ctrl + Alt + T`. Następnie wykonaj następującą komendę (przepisz/wklej i zatwierdź wciskając `ENTER`):

```shell
sudo snap install pycharm-community --classic
```

### macOS

TODO

## Pierwsze uruchomienie PyCharm i konfiguracja środowiska

Przy pierwszym uruchomieniu PyCharm, bez względu na wykorzystywany system operacyjny, zostaniemy zapytani o chęć zaimportowania ustawień środowiska. Wybieramy **Do not import settings** (1), a następnie **OK** (2):

![7_pycharm_import](_images/08a/7_pycharm_import.png)

Potwierdzamy licencję (1) i klikamy **Contuniue** (2):

![8_pycharm_license](_images/08a/8_pycharm_license.png)

Decydujemy czy chcemy pomagać w rozwijaniu PyCharm poprzez przesyłanie raportów . Wybieramy **Send Usage Statistics** lub **Don't send**:

![9_pycharm_statistics](_images/08a/9_pycharm_statistics.png)

Następnie mamy możliwość dostosowania interfejsu użytkownika do własnych preferencji. Można wykonać zmiany. Domyślne ustawienia uzyskujemy klikając **Skip Remaining and Set Defaults**:

![10_pycharm_customize](_images/08a/10_pycharm_customize.png)

W kolejnych krokach skonfigurujemy domyślny interpreter Python 3 wykorzystywany przy tworzeniu nowych projektów przez PyCharm. Kliknij **Configure** (1), a następnie **Settings** (2):

![11_pycharm_settings](_images/08a/11_pycharm_settings.png)

Przejdź do zakładki **Project Interpreter** (1), a następnie kliknij koło zębate w prawym górnym rogu (2):

![12_pycharm_interpreter_tab](_images/08a/12_pycharm_interpreter_tab.png)

Z wyskakującej listy wybieramy **Add...**:

![13_pycharm_add](_images/08a/13_pycharm_add.png)

Wybieramy zakładkę **System Interpreter** (1) i zatwierdzamy przyciskiem **OK** (2):

![14_pycharm_system_interpreter](_images/08a/14_pycharm_system_interpreter.png)

Po chwili interpreter zostanie dodany i zostanie wyświetlona pełna lista zainstalowanych dla niego pakietów. Zatwierdzamy wciskając **OK**:

![15_pycharm_ok](_images/08a/15_pycharm_ok.png)

---

Autorzy: *Tomasz Mańkowski*, *Jakub Tomczyński*
