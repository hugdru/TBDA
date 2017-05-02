--------------------------------------------------------- ITEM
CREATE TYPE ITEM_T AS OBJECT (
  id             INTEGER,
  published_date TIMESTAMP,
  title          NVARCHAR2(400),
  text           CLOB
);

CREATE TYPE ITEM_REF_TAB_T AS TABLE OF REF ITEM_T;

ALTER TYPE ITEM_T ADD ATTRIBUTE (related_items ITEM_REF_TAB_T ) CASCADE;

--------------------------------------------------------- SECTION
CREATE TYPE SECTION_T AS OBJECT (
  id   INTEGER,
  name NVARCHAR2(200)
);

ALTER TYPE ITEM_T ADD ATTRIBUTE (section REF SECTION_T ) CASCADE;

--------------------------------------------------------- IMAGE
CREATE TYPE IMAGE_T AS OBJECT (
  id            INTEGER,
  produced_date TIMESTAMP,
  title         NVARCHAR2(300),
  file_size     NUMBER,
  url           URITYPE
) NOT FINAL;

CREATE TYPE IMAGE_REF_TAB_T AS TABLE OF REF IMAGE_T;

ALTER TYPE ITEM_T ADD ATTRIBUTE (images IMAGE_REF_TAB_T ) CASCADE;

--------------------------------------------------------- CARTOON
CREATE TYPE CARTOON_T UNDER IMAGE_T();

--------------------------------------------------------- INFOGRAM
CREATE TYPE INFOGRAM_T UNDER IMAGE_T();

--------------------------------------------------------- PHOTO
CREATE TYPE PHOTO_T UNDER IMAGE_T();

--------------------------------------------------------- VIDEO
CREATE TYPE VIDEO_T AS OBJECT (
  id            INTEGER,
  recorded_date TIMESTAMP,
  title         NVARCHAR2(200),
  duration      NUMBER,
  url           URITYPE
);

CREATE TYPE VIDEO_REF_TAB_T AS TABLE OF REF VIDEO_T;

ALTER TYPE ITEM_T ADD ATTRIBUTE (videos VIDEO_REF_TAB_T ) CASCADE;

--------------------------------------------------------- JOURNALIST
CREATE TYPE JOURNALIST_T AS OBJECT (
  id              INTEGER,
  name            NVARCHAR2(250),
  professional_id NCHAR(30)
);

ALTER TYPE IMAGE_T ADD ATTRIBUTE (journalist REF JOURNALIST_T ) CASCADE;
ALTER TYPE VIDEO_T ADD ATTRIBUTE (journalist REF JOURNALIST_T ) CASCADE;

--------------------------------------------------------- PLACE
CREATE TYPE PLACE_T AS OBJECT (
  id   INTEGER,
  city NVARCHAR2(300),
  name NVARCHAR2(500)
);

ALTER TYPE VIDEO_T ADD ATTRIBUTE (place REF PLACE_T ) CASCADE;
ALTER TYPE PHOTO_T ADD ATTRIBUTE (place REF PLACE_T ) CASCADE;

--------------------------------------------------------- CATEGORY
CREATE TYPE CATEGORY_T AS OBJECT (
  id   INTEGER,
  name NVARCHAR2(200)
);

ALTER TYPE JOURNALIST_T ADD ATTRIBUTE (category REF CATEGORY_T ) CASCADE;

--------------------------------------------------------- ROLE
CREATE TYPE ROLE_T AS OBJECT (
  id   INTEGER,
  name NVARCHAR2(300)
);

CREATE TYPE JOURNALIST_ROLE_T AS OBJECT (
  journalist      REF JOURNALIST_T,
  journalist_role REF ROLE_T
);

CREATE TYPE JOURNALIST_ROLE_TAB_T AS TABLE OF JOURNALIST_ROLE_T;

ALTER TYPE ITEM_T ADD ATTRIBUTE (journalist_role_set JOURNALIST_ROLE_TAB_T ) CASCADE;

--------------------------------------------------------- CLIENT
CREATE TYPE CLIENT_T AS OBJECT (
  id           INTEGER,
  username     NVARCHAR2(100),
  joining_date TIMESTAMP,
  paid_date    TIMESTAMP,
  item_counter INTEGER
);

--------------------------------------------------------- DOWNLOADED_ITEM
CREATE TYPE DOWNLOADED_ITEM_T AS OBJECT (
  downloaded_item REF ITEM_T,
  download_date   TIMESTAMP
);

CREATE TYPE DOWNLOADED_ITEM_TAB_T AS TABLE OF DOWNLOADED_ITEM_T;

ALTER TYPE CLIENT_T ADD ATTRIBUTE (downloaded_items DOWNLOADED_ITEM_TAB_T ) CASCADE;

--------------------------------------------------------- COUNTRY
CREATE TYPE COUNTRY_T AS OBJECT (
  id   INTEGER,
  name NVARCHAR2(100)
);

ALTER TYPE PLACE_T ADD ATTRIBUTE (country REF COUNTRY_T ) CASCADE;
ALTER TYPE JOURNALIST_T ADD ATTRIBUTE (country REF COUNTRY_T ) CASCADE;
ALTER TYPE CLIENT_T ADD ATTRIBUTE (country REF COUNTRY_T ) CASCADE;

----------------------------------------------- TABLES -----------------------------------------------
CREATE TABLE item_table OF ITEM_T
  NESTED TABLE related_items STORE AS item_related_items_nt
  NESTED TABLE images STORE AS item_images_nt
  NESTED TABLE videos STORE AS item_videos_nt
  NESTED TABLE journalist_role_set STORE AS item_journalist_role_set_nt;

CREATE TABLE section_table OF SECTION_T;

CREATE TABLE image_table OF IMAGE_T;

CREATE TABLE video_table OF VIDEO_T;

CREATE TABLE journalist_table OF JOURNALIST_T;

CREATE TABLE category_table OF CATEGORY_T;

CREATE TABLE place_table OF PLACE_T;

CREATE TABLE country_table OF COUNTRY_T;

CREATE TABLE role_table OF ROLE_T;

CREATE TABLE client_table OF CLIENT_T
  NESTED TABLE downloaded_items STORE AS client_downloaded_items_nt;