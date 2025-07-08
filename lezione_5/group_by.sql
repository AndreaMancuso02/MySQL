-- group by
select distinct cognome from studenti;

select cognome from studenti group by cognome;

select 
	cognome, 
    count(cognome) `quanti`
from studenti
group by cognome
order by `quanti` desc;

select 
	genere, 
    count(*) `quanti`
from studenti
group by genere
order by `quanti` desc;


select cognome,nome,count(*)`quanti`
from docenti d
join corsi c
on d.docente_id = c.docente_id
group by d.docente_id
order by `quanti` desc;

select 
	genere,
    floor(avg(timestampdiff(year, data_nascita, curdate()))) `età media`,
    count(*) `Quanti`
from studenti
where data_nascita is not null and genere is not null
group by genere
order by `età media`;

select
	cognome,
    nome,
    sum(prezzo) `valore corsi`
from docenti d
join corsi c
on d.docente_id = c.docente_id
group by d.docente_id
order by `valore corsi` desc;

select
	cognome,
    nome,
    round(avg(prezzo),2) `Spesa media`,
    count(*) `Iscrizioni`,
    sum(prezzo) `Totale speso`,
    min(prezzo) `Minimo speso`,
    max(prezzo) `Massimo speso`
from studenti s
join iscrizioni i
on s.id = i.studente_id
where provincia = 'to'
group by s.id
having `Iscrizioni` > 1
order by `Iscrizioni` desc;

select
	provincia,
    genere,
    count(*) `Quanti`
from studenti
group by provincia, genere
order by provincia;

select
	provincia,
    genere,
    count(*) `Quanti`
from studenti
group by genere, provincia
order by genere;

select
	provincia,
    genere,
    count(*) `Quanti`,
    floor(avg(timestampdiff(year, data_nascita, curdate()))) `età media`
from studenti
group by genere, provincia
order by genere, provincia;

-- group by ... with roll up
select
	provincia,
    count(*) `Quanti`
from studenti
group by provincia with rollup; 
# aggiunge una riga in piu con totale


-- grouping()
select
	provincia,
    count(*) `Quanti`,
    grouping(provincia)
from studenti
group by provincia with rollup; 


select
	if(grouping(provincia), 'totale', provincia) as Provincia,
	if(grouping(genere), 'totale genere', genere) as Genere,
    count(*) `Quanti`
from studenti
group by provincia, genere
with rollup;

select
	titolo,
    count(*) `Quanti`
from iscrizioni i
join corsi c
on c.id = i.corso_id
group by c.id
order by `Quanti` desc;


