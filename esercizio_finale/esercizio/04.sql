-- Query 1 
-- Elenco articoli e autore ordinati per data decrescente
-- Il result set risultante deve riportare le colonne:
-- title, content, featured_image, username, p.created_at, p.updated_at
-- i record devono essere ordinati per data di creazione del post
SELECT
	p.title,
    p.content,
    p.featured_image,
    u.username,
    p.created_at,
    p.updated_at
FROM
	posts p
INNER JOIN
	users u ON p.author_id = u.id
ORDER BY p.created_at DESC;

-- Query 2
-- Elenco articoli e autore pubblicati dopo una certa data (≥ agosto 2025)
-- Il result set deve riportare le colonne:
-- title, content, username, p.created_at
-- I record devono essere filtrati mostrando solo quelli con created_at >= '2025-08-01'
SELECT
	p.title,
    p.content,
    u.username,
    p.created_at
FROM 
	posts p
INNER JOIN
	users u ON p.author_id = u.id
WHERE
	p.created_at >= '2025-08-01'
ORDER BY
	p.created_at DESC;

-- Query 3 – Elenco articoli e autore pubblicati nel mese di luglio dell’anno corrente
-- Il result set deve riportare le colonne:
-- title, content, username, p.created_at
-- I record devono essere filtrati mostrando solo quelli con month(created_at) = 7
-- e year(created_at) uguale all’anno corrente
SELECT
	p.title,
    p.content,
    u.username,
    p.created_at
FROM
	posts p
INNER JOIN
	users u ON p.author_id = u.id
WHERE
	MONTH(p.created_at) = 7
    AND YEAR(p.created_at) = YEAR(CURDATE());

-- Query 4 – Elenco dei 3 articoli più recenti e autore che li ha scritti
-- Il result set deve riportare le colonne:
-- title, content, username, p.created_at
-- I record devono essere ordinati per created_at in ordine decrescente
-- e limitati ai primi 3 (LIMIT 3)
SELECT
	p.title,
    p.content,
    u.username,
    p.created_at
FROM
	posts p
INNER JOIN
	users u ON p.author_id = u.id
ORDER BY
	p.created_at DESC LIMIT 3;

-- Query 5 – Elenco articoli dell’autore con username = 'verdi'
-- Il result set deve riportare le colonne:
-- title, content, username, p.created_at
-- I record devono essere filtrati mostrando solo quelli con username = 'verdi'
-- I record devono essere ordinati per created_at in ordine decrescente
SELECT
	p.title,
    p.content,
    u.username,
    p.created_at
FROM
	posts p
INNER JOIN
	users u ON p.author_id = u.id
WHERE
	u.username = 'verdi'
ORDER BY
	p.created_at DESC;

-- Query 6 – Conteggio degli articoli per autore
-- Il result set deve riportare le colonne:
-- username, numero di articoli scritti (alias: articoli scritti)
-- I record devono essere raggruppati per autore
-- Ordinare i risultati in ordine decrescente per numero di articoli scritti
SELECT
	u.username,
    count(p.id) `articoli scritti`
FROM
	posts p
INNER JOIN
	users u ON p.author_id = u.id
GROUP BY
	u.username
ORDER BY
	`articoli scritti` DESC;

-- Query 7 – Autore/i che hanno scritto più articoli
-- Il result set deve riportare le colonne:
-- username, numero di articoli scritti (alias: articoli scritti)
-- Mostrare solo gli autori che hanno il massimo numero di articoli
-- Utilizzare HAVING confrontando con un sottoquery di conteggio articoli per autore
SELECT
	u.username,
    count(p.id) `articoli scritti`
FROM
	users u
INNER JOIN
	posts p ON u.id = p.author_id
GROUP BY
	u.username
HAVING
	`articoli scritti` >= (
    SELECT
		MAX(`count_articoli`) as `count`
        FROM(
			SELECT
				COUNT(p2.id) as `count_articoli`
                FROM
                posts as `p2`
                JOIN
                users as `u2` ON p2.author_id = u2.id
                GROUP BY u2.id
        ) as `subquery`
    );

-- Query 8 – Elenco articoli di una specifica categoria
-- Il result set deve riportare le colonne:
-- title, content, t.name (alias: term), t.taxonomy, p.created_at
-- I record devono essere filtrati mostrando solo quelli appartenenti alla categoria 'Primi piatti'
SELECT 
    p.title,
    p.content,
    t.name AS term,
    t.taxonomy,
    p.created_at
FROM 
    posts p
INNER JOIN 
    term_relationships tr ON p.id = tr.object_id
INNER JOIN 
    terms t ON tr.term_id = t.id
WHERE 
    t.name = 'Primi piatti';
    
-- Query 9 – Elenco articoli di uno specifico tag
-- Il result set deve riportare le colonne:
-- title, content, t.name (alias: term), t.taxonomy, p.created_at
-- I record devono essere filtrati mostrando solo quelli con tag 'uova'
SELECT 
    p.title,
    p.content,
    t.name AS term,
    t.taxonomy,
    p.created_at
FROM 
    posts p
INNER JOIN 
    term_relationships tr ON p.id = tr.object_id
INNER JOIN 
    terms t ON tr.term_id = t.id
WHERE 
    t.name = 'uova';

-- Query 10 – Elenco di tutti i commenti approvati di uno specifico articolo
-- Il result set deve riportare le colonne:
-- post_id, author_email, comments.content, comments.status
-- I record devono essere filtrati per post_id = 1
-- e status = 'approved'
-- Ordinare i risultati per created_at in ordine crescente
SELECT 
    c.post_id,
    c.author_email,
    c.content,
    c.status
