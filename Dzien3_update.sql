USE bookstore;
SELECT * FROM Customer WHERE IdCustomer=4;
UPDATE Customer SET CustomerSurname="Psikuta" WHERE IdCustomer=4;
SELECT * FROM Books;
# zwiekszamy cenę o 10 %
UPDATE Books SET price=ROUND(price*1.1,2); 
SELECT * FROM Books;
# max wartosc ksiazki 
SELECT * FROM Books WHERE price =(SELECT MAX(price)FROM Books);
# zwracamy najdroższa książke 
UPDATE BOOKS SET price =price-10 ORDER BY price DESC LIMIT 1;
UPDATE Customer SET CustomerName="Joanna", CustomerSurname="Dostojewska" WHERE IdCustomer=10;
SELECT * FROM Orders;
UPDATE Orders SET Status="Wyslano" WHERE IdOrders=4 OR IdOrders=5;

# INSERT
INSERT INTO Customer VALUES(NULL,"Franiciszek","Janowski","Chorzów");
SELECT * FROM Customer WHERE CustomerSurname="Rutkowski";
SELECT * FROM Books;
SELECT * FROM Orders;


INSERT INTO Orders VALUES(NULL,7,3,'2017-09-12',"Oczekiwanie");  
<<<<<<< HEAD
=======
INSERT INTO Books(AuthorName, AuthorSurname,Title) VALUES("","Grębosz","SymfoniaC++");
>>>>>>> 513b12021c9ac52803c694f6a8241bbd256ef005
