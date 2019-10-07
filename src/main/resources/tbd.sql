--
-- PostgreSQL database dump
--

-- Dumped from database version 10.10 (Ubuntu 10.10-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.10 (Ubuntu 10.10-0ubuntu0.18.04.1)

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
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: dog; Type: TABLE; Schema: public; Owner: tbduser
--

CREATE TABLE public.dog (
    id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.dog OWNER TO tbduser;

--
-- Name: dog_id_seq; Type: SEQUENCE; Schema: public; Owner: tbduser
--

CREATE SEQUENCE public.dog_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dog_id_seq OWNER TO tbduser;

--
-- Name: dog_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tbduser
--

ALTER SEQUENCE public.dog_id_seq OWNED BY public.dog.id;


--
-- Name: empleado; Type: TABLE; Schema: public; Owner: tbduser
--

CREATE TABLE public.empleado (
    rut character varying NOT NULL,
    nombre character varying NOT NULL,
    cargo character varying NOT NULL,
    email character varying NOT NULL
);


ALTER TABLE public.empleado OWNER TO tbduser;

--
-- Name: participantes; Type: TABLE; Schema: public; Owner: tbduser
--

CREATE TABLE public.participantes (
    rut character varying NOT NULL,
    cod integer NOT NULL
);


ALTER TABLE public.participantes OWNER TO tbduser;

--
-- Name: reunion; Type: TABLE; Schema: public; Owner: tbduser
--

CREATE TABLE public.reunion (
    cod integer NOT NULL,
    tema character varying,
    ubicacion character varying,
    capacidad integer,
    hora timestamp without time zone
);


ALTER TABLE public.reunion OWNER TO tbduser;

--
-- Name: reunion_cod_seq; Type: SEQUENCE; Schema: public; Owner: tbduser
--

CREATE SEQUENCE public.reunion_cod_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reunion_cod_seq OWNER TO tbduser;

--
-- Name: reunion_cod_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tbduser
--

ALTER SEQUENCE public.reunion_cod_seq OWNED BY public.reunion.cod;


--
-- Name: dog id; Type: DEFAULT; Schema: public; Owner: tbduser
--

ALTER TABLE ONLY public.dog ALTER COLUMN id SET DEFAULT nextval('public.dog_id_seq'::regclass);


--
-- Name: reunion cod; Type: DEFAULT; Schema: public; Owner: tbduser
--

ALTER TABLE ONLY public.reunion ALTER COLUMN cod SET DEFAULT nextval('public.reunion_cod_seq'::regclass);


--
-- Data for Name: dog; Type: TABLE DATA; Schema: public; Owner: tbduser
--

COPY public.dog (id, name) FROM stdin;
\.


--
-- Data for Name: empleado; Type: TABLE DATA; Schema: public; Owner: tbduser
--

COPY public.empleado (rut, nombre, cargo, email) FROM stdin;
14.766.967-6	Elvia Orr	Gerente	elviaorr@neurocell.com
26.703.926-2	Mandy Wooten	Gerente	mandywooten@neurocell.com
5.684.460-2	Carol Farrell	Subgerente	carolfarrell@neurocell.com
20.137.453-0	Renee Phelps	Subgerente	reneephelps@neurocell.com
11.556.157-8	Saundra Salas	Subgerente	saundrasalas@neurocell.com
11.454.225-2	Earline Guerrero	Gerente	earlineguerrero@neurocell.com
4.393.487-8	Cannon Salinas	Gerente	cannonsalinas@neurocell.com
19.597.739-2	Copeland Avila	Subgerente	copelandavila@neurocell.com
7.583.604-4	Queen Larsen	Subgerente	queenlarsen@neurocell.com
22.996.118-0	Foley Norton	Subgerente	foleynorton@neurocell.com
22.934.525-2	Short Dalton	Subgerente	shortdalton@neurocell.com
\.


--
-- Data for Name: participantes; Type: TABLE DATA; Schema: public; Owner: tbduser
--

COPY public.participantes (rut, cod) FROM stdin;
14.766.967-6	2
26.703.926-2	6
26.703.926-2	8
5.684.460-2	2
5.684.460-2	0
20.137.453-0	2
20.137.453-0	4
20.137.453-0	6
20.137.453-0	8
20.137.453-0	10
20.137.453-0	12
20.137.453-0	14
20.137.453-0	16
20.137.453-0	18
11.556.157-8	8
11.556.157-8	6
11.556.157-8	2
11.454.225-2	2
11.454.225-2	6
11.454.225-2	12
11.454.225-2	18
4.393.487-8	18
19.597.739-2	0
19.597.739-2	2
19.597.739-2	4
19.597.739-2	6
19.597.739-2	8
19.597.739-2	10
19.597.739-2	12
19.597.739-2	14
19.597.739-2	16
19.597.739-2	18
7.583.604-4	18
7.583.604-4	10
7.583.604-4	0
22.996.118-0	0
22.996.118-0	10
22.934.525-2	0
1.386.982-9	0
1.386.982-9	2
1.386.982-9	4
1.386.982-9	6
1.386.982-9	8
1.386.982-9	10
1.386.982-9	12
1.386.982-9	14
1.386.982-9	16
1.386.982-9	18
12.637.498-7	18
12.637.498-7	16
12.637.498-7	14
12.637.498-7	12
12.637.498-7	10
12.637.498-7	8
12.637.498-7	6
12.637.498-7	4
20.732.547-9	4
20.732.547-9	8
20.732.547-9	12
20.732.547-9	16
30.251.727-7	16
30.712.700-7	18
30.712.700-7	16
13.806.941-5	0
13.806.941-5	2
25.848.333-7	8
25.848.333-7	10
25.848.333-7	12
25.848.333-7	14
25.848.333-7	16
25.848.333-7	18
10.253.793-5	14
10.253.793-5	16
10.253.793-5	18
4.515.948-9	0
4.515.948-9	2
\.


--
-- Data for Name: reunion; Type: TABLE DATA; Schema: public; Owner: tbduser
--

COPY public.reunion (cod, tema, ubicacion, capacidad, hora) FROM stdin;
0	Fin de año 2014	sala 447	21	2014-12-06 02:23:52
2	Contrataciones 2002	sala 444	23	2001-11-25 09:24:56
4	Presupuesto 2020	sala 318	40	2019-10-30 09:37:19
6	Fin de año 2009	sala 263	31	2009-08-13 08:23:40
8	Contrataciones 2001	sala 440	27	2000-04-25 08:46:00
10	Contrataciones 2002	sala 131	28	2001-12-31 03:35:48
12	Contrataciones 2020	sala 218	29	2019-11-16 09:55:45
14	Fin de año 2018	sala 469	23	2018-09-06 06:37:49
16	Fin de año 2011	sala 46	31	2019-08-18 09:03:53
18	Fin de año 2010	sala 367	34	2020-12-02 04:32:54
\.


--
-- Name: dog_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tbduser
--

SELECT pg_catalog.setval('public.dog_id_seq', 1, false);


--
-- Name: reunion_cod_seq; Type: SEQUENCE SET; Schema: public; Owner: tbduser
--

SELECT pg_catalog.setval('public.reunion_cod_seq', 1, false);


--
-- Name: dog dog_pkey; Type: CONSTRAINT; Schema: public; Owner: tbduser
--

ALTER TABLE ONLY public.dog
    ADD CONSTRAINT dog_pkey PRIMARY KEY (id);


--
-- Name: empleado empleado_pkey; Type: CONSTRAINT; Schema: public; Owner: tbduser
--

ALTER TABLE ONLY public.empleado
    ADD CONSTRAINT empleado_pkey PRIMARY KEY (rut);


--
-- Name: participantes participantes_pkey; Type: CONSTRAINT; Schema: public; Owner: tbduser
--

ALTER TABLE ONLY public.participantes
    ADD CONSTRAINT participantes_pkey PRIMARY KEY (rut, cod);


--
-- Name: reunion reunion_pkey; Type: CONSTRAINT; Schema: public; Owner: tbduser
--

ALTER TABLE ONLY public.reunion
    ADD CONSTRAINT reunion_pkey PRIMARY KEY (cod);


--
-- PostgreSQL database dump complete
--

