-- 1)
-- Conta gli studenti divisi per genere
-- la tabelle risultante mostrerà i seguenti attributi
-- Genere, Quanti
select 
	genere, 
    count(*) `quanti`
from studenti
group by genere;

-- 2)
-- Conta gli studenti divisi per regione
-- la tabelle risultante mostrerà i seguenti attributi
-- Regione, Quanti
select 
	regione, 
    count(*) `quanti`
from studenti
group by regione;

-- 3)
-- Conta quanti studenti ci sono per ogni combinazione di regione e genere.
-- Mostra i risultati ordinati dal gruppo con più studenti a quello con meno 
select 
	regione,
    genere,
    count(*) `quanti`
from studenti
group by regione, genere
order by `quanti` desc;

-- 4)
-- Conta gli studenti divisi per genere solo della provincia di Alessandria
-- la tabelle risultante mostrerà i seguenti attributi
-- Genere, Quanti
select
	genere,
    count(*) `Quanti`
from studenti
where provincia = 'al'
group by genere;

-- 5)
-- Conta il numero di studenti iscritti a ciascun corso.
-- Ordina il risultato in ordine decrescente in base al numero di iscritti per corso.
select
	c.titolo,
    count(i.studente_id) `Numero Iscritti`
from corsi c
join iscrizioni i
on c.id = i.corso_id
group by c.titolo
order by `Numero Iscritti` desc;

-- 6)
-- Conta quanti corsi tiene ciascun professore.
-- Mostra il cognome e nome del docente insieme al numero di corsi assegnati.
-- Ordina i risultati in ordine decrescente in base al numero di corsi.
select
	d.cognome,
    d.nome,
    count(*) `Corsi`
from docenti d
join corsi c
on d.docente_id = c.id
group by d.docente_id, d.cognome, d.nome
order by `Corsi` desc;
-- 7)
-- Calcola il valore totale delle iscrizioni per ciascun corso, sommando il prezzo pagato da tutti gli studenti iscritti.
-- Mostra il titolo del corso e la somma totale.
select
	c.titolo,
    sum(i.prezzo) `TotIscrizioni`
from corsi c
join iscrizioni i
on c.id = i.corso_id
group by c.titolo
order by `TotIscrizioni` desc;

-- 8)
-- Calcola la media spesa da ogni studente, a quanti corsi è iscritto e il vaolore speso
-- dai un alias leggibile alle colonne prodotte dalle funzioni.
select
	s.nome,
    s.cognome,
    count(i.corso_id) `Corsi Iscritti`,
    sum(i.prezzo) `Spesa Totale`,
    avg(i.prezzo) `Spesa Media`
from studenti s
join iscrizioni i
on s.id = i.corso_id
group by s.id, s.nome, s.cognome
order by `Spesa Totale` desc;


-- 9) Conta gli studenti divisi per regione e per genere mostrando anche i totali aggregati
-- ricordatevi della funzione grouping() e dell'istruzione with rollup
-- la tabelle risultante mostrerà i seguenti attributi, con le righe in più dei subtotali e del totale
-- Regione, Genere, Quanti


-- 10) Calcola età media degli studenti divisi per regione
-- la tabelle risultante mostrerà i seguenti attributi
-- Regione, `età media`
select
	regione,
    round(avg(timestampdiff(year, data_nascita, curdate()))) `età media`
from studenti
group by regione;
