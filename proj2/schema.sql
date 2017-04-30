--------------------------------------------------------- ITEM
CREATE TYPE item_t AS OBJECT(
  id INTEGER,
  published_date DATE,
  title NVARCHAR2(400),
  text CLOB
);

CREATE TYPE item_ref_t AS OBJECT(
  item REF item_t
);

CREATE TYPE item_ref_tab AS TABLE OF item_ref_t;

ALTER TYPE item_t ADD ATTRIBUTE (related_items item_ref_tab) CASCADE;



--------------------------------------------------------- SECTION
CREATE TYPE section_t AS OBJECT(
  id INTEGER,
  name NVARCHAR2(200),
  items_section item_ref_tab
);

ALTER TYPE item_t ADD ATTRIBUTE (section REF section_t) CASCADE;



--------------------------------------------------------- IMAGE
CREATE TYPE image_t AS OBJECT(
  id INTEGER,
  produced_date DATE,
  title NVARCHAR2(300),
  file_size NUMBER,
  url NVARCHAR2(2083),
  items_image item_ref_tab
) NOT FINAL;

CREATE TYPE image_ref_t AS OBJECT(
  image REF image_t
);

CREATE TYPE image_ref_tab AS TABLE OF image_ref_t;

ALTER TYPE item_t ADD ATTRIBUTE (images_item image_ref_tab) CASCADE;



--------------------------------------------------------- CARTOON
CREATE TYPE cartoon_t UNDER image_t();



--------------------------------------------------------- INFOGRAM
CREATE TYPE infogram_t UNDER image_t();



--------------------------------------------------------- PHOTO
CREATE TYPE photo_t UNDER image_t();

CREATE TYPE photo_ref_t AS OBJECT(
  photo REF photo_t
);

CREATE TYPE photo_ref_tab AS TABLE OF photo_ref_t;



--------------------------------------------------------- VIDEO
CREATE TYPE video_t AS OBJECT(
  id INTEGER,
  recorded_date DATE,
  title NVARCHAR2(200),
  duration NUMBER,
  url NVARCHAR2(2083),
  items_video item_ref_tab
);

CREATE TYPE video_ref_t AS OBJECT(
  video REF video_t
);

CREATE TYPE video_ref_tab AS TABLE OF video_ref_t;

ALTER TYPE item_t ADD ATTRIBUTE (videos_item video_ref_tab) CASCADE;



--------------------------------------------------------- JOURNALIST
CREATE TYPE journalist_t AS OBJECT(
  id INTEGER,
  name NVARCHAR2(250),
  professional_id NCHAR(30),
  images_journalist image_ref_tab,
  videos_journalist video_ref_tab
);

CREATE TYPE journalist_ref_t AS OBJECT(
  journalist REF journalist_t
);

CREATE TYPE journalist_ref_tab AS TABLE OF journalist_ref_t;

ALTER TYPE image_t ADD ATTRIBUTE (journalist REF journalist_t) CASCADE;

ALTER TYPE video_t ADD ATTRIBUTE (journalist REF journalist_t) CASCADE;



--------------------------------------------------------- PLACE
CREATE TYPE place_t AS OBJECT(
  id INTEGER,
  city NVARCHAR2(300),
  name NVARCHAR2(500),
  videos_place video_ref_tab
  photos_place photo_ref_tab
);

CREATE TYPE place_ref_t AS OBJECT(
  place REF place_t
);

CREATE TYPE place_ref_tab AS TABLE OF place_ref_t;

ALTER TYPE video_t ADD ATTRIBUTE (place REF place_t) CASCADE;

ALTER TYPE photo_t ADD ATTRIBUTE (place REF place_t) CASCADE;



--------------------------------------------------------- CATEGORY
CREATE TYPE category_t AS OBJECT(
  id INTEGER,
  name NVARCHAR2(200),
  journalists_category journalist_ref_tab
);

ALTER TYPE journalist_t ADD ATTRIBUTE (category REF category_t) CASCADE;



--------------------------------------------------------- client
CREATE TYPE client_t AS OBJECT(
  id INTEGER,
  username NVARCHAR2(100),
  joining_date DATE,
  paid_date DATE,
  item_counter INTEGER
);

CREATE TYPE client_ref_t AS OBJECT(
  client REF client_t
);

CREATE TYPE client_ref_tab AS TABLE OF client_ref_t;



--------------------------------------------------------- ITEM_client
CREATE TYPE item_client_t AS OBJECT(
  downloaded_item REF item_t,
  client REF client_t,
  download_date DATE
);

CREATE TYPE item_client_ref_t AS OBJECT(
  item_client REF item_client_t
);

CREATE TYPE item_client_ref_tab AS TABLE OF item_client_ref_t;

ALTER TYPE item_t ADD ATTRIBUTE (clients_item item_client_ref_tab) CASCADE;

ALTER TYPE client_t ADD ATTRIBUTE (items_client item_client_ref_tab) CASCADE;



--------------------------------------------------------- COUNTRY
CREATE TYPE country_t AS OBJECT(
  id INTEGER,
  name NVARCHAR2(100),
  places_country place_ref_tab,
  journalists_country journalist_ref_tab,
  clients_country client_ref_tab
);

ALTER TYPE place_t ADD ATTRIBUTE (country REF country_t) CASCADE;

ALTER TYPE journalist_t ADD ATTRIBUTE (country REF country_t) CASCADE;

ALTER TYPE client_t ADD ATTRIBUTE (country REF country_t) CASCADE;



----------------------------------------------- TABLES -----------------------------------------------
CREATE TABLE item_table OF item_t
  NESTED TABLE related_items STORE AS related_itens_nt
  NESTED TABLE images_item STORE AS images_item_nt
  NESTED TABLE videos_item STORE AS videos_item_nt
  NESTED TABLE clients_item STORE AS clients_item_nt;

CREATE TABLE section_table OF section_t
  NESTED TABLE items_section STORE AS itens_section_nt;

CREATE TABLE image_table OF image_t
  NESTED TABLE items_image STORE AS itens_image_nt;

CREATE TABLE cartoon_table OF cartoon_t;

CREATE TABLE infogram_table OF inforgram_t;

CREATE TABLE photo_table OF photo_t;

CREATE TABLE video_table OF video_t
  NESTED TABLE items_video STORE AS itens_video_nt;

CREATE TABLE journalist_table OF journalist_t
  NESTED TABLE images_journalist STORE AS images_journalist_nt
  NESTED TABLE videos_journalist STORE AS videos_journalist_nt;

CREATE TABLE place_table OF place_t
  NESTED TABLE videos_place STORE AS videos_place_nt
  NESTED TABLE photos_place STORE AS photos_place_nt;

CREATE TABLE category_table OF category_t
  NESTED TABLE journalists_category STORE AS journalist_category_nt;

CREATE TABLE client_table OF client_t
  NESTED TABLE items_client STORE AS itens_client_nt;

CREATE TABLE item_client_table OF item_client_t
  NESTED TABLE journalists_category STORE AS journalist_category_nt;

CREATE TABLE country_table OF country_t
  NESTED TABLE places_country STORE AS places_country_nt
  NESTED TABLE journalists_country STORE AS journalists_country_nt
  NESTED TABLE clients_country STORE AS clients_country_nt;


