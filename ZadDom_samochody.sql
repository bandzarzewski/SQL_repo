USE samochody;
#1.Imię i nazwisko (tylko te dwie dane) klienta numer 4.
SELECT imie,nazwisko FROM klienci WHERE idklienta=4;
#2.Wszystkie dane samochodów z rocznika 2010.
SELECT * FROM auta WHERE rocznik=2010;
#3.Wszystkie dane na temat samochodów marki Ford posiadanych przez nas
SELECT *FROM auta WHERE marka='Ford';
#4.Samochody o numerach w bazie od 2 do 4 włącznie.
SELECT*FROM auta WHERE idauta >=2 AND idauta<=4;
#5.Imiona i nazwiska klientów, którzy mieszkają w Katowicach na ulicy Rolnej (pod dowolnym numerem).
SELECT imie,nazwisko FROM klienci WHERE adres LIKE '%Rolna%';
#6.Samochód w bazie (marka, model), którego ubezpieczenie jest najdroższe z wszystkich aut.
SELECT marka,model,ubezpieczenie FROM auta WHERE ubezpieczenie = (SELECT MAX(ubezpieczenie) FROM auta);
#7.Samochód (idauta, marka, model), który został najwcześniej wypożyczony (decyduje datawyp).
SELECT a.idauta, a.marka, a.model, w.datawyp FROM auta AS a, wypozyczenia AS w WHERE a.idauta=w.idauta ORDER BY w.datawyp ASC;
#8.Imiona i nazwiska osób, które wypożyczyły kiedykolwiek samochód nr 1.
SELECT k.imie, k.nazwisko, a.idauta FROM klienci AS k, 
wypozyczenia AS w, auta AS a WHERE k.idklienta = w.idklienta AND a.idauta=w.idauta AND  a.idauta = 1;
#9.Jakie auta (marka, model) kiedykolwiek wypożyczyła u nas osoba nr 4?
SELECT a.marka, a.model, k.idklienta FROM klienci AS k, 
wypozyczenia AS w, auta AS a WHERE k.idklienta = w.idklienta AND a.idauta=w.idauta AND k.idklienta=4;
#10.Jakie auta (marka, model) kiedykolwiek wypożyczyła u nas osoba o nazwisku "Pastewniak"?
SELECT a.marka, a.model, k.nazwisko FROM klienci AS k, 
wypozyczenia AS w, auta AS a WHERE k.idklienta = w.idklienta AND a.idauta=w.idauta AND k.nazwisko="Pastewniak";