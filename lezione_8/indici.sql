explain
select cognome, nome, email, credito
from clienti
where provincia = 'to';

# Quando il database cresce in dimensioni per rendere più veloce ed efficiente la ricerca si usano gli INDICI per i campi usati di frequente nella ricerca

alter table clienti add index k_prov(provincia);
-- create index k_prov on clienti(provincia);

# Per mostrare gli indici di una tabella
desc clienti;
show index from clienti;

select distinct provincia from clienti;

# cardinalità della colonna
select count(distinct provincia) from clienti;

explain
select cognome, nome, email, credito
from clienti
where provincia = 'to'
and credito > 100;

select count(distinct provincia) from clienti;
select count(distinct credito) from clienti;

alter table clienti add index k_prov_credito(provincia, credito);

show index from clienti;

# eliminare un indice
drop index k_prov_credito on clienti;
-- alter table clienti drop index k_prov_credito;

alter table clienti add index k_credito_prov(credito, provincia);

explain
select cognome, nome, email, credito
from clienti use index(k_credito_prov)
where provincia = 'to'
and credito > 100;

analyze table clienti;
show index from clienti;

drop index k_credito_prov on clienti;
alter table clienti add index k_prov_credito(provincia, credito);

explain
select cognome, nome, email, credito
from clienti
where provincia = 'to'
and credito > 100;

explain
select cognome, nome, email, credito
from clienti use index(k_prov_credito)
where provincia = 'to';

drop index k_prov on clienti;

explain
select cognome, nome, email, credito
from clienti
where provincia = 'to'
order by cognome;

explain
select provincia, credito
from clienti use index(k_credito)
where credito > 100;

alter table clienti add index k_credito(credito);

drop index k_credito on clienti;

explain
select cognome, nome, email, credito
from clienti
where provincia = 'to'
order by cognome;

alter table clienti add index k_cogn(cognome);
drop index k_cogn on clienti;

alter table clienti add index k_prov_cogn_cred(provincia, cognome, credito);







analyze table clienti;