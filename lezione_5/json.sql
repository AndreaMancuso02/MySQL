create  table articoli(
	id int auto_increment primary key,
    descrizione varchar(100),
    specifiche json
);

desc articoli;

INSERT INTO articoli(descrizione, specifiche)
VALUES(
	'TV SAMSUNG 32" SMART TV',
	'{
		"marca": "SAMSUNG",
		"pesoKg": "5.12",
		"schermo": "LCD",
		"pollici": 32,
		"uscite": ["HDMI", "USB"]
	}'
);

select * from articoli;
-- funzioni json
-- json_object
insert into articoli(descrizione,specifiche)
values
	('TV SONY 32" SMART TV',
    json_object(
		"marca", "SONY",
        "pesoKG","6.5",
        "schermo","LED",
        "pollici",32,
        "uscite","hdmi"
    ) 
);

-- json_array

insert into articoli(descrizione,specifiche)
values
	('TV PHILIPS 55" SMART TV',
    json_object(
		"marca", "PHILIPS",
        "pesoKG","9.5",
        "schermo","OLED",
        "pollici",55,
        "uscite",json_array("hdmi","hdmi2","USB","SCART")
    ) 
);

-- json_extract
select json_extract(specifiche,'$.pesoKG') from articoli;
select json_extract(specifiche,'$.uscite') from articoli;
select json_extract(specifiche,'$.uscite[0]') from articoli; # estrae il primo valore dell'array

insert into articoli(descrizione,specifiche)
values
	('TV LG 55" SMART TV',
    json_object(
		"marca", "LG",
        "pesoKG","9.5",
        "schermo","OLED",
        "pollici",55,
        "uscite",json_array("hdmi","hdmi2","USB","SCART"),
        "misure",json_object(
				"altezza","50cm",
                "profondità","3cm",
                "larghezza","42cm")
    ) 
);
select * from articoli;
select json_extract(specifiche,'$.misure.altezza') 
from articoli
where id = 4;

select specifiche -> '$.marca' from articoli;

-- json_set
# aggiunge in caso non ci siano e modifica i valori
UPDATE articoli
SET specifiche =
JSON_SET(specifiche,
	'$.marca','LG',
	'$.uscite',JSON_ARRAY('HDMI','SCART','S/PDIF'),
	'$.ingressi',JSON_ARRAY('ETHERNET','USB'))
WHERE id = 1;

-- json_insert
# La funzione JSON_INSERT inserisce i valori senza sostituire i valori esistenti
UPDATE articoli
SET specifiche = JSON_INSERT(specifiche,'$.uscite[2]','RGB')
WHERE id = 1;
-- non produce risultato perché la posizione nell'array è occupata

UPDATE articoli
SET specifiche = JSON_INSERT(specifiche,'$.uscite[3]','RGB')
WHERE id = 1;
-- aggiunge il nuovo elemento

-- json_replace
# La funzione JSON_REPLACE sostituisce solo i valori esistenti
UPDATE articoli
SET specifiche = JSON_REPLACE(specifiche,'$.marca','SAMSUNG')
WHERE id = 1;

-- json_remove
# La funzione JSON_REMOVE elimina i valori in una colonna di tipo JSON
UPDATE articoli
SET specifiche = JSON_REMOVE(specifiche,'$.profondita')
WHERE id = 1; -- non produce risultato perché la proprietà non esiste

UPDATE articoli
SET specifiche = JSON_REMOVE(specifiche,'$.uscite[1]')
WHERE id = 1; -- elimina il secondo elemento della proprietà uscite