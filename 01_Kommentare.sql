use northwind;
GO

 /*
		Autor: Andreas Rauch
		Erstelle am: 29.4.2025
		Geändert am : 30.4.2025
		Infos aus Customers, die wo...
 */


--Infos aus der Tabelle Kunden: Customers
select 
		  country
		, city
		, companyname 	 --das ist der Firmenname
		, ContactTitle 
FROM 
		Customers 
where   
		country = 'ISA' 	 --ob es das gibt??
		and
		city = 'XY' 
order by 
		  country
		, city desc	   --absteigend































/*
select 

Hier kommt der code für

select getdate()


klickt man auf eine Fehlermeldung doppelt, springt das SSMS
zu der genannten Fehlerzeile.
Die Quote, dass das exakt ist , liegt bei 60 bis 70% bestenfalls

*/



select getdate() --ab hier bis szum Ende der Zeile ein Kommentar



select 

	* 

	from 
tabelle






