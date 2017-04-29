--------------------------------------------------------- ITEM
CREATE TYPE item_t AS OBJECT(
	id INTEGER,
	published_date DATE,
	title NVARCHAR2(400),
	text CLOB
);

CREATE TYPE item_refs AS OBJECT(
	item REF item_t
);

CREATE TYPE item_tab_refs AS TABLE OF item_refs;

ALTER TYPE item_t ADD ATTRIBUTE (related_itens item_tab_refs) CASCADE;


--------------------------------------------------------- SECTION
CREATE TYPE section_t AS OBJECT(
	id INTEGER,
	name NVARCHAR2(200),
	itens_section item_tab_refs
);

ALTER TYPE item_t ADD ATTRIBUTE (section REF section_t) CASCADE;


--------------------------------------------------------- IMAGE
CREATE TYPE image_t AS OBJECT(
	id INTEGER,
	produced_date DATE,
	title NVARCHAR2(300),
	file_size NUMBER,
	url NVARCHAR2(2083),
	itens_image item_tab_refs
);

CREATE TYPE image_refs AS OBJECT(
	image REF image_t
);

CREATE TYPE image_tab_refs AS TABLE OF image_refs;

ALTER TYPE item_t ADD ATTRIBUTE (images_item image_tab_refs) CASCADE;


--------------------------------------------------------- JOURNALIST
CREATE TYPE journalist_t AS OBJECT(
	id INTEGER,
	name NVARCHAR2(250),
	professional_id NCHAR(30),
	images_journalist image_tab_refs
);

ALTER TYPE image_t ADD ATTRIBUTE (journalist REF journalist_t) CASCADE;



--------------------------------------------------------- VIDEO
CREATE TYPE video_t AS OBJECT(
	id INTEGER,
	recorded_date DATE,
	title NVARCHAR2(200),
	duration NUMBER,
	url NVARCHAR2(2083),
	itens_video item_tab_refs
);

CREATE TYPE video_refs AS OBJECT(
	video REF video_t
);

CREATE TYPE video_tab_refs AS TABLE OF video_refs;

ALTER TYPE item_t ADD ATTRIBUTE (videos video_tab_refs) CASCADE;


--------------------------------------------------------- PLACE
CREATE TYPE place_t AS OBJECT(
	id INTEGER,
	city NVARCHAR2(300),
	name NVARCHAR2(500),
	videos_place video_tab_refs
);

ALTER TYPE video_t ADD ATTRIBUTE (place REF place_t) CASCADE;



----------------------------------------------- USER
/*CREATE TYPE user_t AS OBJECT(
	id INTEGER,
	username NVARCHAR2(100),
	joining_date DATE,
	paid_date DATE,
	item_counter INTEGER,
	country REF country_t
);

CREATE TYPE user_tab AS TABLE OF user_t;


----------------------------------------------- COUNTRY
CREATE TYPE country_t AS OBJECT(
	id INTEGER,
	name NVARCHAR2(100),
);

CREATE TYPE country_tab AS TABLE OF country_t;

CREATE TABLE country of country_t
	NESTED TABLE users STORE AS users_nt;

*/



----------------------------------------------- TABELAS -----------------------------------------------

CREATE TABLE image_tabela OF image_t
	NESTED TABLE itens_image STORE AS itens_image_nt;

CREATE TABLE section_tabela OF section_t
	NESTED TABLE itens_section STORE AS itens_section_nt;

CREATE TABLE item_tabela OF item_t
	NESTED TABLE related_itens STORE AS related_itens_nt;