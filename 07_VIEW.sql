--Sichten verhalten sich wie tabellen , enthalten aber keine Daten sondern nur eine Abfrage			 
--

create or alter view vUmsatz
as
select		c.CompanyName, c.CustomerID, c.Country, c.city,
			o.orderid, o.orderdate, o.freight,
			od.UnitPrice, od.Quantity,
			p.ProductName,
			e.lastname
from 
						   customers c 
				inner join orders o				on c.CustomerID=o.CustomerID
				inner join Employees e			on e.EmployeeID=o.EmployeeID
			    inner join [Order Details] od   on od.orderid  = o.orderid
				inner join products p           on p.ProductID = od.ProductID;
GO



--Auch Berechnungen können wir gleich mitreinnehmen


create or alter view vUmsatz
as
select 
 c.CompanyName, c.CustomerID,c.Country as CLand,c.City as CStadt--kundendaten
,o.OrderID, o.Freight, o.OrderDate  --Bestellkopf
,od.Quantity, od.UnitPrice --aus den Positionen
,p.ProductName, p.UnitsInStock, p.ProductID --Produktdaten
,e.LastName,e.FirstName, e.Country as ALand, e.city as AStadt, e.EmployeeID --Employees
,od.UnitPrice*od.Quantity as PosSumme --Calc
from 
	customers c inner join orders o			  on c.CustomerID=o.CustomerID
				inner join [Order Details] od on o.OrderID   =od.OrderID
				inner join Products p		  on p.ProductID =od.ProductID
				inner join employees e		  on e.EmployeeID=o.EmployeeID
GO


--welche Kunden kommen aus Germany

--Vorsicht-- hier kommt der Kunde mehrfach vor... 
--daher ist das Ergebnis erstmal falsch

select * from vUmsatz where cland = 'Germany'

--alle Kunden, die ein Pos besitzten die mehr asl 1000 Euro ausmachte
--Und hier hat man sich die Joins gespart..

--Prinzip:
--Sichten dann verwenden, wenn auch alle tabellen benötigt werden

select companyname , possumme from vumsatz
where possumme > 1000
