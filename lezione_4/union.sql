select state, capital_id
from america
union
select state, capital_id
from asia
union
select state, capital_id
from africa
order by state;

# il numero delle colonne selezionate sia uguale in ciascuna delle query che si desidera unire

table america
union
table asia
union
select id, state, capital_id, population
from africa
order by state;

#puoi mixare le richieste ma bisognerà specificare tutti i campi
# con il "table" selezioni tutti i campi della tabella
# nella select l'ordine deve essere uguale in tutte le richieste perche non ti darà errore
# ma mixerà i dati al suo interno


# ' ' as generazione == crea un alias, una colonna extra non esistente
select cognome, data_nascita, 'X' as generazione
from studenti
where data_nascita <= '1980-12-31'
union 
select cognome, data_nascita, 'Millenials' as generazione
from studenti
where data_nascita between '1981-01-01'and '1996-12-31'
union 
select cognome, data_nascita, 'Z' as generazione
from studenti
where data_nascita >= '1997-01-01'
order by generazione;

#union di default è distinct == le righe doppie vengono cancellate
# all invece si esegue piu velocemente == le righe doppie rimangono

select * from amici
union all
select * from parenti;

truncate amici;
truncate parenti;

select * from studenti;

insert into amici
select id, nome, cognome, email
from studenti
where id <= 15;

insert into parenti
select id, nome, cognome, email
from studenti
where id >= 10;

select * from parenti
intersect
select * from amici;
#restituisce solo i valori comuni alle due tabelle

select * from parenti
except
select * from amici;
#restituisce i valori della prima tabella che non sono presenti nella seconda