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
INSERT INTO country_table VALUES (8, 'Russia');
INSERT INTO country_table VALUES (9, 'United States of America');

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
INSERT INTO place_table VALUES (1, 'Lisbon', 'Parque florestal de Monsanto', (SELECT REF(p) FROM country_table p WHERE id=1));
INSERT INTO place_table VALUES (2, 'Porto', 'Clerigos', (SELECT REF(p) FROM country_table p WHERE id=1));
INSERT INTO place_table VALUES (3, 'Berlin', 'Cora-Berliner-Straße', (SELECT REF(p) FROM country_table p WHERE id=4));
INSERT INTO place_table VALUES (4, 'London', 'Big Ben', (SELECT REF(p) FROM country_table p WHERE id=5));
INSERT INTO place_table VALUES (5, 'Brussels', 'Avenue de Atomium', (SELECT REF(p) FROM country_table p WHERE id=6));
INSERT INTO place_table VALUES (6, 'Amsterdam', 'Grachtengordel', (SELECT REF(p) FROM country_table p WHERE id=7));
INSERT INTO place_table VALUES (7, 'Chicago', 'Willis Tower', (SELECT REF(p) FROM country_table p WHERE id=9));
INSERT INTO place_table VALUES (8, 'Moscow', 'Kremlin', (SELECT REF(p) FROM country_table p WHERE id=8));
INSERT INTO place_table VALUES (9, 'Paris', 'Champs-Élysées Avenue', (SELECT REF(p) FROM country_table p WHERE id=3));


-- IMAGE
INSERT INTO image_table VALUES (photo_t(1, '2017-05-03 23:55:00', 'Flowers during Spring', 42351, httpuritype.createuri('http://www.sitedenoticias.com/images/flowers_during_spring.png'), (SELECT REF(p) FROM journalist_table p WHERE id=3), (SELECT REF(p) FROM place_table p WHERE id=1)));
INSERT INTO image_table VALUES (photo_t(2, '2017-04-26 20:30:00', 'Big Ben at Summer', 63427, httpuritype.createuri('http://www.sitedenoticias.com/images/big_ben_at_summer.png'), (SELECT REF(p) FROM journalist_table p WHERE id=6), (SELECT REF(p) FROM place_table p WHERE id=4)));
INSERT INTO image_table VALUES (photo_t(3, '2017-02-18 14:20:00', 'The lovely canals', 14549, httpuritype.createuri('http://www.sitedenoticias.com/images/the_lovely_canals.png'), (SELECT REF(p) FROM journalist_table p WHERE id=2), (SELECT REF(p) FROM place_table p WHERE id=6)));
INSERT INTO image_table VALUES (photo_t(4, '2017-02-11 17:15:00', 'Willis Tower covered in snow', 23495, httpuritype.createuri('http://www.sitedenoticias.com/images/willis_tower_covered_in_snow.png'), (SELECT REF(p) FROM journalist_table p WHERE id=7), (SELECT REF(p) FROM place_table p WHERE id=7)));
INSERT INTO image_table VALUES (cartoon_t(5, '2017-02-09 09:50:00', 'Cartoon of Marcelo Rebelo de Sousa', 93012, httpuritype.createuri('http://www.sitedenoticias.com/images/cartoon_of_marcelo_rebelo_de_sousa.png'), (SELECT REF(p) FROM journalist_table p WHERE id=1)));
INSERT INTO image_table VALUES (cartoon_t(6, '2017-02-03 08:35:00', 'Cartoon of Agir', 29143, httpuritype.createuri('http://www.sitedenoticias.com/images/cartoon_of_agir.png'), (SELECT REF(p) FROM journalist_table p WHERE id=7)));
INSERT INTO image_table VALUES (cartoon_t(7, '2017-01-28 12:25:00', 'Cartoon of Cristiano Ronaldo', 73012, httpuritype.createuri('http://www.sitedenoticias.com/images/cartoon_of_cristiano_ronaldo.png'), (SELECT REF(p) FROM journalist_table p WHERE id=8)));
INSERT INTO image_table VALUES (infogram_t(8, '2017-01-19 19:45:00', 'Infogram about demographics', 93012, httpuritype.createuri('http://www.sitedenoticias.com/images/infogram_about_demographics.png'), (SELECT REF(p) FROM journalist_table p WHERE id=5)));
INSERT INTO image_table VALUES (infogram_t(9, '2017-01-03 21:05:00', 'Infogram about Horror Movies', 93012, httpuritype.createuri('http://www.sitedenoticias.com/images/infogram_about_horror_movies.png'), (SELECT REF(p) FROM journalist_table p WHERE id=9)));


-- VIDEO
INSERT INTO video_table VALUES (1, '2017-05-03 23:55:00', 'Kids dancing', 312, httpuritype.createuri('http://www.sitedenoticias.com/videos/kids_dancing.mkv'), (SELECT REF(p) FROM journalist_table p WHERE id=3), (SELECT REF(p) FROM place_table p WHERE id=7));
INSERT INTO video_table VALUES (2, '2017-04-26 20:30:00', 'Man jumping', 278, httpuritype.createuri('http://www.sitedenoticias.com/videos/man_jumping.mkv'), (SELECT REF(p) FROM journalist_table p WHERE id=6), (SELECT REF(p) FROM place_table p WHERE id=2));
INSERT INTO video_table VALUES (3, '2017-02-18 14:20:00', 'Car speeding', 180, httpuritype.createuri('http://www.sitedenoticias.com/videos/car_speeding.mkv'), (SELECT REF(p) FROM journalist_table p WHERE id=2), (SELECT REF(p) FROM place_table p WHERE id=4));
INSERT INTO video_table VALUES (4, '2017-02-11 17:15:00', 'Football match', 19000, httpuritype.createuri('http://www.sitedenoticias.com/videos/football_match.mkv'), (SELECT REF(p) FROM journalist_table p WHERE id=7), (SELECT REF(p) FROM place_table p WHERE id=1));
INSERT INTO video_table VALUES (5, '2017-02-09 09:50:00', 'Albert Einstein interview', 234, httpuritype.createuri('http://www.sitedenoticias.com/videos/albert_einstein_interview.mkv'), (SELECT REF(p) FROM journalist_table p WHERE id=1), (SELECT REF(p) FROM place_table p WHERE id=3));
INSERT INTO video_table VALUES (6, '2017-02-03 08:35:00', 'Guy programming', 540, httpuritype.createuri('http://www.sitedenoticias.com/videos/guy_programming.mkv'), (SELECT REF(p) FROM journalist_table p WHERE id=7), (SELECT REF(p) FROM place_table p WHERE id=8));
INSERT INTO video_table VALUES (7, '2017-01-28 12:25:00', 'Woman writting', 207, httpuritype.createuri('http://www.sitedenoticias.com/videos/woman_writting.mkv'), (SELECT REF(p) FROM journalist_table p WHERE id=8), (SELECT REF(p) FROM place_table p WHERE id=9));
INSERT INTO video_table VALUES (8, '2017-01-19 19:45:00', 'People eating', 731, httpuritype.createuri('http://www.sitedenoticias.com/videos/people_eating.mkv'), (SELECT REF(p) FROM journalist_table p WHERE id=5), (SELECT REF(p) FROM place_table p WHERE id=5));
INSERT INTO video_table VALUES (9, '2017-01-03 21:05:00', 'Enya singing', 239, httpuritype.createuri('http://www.sitedenoticias.com/videos/enya_singing.mkv'), (SELECT REF(p) FROM journalist_table p WHERE id=9), (SELECT REF(p) FROM place_table p WHERE id=4));

