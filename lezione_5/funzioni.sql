-- FUNZIONI DI AGGREGAZIONE
-- avg(colonna)
select * from corsi;
select avg(prezzo) `prezzo medio`
from corsi; # media dei costi escludendo i valori NULL

-- count(*), count(colonna)
select count(*) `Quanti corsi`
from corsi;	# quantità di corsi
# con * conti le righe di una tabella

select * from corsi;
select count(docente_id) from corsi;
# conta tutti i valori validi

select count(cognome) from studenti;

select count(distinct cognome) from studenti;
# distinct conta senza ripetizioni

select count(*) `Totale femmine`
from studenti
where genere = 'f';

select count(genere) from studenti where genere is null;
# puoi anche controllare se esistono valori NULL

-- sum(colonna)
select titolo, sum(i.prezzo) `tot iscrizioni`
from iscrizioni i
join corsi c
on c.id = i.corso_id
where corso_id = 1;


-- max(colonna), min(colonna)
select max(prezzo) `corso più caro`,
	   min(prezzo) `corso più economico`
from corsi;
# non vengono considerati i valori NULL

-- FUNZIONI MATEMATICHE
-- round(colonna, [numero decimali])
# arrotondamento. non specifico il secondo numero arrotonda all intero
select round(avg(prezzo), 1) `prezzo medio`
from corsi;

select floor(155.65), ceiling(55.35);
# arrotonda verso il basso
# arrotonda verso l alto

-- FUNZIONI SULLE STRINGHE
select cognome, length(cognome) 
from studenti;
# lunghezza in termini di caratteri

select cognome, nome, concat(cognome,' ', nome) 
from studenti;
# concatena le stringhe

select concat_ws(' ', cognome, nome, email, indirizzo) `Info complete`
from studenti;
# il primo valore serve a specificare cosa inserire tra un valore e l altro

select cognome, substring(cognome,2,3) 
from studenti;
# decidi da dove e quanti caratteri prendere


select round(avg(length(concat(cognome,nome)))) `lunghezza media` 
from studenti;

-- FUNZIONE INFORMATIVA
-- last_insert_id()

insert into docenti(cognome,nome,email)
values('enrico','macello','emac@icloud.it');

select last_insert_id();
select * from corsi;

update corsi set docente_id = last_insert_id()
where id = 9;

select * from studenti;

insert into studenti(cognome, nome,email)
values
('isabella','bianchi','isb@gmail.com'),
('mauro','biglia','mbiglia@gmail.com'),
('gino','verdi','gvvdi@gmail.com');

select last_insert_id();
# segnerà sempre il primo inserito tra i molti

insert into studenti(cognome, nome,email)
values
('pino','abete','pbate@gmail.com');

-- replace() case sensitive
select indirizzo, replace(indirizzo, 'corso','Viale') from studenti;
select * from studenti;
# sostituisce una parola con un'altra
# presta attenzione alle minuscole e maiuscole

select indirizzo, regexp_replace(indirizzo, '(?i)corso','Viale') from studenti;

-- FUNZIONI DI DATA E ORA
select now(); #data ora
select curdate(); #data
select curtime(); #ora

select data_nascita, year(data_nascita) from studenti;
select data_nascita, dayname(data_nascita) from studenti;
select data_nascita, dayofweek(data_nascita) from studenti;
select data_nascita, month(data_nascita) from studenti;
select data_registrazione, second(data_registrazione) from studenti;

select @@lc_time_names; #visualizzo la lingua attuale
SET lc_time_names = 'it_IT'; #setto la lingua in italiano

select dayofweek('2025-07-08'); #3 perche partono dalla domenica

-- date_format
select data_nascita, date_format(data_nascita,'%d/%m/%Y') from studenti; 
# l'anno ha le 4 cifre
select data_nascita, date_format(data_nascita,'%d/%m/%y') from studenti;
# l'anno ha le 2 cifre finali

select data_nascita, date_format(data_nascita,'%d %M %Y') from studenti;

select time_format('17:05','%h:%i %p');

-- str_to_date()
select * from studenti;

update studenti 
set data_nascita = str_to_date(concat_ws('-','05','10','1969'),'%d-%m-%Y')
where id = 51;

select adddate('2025-07-08',7);
select adddate('2025-07-08',interval 7 month);
select adddate('2025-07-08',interval 7 year);
select addtime('17:25','05:05'); #restituisce: 22:30:00

select datediff('2025-07-08','2025-07-15');
select datediff(curdate(),'2025-08-15');
select datediff(curdate(),'2002-09-05');

select data_nascita, timestampdiff(year,data_nascita,curdate()) `età`
from studenti
order by `età`;
# differenza tra data di nascita e data attuale in anni

alter table studenti add eta tinyint unsigned after data_nascita;
update studenti set eta = timestampdiff(year,data_nascita,curdate());

insert into studenti(cognome,nome,email,data_nascita,eta)
values 
('cettola','franco','frcttl@icloud.it','1978-07-28',timestampdiff(year,data_nascita,curdate()));

-- control flow funcition

-- if
select * from studenti order by regione;
select 
	cognome,
    nome,
    if(provincia = 'to','in sede', 'fuori sede') `provenienza`
from studenti
order by `provenienza`;

-- case
select 
	provincia,
	CASE provincia
	when 'to' then 'Torino'
	when 'at' then 'Asti'
	when 'no' then 'Novara'
	when 'al' then 'Alessandria'
	when 'cn' then 'Cuneo'
	when 'no' then 'Novara'
	when 'bg' then 'Bergamo'
	when 'mi' then 'Milano'
	else 'non tradotto' end 'Provincia completa'
from studenti
order by provincia;

use app_java2025;

select * from libri2;
select
	prezzo,
	case
		when prezzo < 30 then 'economico'
        when prezzo >= 30 then 'caro'
	end `valutazione`
from libri2;

select 
	cognome,
	case
		when genere = 'f' then 'Donna'
		when genere = 'm' then 'Uomo'
	else 'Not Binary'
    end `Genere`
from studenti;