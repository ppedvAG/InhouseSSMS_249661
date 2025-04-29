GO = kein TSQL Befehl

create or alter view test
as
select * from orders
GO
select * from test

select * from customers cross join orders
--verknüpft jeden DS mit jedem anderen DS der anderen Tabellen
--Customers 91  Order 830--> ca 75 000 DatensätzeNULL

  --jede mathematische Operation mit NULL führt zu NULL

NULL ist nicht 0  !!
''

select NULL +1

select * from customers where region is NULL
