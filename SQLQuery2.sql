select 
		spalte ,
		'text',
		Mathe,
		Zahl as Alias
from 
	tabelle t1
where
		spalten < <= >= = | !=
		AND | OR
		Spalte like   |Wildcard: %  _  [Wertebereich]	 .. [a-m][3-6][a-c|1-4]
		not like

	    in (liste)  ..(1,2,3,4) --keine Wildcards
		between Wert1 and Wert2 --Werte sind inklusive



