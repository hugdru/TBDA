-- tipo objeto item
CREATE TYPE item_t AS OBJECT(
	id bigint,
	published_date date,
	title nvarchar(400),
	text nvarchar(max),
);

-- tipo tabela item para ser usado em section
CREATE TYPE item_tab AS TABLE OF item_t;

-- tabela de itens, onde se faz inserção de dados
CREATE TABLE item OF item_t;

-- tipo objeto section
CREATE TYPE section_t AS OBJECT(
	id bigint,
	name nvarchar(200),
	itens item_tab
);

-- tabela de itens, onde se faz inserção de dados
CREATE TABLE section OF section_t
	NESTED TABLE itens STORE AS itens_nt;

-- 
CREATE TYPE user_t AS OBJECT(
	id bigint,
	username nvarchar(100),
	joining_date date,
	paid_date date,
	item_counter int,
	country REF country_t
);

CREATE TYPE user_tab AS TABLE OF user_t;

CREATE TYPE country_t AS OBJECT(
	id bigint,
	name nvarchar(100),
);

CREATE TYPE country_tab AS TABLE OF country_t;

CREATE TABLE country of country_t
	NESTED TABLE users STORE AS users_nt;