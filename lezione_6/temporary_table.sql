create temporary table studenti_giovani
select
	studenti.id,
	nome,
    cognome,
    timestampdiff(year, data_nascita, curdate()) `eta`
from studenti
having `eta` <= 30;

select * from studenti_giovani;


select
	nome,
    cognome,
    timestampdiff(year, data_nascita, curdate()) `eta`,
    nome_corsi
from studenti s
join iscrizioni i
on s.id = i.studente_id
join corsi c
on c.id = i.corso_id
having `eta` > 30;

drop temporary table studenti_giovani;


select
	nome,
    cognome,
    `eta`,
    nome_corsi
from studenti_giovani s
join iscrizioni i
on s.id = i.studente_id
join corsi c
on c.id = i.corso_id;

select nome_corsi, count(*) as Quanti
from studenti_giovani
join iscrizioni on iscrizioni.studente_id = studenti_giovani.id
join corsi on corsi.id = iscrizioni.corso_id
group by nome_corsi;


