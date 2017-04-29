----------------------------------------------- ITEM
CREATE TYPE item_t AS OBJECT(
	id bigint,
	published_date date,
	title nvarchar(400),
	text nvarchar(max),
);

CREATE TABLE item OF item_t;

CREATE TYPE item_refs AS OBJECT(
	item REF item_t
);

CREATE TYPE item_tab_refs AS TABLE OF item_refs;

----------------------------------------------- RELATED_ITEM
CREATE TYPE related_item_t AS OBJECT(
	item REF item_t,
	related_itens item_tab_refs
);

----------------------------------------------- SECTION
CREATE TYPE section_t AS OBJECT(
	id bigint,
	name nvarchar(200),
	itens item_tab_refs
);

CREATE TABLE section OF section_t
	NESTED TABLE itens STORE AS itens_nt;


----------------------------------------------- USER
CREATE TYPE user_t AS OBJECT(
	id bigint,
	username nvarchar(100),
	joining_date date,
	paid_date date,
	item_counter int,
	country REF country_t
);

CREATE TYPE user_tab AS TABLE OF user_t;


----------------------------------------------- COUNTRY
CREATE TYPE country_t AS OBJECT(
	id bigint,
	name nvarchar(100),
);

CREATE TYPE country_tab AS TABLE OF country_t;

CREATE TABLE country of country_t
	NESTED TABLE users STORE AS users_nt;