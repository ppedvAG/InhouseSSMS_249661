--AGGREGATE

select spx, spy , agg()
from tabelle
where ...
group by spx, spy 
order by


--SUM(), AVG(), MIN(), MAX(), COUNT()

select sum(freight) as SummeFracht,avg(freight) from orders

--Gesamter Umsatz
select sum(unitprice*quantity) from [Order Details]


select country, count(*) from customers
group by country


select * from [Order Details]


--Umsatz pro Produkt

select top 1 productid as ProduktNr
		,sum(unitprice*quantity) as Umsatz 
from    
		[Order Details]

group by 
		productid 
order by Umsatz desc


--best verkaufte Produkt aus dem Jahr 1997


select top 1 productid as ProduktNr
		,sum(unitprice*quantity) as Umsatz 
from    
		[Order Details] od inner join orders o on o.OrderID=od.orderid
where
		year(o.OrderDate) = 1997

group by 
		productid 
order by Umsatz desc
		
--jetzt mit Produktnamen

select top 1 p.productid, p.productname as ProduktName
		,sum(od.unitprice*od.quantity) as Umsatz 
from    
		[Order Details] od inner join orders o on o.OrderID=od.orderid
						   inner join Products p on p.ProductID=od.ProductID
where
		year(o.OrderDate) = 1997

group by 
		p.productid, p.productname
order by Umsatz desc



--oder mit der Sicht ...:-)
select top 1 productname,sum(possumme) as Umsatz from umsatzkunden
where		 year(orderdate) = 1997
group by	 productname
order by	 umsatz desc



--Aufgabe: Anzahl der Kunden pro Land und Stadt

--Ausgabe : Land, Stadt, Anzahl
--customers  count(*)

select   country, city , count(*) as Anzahl from customers
group by country, city
order by country, city

--aber welche haben mehr als 1 

select   country, city , count(*) as Anzahl from customers
group by country, city having count(*) > 1
order by country, city

--FROM  --> WHERE --> GROUP BY---SELECT--ORDER BY
--FROM-->GROUP BY --HAVING



select * from (
select   country, city , count(*) as Anzahl from customers
group by country, city) t
where anzahl > 1


select count(customerid), count(*), count(region) from customers

select * from customers



--Wie groß ist der Umsatz von Alfki im Jahr 1998?

--Was will ich sehen?
--Companyname , Umsatz

--wo kommen die Werte her?
--customers--orders--order details

--Schritt 1

select * from
	customers c inner join orders o           on c.CustomerID=o.CustomerID
				inner join [Order Details] od on od.OrderID=o.OrderID

--klappts, dann schritt 2
select c.CustomerID, c.CompanyName, unitprice, quantity, orderdate from
	customers c inner join orders o           on c.CustomerID=o.CustomerID
				inner join [Order Details] od on od.OrderID=o.OrderID
where
	c.CustomerID='ALFKI' AND year(orderdate) = 1998

--schauts gut aus... dann schritt 3
select c.CompanyName, sum(unitprice* quantity) from
	customers c inner join orders o           on c.CustomerID=o.CustomerID
				inner join [Order Details] od on od.OrderID=o.OrderID
where
	c.CustomerID='ALFKI' AND year(orderdate) = 1998
group by 
	c.CompanyName



select country, city, count(*) 
from customers
group by country, city with cube |rollup
order by country, city



select country, city, count(*) 
from customers
group by country, city with cube 
order by country, city



select country, city, count(*)  as Anzahl
into #t
from customers
group by country, city with rollup 
order by country, city

select * from #t

--#t lokale temp Tabelle
--existieren nur in der Session, in der sie erstellt wurden
--wird die Verbindung beendet ist die #t weg..
drop table #t






--Was ist das beste Produkt und das schlechteste


select * from 
(select top 1 p.productid, p.productname as ProduktName
		,sum(od.unitprice*od.quantity) as Umsatz 
from    
		[Order Details] od inner join orders o on o.OrderID=od.orderid
						   inner join Products p on p.ProductID=od.ProductID
where
		year(o.OrderDate) = 1997

group by 
		p.productid, p.productname
order by Umsatz dsc) t1
UNION
select * from (
select top 1 p.productid, p.productname as ProduktName
		,sum(od.unitprice*od.quantity) as Umsatz 
from    
		[Order Details] od inner join orders o on o.OrderID=od.orderid
						   inner join Products p on p.ProductID=od.ProductID
where
		year(o.OrderDate) = 1997

group by 
		p.productid, p.productname
order by Umsatz asc) t2










select top 1 p.productid, p.productname as ProduktName
		,sum(od.unitprice*od.quantity) as Umsatz 
into #t1
from    
		[Order Details] od inner join orders o on o.OrderID=od.orderid
						   inner join Products p on p.ProductID=od.ProductID
where
		year(o.OrderDate) = 1997

group by 
		p.productid, p.productname
order by Umsatz desc


select top 1 p.productid, p.productname as ProduktName
		,sum(od.unitprice*od.quantity) as Umsatz 
into #t2
from    
		[Order Details] od inner join orders o on o.OrderID=od.orderid
						   inner join Products p on p.ProductID=od.ProductID
where
		year(o.OrderDate) = 1997

group by 
		p.productid, p.productname
order by Umsatz asc


select * from #t1
union
select * from #t2




--Aggregate

--max min avg sum count

select count(*) from customers --91
select count(customerid)  from customers --91
select count(region) from customers --null zählt nicht mit

select count(*) as Anzahl
	, min(freight) as MinFracht
	, max(freight) as MaxFracht
	, sum(freight) as SummeFracht
	, avg(freight) as SchnittFracht
	from orders

select * from orders

select employeeid,sum(freight) from orders
group by EmployeeID

select ...
from
where
group by
order by


select year(orderdate) as Jahr, sum(freight) from orders
group by year(orderdate)


--Summe der Frachtkosten pro Jahr und Monat

select year(orderdate), month(orderdate) , sum(freight)
from orders
group by year(orderdate), month(orderdate) 
order by 1,2


--Umsatz pro Kunden und Land

select Cland, companyname, sum(possumme)
from vumsatz
group by Cland, companyname
order by 1,2,3


select country,companyname, sum(od.unitprice*od.quantity)
from 
customers c inner join orders o on  c.CustomerID=o.CustomerID		
			inner join [Order Details] od on od.OrderID=o.OrderID
group by  country,companyname
with rollup
order by 1,2


--Wieviel Umsatz haben die Ang 2 und 3 gemacht im Jahr 1998
--pro Monat

select 
		v.EmployeeID, v.LastName
		, month(orderdate)	as Monat
		, sum(possumme)		as Umsatz
from	
		vumsatz v
where	
		v.EmployeeID in(2,3)
		and 
		year(v.orderdate) = 1998
group by 
		v.EmployeeID
		, v.LastName
		, month(orderdate)

--aber nur die wo mehr als 20000 Umsatz hatten

select 
		v.EmployeeID, v.LastName
		, month(orderdate)	as Monat
		, sum(possumme)		as Umsatz
from	
		vumsatz v
where	
		v.EmployeeID in(2,3)
		and 
		year(v.orderdate) = 1998
		--ein where kann keine AGG filtern
group by 
		v.EmployeeID
		, v.LastName
		, month(orderdate)
having sum(possumme) > 20000 --nur AGG hier





































