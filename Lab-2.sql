-- Laboratorium 2

-- Ćw. 1.1
-- Napisz polecenie, które oblicza wartość sprzedaży dla każdego
-- zamówienia w tablicy order details i wynik zwraca posortowany
-- w malejącej kolejności (wg wartości sprzedaży).

-- USE northwind
-- SELECT OrderId, SUM((UnitPrice * Quantity) - (Discount * Quantity)) AS "Wartość sprzedaży"
-- FROM [Order Details]
-- GROUP BY OrderId
-- ORDER BY SUM((UnitPrice * Quantity) - (Discount * Quantity)) DESC

-- Ćw. 1.2
-- Zmodyfikuj zapytanie z punktu 1.1, tak aby zwracało pierwszych
-- 10 wierszy

-- USE northwind
-- SELECT TOP (10) OrderId, SUM((UnitPrice * Quantity) - (Discount * Quantity)) AS "Wartość sprzedaży"
-- FROM [Order Details]
-- GROUP BY OrderId
-- ORDER BY SUM((UnitPrice * Quantity) - (Discount * Quantity)) DESC

-- Ćw. 1.3
-- Zmodyfikuj zapytanie z punktu 1.2, tak aby zwracało 10
-- pierwszych produktów wliczając równorzędne.
-- Porównaj wyniki. 

-- Wyniki są takie same, ponieważ 11 element listy jest rózny od 10

-- USE northwind
-- SELECT TOP (10) WITH TIES 
-- OrderId, SUM((UnitPrice * Quantity) - (Discount * Quantity)) AS "Wartość sprzedaży"
-- FROM [Order Details]
-- GROUP BY OrderId
-- ORDER BY SUM((UnitPrice * Quantity) - (Discount * Quantity)) DESC

-- Ćw 2.1
-- Podaj liczbę zamówionych jednostek produktów dla
-- produktów, dla których productid < 3

-- USE Northwind
-- SELECT ProductId, SUM(Quantity) AS "Liczba zamówionych jednostek"
-- FROM [Order Details]
-- WHERE ProductID < 3
-- GROUP BY ProductID

-- Ćw 2.2
-- Zmodyfikuj zapytanie z punktu 2.1 tak aby podawało liczbę
-- zamówionych jednostek produktu dla wszystkich produktów

-- USE Northwind
-- SELECT ProductId, SUM(Quantity) AS "Liczba zamówionych jednostek"
-- FROM [Order Details]
-- GROUP BY ProductID
-- ORDER BY SUM(Quantity) DESC

-- Ćw 2.3
-- Podaj wartość zamówienia dla każdego zamówienia dla którego
-- łączna liczba zamawianych jednostek produktów jest > 250 

-- SELECT ProductId, SUM(Quantity * UnitPrice) AS "Liczba zamówionych jednostek"
-- FROM [Order Details]
-- GROUP BY ProductID 
-- HAVING SUM(Quantity) > 250
-- ORDER BY SUM(Quantity) DESC

--Ćw 3.1
-- Napisz polecenie, które oblicza sumaryczną ilość zamówionych
-- towarów, porządkuje wynik wg productid i ordered i wykonuje
-- kalkulacje rollup.

-- USE Northwind
-- SELECT SUM(quantity), ProductID, OrderID
-- FROM [Order Details] AS od
-- GROUP BY ROLLUP(ProductID, OrderID)
-- ORDER BY ProductID, OrderID

--Ćw 3.1
-- Zmodyfikuj zapytanie z punktu 3.1, tak aby ograniczyć wynik
-- tylko do produktu o numerze 50.

-- USE Northwind
-- SELECT SUM(quantity), ProductID, OrderID
-- FROM [Order Details] AS od
-- WHERE ProductID = 50
-- GROUP BY ROLLUP(ProductID, OrderID)
-- ORDER BY ProductID, OrderID

-- Ćw 3.2
-- Jakie jest znaczenie wartości null w kolumnie productid i
-- orderid?

-- Wartości null są wstawiane w miejsce kolumn po których robiona jest funkcja agregująca częściowa

-- Ćw. 4.1
-- Napisz polecenie, które zwraca productid, orderid i quantity dla
-- wszystkich produktów/zamówień, których orderid > 11070. 
-- Po każdej zmianie productid podsumuj liczbę zamówionych
-- jednostek produktu
-- USE Northwind
-- SELECT ProductId, OrderId, SUM(od.Quantity) AS "Suma"
-- FROM [Order Details] AS od
-- WHERE OrderID > 11070
-- GROUP BY ROLLUP (od.ProductID, OrderID)

-- ćw 5.1
-- Dla każdego pracownika podaj liczbę obsługiwanych przez
-- niego zamówień
-- USE Northwind
-- SELECT SUM(orderId) AS "Suma zamówień", o.EmployeeID, e.lastName, e.FirstName
-- FROM Orders AS o, Employees AS e
-- WHERE e.EmployeeID = o.EmployeeID
-- GROUP BY o.EmployeeID, e.LastName, e.FirstName

-- Ćw 5.2
-- Dla każdego pracownika podaj liczbę obsługiwanych przez
-- niego zamówień z podziałem na lata i miesiące

-- USE Northwind
-- SELECT SUM(orderId) AS "Suma zamówień", o.EmployeeID, MAX(e.LastName) AS "Nazwisko", MAX(e.FirstName) AS "Imię", MAX(Year(o.OrderDate)) AS "Rok", MAX(Month(o.OrderDate)) AS "Miesiąc"
-- FROM Orders AS o, Employees AS e
-- WHERE e.EmployeeID = o.EmployeeID
-- GROUP BY ROLLUP (o.EmployeeID, Year(o.OrderDate), Month(o.OrderDate))
-- ORDER BY MAX(o.OrderDate)

-- Ćw. 5.3
-- Dla każdego spedytora podaj wartość (opłata za przesyłkę)
-- przewożonych przez niego zamówień
-- USE Northwind
-- SELECT SUM(Freight) AS "Wartość opłat za przesyłkę", MAX(s.CompanyName) AS "Firma"  
-- FROM Orders o, Shippers s
-- WHERE s.ShipperID = o.ShipVia
-- GROUP BY (ShipVia)

-- Ćw. 5.4
-- Dla każdego spedytora podaj wartość (opłata za przesyłkę)
-- przewożonych przez niego zamówień z podziałem na
-- poszczególne lata
-- USE Northwind
-- SELECT SUM(Freight) AS "Wartość opłat za przesyłkę", MAX(s.CompanyName) AS "Firma", MAX(Year(o.ShippedDate)) AS "Rok", MAX(Month(o.ShippedDate)) AS "Miesiąc"  
-- FROM Orders o, Shippers s
-- WHERE s.ShipperID = o.ShipVia
-- GROUP BY ROLLUP (ShipVia, YEAR(ShippedDate), MONTH(ShippedDate))

-- Ćw. 5.5
-- Dla każdej kategorii podaj maksymalną i minimalną cenę
-- produktu w tej kategorii
-- USE Northwind
-- SELECT MAX(UnitPrice) AS "Maksymalna cena", MIN (UnitPrice) AS "Minimalna cena", MAX(c.CategoryName) AS "Kategoria"
-- FROM Products p, Categories c
-- WHERE c.CategoryID = p.CategoryID
-- GROUP BY p.CategoryID
-- ORDER BY MAX(c.CategoryName)






