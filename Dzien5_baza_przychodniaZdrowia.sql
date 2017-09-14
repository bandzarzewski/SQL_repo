DROP DATABASE IF EXISTS `Przychodnia zdrowia`;
USE `Przychodnia zdrowia`;

CREATE DATABASE `Przychodnia zdrowia`;
DROP TABLE IF EXISTS `pacjent`;
CREATE TABLE `pacjent`(
`Id_pacjent` int(10) NOT NULL AUTO_INCREMENT,
`imie` VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
`nazwisko` VARCHAR(40) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
`pesel` VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
`telefon` int(10)  NOT NULL,
`ulica` VARCHAR (50) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
`miasto` VARCHAR (50) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL
PRIMARY KEY(`Id_pacjent`)
)DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1;

DROP TABLE IF EXISTS `lekarz`;
CREATE TABLE `lekarz`(
`Id_lekarz`int(10) NOT NULL AUTO_INCREMENT, 
`imie` VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
`nazwisko` VARCHAR(40) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
`specializacja` VARCHAR(40) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
`telefon` int(10)  NOT NULL,
PRIMARY KEY(`Id_lekarz`)

)DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1;

DROP TABLE IF EXISTS `godzWizytLekarza`;
CREATE TABLE `godzWizytLekarza`(
`Id_godzWizytLekarza` int(10) NOT NULL AUTO_INCREMENT,
`Id_lekarz` int(10)  NOT NULL,
`Id_pacjent` int(10) NOT NULL,
`Id_godzPrzyjec`int(10) NOT NULL,
`Dzien_Tygodnia` Date NOT NULL,
`Godz_wizyty`TIME  NOT NULL,
PRIMARY KEY(`Id_godzWizytLekarza`),
FOREIGN KEY(`Id_godzPrzyjec`) REFERENCES godz_przyjec (Id_godzPrzyjec),
FOREIGN KEY(`Id_pacjent`) REFERENCES pacjent (Id_pacjent),
FOREIGN KEY(`Id_lekarz`) REFERENCES lekarz(Id_lekarz)) 
DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1;

DROP TABLE IF EXISTS `umowioneWizyty`;
CREATE TABLE `umowioneWizyty`(
`Id_wizyty` int(10) NOT NULL AUTO_INCREMENT,
`Id_lekarz` int(10),
`Id_pacjent` int(10),
`Date` Date NOT NULL ,
PRIMARY KEY(`Id_wizyty`),
FOREIGN KEY(`Id_pacjent`) REFERENCES pacjent (Id_pacjent),
FOREIGN KEY(`Id_lekarz`) REFERENCES lekarz(Id_lekarz)) 
DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1;

DROP TABLE IF EXISTS `recepta`;
CREATE TABLE `recepta`(
`Id_recepta`int(10) NOT NULL AUTO_INCREMENT,  
`Id_lekarz` int(10),
`Id_pacjent` int(10),
`Nazwa_Leku` Text CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL, 
`Dawkowanie` Text CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL, 
FOREIGN KEY(`Id_pacjent`) REFERENCES pacjent (Id_pacjent),
FOREIGN KEY(`Id_lekarz`) REFERENCES lekarz(Id_lekarz)
)DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1;

DROP TABLE IF EXISTS `godz_przyjec`;
CREATE TABLE `godz_przyjec`(
`Id_godzPrzyjec`int(10) NOT NULL AUTO_INCREMENT, 
`Id_lekarz` int(10),
`Id_pacjent` int(10),
`Poniedziałek_Start` Time NOT NULL,
`Poniedziałek_End` Time NOT NULL,
`Wtorek_Start` Time NOT NULL,
`Wtorek_End` Time NOT NULL,
`Środa_Start` Time NOT NULL,
`Środa_End` Time NOT NULL,
`Czwartek_Start` Time NOT NULL,
`Czwartek_End` Time NOT NULL,
`Piatek_Start` Time NOT NULL,
`Piatek_End` Time NOT NULL,
FOREIGN KEY(`Id_pacjent`) REFERENCES pacjent (Id_pacjent),
FOREIGN KEY(`Id_lekarz`) REFERENCES lekarz(Id_lekarz)
)DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1;

DROP TABLE IF EXISTS Activity;
CREATE TABLE Activity(
`Idactivity` int NOT NULL AUTO_INCREMENT,
`Message` TEXT  CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
PRIMARY KEY(`Idactivity`))
DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1;



