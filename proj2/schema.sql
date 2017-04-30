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



--------------------------------------------------------- JOURNALIST
CREATE TYPE journalist_t AS OBJECT(
	id INTEGER,
	name NVARCHAR2(250),
	professional_id NCHAR(30),
	images_journalist image_tab_refs
);

CREATE TYPE journalist_refs AS OBJECT(
	journalist REF journalist_t
);

CREATE TYPE journalist_tab_refs AS TABLE OF journalist_refs;

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
	photos photo_tab_refs
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
	journalist journalist_tab_refs
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

ALTER TYPE item_t ADD ATTRIBUTE (users item_user_tab_refs) CASCADE;

ALTER TYPE user_t ADD ATTRIBUTE (itens item_user_tab_refs) CASCADE;



--------------------------------------------------------- COUNTRY
CREATE TYPE country_t AS OBJECT(
	id INTEGER,
	name NVARCHAR2(100),
	places place_tab_refs,
	journalists journalist_tab_refs,
	users user_tab_refs
);

ALTER TYPE place_t ADD ATTRIBUTE (country REF country_t) CASCADE;

ALTER TYPE journalist_t ADD ATTRIBUTE (country REF country_t) CASCADE;

ALTER TYPE user_t ADD ATTRIBUTE (country REF country_t) CASCADE;




----------------------------------------------- TABELAS -----------------------------------------------

CREATE TABLE image_tabela OF image_t
	NESTED TABLE itens_image STORE AS itens_image_nt;

CREATE TABLE section_tabela OF section_t
	NESTED TABLE itens_section STORE AS itens_section_nt;

CREATE TABLE item_tabela OF item_t
	NESTED TABLE related_itens STORE AS related_itens_nt;