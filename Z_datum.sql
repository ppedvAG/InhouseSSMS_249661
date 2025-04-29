				
SELECT FORMAT(GETDATE(), 'dd.MM.yyyy', 'de-DE') AS GermanDate;
SELECT FORMAT(GETDATE(), 'MM/dd/yyyy', 'en-US') AS EnglishDate;

SELECT CONVERT(VARCHAR, GETDATE(), 104) AS GermanDate;
SELECT CONVERT(VARCHAR, GETDATE(), 101) AS EnglishDate;

-- Formatieren eines Datums mit Wochentag und Monat
SELECT FORMAT(GETDATE(), 'dddd, MMMM dd, yyyy', 'de-DE') AS GermanFormattedDate;
SELECT FORMAT(GETDATE(), 'dddd, MMMM dd, yyyy', 'en-US') AS EnglishFormattedDate;

---Crazy??

SET LANGUAGE German;
select orderdate from orders where orderdate = '1997-10-02'; -- ISO 8601 Format (YYYY-MM-DD)

SET LANGUAGE English;   
select orderdate from orders where orderdate = '1997-10-02'; -- ISO 8601 Format (YYYY-MM-DD)

select        orderdate as OrgDatum
            , convert(varchar(50), orderdate, 101)
            , convert(varchar(50), orderdate, 104)
            , FORMAT(orderdate,'dddd,MMMM dd, yyyy', 'de-DE') as GermanFormattedDate
from Orders