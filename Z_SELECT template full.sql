				Select 
		SP1, Sp2 , Sp3 as Alias
		Zahl, 'txt', Mathe as Alias
		*
from 
		tabelle t1
where
		t1.sp1 < > <=  >=  =  |  !=
		AND | OR
		t1.sp2 like |Wildcards: % für beliebig viele Zeichen
							    _ genau ein unbekanntes Zeichen
								[] Wertebereich.. steht für ein Zeichen

							--	Suche nach % [%], ' --> ''
GROUP BY 
		t1.sp1, t2.sp3  --alle Spalten des SELECTS ..keine Aggregate, kein Alias
HAVING
		AGG() > < --- nur filtern, was mit einem AGG berechnet werden sollte
Order by
		t1.sp1, ALias desc


 NULL != 0
 select 1+0
 select null + 1

select * from customers
where 
		region is null 
