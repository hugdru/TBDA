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
  name          NVARCHAR2(200)
);

ALTER TYPE ITEM_T ADD ATTRIBUTE (section REF SECTION_T ) CASCADE;

--------------------------------------------------------- IMAGE
CREATE TYPE IMAGE_T AS OBJECT (
  id            INTEGER,
  produced_date DATE,
  title         NVARCHAR2(300),
  file_size     NUMBER,
  url           NVARCHAR2(2083)
) NOT FINAL;

CREATE TYPE IMAGE_REF_T AS OBJECT (
  image REF IMAGE_T
);

CREATE TYPE IMAGE_REF_TAB AS TABLE OF IMAGE_REF_T;

ALTER TYPE ITEM_T ADD ATTRIBUTE (images IMAGE_REF_TAB ) CASCADE;

--------------------------------------------------------- CARTOON
-- Description: A subtype of image
CREATE TYPE CARTOON_T UNDER IMAGE_T();

--------------------------------------------------------- INFOGRAM
-- Description: A subtype of image
CREATE TYPE INFOGRAM_T UNDER IMAGE_T();

--------------------------------------------------------- PHOTO
-- Description: A subtype of image
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
  url           NVARCHAR2(2083)
);

CREATE TYPE VIDEO_REF_T AS OBJECT (
  video REF VIDEO_T
);

CREATE TYPE VIDEO_REF_TAB AS TABLE OF VIDEO_REF_T;

ALTER TYPE ITEM_T ADD ATTRIBUTE (videos VIDEO_REF_TAB ) CASCADE;

--------------------------------------------------------- JOURNALIST
CREATE TYPE JOURNALIST_T AS OBJECT (
  id                INTEGER,
  name              NVARCHAR2(250),
  professional_id   NCHAR(30)
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
  name         NVARCHAR2(500)
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
  name                 NVARCHAR2(200)
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
  download_date   DATE
);

CREATE TYPE ITEM_CLIENT_TAB AS TABLE OF ITEM_CLIENT_T;

ALTER TYPE CLIENT_T ADD ATTRIBUTE (downloaded_items ITEM_CLIENT_TAB ) CASCADE;

--------------------------------------------------------- COUNTRY
CREATE TYPE COUNTRY_T AS OBJECT (
  id                  INTEGER,
  name                NVARCHAR2(100)
);

ALTER TYPE PLACE_T ADD ATTRIBUTE (country REF COUNTRY_T ) CASCADE;
ALTER TYPE JOURNALIST_T ADD ATTRIBUTE (country REF COUNTRY_T ) CASCADE;
ALTER TYPE CLIENT_T ADD ATTRIBUTE (country REF COUNTRY_T ) CASCADE;

----------------------------------------------- TABLES -----------------------------------------------
CREATE TABLE item_table OF ITEM_T
  NESTED TABLE related_items STORE AS item_related_items_nt
  NESTED TABLE images STORE AS item_images_nt
  NESTED TABLE videos STORE AS item_videos_nt
  NESTED TABLE clients STORE AS item_clients_nt;

CREATE TABLE section_table OF SECTION_T;

CREATE TABLE image_table OF IMAGE_T;

CREATE TABLE cartoon_table OF CARTOON_T;

CREATE TABLE infogram_table OF INFOGRAM_T;

CREATE TABLE photo_table OF PHOTO_T;

CREATE TABLE video_table OF VIDEO_T;

CREATE TABLE journalist_table OF JOURNALIST_T;

CREATE TABLE place_table OF PLACE_T;

CREATE TABLE category_table OF CATEGORY_T;

CREATE TABLE client_table OF CLIENT_T
  NESTED TABLE downloaded_items STORE AS client_downloaded_items_nt;

CREATE TABLE country_table OF COUNTRY_T;
