DROP DATABASE IF EXISTS Bookstore;
CREATE DATABASE Bookstore;
USE Bookstore;
CREATE TABLE Books(
`Idbook` int NOT NULL AUTO_INCREMENT,
`AuthorName` TEXT CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
`AuthorSurname` TEXT CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
`Title` TEXT CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
`price` FLOAT,
PRIMARY KEY(`Idbook`)
)DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=1;


CREATE TABLE Customer(
`IdCustomer` int NOT NULL AUTO_INCREMENT,
`CustomerName` TEXT CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
`CustomerSurname` TEXT CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
`Town` TEXT CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
PRIMARY KEY(`IdCustomer`)
)DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=1;

CREATE TABLE Orders(
`IdOrders` int NOT NULL AUTO_INCREMENT,
`IdCustomer` int NOT NULL ,
`IdBook` int NOT NULL ,
`OrderDate` DATE NOT NULL,
`Status` VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
PRIMARY KEY(`IdOrders`)
)DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=1;

INSERT INTO Books(AuthorName,AuthorSurname,Title,price) VALUES 
("Jan", "Miachalak", "Zaawansowane programowanie w PHP", 47.29),
("Andrzej", "Krawczyk", "Windows 10 PL. Zaawansowana administracja systemem", 49.99),
("Paweł", "Jakubowski", "HTML 5. Tworzenie witryn", 53.65),
("Tomasz", "Kowalski", "Urządzenia techniki komputerowej", 34.15),
("Łukasz", "Pasternak", "Java: Tworzenie nowoczesnych stron WWW", 29.99);

INSERT INTO Customer(CustomerName,CustomerSurname,Town) VALUES 
("Łukasz", "Lewandowski", "Poznań"),
("Jan", "Nowak", "Katowice"),
("Maciej", "Wójcik", "Bydgoszcz"),
("Agnieszka", "Jankowska", "Lublin"),
("Tomasz", "Mazur", "Jelenia Góra"),
("Michał", "Zieliński", "Kraków"),
("Artur", "Rutkowski", "Kielce"),
("Mateusz", "Skorupa", "Gdańsk"),
("Jerzy", "Rutkowski", "Włóżmitu"),
("Anna", "Karenna", "Tumidaj");

INSERT INTO Orders(IdBook,IdCustomer,OrderDate,Status) VALUES
(2, 4, "2017-10-08", "Oczekiwanie"),
(7, 1, "2017-09-05", "Wyslano"),
(9, 1, "2017-10-11", "Wyslano"),
(2, 2, "2017-10-15", "Oczekiwanie"),
(2, 5, "2017-08-12", "Oczekiwanie"),
(3, 2, "2017-10-20", "Wyslano"),
(4, 3, "2017-08-14", "Wyslano"),
(8, 1, "2017-08-19", "Wyslano"),
(3, 1, "2017-11-19", "Wyslano"),
(9, 2, "2017-12-28", "Oczekiwane");


/*
SELECT*FROM Orders;

-- 1.Ułóż książki alfabetycznie po tytule
SELECT*FROM Books ORDER BY Title ASC;
-- 2.Znajdź najdroższą książkę w bazie
SELECT MAX(price) FROM Books;
-- 3. Wyświetl wszystkie wysłane zamówienia
SELECT * FROM Orders WHERE Status="Wysłano";
-- 4. Wyświetl wszystkich klientów o nazwisku Pszczoła
SELECT * FROM Customer WHERE CustomerSurname="Pszczoła";
-- 5. Wyświetl wszystkie książki zawierające wyrażenie Windows w tytule
SELECT * FROM Books WHERE Title LIKE "%Windows%";
-- 6.Wyświetl zamówienia odnajwcześniej dokonanego do najpóźniej
SELECT * FROM Orders ORDER BY OrderDate ASC; -- lub DESC 
*/
-- SELECT C.CustomerName, C.CustomerSurname,O.IdOrders,O.OrderDate FROM Orders AS O,Customer AS C WHERE O.IdCustomer=C.IdCustomer;
-- SELECT C.CustomerName, C.CustomerSurname, O.IdBook FROM Customer AS C, Orders AS O WHERE O.IdBook = 2 AND C.IdCustomer = O.IdCustomer;
-- SELECT B.AuthorName, B.AuthorSurname, B.Title, C.CustomerName, C.CustomerSurname FROM Books AS B, Orders AS O ,Customer AS C WHERE C.CustomerName="Jan" AND C.CustomerSurname="Nowak" AND C.IdCustomer=O.IdCustomer AND B.IdBook=O.IdBook;
SELECT  C.CustomerName, C.CustomerSurname, O.IdOrders,O.OrderDate,O.Status,B.Title FROM Orders AS O,Customer AS C,B AS Books WHERE 

