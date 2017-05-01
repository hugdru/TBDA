-- SECTION
INSERT INTO section_table VALUES (1, 'World');
INSERT INTO section_table VALUES (2, 'Politics');
INSERT INTO section_table VALUES (3, 'Business');
INSERT INTO section_table VALUES (4, 'Opinion');
INSERT INTO section_table VALUES (5, 'Technology');
INSERT INTO section_table VALUES (6, 'Science');
INSERT INTO section_table VALUES (7, 'Health');
INSERT INTO section_table VALUES (8, 'Sports');
INSERT INTO section_table VALUES (9, 'Arts');

-- CATEGORY
INSERT INTO category_table VALUES (1, 'Freelance journalism');
INSERT INTO category_table VALUES (2, 'Analytic journalism');
INSERT INTO category_table VALUES (3, 'Comedic journalism');
INSERT INTO category_table VALUES (4, 'Community journalism');
INSERT INTO category_table VALUES (5, 'Computational journalism');
INSERT INTO category_table VALUES (6, 'Enterprise journalism');
--INSERT INTO category_table VALUES (7, 'Mobile journalism');
--INSERT INTO category_table VALUES (8, 'Scientific journalism');
--INSERT INTO category_table VALUES (9, 'Data journalism');

-- COUNTRY
INSERT INTO country_table VALUES (1, 'Portugal');
INSERT INTO country_table VALUES (2, 'Spain');
INSERT INTO country_table VALUES (3, 'France');
INSERT INTO country_table VALUES (4, 'Germany');
INSERT INTO country_table VALUES (5, 'United Kingdom');
INSERT INTO country_table VALUES (6, 'Belgium');
INSERT INTO country_table VALUES (7, 'The Netherlands');
INSERT INTO country_table VALUES (8, 'Switzerland');
INSERT INTO country_table VALUES (9, 'Italy');

-- JOURNALIST
INSERT INTO journalist_table VALUES (1, 'José Nunes Lopes', '385649285174209', (SELECT REF(p) FROM category_table p WHERE id=6), (SELECT REF(p) FROM country_table p WHERE id=2));
INSERT INTO journalist_table VALUES (2, 'Clara Silva Lima', '403748039483245', (SELECT REF(p) FROM category_table p WHERE id=3), (SELECT REF(p) FROM country_table p WHERE id=5));
INSERT INTO journalist_table VALUES (3, 'Hugo Fernandes Almeida', '582064401853729', (SELECT REF(p) FROM category_table p WHERE id=1), (SELECT REF(p) FROM country_table p WHERE id=8));
INSERT INTO journalist_table VALUES (4, 'Guilherme Ribeiro Dias', '401358289582293', (SELECT REF(p) FROM category_table p WHERE id=2), (SELECT REF(p) FROM country_table p WHERE id=6));
INSERT INTO journalist_table VALUES (5, 'Filipe Martins Rodrigues', '382387596342312', (SELECT REF(p) FROM category_table p WHERE id=4), (SELECT REF(p) FROM country_table p WHERE id=1));
INSERT INTO journalist_table VALUES (6, 'Igor Sousa Cunha', '295062196039212', (SELECT REF(p) FROM category_table p WHERE id=1), (SELECT REF(p) FROM country_table p WHERE id=4));
INSERT INTO journalist_table VALUES (7, 'Margarida Pinto Barbosa', '045872348942372', (SELECT REF(p) FROM category_table p WHERE id=3), (SELECT REF(p) FROM country_table p WHERE id=5));
INSERT INTO journalist_table VALUES (8, 'Rodrigo Araújo Gonçalves', '560480293484723', (SELECT REF(p) FROM category_table p WHERE id=3), (SELECT REF(p) FROM country_table p WHERE id=9));
INSERT INTO journalist_table VALUES (9, 'Daniela Lima Costa', '593295810321850', (SELECT REF(p) FROM category_table p WHERE id=5), (SELECT REF(p) FROM country_table p WHERE id=2));


-- PLACE
INSERT INTO place_table VALUES (photo_t(1, '2017-05-03 23:55:00', 'Flowers during Spring', 'Portugal'));
INSERT INTO place_table VALUES (2, '2017-04-13 20:30:00', 'Spain');
INSERT INTO place_table VALUES (3, '2017-02-28 12:50:00', 'France');
INSERT INTO place_table VALUES (4, '2017-02-28 12:50:00', 'Germany');
INSERT INTO place_table VALUES (5, '2017-02-28 12:50:00', 'United Kingdom');
INSERT INTO place_table VALUES (6, '2017-02-28 12:50:00', 'Belgium');
INSERT INTO place_table VALUES (7, '2017-02-28 12:50:00', 'The Netherlands');
INSERT INTO place_table VALUES (8, '2017-02-28 12:50:00', 'Switzerland');
INSERT INTO place_table VALUES (9, '2017-02-28 12:50:00', 'Italy');


-- IMAGE
INSERT INTO image_table VALUES (photo_t(1, '2017-05-03 23:55:00', 'Flowers during Spring', 'Portugal'));
INSERT INTO image_table VALUES (2, '2017-04-13 20:30:00', 'Spain');
INSERT INTO image_table VALUES (3, '2017-02-28 12:50:00', 'France');
INSERT INTO image_table VALUES (4, '2017-02-28 12:50:00', 'Germany');
INSERT INTO image_table VALUES (5, '2017-02-28 12:50:00', 'United Kingdom');
INSERT INTO image_table VALUES (6, '2017-02-28 12:50:00', 'Belgium');
INSERT INTO image_table VALUES (7, '2017-02-28 12:50:00', 'The Netherlands');
INSERT INTO image_table VALUES (8, '2017-02-28 12:50:00', 'Switzerland');
INSERT INTO image_table VALUES (9, '2017-02-28 12:50:00', 'Italy');