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
) NOT FINAL;

CREATE TYPE image_refs AS OBJECT(
	image REF image_t
);

CREATE TYPE image_tab_refs AS TABLE OF image_refs;

ALTER TYPE item_t ADD ATTRIBUTE (images_item image_tab_refs) CASCADE;



--------------------------------------------------------- CARTOON
CREATE TYPE cartoon_t UNDER image_t();



--------------------------------------------------------- INFOGRAM
CREATE TYPE infogram_t UNDER image_t();



--------------------------------------------------------- PHOTO
CREATE TYPE photo_t UNDER image_t();

CREATE TYPE photo_refs AS OBJECT(
	photo REF photo_t
);

CREATE TYPE photo_tab_refs AS TABLE OF photo_refs;



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

ALTER TYPE item_t ADD ATTRIBUTE (videos_item video_tab_refs) CASCADE;



--------------------------------------------------------- JOURNALIST
CREATE TYPE journalist_t AS OBJECT(
	id INTEGER,
	name NVARCHAR2(250),
	professional_id NCHAR(30),
	images_journalist image_tab_refs,
	videos_journalist video_tab_refs
);

CREATE TYPE journalist_refs AS OBJECT(
	journalist REF journalist_t
);

CREATE TYPE journalist_tab_refs AS TABLE OF journalist_refs;

ALTER TYPE image_t ADD ATTRIBUTE (journalist REF journalist_t) CASCADE;

ALTER TYPE video_t ADD ATTRIBUTE (journalist REF journalist_t) CASCADE;



--------------------------------------------------------- PLACE
CREATE TYPE place_t AS OBJECT(
	id INTEGER,
	city NVARCHAR2(300),
	name NVARCHAR2(500),
	videos_place video_tab_refs
	photos_place photo_tab_refs
);

CREATE TYPE place_refs AS OBJECT(
	place REF place_t
);

CREATE TYPE place_tab_refs AS TABLE OF place_refs;

ALTER TYPE video_t ADD ATTRIBUTE (place REF place_t) CASCADE;

ALTER TYPE photo_t ADD ATTRIBUTE (place REF place_t) CASCADE;



--------------------------------------------------------- CATEGORY
CREATE TYPE category_t AS OBJECT(
	id INTEGER,
	name NVARCHAR2(200),
	journalist_category journalist_tab_refs
);

ALTER TYPE journalist_t ADD ATTRIBUTE (category REF category_t) CASCADE;



--------------------------------------------------------- USER
CREATE TYPE user_t AS OBJECT(
	id INTEGER,
	username NVARCHAR2(100),
	joining_date DATE,
	paid_date DATE,
	item_counter INTEGER
);

CREATE TYPE user_refs AS OBJECT(
	user REF user_t
);

CREATE TYPE user_tab_refs AS TABLE OF user_refs;



--------------------------------------------------------- ITEM_USER
CREATE TYPE item_user_t AS OBJECT(
	downloaded_item REF item_t,
	user REF user_t,
	download_date DATE
);

CREATE TYPE item_user_refs AS OBJECT(
	item_user REF item_user_t
);

CREATE TYPE item_user_tab_refs AS TABLE OF item_user_refs;

ALTER TYPE item_t ADD ATTRIBUTE (users_item item_user_tab_refs) CASCADE;

ALTER TYPE user_t ADD ATTRIBUTE (itens_user item_user_tab_refs) CASCADE;



--------------------------------------------------------- COUNTRY
CREATE TYPE country_t AS OBJECT(
	id INTEGER,
	name NVARCHAR2(100),
	places_country place_tab_refs,
	journalists_country journalist_tab_refs,
	users_country user_tab_refs
);

ALTER TYPE place_t ADD ATTRIBUTE (country REF country_t) CASCADE;

ALTER TYPE journalist_t ADD ATTRIBUTE (country REF country_t) CASCADE;

ALTER TYPE user_t ADD ATTRIBUTE (country REF country_t) CASCADE;




----------------------------------------------- TABELAS -----------------------------------------------
CREATE TABLE item_tabela OF item_t
	NESTED TABLE related_itens STORE AS related_itens_nt
	NESTED TABLE images_item STORE AS images_item_nt
	NESTED TABLE videos_item STORE AS videos_item_nt
	NESTED TABLE users_item STORE AS users_item_nt;

CREATE TABLE section_tabela OF section_t
	NESTED TABLE itens_section STORE AS itens_section_nt;

CREATE TABLE image_tabela OF image_t
	NESTED TABLE itens_image STORE AS itens_image_nt;

CREATE TABLE cartoon_tabela OF cartoon_t;

CREATE TABLE infogram_tabela OF inforgram_t;

CREATE TABLE photo_tabela OF photo_t;

CREATE TABLE video_tabela OF video_t
	NESTED TABLE itens_video STORE AS itens_video_nt;

CREATE TABLE journalist_tabela OF journalist_t
	NESTED TABLE images_journalist STORE AS images_journalist_nt
	NESTED TABLE videos_journalist STORE AS videos_journalist_nt;

CREATE TABLE place_tabela OF place_t
	NESTED TABLE videos_place STORE AS videos_place_nt
	NESTED TABLE photos_place STORE AS photos_place_nt;

CREATE TABLE category_tabela OF category_t
	NESTED TABLE journalist_category STORE AS journalist_category_nt;

CREATE TABLE user_tabela OF user_t
	NESTED TABLE itens_user STORE AS itens_user_nt;

CREATE TABLE item_user_tabela OF item_user_t
	NESTED TABLE journalist_category STORE AS journalist_category_nt;

CREATE TABLE country_tabela OF country_t
	NESTED TABLE places_country STORE AS places_country_nt
	NESTED TABLE journalists_country STORE AS journalists_country_nt
	NESTED TABLE users_country STORE AS users_country_nt;

	