--mehrere tabellen

--Customers --> Orders ---> Order Details --> Products

--INNER JOIN   99%
--LEFT JOIN 
--RIGHT JOIN
--CROSS JOIN
--

 select * from tabelle t1 inner join tabelle t2 on t1.spx = t2.spx


 select * 
 from 
		customers c inner join orders o on c.CustomerID=o.CustomerID
 --  Tabelle customers verknüpft mit orders auf Basis on Spalte = Spalte

-- Zeige alle Bestellungen an und deren Positionen
-- mit welche Spalte müssen wir verknüpfen.. 
-- welche taucht in beiden Tabelle auf:  orderid

select * 
from 
		orders o inner join [Order Details] od on o.OrderID=od.OrderID


select * 
from 
	tabelle t1 inner join tabelle t2 on t1.spx = t2.spx	
			   inner join tabelle t3 on t3.spy = t2.spy
			   inner join tabelle t4 on t4.spz = t1.spz

--Cust(customerid)  Orders (orderid) order details (productid) products

--Gib alle Firmenname der Kunden und das gekaufte Produkt daneben

--Ausgabe Companyname, Productname und doppelte entfernen

SELECT distinct c.CompanyName, p.ProductName
FROM 
	  customers c										    inner join 
	  orders o		     on c.CustomerID = o.CustomerID	    inner join 
	  [Order Details] od on od.OrderID   = o.OrderID        inner join 
	  products p		 on p.ProductID  = od.ProductID
ORDER BY
		c.CompanyName, p.ProductName 

--Ergänze um Lastname des Angestellten in der Ausgabe

SELECT distinct c.CompanyName, p.ProductName, e.Lastname
FROM 
	  customers c										    inner join 
	  orders o		     on c.CustomerID = o.CustomerID	    inner join 
	  [Order Details] od on od.OrderID   = o.OrderID        inner join 
	  products p		 on p.ProductID  = od.ProductID		inner join
	  employees e		 on e.EmployeeID = o.EmployeeID

ORDER BY
		c.CompanyName, p.ProductName 

select * 
from 
		Tabelle1 A inner join Tabelle2 B  on A.spx = BNspx
				   inner join Tabelle3 C  on c.spy = B.spy
				   inner join Tabelle4 D  on D.spz = A.spz
			  left|right join Tabelle5 E on E.spa = B.spa
where 
		a.spx = 
		or 
		e.spy < 
order by 
		b.spm




select * 
from customers c inner join orders o on c.CustomerID=o.CustomerID

select * from orders
select * from [Order Details]


--alle Daten aus Orders und deren Positionen

select *
from 
	orders o inner join [Order Details] od on o.OrderID=od.OrderID;
	GO
		--	inner join 
--Sicht = Views


select * from umsatzkunden


select * from customers
country = 'UK'
			




--Self Join.. man darf auch die selbe Tabelle joinen, muss allerdings ihr verschiedene
--Aliase zuweisen

select lastname, country, city from employees

--Liste
--Ang Stadt Stv

select e1.lastname, e1.city, e2.lastname
from 
	employees e1 inner join employees e2 on e1.city = e2.city
where
		e1.lastname != e2.lastname
order by city, e1.lastname


select * from 
	tabelle1 A left|right join tabelle2 B on A.spnr = B.spnr


select * from 
	tabelle1 A left join tabelle2 B on A.spnr = B.spnr

select * from 
	tabelle2 B right join tabelle1 A on A.spnr = B.spnr


--welcher Kunde hat nichts gekauft?

select * 
from		customers c left join orders o on c.CustomerID=o.CustomerID
where orderid is NULL
order by orderid

select isnull(region, 'k.A'), region from customers




 select * from 
 orders o left join [order details] od
 on o.orderid = od.orderid

 select count(*) from orders  --830

 select * from 
	customers c left join orders o on c.CustomerID=o.CustomerID
where orderid is null

 select * from 
	orders o right join customers c  on c.CustomerID=o.CustomerID
where orderid is null

andreasr@ppedv.de

--cross join  --jeder DAtansatz wird mit jedem anderen verknüpft

select * from customers cross join orders