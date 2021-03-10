-- Harmata Edwin

-- Z pliku ćwiczeń

-- Napisz polecenie, które wyświetla listę dzieci będących członkami
-- biblioteki (baza library). Interesuje nas imię, nazwisko i data
-- urodzenia dziecka.
-- USE library
-- SELECT m.firstname, m.lastname, j.birth_date
-- FROM Member m INNER JOIN juvenile j
-- ON j.member_no = m.member_no


-- Napisz polecenie, które podaje tytuły aktualnie wypożyczonych
-- książek
-- USE library
-- SELECT DISTINCT t.title 
-- FROM title t INNER JOIN loan l
-- ON t.title_no = l.title_no

-- Podaj informacje o karach zapłaconych za przetrzymywanie książki
-- o tytule ‘Tao Teh King’. Interesuje nas data oddania książki, ile dni
-- była przetrzymywana i jaką zapłacono karę 

-- Żeby otrzymać sensowne wyniki a nie pustą tabele znalazłem wszystkie kary wraz z liczbą dni za ich przetrzymywanie, oczywiście kar zapłaconych za
-- ksiązkę o zadanym tytule nie ma

-- USE library
-- SELECT lh.fine_assessed, t.title, DAY(lh.in_date - lh.out_date) AS "Liczba dni przetrzymywania"
-- FROM loanhist lh 
-- INNER JOIN loan l 
-- ON lh.member_no = l.member_no AND lh.fine_assessed IS NOT NULL
-- INNER JOIN title t 
-- ON t.title_no = l.title_no
-- ORDER BY fine_assessed DESC

-- Napisz polecenie które podaje listę książek (mumery ISBN)
-- zarezerwowanych przez osobę o nazwisku: Stephen A. Graff

-- USE library
-- SELECT DISTINCT CONCAT(m.firstname,' ', m.middleinitial,'. ', m.lastname) AS "Osoba", r.isbn, t.title
-- FROM reservation r
-- INNER JOIN member m
-- ON m.firstname = 'Stephen' AND m.lastname = 'Graff' AND m.middleinitial = 'A'
-- INNER JOIN item i 
-- ON i.isbn = r.isbn
-- INNER JOIN title t
-- ON t.title_no = i.title_no

-- Wybierz nazwy i ceny produktów (baza northwind) o cenie
-- jednostkowej pomiędzy 20.00 a 30.00, dla każdego produktu podaj
-- dane adresowe dostawcy

-- USE Northwind
-- SELECT p.ProductName, p.UnitPrice, CONCAT(s.Country, ', ', s.PostalCode, ' ', s.City, ', ', s.Address) AS "Adres" 
-- FROM Products p
-- INNER JOIN Suppliers s
-- ON s.SupplierID = p.SupplierID
-- WHERE p.UnitPrice > 19.99 AND p.UnitPrice < 30
-- ORDER BY p.UnitPrice DESC

-- Wybierz nazwy produktów oraz inf. o stanie magazynu dla
-- produktów dostarczanych przez firmę ‘Tokyo Traders’

-- USE Northwind
-- SELECT p.ProductName, p.UnitsInStock, p.UnitsOnOrder, s.CompanyName
-- FROM Products p
-- INNER JOIN Suppliers s
-- ON s.CompanyName = 'Tokyo Traders' AND s.SupplierID = p.SupplierID


-- Czy są jacyś klienci którzy nie złożyli żadnego zamówienia w 1997
-- roku, jeśli tak to pokaż ich dane adresowe

-- USE Northwind
-- SELECT DISTINCT c.CompanyName, CONCAT(c.Country, ', ', c.PostalCode, ' ', c.City, ', ', c.Address) AS "Adress"
-- FROM Customers c
-- LEFT JOIN Orders o
-- ON c.CustomerID = o.CustomerID AND YEAR(o.OrderDate) = 1997
-- WHERE o.OrderDate IS NULL

-- Wybierz nazwy i numery telefonów dostawców, dostarczających
-- produkty, których aktualnie nie ma w magazynie