FROM 
    comments c
WHERE 
    c.post_id = 1
    AND c.status = 'approved'
ORDER BY 
    c.created_at ASC;

-- Query 11 – Conteggio dei commenti approvati per ogni post
-- Il result set deve riportare le colonne:
-- post_id, numero di commenti approvati (alias: quanti)
-- I record devono essere raggruppati per post_id
-- Mostrare solo i post che hanno almeno un commento approvato
SELECT 
    c.post_id,
    COUNT(c.id) AS quanti
FROM 
    comments c
WHERE
    c.status = 'approved'
GROUP BY 
    c.post_id
HAVING 
    COUNT(c.id) > 0;

-- Query 12 – Elenco articoli con commenti associati
-- Il result set deve riportare le colonne:
-- p.id, p.title, c.content
-- Mostrare solo i post che hanno almeno un commento
SELECT 
    p.id,
    p.title,
    c.content
FROM 
    posts p
INNER JOIN 
    comments c ON p.id = c.post_id
ORDER BY 
    p.id, c.created_at ASC;

-- Query 13 – Elenco articoli senza commenti
-- Il result set deve riportare le colonne:
-- p.id, p.title, c.content (che sarà NULL se non ci sono commenti)
-- Mostrare solo i post che non hanno alcun commento
SELECT 
    p.id,
    p.title,
    c.content
FROM 
    posts p
LEFT JOIN 
    comments c ON p.id = c.post_id
WHERE 
    c.content IS NULL;

-- Query 14 – Conteggio dei commenti di un articolo specifico (id = 1)
-- Il result set deve riportare le colonne:
-- id del post e numero di commenti associati
-- I record devono essere filtrati mostrando solo il post con id = 1
SELECT 
    p.id AS post_id,
    COUNT(c.id) AS numero_commenti
FROM 
    posts p
LEFT JOIN 
    comments c ON p.id = c.post_id
WHERE 
    p.id = 1
GROUP BY 
    p.id;

-- Query 15 – Elenco articoli con categorie e tag (tutti i termini)
-- Il result set deve riportare le colonne:
-- p.id, p.author_id, title, content, username, t.name (alias: term), t.taxonomy, p.created_at
-- Mostrare i post con eventuali termini associati (categorie o tag)
SELECT 
    p.id,
    p.author_id,
    p.title,
    p.content,
    u.username,
    t.name AS term,
    t.taxonomy,
    p.created_at
FROM 
    posts p
INNER JOIN 
    users u ON p.author_id = u.id
LEFT JOIN 
    term_relationships tr ON p.id = tr.object_id
LEFT JOIN 
    terms t ON tr.term_id = t.id;

-- Query 16 – Elenco articoli con categorie e tag separati
-- Il result set deve riportare le colonne:
-- p.id, p.title, p.excerpt, u.username, categories, tags, p.created_at
-- Dove categories è la concatenazione dei termini taxonomy = 'category'
-- e tags è la concatenazione dei termini taxonomy = 'tag'
-- per creare le colonne 'categories' e 'tag' dovete usare due funzioni:
-- GROUP_CONCAT() -- documentazione: https://dev.mysql.com/doc/refman/8.4/en/aggregate-functions.html#function_group-concat
-- IF - vista in aula (vi serve per distinguere se taxonomy è uguale a 'category' e se taxonomy è uguale a 'tag')
-- IF diventa argomento di GROUP_CONCAT
-- esempio di uso di GROUP_CONCAT() su database corsi:
/*
select
	d.nome `Nome Docente`,
    d.cognome `Cognome Docente`,
    count(*)  `Quanti`,
    group_concat(c.titolo ORDER BY c.titolo DESC SEPARATOR '; ')  `Corsi assegnati`
from docenti d
join corsi c
on d.id = c.docente_id
group by d.id;
*/
SELECT 
    p.id,
    p.title,
    p.excerpt,
    u.username,
    GROUP_CONCAT(
        IF(t.taxonomy = 'category', t.name, NULL)
        ORDER BY t.name SEPARATOR ', '
    ) AS categories,
    GROUP_CONCAT(
        IF(t.taxonomy = 'tag', t.name, NULL)
        ORDER BY t.name SEPARATOR ', '
    ) AS tags,
    p.created_at
FROM 
    posts p
INNER JOIN 
    users u ON p.author_id = u.id
LEFT JOIN 
    term_relationships tr ON p.id = tr.object_id
LEFT JOIN 
    terms t ON tr.term_id = t.id
GROUP BY 
    p.id, p.title, p.excerpt, u.username, p.created_at;

-- Query 17 – Ricerca full-text negli articoli
-- Seleziona gli articoli che contengono le parole 'facile, veloce'
-- Il result set deve riportare le colonne:
-- title, content, peso (risultato della funzione MATCH)
-- Usare MATCH(title, content) AGAINST ('facile, veloce')


-- Query 18 – Ricerca full-text negli articoli
-- Seleziona gli articoli che contengono esattamente la frase "filetti di merluzzo al forno"
-- Usare MATCH con stringa fra virgolette doppie


-- Query 19 – Ricerca full-text negli articoli
-- Seleziona gli articoli che devono contenere la parola 'forno' e NON devono contenere la parola 'pentola'
-- Usare MATCH in modalità BOOLEAN MODE