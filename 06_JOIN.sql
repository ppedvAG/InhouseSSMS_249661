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




