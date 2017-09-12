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
