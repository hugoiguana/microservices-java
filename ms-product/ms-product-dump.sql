--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: migration; Type: SCHEMA; Schema: -; Owner: app
--

CREATE SCHEMA migration;


ALTER SCHEMA migration OWNER TO app;

--
-- Name: product; Type: SCHEMA; Schema: -; Owner: app
--

CREATE SCHEMA product;


ALTER SCHEMA product OWNER TO app;

--
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;


--
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: flyway_migration_version; Type: TABLE; Schema: migration; Owner: app
--

CREATE TABLE migration.flyway_migration_version (
    installed_rank integer NOT NULL,
    version character varying(50),
    description character varying(200) NOT NULL,
    type character varying(20) NOT NULL,
    script character varying(1000) NOT NULL,
    checksum integer,
    installed_by character varying(100) NOT NULL,
    installed_on timestamp without time zone DEFAULT now() NOT NULL,
    execution_time integer NOT NULL,
    success boolean NOT NULL
);


ALTER TABLE migration.flyway_migration_version OWNER TO app;

--
-- Name: category; Type: TABLE; Schema: product; Owner: app
--

CREATE TABLE product.category (
    id uuid NOT NULL,
    name character varying NOT NULL,
    description character varying,
    dt_criation timestamp without time zone,
    dt_modification timestamp without time zone,
    deleted boolean
);


ALTER TABLE product.category OWNER TO app;

--
-- Name: product; Type: TABLE; Schema: product; Owner: app
--

CREATE TABLE product.product (
    id uuid NOT NULL,
    name character varying NOT NULL,
    description character varying,
    dt_criation timestamp without time zone,
    dt_modification timestamp without time zone,
    deleted boolean,
    price numeric(6,2)
);


ALTER TABLE product.product OWNER TO app;

--
-- Data for Name: flyway_migration_version; Type: TABLE DATA; Schema: migration; Owner: app
--

COPY migration.flyway_migration_version (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) FROM stdin;
0	\N	<< Flyway Schema Creation >>	SCHEMA	"migration"	\N	app	2024-04-09 13:30:40.509709	0	t
1	1	Initial	SQL	V1__Initial.sql	-1091514663	app	2024-04-09 13:30:40.541365	7	t
2	2	add column price to product	SQL	V2__add_column_price_to_product.sql	-214879646	app	2024-04-09 13:30:40.560792	1	t
3	3	create table category	SQL	V3__create_table_category.sql	2003437252	app	2024-04-09 13:30:40.566731	4	t
\.


--
-- Data for Name: category; Type: TABLE DATA; Schema: product; Owner: app
--

COPY product.category (id, name, description, dt_criation, dt_modification, deleted) FROM stdin;
5472f957-8d95-4e4f-a084-8cd9193b1fd0	smartphones	Smartphones	2024-04-09 13:30:40.569495	2024-04-09 13:30:40.569495	\N
\.


--
-- Data for Name: product; Type: TABLE DATA; Schema: product; Owner: app
--

COPY product.product (id, name, description, dt_criation, dt_modification, deleted, price) FROM stdin;
750a91ab-671c-450a-bf32-93a1d4cf08bc	TV	TV samsung 42	2024-04-09 14:50:51.859634	2024-04-09 14:50:51.859647	t	1200.25
8ba2a323-b876-4eb8-8e75-513486e5914f	TV	TV samsung 42	2024-04-09 15:59:53.078023	2024-04-09 15:59:53.078051	f	1200.25
adedba6c-e4ab-4daf-98f6-7311b741f037	TV 32	TV iguana 32 pelegadas	2024-04-09 14:47:36.127292	2024-04-09 16:18:43.676075	f	1000.00
\.


--
-- Name: flyway_migration_version flyway_migration_version_pk; Type: CONSTRAINT; Schema: migration; Owner: app
--

ALTER TABLE ONLY migration.flyway_migration_version
    ADD CONSTRAINT flyway_migration_version_pk PRIMARY KEY (installed_rank);


--
-- Name: category category_pkey; Type: CONSTRAINT; Schema: product; Owner: app
--

ALTER TABLE ONLY product.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- Name: product product_pkey; Type: CONSTRAINT; Schema: product; Owner: app
--

ALTER TABLE ONLY product.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);


--
-- Name: flyway_migration_version_s_idx; Type: INDEX; Schema: migration; Owner: app
--

CREATE INDEX flyway_migration_version_s_idx ON migration.flyway_migration_version USING btree (success);


--
-- PostgreSQL database dump complete
--

