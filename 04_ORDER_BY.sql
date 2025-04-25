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



