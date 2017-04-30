--------------------------------------------------------- ITEM
CREATE TYPE ITEM_T AS OBJECT (
  id             INTEGER,
  published_date DATE,
  title          NVARCHAR2(400),
  text           CLOB
);

CREATE TYPE ITEM_REF_T AS OBJECT (
  item REF ITEM_T
);

CREATE TYPE ITEM_REF_TAB AS TABLE OF ITEM_REF_T;

ALTER TYPE ITEM_T ADD ATTRIBUTE (related_items ITEM_REF_TAB ) CASCADE;

--------------------------------------------------------- SECTION
CREATE TYPE SECTION_T AS OBJECT (
  id            INTEGER,
  name          NVARCHAR2(200),
  items_section ITEM_REF_TAB
);

ALTER TYPE ITEM_T ADD ATTRIBUTE (section REF SECTION_T ) CASCADE;

--------------------------------------------------------- IMAGE
CREATE TYPE IMAGE_T AS OBJECT (
  id            INTEGER,
  produced_date DATE,
  title         NVARCHAR2(300),
  file_size     NUMBER,
  url           NVARCHAR2(2083),
  items_image   ITEM_REF_TAB
) NOT FINAL;

CREATE TYPE IMAGE_REF_T AS OBJECT (
  image REF IMAGE_T
);

CREATE TYPE IMAGE_REF_TAB AS TABLE OF IMAGE_REF_T;

ALTER TYPE ITEM_T ADD ATTRIBUTE (images_item IMAGE_REF_TAB ) CASCADE;

--------------------------------------------------------- CARTOON
CREATE TYPE CARTOON_T UNDER IMAGE_T();

--------------------------------------------------------- INFOGRAM
CREATE TYPE INFOGRAM_T UNDER IMAGE_T();

--------------------------------------------------------- PHOTO
CREATE TYPE PHOTO_T UNDER IMAGE_T();

CREATE TYPE PHOTO_REF_T AS OBJECT (
  photo REF PHOTO_T
);

CREATE TYPE PHOTO_REF_TAB AS TABLE OF PHOTO_REF_T;

--------------------------------------------------------- VIDEO
CREATE TYPE VIDEO_T AS OBJECT (
  id            INTEGER,
  recorded_date DATE,
  title         NVARCHAR2(200),
  duration      NUMBER,
  url           NVARCHAR2(2083),
  items_video   ITEM_REF_TAB
);

CREATE TYPE VIDEO_REF_T AS OBJECT (
  video REF VIDEO_T
);

CREATE TYPE VIDEO_REF_TAB AS TABLE OF VIDEO_REF_T;

ALTER TYPE ITEM_T ADD ATTRIBUTE (videos_item VIDEO_REF_TAB ) CASCADE;

--------------------------------------------------------- JOURNALIST
CREATE TYPE JOURNALIST_T AS OBJECT (
  id                INTEGER,
  name              NVARCHAR2(250),
  professional_id   NCHAR(30),
  images_journalist IMAGE_REF_TAB,
  videos_journalist VIDEO_REF_TAB
);

CREATE TYPE JOURNALIST_REF_T AS OBJECT (
  journalist REF JOURNALIST_T
);

CREATE TYPE JOURNALIST_REF_TAB AS TABLE OF JOURNALIST_REF_T;

ALTER TYPE IMAGE_T ADD ATTRIBUTE (journalist REF JOURNALIST_T ) CASCADE;

ALTER TYPE VIDEO_T ADD ATTRIBUTE (journalist REF JOURNALIST_T ) CASCADE;

--------------------------------------------------------- PLACE
CREATE TYPE PLACE_T AS OBJECT (
  id           INTEGER,
  city         NVARCHAR2(300),
  name         NVARCHAR2(500),
  videos_place VIDEO_REF_TAB,
  photos_place PHOTO_REF_TAB
);

CREATE TYPE PLACE_REF_T AS OBJECT (
  place REF PLACE_T
);

CREATE TYPE PLACE_REF_TAB AS TABLE OF PLACE_REF_T;

ALTER TYPE VIDEO_T ADD ATTRIBUTE (place REF PLACE_T ) CASCADE;

ALTER TYPE PHOTO_T ADD ATTRIBUTE (place REF PLACE_T ) CASCADE;

