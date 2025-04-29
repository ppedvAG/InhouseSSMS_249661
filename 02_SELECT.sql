--Daten lesen

use northwind;


SELECT --Ausgabe

SELECT Spalten as SP1, Zahlen , 'text', Mathe	as Alias
FROM TABELLE 


select 100	 as Zahl
select 'TEXT'  as text

select t. from tabelle t    --alias für Tabelle


select c.ContactTitle,c.City from Customers	 c


select * = alle SPalten
select customerid , 100.2 A from customers

select customerid, country city from customers
--Land = Stadt?

 -- * 
--Gib aus der Tab orders folgendes aus
--Bestelldatum, frachtkosten, bestNr, Kundennr

 select * from orders o		 --zuerst mit Stern und Tabelle mit Alias

 select  from orders o		--Stern weg

select 
	  o.OrderDate				 --dann mit Alias der Tabelle arbeiten
	, o.Freight
	, o.OrderID
	, o.CustomerID
from 
	  orders o

	  --Ebene 15 / 16 
	  --17 und höher --> Admin
	  --14 = Security


--lasst euch alle BestellDetails ausgeben
select * from [Order Details]





































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














