SELECT 
    orders.OrderID, customers.ContactName, orders.OrderDate
FROM
    customers
        INNER JOIN
    orders ON orders.CustomerID = customers.CustomerID;
    
SELECT 
    customers.ContactName, orders.OrderID
FROM
   orders
	LEFT JOIN
      customers ON customers.CustomerID = orders.CustomerID ORDER BY customers.ContactName;
    
SELECT 
    customers.ContactName, orders.OrderID
FROM
    orders
        RIGHT JOIN
    customers ON customers.CustomerID = orders.CustomerID
ORDER BY customers.ContactName;
    
/*    customers.ContactName, orders.OrderID
FROM
    orders
        FULL JOIN
    customers ON customers.CustomerID = orders.CustomerID
ORDER BY customers.ContactName;*/

        