GO = kein TSQL Befehl

create or alter view test
as
select * from orders
GO
select * from test

select * from customers cross join orders
--verkn�pft jeden DS mit jedem anderen DS der anderen Tabellen
--Customers 91  Order 830--> ca 75 000 Datens�tzeNULL

  --jede mathematische Operation mit NULL f�hrt zu NULL

NULL ist nicht 0  !!
''

select NULL +1

select * from customers where region is NULL
