
select * from tabelle t1 
order by spalte1 asc,spalte2 desc



select 
	freight as Fracht,
	orderid
from orders	o
where fracht < 100
order by fracht

 --FROM--> WHERE --> SELECT --> ORDER BY --> AUSGABE


 --Bitte alle Kunden sortieren 
 --zuerst nach Land und dann nach Stadt aufsteigen

	--asc ist default Einstellung
select country as Land, city as Stadt, * from customers 
order by country, city


select 
	sp1 , sp2 , Mathe, 'txt' as Alias
from tabelle t
where 
		sp < > between in 
		AND|OR
ORDER BY SP|ALIAS  ASC|DESC, SP2 ASC|DESC


select * from customers
order by country, city desc

--mna kann auch nach Spaltenr sortieren :-(
select * from customers
order by 4,5

--man kan auch nach ALias sortieren
select city as Stadt, * from customers
order by Stadt



