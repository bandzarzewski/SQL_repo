DROP TABLE IF EXISTS Activity;
CREATE TABLE Activity(
`Idactivity` int NOT NULL AUTO_INCREMENT,
`Message` TEXT  CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
`Query` TEXT  CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
PRIMARY KEY(`Idactivity`))
DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1;

DROP TRIGGER wypozyczSamochod  ;
delimiter |
CREATE TRIGGER wypozyczSamochod 
AFTER INSERT ON wypozyczenia 
FOR EACH ROW BEGIN
INSERT INTO Activity 
SET Message = 
(SELECT(CONCAT("Wypozyczono auto"," ", marka," ", model))FROM auta WHERE idauta=NEW.idauta);
END
|


DROP TRIGGER dodanoNowySamochod ;
|
CREATE TRIGGER dodanoNowySamochod
AFTER INSERT ON auta 
FOR EACH ROW BEGIN
INSERT INTO activity
SET Message=
(SELECT(CONCAT("Dodadno nowe auto"," ",new.marka," ",new.model," ",new.przebieg)));
end
|

/*
INSERT INTO wypozyczenia 
SET idklienta = 2, idauta=2,datawyp="2017-09-14", 
datazwrotu="2017-09-15",naleznosc=101;
*/
INSERT INTO auta SET 
marka="Audi",
model="A4",
przebieg=130000,
rocznik=2016,
kolor="srebny",
ubezpieczenie=1;