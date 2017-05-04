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

-- ROLE
INSERT INTO role_table VALUES (1, 'Main Reporter');
INSERT INTO role_table VALUES (2, 'Editor');
INSERT INTO role_table VALUES (3, 'Columnist');
INSERT INTO role_table VALUES (4, 'Blogger');
INSERT INTO role_table VALUES (5, 'Photographer');
INSERT INTO role_table VALUES (6, 'Collaborator,');

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
INSERT INTO journalist_table VALUES (7, 'Margarida PINTO Barbosa', '045872348942372', (SELECT REF(p) FROM category_table p WHERE id=3), (SELECT REF(p) FROM country_table p WHERE id=5));
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
INSERT INTO image_table VALUES (photo_t(1, TO_TIMESTAMP('2017-05-03 23:55:00', 'YYYY-MM-DD HH24:MI:SS'), 'Flowers during Spring', 42351, httpuritype.createuri('http://www.sitedenoticias.com/images/flowers_during_spring.png'), (SELECT REF(p) FROM journalist_table p WHERE id=3), (SELECT REF(p) FROM place_table p WHERE id=1)));
INSERT INTO image_table VALUES (photo_t(2, TO_TIMESTAMP('2017-04-26 20:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Big Ben at Summer', 63427, httpuritype.createuri('http://www.sitedenoticias.com/images/big_ben_at_summer.png'), (SELECT REF(p) FROM journalist_table p WHERE id=6), (SELECT REF(p) FROM place_table p WHERE id=4)));
INSERT INTO image_table VALUES (photo_t(3, TO_TIMESTAMP('2017-02-18 14:20:00', 'YYYY-MM-DD HH24:MI:SS'), 'The lovely canals', 14549, httpuritype.createuri('http://www.sitedenoticias.com/images/the_lovely_canals.png'), (SELECT REF(p) FROM journalist_table p WHERE id=2), (SELECT REF(p) FROM place_table p WHERE id=6)));
INSERT INTO image_table VALUES (photo_t(4, TO_TIMESTAMP('2017-02-11 17:15:00', 'YYYY-MM-DD HH24:MI:SS'), 'Willis Tower covered in snow', 23495, httpuritype.createuri('http://www.sitedenoticias.com/images/willis_tower_covered_in_snow.png'), (SELECT REF(p) FROM journalist_table p WHERE id=7), (SELECT REF(p) FROM place_table p WHERE id=7)));
INSERT INTO image_table VALUES (cartoon_t(5, TO_TIMESTAMP('2017-02-09 09:50:00', 'YYYY-MM-DD HH24:MI:SS'), 'Cartoon of Marcelo Rebelo de Sousa', 93012, httpuritype.createuri('http://www.sitedenoticias.com/images/cartoon_of_marcelo_rebelo_de_sousa.png'), (SELECT REF(p) FROM journalist_table p WHERE id=1)));
INSERT INTO image_table VALUES (cartoon_t(6, TO_TIMESTAMP('2017-02-03 08:35:00', 'YYYY-MM-DD HH24:MI:SS'), 'Cartoon of Agir', 29143, httpuritype.createuri('http://www.sitedenoticias.com/images/cartoon_of_agir.png'), (SELECT REF(p) FROM journalist_table p WHERE id=7)));
INSERT INTO image_table VALUES (cartoon_t(7, TO_TIMESTAMP('2017-01-28 12:25:00', 'YYYY-MM-DD HH24:MI:SS'), 'Cartoon of Cristiano Ronaldo', 73012, httpuritype.createuri('http://www.sitedenoticias.com/images/cartoon_of_cristiano_ronaldo.png'), (SELECT REF(p) FROM journalist_table p WHERE id=8)));
INSERT INTO image_table VALUES (infogram_t(8, TO_TIMESTAMP('2017-01-19 19:45:00', 'YYYY-MM-DD HH24:MI:SS'), 'Infogram about demographics', 93012, httpuritype.createuri('http://www.sitedenoticias.com/images/infogram_about_demographics.png'), (SELECT REF(p) FROM journalist_table p WHERE id=5)));
INSERT INTO image_table VALUES (infogram_t(9, TO_TIMESTAMP('2017-01-03 21:05:00', 'YYYY-MM-DD HH24:MI:SS'), 'Infogram about Horror Movies', 93012, httpuritype.createuri('http://www.sitedenoticias.com/images/infogram_about_horror_movies.png'), (SELECT REF(p) FROM journalist_table p WHERE id=9)));


-- VIDEO
INSERT INTO video_table VALUES (1, TO_TIMESTAMP('2017-05-03 23:55:00', 'YYYY-MM-DD HH24:MI:SS'), 'Kids dancing', 312, httpuritype.createuri('http://www.sitedenoticias.com/videos/kids_dancing.mkv'), (SELECT REF(p) FROM journalist_table p WHERE id=3), (SELECT REF(p) FROM place_table p WHERE id=7));
INSERT INTO video_table VALUES (2, TO_TIMESTAMP('2017-04-26 20:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Man jumping', 278, httpuritype.createuri('http://www.sitedenoticias.com/videos/man_jumping.mkv'), (SELECT REF(p) FROM journalist_table p WHERE id=6), (SELECT REF(p) FROM place_table p WHERE id=2));
INSERT INTO video_table VALUES (3, TO_TIMESTAMP('2017-02-18 14:20:00', 'YYYY-MM-DD HH24:MI:SS'), 'Car speeding', 180, httpuritype.createuri('http://www.sitedenoticias.com/videos/car_speeding.mkv'), (SELECT REF(p) FROM journalist_table p WHERE id=2), (SELECT REF(p) FROM place_table p WHERE id=4));
INSERT INTO video_table VALUES (4, TO_TIMESTAMP('2017-02-11 17:15:00', 'YYYY-MM-DD HH24:MI:SS'), 'Football match', 19000, httpuritype.createuri('http://www.sitedenoticias.com/videos/football_match.mkv'), (SELECT REF(p) FROM journalist_table p WHERE id=7), (SELECT REF(p) FROM place_table p WHERE id=1));
INSERT INTO video_table VALUES (5, TO_TIMESTAMP('2017-02-09 09:50:00', 'YYYY-MM-DD HH24:MI:SS'), 'Albert Einstein interview', 234, httpuritype.createuri('http://www.sitedenoticias.com/videos/albert_einstein_interview.mkv'), (SELECT REF(p) FROM journalist_table p WHERE id=1), (SELECT REF(p) FROM place_table p WHERE id=3));
INSERT INTO video_table VALUES (6, TO_TIMESTAMP('2017-02-03 08:35:00', 'YYYY-MM-DD HH24:MI:SS'), 'Guy programming', 540, httpuritype.createuri('http://www.sitedenoticias.com/videos/guy_programming.mkv'), (SELECT REF(p) FROM journalist_table p WHERE id=7), (SELECT REF(p) FROM place_table p WHERE id=8));
INSERT INTO video_table VALUES (7, TO_TIMESTAMP('2017-01-28 12:25:00', 'YYYY-MM-DD HH24:MI:SS'), 'Woman writting', 207, httpuritype.createuri('http://www.sitedenoticias.com/videos/woman_writting.mkv'), (SELECT REF(p) FROM journalist_table p WHERE id=8), (SELECT REF(p) FROM place_table p WHERE id=9));
INSERT INTO video_table VALUES (8, TO_TIMESTAMP('2017-01-19 19:45:00', 'YYYY-MM-DD HH24:MI:SS'), 'People eating', 731, httpuritype.createuri('http://www.sitedenoticias.com/videos/people_eating.mkv'), (SELECT REF(p) FROM journalist_table p WHERE id=5), (SELECT REF(p) FROM place_table p WHERE id=5));
INSERT INTO video_table VALUES (9, TO_TIMESTAMP('2017-01-03 21:05:00', 'YYYY-MM-DD HH24:MI:SS'), 'Enya singing', 239, httpuritype.createuri('http://www.sitedenoticias.com/videos/enya_singing.mkv'), (SELECT REF(p) FROM journalist_table p WHERE id=9), (SELECT REF(p) FROM place_table p WHERE id=4));


-- ITEM
INSERT INTO item_table VALUES (
	1,
	TO_TIMESTAMP('2017-05-01 23:55:00', 'YYYY-MM-DD HH24:MI:SS'),
	'Trump Says the Government Needs a "Good Shutdown"',
	'President Trump said on Tuesday that the United States needed "a good shutdown" this fall to force a partisan confrontation over federal spending, and suggested that he might move to reverse longstanding Senate rules that effectively require a supermajority to approve most major pieces of legislation.',
	ITEM_REF_TAB_T(),
	(SELECT REF(p) FROM section_table p WHERE id=2),
	IMAGE_REF_TAB_T((SELECT REF(d) FROM image_table d WHERE d.id=4), (SELECT REF(d) FROM image_table d WHERE d.id=6)),
	VIDEO_REF_TAB_T((SELECT REF(d) FROM video_table d WHERE d.id=2)),
	JOURNALIST_ROLE_TAB_T(JOURNALIST_ROLE_T((SELECT REF(d) FROM journalist_table d WHERE d.id=3), (SELECT REF(d) FROM role_table d WHERE d.id=1)))
);
INSERT INTO item_table VALUES (
	2,
	TO_TIMESTAMP('2017-04-26 20:30:00', 'YYYY-MM-DD HH24:MI:SS'),
	'Majority of Mélenchon supporters will not back Emmanuel Macron',
	'Poll suggests 65% of those who backed hard-left candidate will not vote for centrist fighting Marine Le Pen for French presidency',
	ITEM_REF_TAB_T(),
	(SELECT REF(p) FROM section_table p WHERE id=1),
	IMAGE_REF_TAB_T((SELECT REF(d) FROM image_table d WHERE d.id=7)),
	VIDEO_REF_TAB_T((SELECT REF(d) FROM video_table d WHERE d.id=3), (SELECT REF(d) FROM video_table d WHERE d.id=7)),
	JOURNALIST_ROLE_TAB_T(JOURNALIST_ROLE_T((SELECT REF(d) FROM journalist_table d WHERE d.id=6), (SELECT REF(d) FROM role_table d WHERE d.id=3)), JOURNALIST_ROLE_T((SELECT REF(d) FROM journalist_table d WHERE d.id=7), (SELECT REF(d) FROM role_table d WHERE d.id=5)))
);
INSERT INTO item_table VALUES (
	3,
	TO_TIMESTAMP('2017-02-18 14:20:00', 'YYYY-MM-DD HH24:MI:SS'),
	'Merkel presses Putin over anti-gay purge in Chechnya',
	'German chancellor raises reports of torture and persecution of gay men during joint press conference with Russian president',
	ITEM_REF_TAB_T(),
	(SELECT REF(p) FROM section_table p WHERE id=4),
	IMAGE_REF_TAB_T((SELECT REF(d) FROM image_table d WHERE d.id=1), (SELECT REF(d) FROM image_table d WHERE d.id=5)),
	VIDEO_REF_TAB_T((SELECT REF(d) FROM video_table d WHERE d.id=9), (SELECT REF(d) FROM video_table d WHERE d.id=1)),
	JOURNALIST_ROLE_TAB_T(JOURNALIST_ROLE_T((SELECT REF(d) FROM journalist_table d WHERE d.id=2), (SELECT REF(d) FROM role_table d WHERE d.id=5)))
);
INSERT INTO item_table VALUES (
	4,
	TO_TIMESTAMP('2017-02-11 17:15:00', 'YYYY-MM-DD HH24:MI:SS'),
	'"Exercise pill" could deliver benefits of fitness in tablet form',
	'Drug could transform lives of those who are unable to exercise because of obesity or serious physical disability, mouse study suggests',
	ITEM_REF_TAB_T(),
	(SELECT REF(p) FROM section_table p WHERE id=7),
	IMAGE_REF_TAB_T(),
	VIDEO_REF_TAB_T((SELECT REF(d) FROM video_table d WHERE d.id=6)),
	JOURNALIST_ROLE_TAB_T(JOURNALIST_ROLE_T((SELECT REF(d) FROM journalist_table d WHERE d.id=7), (SELECT REF(d) FROM role_table d WHERE d.id=1)))
);
INSERT INTO item_table VALUES (
	5,
	TO_TIMESTAMP('2017-02-09 09:50:00', 'YYYY-MM-DD HH24:MI:SS'),
	'FBI translator married Isis recruiter she was meant to be investigating',
	'Daniela Greene moved to Syria to be with her jihadi groom, a former German rapper, before realising she was involved "way over her head"',
	ITEM_REF_TAB_T(),
	(SELECT REF(p) FROM section_table p WHERE id=6),
	IMAGE_REF_TAB_T((SELECT REF(d) FROM image_table d WHERE d.id=2)),
	VIDEO_REF_TAB_T((SELECT REF(d) FROM video_table d WHERE d.id=5)),
	JOURNALIST_ROLE_TAB_T(JOURNALIST_ROLE_T((SELECT REF(d) FROM journalist_table d WHERE d.id=8), (SELECT REF(d) FROM role_table d WHERE d.id=2)))
);
INSERT INTO item_table VALUES (
	6,
	TO_TIMESTAMP('2017-02-03 08:35:00', 'YYYY-MM-DD HH24:MI:SS'),
	'May: Juncker will find me "bloody difficult woman" in Brexit talks',
	'Comment comes as cabinet source brands decision to leak details of PM’s dinner with European commission chief a "miscalculation"',
	ITEM_REF_TAB_T(),
	(SELECT REF(p) FROM section_table p WHERE id=7),
	IMAGE_REF_TAB_T(),
	VIDEO_REF_TAB_T(),
	JOURNALIST_ROLE_TAB_T(JOURNALIST_ROLE_T((SELECT REF(d) FROM journalist_table d WHERE d.id=8), (SELECT REF(d) FROM role_table d WHERE d.id=2)), JOURNALIST_ROLE_T((SELECT REF(d) FROM journalist_table d WHERE d.id=5), (SELECT REF(d) FROM role_table d WHERE d.id=6)))
);
INSERT INTO item_table VALUES (
	7,
	TO_TIMESTAMP('2017-01-28 12:25:00', 'YYYY-MM-DD HH24:MI:SS'),
	'Jaber Abdullah: how I set up a REFugee football team in Barnsley',
	'The Sudanese asylum seeker has created a 50-strong squad to help men stuck in immigration limbo in a town that has faced anti-immigration marches',
	ITEM_REF_TAB_T(),
	(SELECT REF(p) FROM section_table p WHERE id=9),
	IMAGE_REF_TAB_T((SELECT REF(d) FROM image_table d WHERE d.id=8)),
	VIDEO_REF_TAB_T((SELECT REF(d) FROM video_table d WHERE d.id=2)),
	JOURNALIST_ROLE_TAB_T(JOURNALIST_ROLE_T((SELECT REF(d) FROM journalist_table d WHERE d.id=2), (SELECT REF(d) FROM role_table d WHERE d.id=2)))
);
INSERT INTO item_table VALUES (
	8,
	TO_TIMESTAMP('2017-01-19 19:45:00', 'YYYY-MM-DD HH24:MI:SS'),
	'Erdoğan rejoins Turkey’s ruling party in wake of REFerendum on new powers',
	'President returns to Justice and Development party a fortnight after voters narrowly approved constitutional amendments',
	ITEM_REF_TAB_T(),
	(SELECT REF(p) FROM section_table p WHERE id=5),
	IMAGE_REF_TAB_T((SELECT REF(d) FROM image_table d WHERE d.id=3)),
	VIDEO_REF_TAB_T((SELECT REF(d) FROM video_table d WHERE d.id=8), (SELECT REF(d) FROM video_table d WHERE d.id=4)),
	JOURNALIST_ROLE_TAB_T(JOURNALIST_ROLE_T((SELECT REF(d) FROM journalist_table d WHERE d.id=3), (SELECT REF(d) FROM role_table d WHERE d.id=1)), JOURNALIST_ROLE_T((SELECT REF(d) FROM journalist_table d WHERE d.id=8), (SELECT REF(d) FROM role_table d WHERE d.id=3)))
);
INSERT INTO item_table VALUES (
	9,
	TO_TIMESTAMP('2017-01-03 21:05:00', 'YYYY-MM-DD HH24:MI:SS'),
	'"Oldest human" dies in Indonesia aged 146',
	'Indonesia says deceased man was born in December 1870, although his age was never verified',
	ITEM_REF_TAB_T(),
	(SELECT REF(p) FROM section_table p WHERE id=3),
	IMAGE_REF_TAB_T((SELECT REF(d) FROM image_table d WHERE d.id=9), (SELECT REF(d) FROM image_table d WHERE d.id=7)),
	VIDEO_REF_TAB_T(),
	JOURNALIST_ROLE_TAB_T(JOURNALIST_ROLE_T((SELECT REF(d) FROM journalist_table d WHERE d.id=5), (SELECT REF(d) FROM role_table d WHERE d.id=4)))
);


-- INSERTS NAS TABLEAS DE ITEMS RELACIONADOS EM CADA ITEM
-- ITEM 1
INSERT INTO table(SELECT s.related_items FROM item_table s WHERE s.id=1) 
(SELECT REF(d) FROM item_table d WHERE d.id=6);
INSERT INTO table(SELECT s.related_items FROM item_table s WHERE s.id=1) 
(SELECT REF(d) FROM item_table d WHERE d.id=2);
INSERT INTO table(SELECT s.related_items FROM item_table s WHERE s.id=1) 
(SELECT REF(d) FROM item_table d WHERE d.id=7);
-- ITEM 2
INSERT INTO table(SELECT s.related_items FROM item_table s WHERE s.id=2) 
(SELECT REF(d) FROM item_table d WHERE d.id=6);
INSERT INTO table(SELECT s.related_items FROM item_table s WHERE s.id=2) 
(SELECT REF(d) FROM item_table d WHERE d.id=2);
INSERT INTO table(SELECT s.related_items FROM item_table s WHERE s.id=2) 
(SELECT REF(d) FROM item_table d WHERE d.id=8);
INSERT INTO table(SELECT s.related_items FROM item_table s WHERE s.id=2) 
(SELECT REF(d) FROM item_table d WHERE d.id=1);
-- ITEM 3
INSERT INTO table(SELECT s.related_items FROM item_table s WHERE s.id=3) 
(SELECT REF(d) FROM item_table d WHERE d.id=2);
INSERT INTO table(SELECT s.related_items FROM item_table s WHERE s.id=3) 
(SELECT REF(d) FROM item_table d WHERE d.id=7);
INSERT INTO table(SELECT s.related_items FROM item_table s WHERE s.id=3) 
(SELECT REF(d) FROM item_table d WHERE d.id=4);
INSERT INTO table(SELECT s.related_items FROM item_table s WHERE s.id=3) 
(SELECT REF(d) FROM item_table d WHERE d.id=5);
-- ITEM 4
INSERT INTO table(SELECT s.related_items FROM item_table s WHERE s.id=4) 
(SELECT REF(d) FROM item_table d WHERE d.id=5);
INSERT INTO table(SELECT s.related_items FROM item_table s WHERE s.id=4) 
(SELECT REF(d) FROM item_table d WHERE d.id=9);
INSERT INTO table(SELECT s.related_items FROM item_table s WHERE s.id=4) 
(SELECT REF(d) FROM item_table d WHERE d.id=1);
-- ITEM 5
INSERT INTO table(SELECT s.related_items FROM item_table s WHERE s.id=5) 
(SELECT REF(d) FROM item_table d WHERE d.id=3);
INSERT INTO table(SELECT s.related_items FROM item_table s WHERE s.id=5) 
(SELECT REF(d) FROM item_table d WHERE d.id=8);
INSERT INTO table(SELECT s.related_items FROM item_table s WHERE s.id=5) 
(SELECT REF(d) FROM item_table d WHERE d.id=7);
INSERT INTO table(SELECT s.related_items FROM item_table s WHERE s.id=5) 
(SELECT REF(d) FROM item_table d WHERE d.id=1);
-- ITEM 6
INSERT INTO table(SELECT s.related_items FROM item_table s WHERE s.id=6) 
(SELECT REF(d) FROM item_table d WHERE d.id=1);
INSERT INTO table(SELECT s.related_items FROM item_table s WHERE s.id=6) 
(SELECT REF(d) FROM item_table d WHERE d.id=4);
INSERT INTO table(SELECT s.related_items FROM item_table s WHERE s.id=6) 
(SELECT REF(d) FROM item_table d WHERE d.id=2);
-- ITEM 7
INSERT INTO table(SELECT s.related_items FROM item_table s WHERE s.id=7) 
(SELECT REF(d) FROM item_table d WHERE d.id=9);
INSERT INTO table(SELECT s.related_items FROM item_table s WHERE s.id=7) 
(SELECT REF(d) FROM item_table d WHERE d.id=2);
INSERT INTO table(SELECT s.related_items FROM item_table s WHERE s.id=7) 
(SELECT REF(d) FROM item_table d WHERE d.id=6);
-- ITEM 8
INSERT INTO table(SELECT s.related_items FROM item_table s WHERE s.id=8) 
(SELECT REF(d) FROM item_table d WHERE d.id=2);
INSERT INTO table(SELECT s.related_items FROM item_table s WHERE s.id=8) 
(SELECT REF(d) FROM item_table d WHERE d.id=5);
INSERT INTO table(SELECT s.related_items FROM item_table s WHERE s.id=8) 
(SELECT REF(d) FROM item_table d WHERE d.id=1);
INSERT INTO table(SELECT s.related_items FROM item_table s WHERE s.id=8) 
(SELECT REF(d) FROM item_table d WHERE d.id=3);
INSERT INTO table(SELECT s.related_items FROM item_table s WHERE s.id=8) 
(SELECT REF(d) FROM item_table d WHERE d.id=9);
-- ITEM 9
INSERT INTO table(SELECT s.related_items FROM item_table s WHERE s.id=9) 
(SELECT REF(d) FROM item_table d WHERE d.id=1);
INSERT INTO table(SELECT s.related_items FROM item_table s WHERE s.id=9) 
(SELECT REF(d) FROM item_table d WHERE d.id=7);
INSERT INTO table(SELECT s.related_items FROM item_table s WHERE s.id=9) 
(SELECT REF(d) FROM item_table d WHERE d.id=5);


-- CLIENT
INSERT INTO client_table VALUES (
	1,
	'clarita12',
	TO_TIMESTAMP('2016-12-03 23:55:00', 'YYYY-MM-DD HH24:MI:SS'),
	TO_TIMESTAMP('2017-04-15 12:25:00', 'YYYY-MM-DD HH24:MI:SS'),
	13,
	DOWNLOADED_ITEM_TAB_T(DOWNLOADED_ITEM_T((SELECT REF(d) FROM item_table d WHERE d.id=5), TO_TIMESTAMP('2017-02-10 09:50:00', 'YYYY-MM-DD HH24:MI:SS')),
						  DOWNLOADED_ITEM_T((SELECT REF(d) FROM item_table d WHERE d.id=8), TO_TIMESTAMP('2017-01-20 19:45:00', 'YYYY-MM-DD HH24:MI:SS')),
						  DOWNLOADED_ITEM_T((SELECT REF(d) FROM item_table d WHERE d.id=1), TO_TIMESTAMP('2017-05-02 23:55:00', 'YYYY-MM-DD HH24:MI:SS'))),
	(SELECT REF(p) FROM country_table p WHERE p.id=3)
);
INSERT INTO client_table VALUES (
	2,
	'sialoquent74',
	TO_TIMESTAMP('2016-09-16 14:48:00', 'YYYY-MM-DD HH24:MI:SS'),
	TO_TIMESTAMP('2017-04-19 10:39:00', 'YYYY-MM-DD HH24:MI:SS'),
	4,
	DOWNLOADED_ITEM_TAB_T(DOWNLOADED_ITEM_T((SELECT REF(d) FROM item_table d WHERE d.id=3), TO_TIMESTAMP('2017-02-18 14:20:00', 'YYYY-MM-DD HH24:MI:SS')),
						  DOWNLOADED_ITEM_T((SELECT REF(d) FROM item_table d WHERE d.id=7), TO_TIMESTAMP('2017-01-28 12:25:00', 'YYYY-MM-DD HH24:MI:SS'))),
	(SELECT REF(p) FROM country_table p WHERE p.id=8)
);
INSERT INTO client_table VALUES (
	3,
	'lugubrious46',
	TO_TIMESTAMP('2016-08-31 06:37:00', 'YYYY-MM-DD HH24:MI:SS'),
	TO_TIMESTAMP('2017-04-12 19:28:00', 'YYYY-MM-DD HH24:MI:SS'),
	9,
	DOWNLOADED_ITEM_TAB_T(DOWNLOADED_ITEM_T((SELECT REF(d) FROM item_table d WHERE d.id=1), TO_TIMESTAMP('2017-05-03 10:35:00', 'YYYY-MM-DD HH24:MI:SS')),
						  DOWNLOADED_ITEM_T((SELECT REF(d) FROM item_table d WHERE d.id=6), TO_TIMESTAMP('2017-02-04 08:35:00', 'YYYY-MM-DD HH24:MI:SS')),
						  DOWNLOADED_ITEM_T((SELECT REF(d) FROM item_table d WHERE d.id=3), TO_TIMESTAMP('2017-02-19 14:20:00', 'YYYY-MM-DD HH24:MI:SS'))),
	(SELECT REF(p) FROM country_table p WHERE p.id=6)
);
INSERT INTO client_table VALUES (
	4,
	'filibuster89',
	TO_TIMESTAMP('2016-11-12 23:11:00', 'YYYY-MM-DD HH24:MI:SS'),
	TO_TIMESTAMP('2017-03-09 17:05:00', 'YYYY-MM-DD HH24:MI:SS'),
	14,
	DOWNLOADED_ITEM_TAB_T(DOWNLOADED_ITEM_T((SELECT REF(d) FROM item_table d WHERE d.id=4), TO_TIMESTAMP('2017-02-12 17:15:00', 'YYYY-MM-DD HH24:MI:SS')),
						  DOWNLOADED_ITEM_T((SELECT REF(d) FROM item_table d WHERE d.id=9), TO_TIMESTAMP('2017-01-04 21:05:00', 'YYYY-MM-DD HH24:MI:SS'))),
	(SELECT REF(p) FROM country_table p WHERE p.id=4)
);
INSERT INTO client_table VALUES (
	5,
	'ranivorous69',
	TO_TIMESTAMP('2016-03-05 21:58:00', 'YYYY-MM-DD HH24:MI:SS'),
	TO_TIMESTAMP('2017-04-20 15:05:00', 'YYYY-MM-DD HH24:MI:SS'),
	19,
	DOWNLOADED_ITEM_TAB_T(DOWNLOADED_ITEM_T((SELECT REF(d) FROM item_table d WHERE d.id=3), TO_TIMESTAMP('2017-02-20 14:20:00', 'YYYY-MM-DD HH24:MI:SS')),
						  DOWNLOADED_ITEM_T((SELECT REF(d) FROM item_table d WHERE d.id=7), TO_TIMESTAMP('2017-01-29 12:25:00', 'YYYY-MM-DD HH24:MI:SS')),
						  DOWNLOADED_ITEM_T((SELECT REF(d) FROM item_table d WHERE d.id=5), TO_TIMESTAMP('2017-02-11 09:50:00', 'YYYY-MM-DD HH24:MI:SS'))),
	(SELECT REF(p) FROM country_table p WHERE p.id=1)
);
INSERT INTO client_table VALUES (
	6,
	'nambypamby14',
	TO_TIMESTAMP('2016-05-19 18:29:00', 'YYYY-MM-DD HH24:MI:SS'),
	TO_TIMESTAMP('2017-04-25 11:43:00', 'YYYY-MM-DD HH24:MI:SS'),
	3,
	DOWNLOADED_ITEM_TAB_T(DOWNLOADED_ITEM_T((SELECT REF(d) FROM item_table d WHERE d.id=6), TO_TIMESTAMP('2017-02-05 08:35:00', 'YYYY-MM-DD HH24:MI:SS')),
						  DOWNLOADED_ITEM_T((SELECT REF(d) FROM item_table d WHERE d.id=2), TO_TIMESTAMP('2017-04-27 20:30:00', 'YYYY-MM-DD HH24:MI:SS'))),
	(SELECT REF(p) FROM country_table p WHERE p.id=9)
);
INSERT INTO client_table VALUES (
	7,
	'troglodyte36',
	TO_TIMESTAMP('2016-11-17 18:47:00', 'YYYY-MM-DD HH24:MI:SS'),
	TO_TIMESTAMP('2017-03-10 09:18:00', 'YYYY-MM-DD HH24:MI:SS'),
	7,
	DOWNLOADED_ITEM_TAB_T(DOWNLOADED_ITEM_T((SELECT REF(d) FROM item_table d WHERE d.id=5), TO_TIMESTAMP('2017-02-12 09:50:00', 'YYYY-MM-DD HH24:MI:SS')),
						  DOWNLOADED_ITEM_T((SELECT REF(d) FROM item_table d WHERE d.id=2), TO_TIMESTAMP('2017-04-28 20:30:00', 'YYYY-MM-DD HH24:MI:SS')),
						  DOWNLOADED_ITEM_T((SELECT REF(d) FROM item_table d WHERE d.id=8), TO_TIMESTAMP('2017-01-21 19:45:00', 'YYYY-MM-DD HH24:MI:SS'))),
	(SELECT REF(p) FROM country_table p WHERE p.id=8)
);
