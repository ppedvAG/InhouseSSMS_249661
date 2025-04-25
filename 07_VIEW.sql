--Sichten verhalten sich wie tabellen , enthalten aber keine Daten sondern nur eine Abfrage			 


create or alter view UmsatzKunden
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

