--immer in einem Script die DB auswählen
--USE DATABASE

USE NORTHWIND;
GO


select 
		Spalte1, Spalte2, Spalten3, *
from tabelle


select * from customers

--man kann im SELECT Spalten angeben
select customerid, companyname, country, city from customers

--kommasepariert kann man mehrere Spalten angeben
select c.CompanyName,c.City, c.Country, c.CustomerID from customers c

--Man Spalten bei der Ausgabe umbennen.. gilt aber nur bei der Ausgabe
select country as Land from customers

--Wenn man Berechnungen ausführt gibt es keine Spaltennamen.. daher as Spaltenname
select 2*100 as Mathe



--Gebe aus der Tabelle orders die Spalten freight, orderid, customerid aus..
select freight, orderid, customerid from orders

select 
		freight as Netto, freight*1.19 as Brutto --Berechnung Fracht in Brutto 
		, orderid
		, customerid 
from orders

--wenn man schön formatiert kann man auch schon kommentieren
select freight, 
		orderid, 
	--	customerid 
from orders


select   freight
		,orderid 
--		,customerid 
from orders

--sind im Namen von Objekten math. Operatoren oder Leerzeichen, dann []
select [mengen-preis]

select * from [Order Details]


--Ausgabe alle Zeilen der Order details plus Ausgabe der Positionssumme

select *, unitprice*quantity as Possumme from [Order Details]

--es läßt ich für jede Ergebniszeile zusätzlich Zahlen oder Textausgeben
select orderid, 100, 'txt' from orders

select 'Fa. '+companyname, * from customers














