DROP DATABASE IF EXISTS `Bibloteka`;
CREATE DATABASE `Bibloteka`;
USE `Bibloteka`;

CREATE TABLE `Ksiazka`(
`Id_ksiazka` INT(10)NOT NULL AUTO_INCREMENT ,
`Imie` VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
`NazwiskoAutora`VARCHAR(40) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
`ISBN` INT(20) NOT NULL UNIQUE,
`Tytul`VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL ,
`RokWydania`INT(20) NOT NULL, 
`DataDodania` Date NOT NULL,
PRIMARY KEY(`Id_ksiazka`))
DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1;


CREATE TABLE `Czytelnik`(
`Id_czytelnik` INT(10) NOT NULL AUTO_INCREMENT,
`Imie` VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
`Nazwisko`VARCHAR(40) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
`DataUrodzenia` Date NOT NULL,
`Pesel` INT (20) NOT NULL,
PRIMARY KEY(`Id_czytelnik`))
DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1;




CREATE TABLE `OddzialBibloteki`(
`Id_oddzial` int(10) NOT NULL AUTO_INCREMENT,
`Nazwa`VARCHAR(80) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
`Adres` VARCHAR(80) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
`Informacje` VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_polish_ci,
PRIMARY KEY(`Id_oddzial`))
DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1;

-- DROP TABLE `Wypozyczyl`;
CREATE TABLE `Wypozyczyl`(
`Id_wypozyczyl` int(10) NOT NULL AUTO_INCREMENT,
`Id_czytelnik` INT(10) NOT NULL,
`Id_ksiazka` INT(10) NOT NULL,
`Id_oddzial`INT(10) NOT NULL,
`DataWypozyczenia` Date NOT NULL DEFAULT "2011-05-27",
PRIMARY KEY(`Id_wypozyczyl`),
FOREIGN KEY(`Id_czytelnik`) REFERENCES czytelnik(Id_czytelnik),
FOREIGN KEY(`Id_ksiazka`) REFERENCES ksiazka(Id_ksiazka),
FOREIGN KEY(`Id_oddzial`) REFERENCES oddzialbibloteki(Id_oddzial)

)DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1;

SHOW CREATE TABLE `Czytelnik`;
INSERT INTO ksiazka(Imie,NazwiskoAutora,ISBN,Tytul,RokWydania) VALUES( 'Vance', 'Ashlee',100,'Elon Musk. Biografia',2016);
INSERT INTO ksiazka(Imie,NazwiskoAutora,ISBN,Tytul,RokWydania) VALUES( 'Bruce', 'Eckel',200,'Thinking in Java.',1997);
INSERT INTO ksiazka(Imie,NazwiskoAutora,ISBN,Tytul,RokWydania) VALUES( 'Elisabeth', 'Freeman',300,'Wzorce projektowe',2000);

INSERT INTO czytelnik(Imie,Nazwisko,DataUrodzenia,Pesel) VALUES( 'Maciek','Kowalski',"1987-09-27",146785);
INSERT INTO czytelnik(Imie,Nazwisko,DataUrodzenia,Pesel) VALUES( 'Adam','Sienkiewicz',"1934-01-13",157934);
INSERT INTO czytelnik(Imie,Nazwisko,DataUrodzenia,Pesel) VALUES( 'Ola','Kot',"1994-03-18",567345);

INSERT INTO oddzialbibloteki(Nazwa,Adres) VALUES('Pierwsza bibloteka','ul. Reja 13');
INSERT INTO oddzialbibloteki(Nazwa,Adres) VALUES('Druga bibloteka','ul. Ruska 1');

INSERT INTO wypozyczyl(Id_czytelnik,Id_ksiazka,Id_oddzial,DataWypozyczenia)VALUES(1,1,2,"2017-09-17"); 
INSERT INTO wypozyczyl(Id_czytelnik,Id_ksiazka,Id_oddzial)VALUES(2,2,1); 

DROP TABLE `KsiazkaWOddzial`;
CREATE TABLE `KsiazkaWOddzial`(
`Id_ksiazkaWOddzial` int(10) NOT NULL AUTO_INCREMENT,
`Id_ksiazka` INT(10) NOT NULL,
`Id_oddzial`INT(10) NOT NULL,
`DataWprowadzeniaKsiazki` Date NOT NULL ,
PRIMARY KEY(`Id_ksiazkaWOddzial`),
CONSTRAINT Id_ksiazka  FOREIGN KEY(`Id_ksiazka`) REFERENCES ksiazka(Id_ksiazka),
CONSTRAINT Id_oddzial FOREIGN KEY(`Id_oddzial`) REFERENCES oddzialbibloteki(Id_oddzial)
)DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1;

-- Napisz trigger, który po dodaniu ksiązki, doda ją do tego oddziału biblioteki

-- TU TRZEBA CHYBA DODAĆ DO TABELI _ KSIAZKI W ODDZIALE !
-- trigger - po dodaniu 'ksiazku' w tabeli ksiazki dla kazdego rekordu, dodaj w tabeli 'KsiazkiWOdziale' SET 

DROP TRIGGER dodanieKsiazki;
delimiter |
CREATE TRIGGER dodanieKsiaki
AFTER INSERT ON ksiazka
FOR EACH ROW BEGIN 
INSERT INTO ksiazkawoddzial SET Id_ksiazka=NEW.Id_ksiazka ;
-- INSERT ksiazkawoddzial SET Id_ksiazka=NEW.Id_ksiazka WHERE ksiazkawoddzial.Id_ksiazka=ksiazka.Id_ksiazka;
END
|


delimiter |
CREATE TRIGGER dodanoNowaKsiazke 
AFTER INSERT ON Ksiazka 
FOR EACH ROW  
INSERT INTO OddzialBibloteki
SET Informacje=(SELECT(CONCAT("Dodano nową książke"," ",new.Tytul,"",new.Imie," ",new.NazwiskoAutora)));
END
|

INSERT INTO ksiazka(Imie,NazwiskoAutora,ISBN,Tytul,RokWydania) VALUES( 'Kath', 'Sierra',400,'Rusz glowa! Java',2017);



