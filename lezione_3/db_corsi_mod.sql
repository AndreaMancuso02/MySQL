select titolo, email
from docenti, corsi
where docenti.id = corsi.docente_id
and titolo = 'java';

select titolo, cognome, nome, docenti.id, corsi.docente_id
from docenti, corsi;

select corsi.titolo , studenti.cognome, studenti.nome
from corsi, iscrizioni, studenti
where corsi.id = iscrizioni.corso_id
and studenti.id = iscrizioni.studente_id
and titolo = 'basi di dati'
and genere = 'f'
order by studenti.cognome;

select corsi.titolo , studenti.cognome, studenti.nome, docenti.cognome, docenti.nome
from docenti, corsi, iscrizioni, studenti
where docenti.id = corsi.docente_id
and corsi.id = iscrizioni.corso_id
and studenti.id = iscrizioni.studente_id
order by corsi.titolo;

select 
	c.titolo `Titolo del Corso`,
    s.cognome as `Cognome studente`, 
    s.nome as `Nome studente`, 
    d.cognome `Cognome docente`, 
    d.nome `Nome docente`
from 
	docenti d, 
    corsi c, 
    iscrizioni i, 
    studenti s
where d.id = c.docente_id
and c.id = i.corso_id
and s.id = i.studente_id
order by c.titolo;

select title, price, price * 1.10 `prezzo con IVA`
from app_java2025.books;
 /*
cosi puoi interagire con il database diverso senza "entrare in uso"
*/