--Datumsuche

--Suche nach Jahr

select * from orders 
		where orderdate >= '1.1.1997' 
				and 
			  orderdate <= '31.12.1997 23:59:59.997'
			  --1997-12-31 23:59:59.999
order by orderdate desc

select year(orderdate),* from orders where year(orderdate) =1997


--zu einem Datum etwas dazurechen
select dateadd(dd,100,getdate())

--ww 
--hh Stunden
--ss Sekunden
--yy Jahr
--mm Monat
--qq Quartal
--dw day of week


select datepart(qq,getdate()), datepart(ww, getdate())+1

select 
			datepart(qq, orderdate) , orderdate
from orders
where
		datepart(qq, orderdate) = 4


select * from orders


--wieviel Tage zu spät oder zu früh kam eine Bestellung an
--negativ sollte zu früh sein... 
--sortiere nach den zu spät angekommenen

select	  orderid, shippeddate, requireddate
		, datediff(dd, shippeddate, requireddate) as zuspaet
from	 
		 orders
where 
		datediff(dd, shippeddate, requireddate)< 0
order by 
		 zuspaet


select datename(dw,getdate())

select EOMONTH(getdate())-- letzter Tag des Monats


select 'ABCDEFGHIJK', left('ABCDEFGHIJK',4)+ right('ABCDEFGHIJK',4)

select left(reverse('abcdefghikf'),4)






