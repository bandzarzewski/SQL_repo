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
#7. Oblicz ile dany pracownik zarabia dziennie, tygodniowo, miesięcznie i rocznie. Wynik posortuj malejąco. 
# Dane wyświetl w konwencji: Imię i Nazwisko, Dniówka, Tygodniówka, Pensja miesięczna, Pensja roczna.
SELECT 
    imie,
    nazwisko,
    (pensja * 12) AS 'Roczna pensja',
    pensja AS 'Miesieczna pensja',
    ROUND(pensja / 4, 2) AS 'Tygodniowa pensja',
    ROUND(pensja / 30, 2) AS 'Dzienne zarobki'
FROM
    pracownicy;

# 8. Pokaż wszystkich pracowników, których nazwiska zaczynają się na M. Wyświetl tylko Imię i Nazwisko pracownika. 
SELECT imie, nazwisko FROM pracownicy WHERE nazwisko LIKE 'M%';
# 9. Pokaż wszystkich pracowników, którzy pracują w dziale logistyki lub informatyki. W wyniku wyświetl tylko imię i nazwisko pracownika
SELECT p.imie,p.nazwisko, d.nazwa FROM pracownicy AS p , dzialy AS d WHERE p.ID_dzialu=d.ID_dzialu AND d.nazwa='Informatyka' OR d.nazwa='Logistyka' ;
# 10. Pokaż wszystkich pracowników których bezpośrednim przełożonym jest Leopold Banko. 
# Wyniki przedstaw w konwencji imię, nazwisko w jednej kolumnie i imię i nazwisko przełożonego w drugiej kolumnie.

SELECT 
    CONCAT(p.imie, ' ', p.nazwisko) AS 'Pracownik ',
    CONCAT(m.imie, ' ', m.nazwisko) AS 'Szef'
FROM
    pracownicy AS p
        JOIN
    pracownicy AS m ON p.ID_pracownika = m.ID_przelozonego
WHERE
   # m.ID_pracownika=150;
    m.nazwisko = 'Banko';  

