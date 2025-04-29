--AGGREGATE

--SUM()
--AVG()
--MIN()
--MAX()
--COUNT()

select 
	count(*)--Anzahl der Datansätze
 ,  min(freight) as MinFracht
 ,  max(freight) as MaxFracht
 ,  avg(freight) as SchnittFracht
 ,	sum(freight) as FrachtGesamt
 ,  sum(freight) /  count(freight)  --AVG ist also korrekt
from
	orders

--Vorsicht bei 
select 
		 count(*) ,
		 count(customerid),
		 count(Region) 
from customers

select region  from customers



--Wie hoch sind die Frachtkosten in Summe pro Ang



select
		employeeid,sum(freight)
from orders
group by 
		employeeid

 --mischt man ein Aggregat im Select mit einer Spalte
 --dann muss ein Group by folgen
 --group by = pro was? aggregieren	 (alle Spalten des select)

 --wieviele Kunde gibt es pro Land

 select 
			country, count(*)
 from 
			customers
 group by	
			country

--Anzahl pro Land und Stadt
select 
		country, city, count(*)
from customers
group by	country, city
order by country, city


---Wie hoch ist der Umsatz pro Kunde?
--sortiere das Ergbnis vom höchsten zum geringsten Umsatz

--Firmenname, Umsatz  sortiert

select companyname, sum(od.unitprice*od.quantity)  as Umsatz
from 
	customers c inner join orders o on c.CustomerID=o.CustomerID
				inner join [Order Details] od on od.OrderID=o.OrderID
group by 
		 companyname
order by 
		 Umsatz desc



 --mit der Sicht deutlich weniger Aufwand
select 
			companyname, sum(possumme) as Umsatz
from 
			vsales
group by	
			CompanyName
order by 
			umsatz desc





select companyname, sum(  Unitprice*quantity)	as Umsatz
from
	customers c inner join orders o on o.CustomerID=c.CustomerID
				inner join [Order Details] od on od.OrderID=o.orderid
 group by companyname	


select * from [Order Details]


--Wie hoch ist der Durschnittliche Frachtkostenbetrag der Produkte

--Liste alle Produkte auf und deren durchschnittlichen Frachtkostenwert

select 
		productname, avg(freight) as Schnitt
from 
		vsales 
group by
		productname
order by 
		Schnitt 

 --oder

select 
		productname, avg(freight) as Schnitt
from 
		products p inner join [Order Details] od on od.ProductID=p.ProductID
				   inner join orders o on o.OrderID=od.OrderID
 group by
		productname
order by 
		Schnitt 

 --wieviele Kunden gibts es pro Land und Stadt
  --abu
  --die wo aus USA, Brasil, Argentina
  --aber nur die, wo die Anz größer 1 ist

 --HAVING ist der Filter für Aggregate

select		country, city, count(*) as Anz
from		customers
where
			country  in ('USA', 'Brazil', 'Argentina')
group by	country, city	having count(*) >1
order by	country, city


--Superaggregate
select		country, city, count(*) as Anz
from		customers
group by	country, city	with rollup
order by	country, city


 --Tipp
select		country, city, count(*) as Anz
into #t
from		customers
group by	country, city	with rollup
order by	country, city


select * from #t


	

































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





































