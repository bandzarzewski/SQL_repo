#1. Podaj imiona i nazwiska wszystkich aktorów.
SELECT Imie,nazwisko FROM aktor;

# 2.Podaj filmy, w których liczba aktorów przekracza 10.
SELECT Tytul, liczbaAktorow FROM film WHERE liczbaAktorow>=10;

# 3. Podaj tytuł, czas i kiedy wyprodukowano filmy, które miały premierę w 2010 roku i należą do gatunku filmów sensacyjnych.
SELECT Tytul,Czas,wyprodukowano FROM film WHERE wyprodukowano BETWEEN '2010-01-01' AND '2010-12-30'  AND Gatunek="fantastyczny";

# 4. Którzy aktorzy mężczyźni grali rolę w „Przeminęło z wiatrem”?

--                      || SPRAWDZIĆ TO JESZCZE RAZ !!!

SELECT aktor.Imie ,film.Tytul  FROM aktor,film WHERE aktor.Plec = 'm' AND film.Tytul = "Przeminelo z wiatrem" ;


# SELECT  a.Imie,a.Nazwisko,f.TytulFilmu FROM aktor AS a, gwiazdyw AS f WHERE f.TytulFilmu="Przeminelo z wiatrem" AND a.Plec="m";
# SELECT  a.Imie,a.Nazwisko, film.Tytul FROM aktor AS a WHERE film.Tytul="Przeminelo z wiatrem";
-- Clark	Gables
-- Daniel	Radcliffe
SELECT TytulFilmu, ImieGwiazdy FROM gwiazdyw WHERE ImieGwiazdy="Clark" OR ImieGwiazdy="Daniel" ;
-- SELECT g.ImieGwiazdy, a.Plec FROM gwiazdyw AS g, aktor AS a WHERE a.Nazwisko=g.Id AND Plec="m";

# 5. Które filmy są dłuższe od „Przeminęło z wiatrem”?
SELECT Tytul FROM film WHERE  Czas > 120;

# 6. Podaj film, w którym zagrała największa liczba aktorów.
SELECT  MAX(liczbaAktorow), Tytul FROM film;
# 7. Podaj średni czas trwa filmu.
SELECT Tytul, AVG(Czas) FROM film;

# 8. Wyświetl filmy od najdłuższego do najkrótszego.
SELECT Tytul, Czas FROM film ORDER BY Czas DESC;

# 9. Podaj średni czas filmu wyprodukowanego w każdym studiu.
SELECT AVG(Czas), nazwaStudia FROM film  GROUP BY nazwaStudia ;

# 10. Podaj średni czas filmu wyprodukowanego w poszczególnych latach.
SELECT  AVG(Czas), wyprodukowano FROM film  GROUP BY wyprodukowano  ;

#Część 2:
#1. Podaj wszystkie filmy, które posiadają w tytule ciąg „Harry”.
SELECT Tytul FROM film WHERE Tytul LIKE '%Harry%';
#2. Podaj wszystkie tytuły filmów, które zostały wyprodukowane w studiu „Hollywood” i wyprodukowano je przed rokiem 1990 lub po 2000.
-- SELECT Tytul , nazwaStudia, wyprodukowano FROM film WHERE nazwaStudia="Hollywood"  AND wyprodukowano <=  -- AND wyprodukowano > '2000-01-01' ;
SELECT Tytul , nazwaStudia, wyprodukowano FROM film WHERE wyprodukowano NOT BETWEEN '1990-01-01' AND '2010-01-01' AND nazwaStudia="Hollywood"; 


#3. Podaj wszystkie tytuły filmów i daty urodzenia grających w filmach aktorów.
SELECT f.Tytul, a.DataUrodzenia, a.Imie,a.Nazwisko FROM film AS f, aktor AS a;

#4. Wypisz takich aktorów, którzy nie zagrali w „Przeminęło z wiatrem”.
SELECT * FROM gwiazdyw WHERE NOT TytulFilmu="Przeminelo z wiatrem"; 

#5. Wypisz datę premiery oraz datę urodzenia dyrektora produkcji wszystkich filmów.

SELECT DISTINCT f.wyprodukowano AS 'Data produkcji ', d.DataUr AS 'Data urodzenia reżysera', f.tytul AS 'Tytuł filmu' FROM dyrektorprodukcji d ,film f;
#6. Dla każdego gatunku filmu podaj średni wiek aktorów w nim występujących.

-- SPRAWDZIĆ !!! 

SELECT AVG( YEAR(now()) - YEAR(DataUrodzenia)) AS 'avg_age', g.TytulFilmu FROM aktor, gwiazdyw g;


#7. Podaj wszystkich aktorów, którzy mają więcej niż 10 zagranych ról i zagrali w filmach wyprodukowanych po 2005 roku.

-- Poprawić !!! użyć JOIN 

SELECT Tytul,wyprodukowano FROM film WHERE wyprodukowano >'2005-01-01';
SELECT g.ImieGwiazdy, g.NazwiskoGwiazdy, f.Tytul FROM gwiazdyw AS g JOIN film  AS f ON g.TytulFilmu=f.Tytul WHERE f.liczbaAktorow > 10 AND f.wyprodukowano>'2005-01-01' ;



#8. Podaj kobiety grające w filmach, w których dyrektorami produkcji są osoby, których wartość konta jest większa od średniej wartości konta dyrektorów produkcji.
SELECT *FROM aktor WHERE Plec='k';
SELECT *FROM dyrektorprodukcji WHERE WartoscKonta > '200000';
#9. Podaj filmy w których dyrektor był zarazem gwiazdą.
#10. Wypisz, ile razem nagród otrzymali aktorzy oraz aktorki urodzeni po 1950 roku.























