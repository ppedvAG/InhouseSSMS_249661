GO = kein TSQL Befehl

create or alter view test
as
select * from orders
GO
select * from test

select * from customers cross join orders
--verknüpft jeden DS mit jedem anderen DS der anderen Tabellen
--Customers 91  Order 830--> ca 75 000 Datensätze