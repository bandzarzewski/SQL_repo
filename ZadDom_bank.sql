USE bank_v2;
# 1. Wyświetl dane wszystkich pracowników w banku.
SELECT * FROM pracownicy;
# 2. Wyświetl informację o wszystkich stanowiskach w banku.
SELECT * FROM stanowiska;
# 3. Wyświetl informacje o wszystkich działach w banku.
SELECT * FROM dzialy;
# 4. Wyświetl imiona, nazwiska i pensję wszystkich pracowników.
SELECT imie,nazwisko,pensja FROM pracownicy;
# 5. Wyświetl imiona , nazwiska i całkowite wynagrodzenie (pensja + dodatki) wszystkich pracowników banku.
SELECT imie,nazwisko, pensja+dodatki FROM pracownicy;
# 6. Zmodyfikuj tak zapytanie z zadania nr 5 aby nadać nową nazwę „wynagrodzenie całkowite” kolumnie o nazwie „No column name”.
SELECT imie,nazwisko, (pensja+dodatki)AS'wynagrodzenie całkowite' FROM  pracownicy;