--------------------------------------------------------- CATEGORY
CREATE TYPE CATEGORY_T AS OBJECT (
  id                   INTEGER,
  name                 NVARCHAR2(200),
  journalists_category JOURNALIST_REF_TAB
);

ALTER TYPE JOURNALIST_T ADD ATTRIBUTE (category REF CATEGORY_T ) CASCADE;

--------------------------------------------------------- client
CREATE TYPE CLIENT_T AS OBJECT (
  id           INTEGER,
  username     NVARCHAR2(100),
  joining_date DATE,
  paid_date    DATE,
  item_counter INTEGER
);

CREATE TYPE CLIENT_REF_T AS OBJECT (
  client REF CLIENT_T
);

CREATE TYPE CLIENT_REF_TAB AS TABLE OF CLIENT_REF_T;

--------------------------------------------------------- ITEM_client
CREATE TYPE ITEM_CLIENT_T AS OBJECT (
  downloaded_item REF ITEM_T,
  client          REF CLIENT_T,
  download_date   DATE
);

CREATE TYPE ITEM_CLIENT_REF_T AS OBJECT (
  item_client REF ITEM_CLIENT_T
);

CREATE TYPE ITEM_CLIENT_REF_TAB AS TABLE OF ITEM_CLIENT_REF_T;

ALTER TYPE ITEM_T ADD ATTRIBUTE (clients_item ITEM_CLIENT_REF_TAB ) CASCADE;

ALTER TYPE CLIENT_T ADD ATTRIBUTE (items_client ITEM_CLIENT_REF_TAB ) CASCADE;

--------------------------------------------------------- COUNTRY
CREATE TYPE COUNTRY_T AS OBJECT (
  id                  INTEGER,
  name                NVARCHAR2(100),
  places_country      PLACE_REF_TAB,
  journalists_country JOURNALIST_REF_TAB,
  clients_country     CLIENT_REF_TAB
);

ALTER TYPE PLACE_T ADD ATTRIBUTE (country REF COUNTRY_T ) CASCADE;

ALTER TYPE JOURNALIST_T ADD ATTRIBUTE (country REF COUNTRY_T ) CASCADE;

ALTER TYPE CLIENT_T ADD ATTRIBUTE (country REF COUNTRY_T ) CASCADE;

----------------------------------------------- TABLES -----------------------------------------------
CREATE TABLE item_table OF ITEM_T
  NESTED TABLE related_items STORE AS related_itens_nt
  NESTED TABLE images_item STORE AS images_item_nt
  NESTED TABLE videos_item STORE AS videos_item_nt
  NESTED TABLE clients_item STORE AS clients_item_nt;

CREATE TABLE section_table OF SECTION_T
  NESTED TABLE items_section STORE AS itens_section_nt;

CREATE TABLE image_table OF IMAGE_T
  NESTED TABLE items_image STORE AS itens_image_nt;

CREATE TABLE cartoon_table OF CARTOON_T;

CREATE TABLE infogram_table OF INFORGRAM_T;

CREATE TABLE photo_table OF PHOTO_T;

CREATE TABLE video_table OF VIDEO_T
  NESTED TABLE items_video STORE AS itens_video_nt;

CREATE TABLE journalist_table OF JOURNALIST_T
  NESTED TABLE images_journalist STORE AS images_journalist_nt
  NESTED TABLE videos_journalist STORE AS videos_journalist_nt;

CREATE TABLE place_table OF PLACE_T
  NESTED TABLE videos_place STORE AS videos_place_nt
  NESTED TABLE photos_place STORE AS photos_place_nt;

CREATE TABLE category_table OF CATEGORY_T
  NESTED TABLE journalists_category STORE AS journalist_category_nt;

CREATE TABLE client_table OF CLIENT_T
  NESTED TABLE items_client STORE AS itens_client_nt;

CREATE TABLE item_client_table OF ITEM_CLIENT_T
  NESTED TABLE journalists_category STORE AS journalist_category_nt;

CREATE TABLE country_table OF COUNTRY_T
  NESTED TABLE places_country STORE AS places_country_nt
  NESTED TABLE journalists_country STORE AS journalists_country_nt
  NESTED TABLE clients_country STORE AS clients_country_nt;


