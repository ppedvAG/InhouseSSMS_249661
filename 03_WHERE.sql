--So könnte ein SELECT aussehen

--Daten filtern

select Spalten , Mathe, 'Text', Zahlen as Alias
FROM Tabelle t1
WHERE
		Spalte = Wert  -- 100 'bcbc'
		Spalte > Wert	  -auch bei Text
		Spalte >= Wert
		Spalte < Wert
		Spalter <= Wert
		AND | OR
		Spalte = < > Wert
		Spalte in (Liste) --statt sp = Wert or sp = wert or Sp = wert
		Spalte between Wert1 and Wert2
		 --Verneinungen
		!=  <>  statt = 
		not in
		not between


		like
		not like

 select * from customers c
 where
		country = 'UK'		    --7

 --aus den USA

 select * from customers c
 where
		c.Country = 'USA'


select * from orders	  --
--alle Bestellungen, die wo unter 100 Frachtkosten habe

select freight, * from orders o
where 
		o.Freight < 100


--alle Bestellungen, die zwischen 50 und 100 sind

Select * from orders 
where
		freight >= 50
		AND
		freight <= 100	--Spalten müssen auch bei AND wider angegeben werden

--kürzer:
--between

select * from orders o
where
	freight between	 50 and 100

--alle Kunden , die in einem Land wohnen das mit A B oder C beginnt
--es gibt mehrere Möglichkeiten

select country, * from customers c
where
	c.Country	between 'A' and 'D'

 
select country, * from customers c
where
	c.Country	< 'D'

 
select country, * from customers c
where
	c.Country	>='A' and c.country < 'D'--kein % da kein like


--alle Kunden aus  UK USA Germany Austria
select * from customers c
where
	c.country = 'USA'
	OR
	c.country = 'Uk'
	OR
	c.country = 'Germany'
	OR
	c.country = 'Austria'

 --effizient

 where spalte in (Liste)


select * from customers c
where
	c.Country in ('UK','USA','Germany','AUstria')


 --Like: nur der Like kann Wildcard
-- % beliebig viele Zeichen -auch 0 
-- _ steht für genau ein Zeichen

select * from customers c
where
	c.Country like 'A%'

select * from orders

--suche alle DS aus Orders, die wo
--in Customerid : soll mit A beginnen und mit i enden



select * from orders o 
where
		o.CustomerID like 'A%i'


 --alle Bestllunge, bei denen in Customerid ein y vorkommt
 select * from orders o 
where
		o.CustomerID like '%y%'


--der vorletzte Buchstabe soll y sein
 select * from orders
 where CustomerID like '%y_'


 --suche alle Orders die in Customerid folgendes haben:
 -- es soll ein H vorkommen
 --und der drittletzte Buchstabe soll ein o sein

select * from orders
 where 
		CustomerID like '%h%'
		and
		CustomerID like '%o__'

 --customerid sol mit A , C F M L S beginnen

 --Wertebereich: [  ]			   --genau ein Zeichen

 --[afgio]

 select * from customers where country like '[abcde]%[mnoprs]'


 ---wie	  kann man falsche PINs prüfen

 Spalte PIN

 where PIN '%[a-z]%'

 where pin not like '[0-9][0-9][0-9][0-9]' 

 --Ergebnisse validieren
 select * from orders
 --alle Bestellung von AngId 1, 3 -- Employeeid	  UND
 --aus UK verschifft			  -- Shipcountry  OR
 --und Fracht < 500				  -- Freight	

select * from orders o
 where
		employeeid in (1,3)	  
		and
		ShipCountry	  ='UK'	
		OR
		Freight		  < 500	
order by freight desc

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










































SELECT 
	SPALTEN as A , Spalte2 as B, Mathe, 'TXT', SP*
from Tabelle t
where 
		SP > < <=  >=  != =   <>
		AND|OR --AND ist stärker bindend
		SP < > = != <> <= >=
		AND|OR
		SP between wert1 and wert2  --ersetzt sp >= and Sp <=
		AND|OR
		SP IN (Wert1, Wert2, Wert3,,,) --ersetzt sp= and sp= and Sp=
		AND|OR
		SP like -- nur die kann Wildcards
				-- % beliebig viele Zeichen
				-- _ steht für genau ein Zeichen
				-- [] steht für genau ein Zeichen [0-9|a-z][agk]
order by sp desc|asc, sp2 desc






select * from orders
where 
		freight < 50