-- USE Northwind
-- SELECT DISTINCT s.CompanyName, s.Phone
-- FROM Suppliers s
-- INNER JOIN Products p
-- ON p.SupplierID = p.SupplierID AND p.UnitsInStock = 0


-- Wybierz nazwy i ceny produktów (baza northwind) o cenie
-- jednostkowej pomiędzy 20.00 a 30.00, dla każdego produktu podaj
-- dane adresowe dostawcy, interesują nas tylko produkty z kategorii
-- ‘Meat/Poultry’

-- USE Northwind
-- SELECT p.ProductName, p.UnitPrice, CONCAT(s.CompanyName, ', ', s.PostalCode, ' ', s.City, ', ', s.Address) AS "Supplier adress", c.CategoryName
-- FROM Products p
-- INNER JOIN Categories c
-- ON p.CategoryID = c.CategoryID AND c.CategoryName = 'Meat/Poultry'
-- INNER JOIN Suppliers s
-- ON p.SupplierID = s.SupplierID
-- WHERE p.UnitPrice > 19.99 AND p.UnitPrice < 30.00

-- Wybierz nazwy i ceny produktów z kategorii ‘Confections’ dla
-- każdego produktu podaj nazwę dostawcy.

-- USE Northwind
-- SELECT p.ProductName, p.UnitPrice, s.CompanyName as "Supplier"
-- FROM Products p
-- INNER JOIN Categories c
-- ON c.CategoryName = 'Confections' AND p.CategoryID = c.CategoryID
-- INNER JOIN Suppliers s
-- ON p.SupplierID = s.SupplierID


-- Wybierz nazwy i numery telefonów klientów , którym w 1997 roku
-- przesyłki dostarczała firma ‘United Package’

-- USE Northwind
-- SELECT c.CompanyName, c.Phone
-- FROM Customers c
-- INNER JOIN Orders o
-- ON o.CustomerID = c.CustomerID
-- INNER JOIN Shippers s
-- ON S.ShipperID = o.ShipVia AND s.CompanyName = 'United Package'
-- WHERE YEAR(o.ShippedDate) = 1997


-- Wybierz nazwy i numery telefonów klientów, którzy kupowali
-- produkty z kategorii ‘Confections’


-- USE Northwind
-- SELECT DISTINCT c.CompanyName, c.Phone, cat.CategoryName
-- FROM Customers c
-- INNER JOIN Orders o
-- ON c.CustomerID = o.CustomerID 
-- INNER JOIN [Order Details] od
-- ON od.OrderID = o.OrderID
-- INNER JOIN Products p
-- ON  od.ProductID = p.ProductID
-- INNER JOIN Categories cat
-- ON p.CategoryID = cat.CategoryID AND cat.CategoryName = 'Confections'

-- Napisz polecenie, które wyświetla listę dzieci będących członkami
-- biblioteki (baza library). Interesuje nas imię, nazwisko, data
-- urodzenia dziecka i adres zamieszkania dziecka.

-- USE library
-- SELECT m.firstname, m.lastname, j.birth_date, CONCAT(a.city, ', ', a.street) AS "Adress"
-- FROM Member m
-- INNER JOIN juvenile j
-- ON m.member_no = j.member_no
-- INNER JOIN adult a 
-- ON a.member_no = j.adult_member_no


-- Napisz polecenie, które wyświetla listę dzieci będących członkami
-- biblioteki (baza library). Interesuje nas imię, nazwisko, data
-- urodzenia dziecka, adres zamieszkania dziecka oraz imię i nazwisko
-- rodzica.

-- USE library
-- SELECT m.firstname, m.lastname, j.birth_date, CONCAT(a.city, ', ', a.street) AS "Adress",
-- CONCAT(m2.firstname, ' ', m2.lastname) AS "Parent" 
-- FROM Member m
-- INNER JOIN juvenile j
-- ON m.member_no = j.member_no
-- INNER JOIN adult a 
-- ON a.member_no = j.adult_member_no
-- INNER JOIN member m2
-- ON j.adult_member_no = m2.member_no