--Mathe

select freight as Netto	 , orderid,
		,freight*1.19 
from orders
	where 	(freight*1.19) < 500
order by 2 desc		 --das geht, aber.... 

--der durschnittswert der Fracht : 78

select 100	  from orders


--Zeige die Fracht an und, daneben die Abweichung vom Schnitt
--und sortiere das Ergebnis
--je mehr die Abweichung ist desto schlimmer
-- zB 78 Schnitt, aber 500... zuviel--> als neg. Abweichung ist schlecht

select 
		freight 
	,	(78 - freight)	 as Abw
	,   (freight -78)
from orders
order by
		 Abw asc



select getdate()   --aktuelle Uhrzeit und Datum


select * from orders  where   orderdate < '1996-07-05'



--gib alle Orders aus, aus dem Jahr 1997

select * from orders
where 
	 orderdate >= '1.1.1997'
and  orderdate  < '1.1.1998'	 --'1998-01-01'

select * from orders
where 
orderdate
between '1.1.1997' and 	'31.12.1997'

----[1.1.1997--------------------31.12.1997 23:59:59.999]---------------------

select * from orders where orderdate like '%1997%'	--korrekt aber langsam

select * from orders
where
	orderdate >= '1.1.1997' and orderdate <='31.12.1997 23:59:59.997'
order by 4	desc

select convert(date, orderdate) from orders









		