--wieviele haben Frachtkosten über 1000

select * from orders
where 
		freight > 1000

--wieviele haben exakt 0,02 Frachtkosten
select * from orders
where 
		freight = 0.02

--aus Tabelle Customers alle raussuchen deren Firmenname mit A,B oder C beginnt


select * from customers
where 
	companyname < 'D'  --geht auch mit Text.. sortierbar :-)

--Will man eine SPalte merhfach filtern muss die Spalte wiederholt werden


--bestellungen (orders) die freight zwischen 100 und 500 eingeschlossen

select * from orders
	where 
			freight >= 100
			AND
			freight <= 500


--geht auch leichter mit between

select * from orders
	where 
			freight between 100 and 500


--alle Kunden (customers) die aus  Land UK oder USA oder Germany sind

select * from customers
	where	
			country = 'UK'
			OR
			country = 'USA'
			OR 
			country = 'Germany'

--kürzer mit IN

select * from customers
	where	
			country IN ('UK', 'USA', 'Germany')


--Suche alle Bestellungen, die wo 
--fachtkosten unter 100 haben und vom Angnr 3 betreut wurden
--oder aus der Stadt London ausgeliefert wurden
--Immer KLammern setzen!!

select * from orders --nur die wo 
where
	freight < 100
	AND
	employeeid = 3
	OR
	shipcity = 'london'
order by freight desc


--unscharfe Suche LIKE

select * from customers
where
		companyname like 'A%'


--wieviele Firman haben am Ende ein y


select * from customers
where companyname  like '%y'

--(505) 555-59_9

select * from customers
where phone like '%9%'
--% viele Stelle
--_ genau eine stelle

--Welche Firma hat an 3. letzter Stelle eine 9 in der Phone Spalte

select companyname, phone from customers
	where 
			phone like '%9__'


--SPALTE PIN

--varchar(4)

where pin like '[0-9][0-9][0-9][0-9]'-- Frage mit > 0 und < 10000 klappt das nicht



--[0-9]
--[a-z]


--Suche wir alle Firman die mit A B C  G H M beginnen

select * from customers
where
		companyname like '[abcghm]%' --die Klammer steht für genau ein Zeichen
order by companyname desc

select * from customers
where
		companyname like '%[%]%'

--Suche nach allen Firmen, die ein ' im Namen haben


select * from customers
where
		companyname like '%''%' -- 2 ' steht für ein '



select companyname,  datalength(companyname),
					len(companyname) 
from customers


---Suche alle Kunden heraus, deren Firmenname mit A, b g oder h beginnt

select * from customers
where 
	companyname like 'A%'
	OR
	companyname like 'B%'
	OR
	companyname like 'G%'
	OR
	companyname like 'H%'

--[  ]

select * from customers where
	companyname like '[abgh]%' --die [] steht für genau ein Zeichen


--suche alle Firmen (companyname)
--deren Firmename mit B C H L M beginnt und mit M  N T S endet

select * from customers
	where companyname like '[bchlm]%[mnts]'

--was müsste man ändern, wenn mnts das drittletze Zeichen sein sollte
select * from customers
	where companyname like '[bchlm]%[mnts]__'

	--DS mit % suchen
select * from customers 
where CompanyName like '%[%]%' --?

--Suchen nach '
select * from customers 
where CompanyName like '%''%' --? einfach 2 '










/*
SELECT 
	SPALTEN
	TEXT
	ZAHL
	MATHE as Alias
FROM TABELLE t
WHERE SPALTEN = , <  >

ORDER BY SP oder Alias



*/
--kleiner als der Schnitt
select * from orders
where
		freight < 78


select * from orders
where
		freight > 78


select * from orders
where
		freight = 78

--geht auch mit Text
select * from customers
where companyname < 'M'
--order by companyname desc

--dazwischen ?
--wenn eine Spalte mehrere Beding erfüllen soll, dann muss sie wiederholt werden
--mit AND 
select * from orders
where
		freight >=10
		AND
		freight <=100
order by freight desc


--geht das nicht kürzer?

select * from orders
where
	freight between 10 and 100 --die Werte sind inklusive >=  <=

--Alle Produkte deren Preis zwischen 50 und 100 liegt

--welche Produkte haben mehr als 100 Stück auf Lager

select productname, UnitsInStock from products where UnitsInStock > 100
select * from products 



where 
		UnitPrice between 50 and 100









