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
disp('Macierz:');
disp(a);
disp('Pojedynczy element:');
disp(a(3, 2));
disp('Pierwszy wiersz:');
disp(a(1, :));
```

> Macierz:  
> &emsp;1.0000&emsp;5.0000&emsp;3.0000  
> &emsp;63.0000&emsp;22.6000&emsp;2.0000  
> &emsp;12.9000&emsp;5.0000&emsp;3.0000  
>  
> Pojedynczy element:  
> &emsp;5  
>  
> Pierwszy wiersz:  
> &emsp;1&emsp;5&emsp;3

---

#### :hammer: :fire: Zadanie :fire: :hammer:

Uruchom środowisko Matlab.

---

## Zadanie końcowe :fire: :hammer:

Bla Bla

## Zadanie domowe :boom: :house:

#### Zadanie 1

Bla

---

Autorzy: *Tomasz Mańkowski*
