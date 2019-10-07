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
1.386.982-9	Baxter Adams	Gerente	baxteradams@neurocell.com
12.637.498-7	Mcneil Barrera	Subgerente	mcneilbarrera@neurocell.com
20.732.547-9	Rhoda Davis	Subgerente	rhodadavis@neurocell.com
30.251.727-7	Lucinda Zamora	Subgerente	lucindazamora@neurocell.com
30.712.700-7	Mccormick Weiss	Subgerente	mccormickweiss@neurocell.com
13.806.941-5	Strickland Hammond	Gerente	stricklandhammond@neurocell.com
25.848.333-7	Janette Richmond	Gerente	janetterichmond@neurocell.com
10.253.793-5	Merle Daugherty	Gerente	merledaugherty@neurocell.com
4.515.948-9	Abby Sheppard	Gerente	abbysheppard@neurocell.com
\.


--
-- Data for Name: participantes; Type: TABLE DATA; Schema: public; Owner: tbduser
--

COPY public.participantes (rut, cod) FROM stdin;
14.766.967-6	17
14.766.967-6	3
14.766.967-6	5
26.703.926-2	5
26.703.926-2	15
26.703.926-2	19
5.684.460-2	19
5.684.460-2	9
5.684.460-2	1
20.137.453-0	1
20.137.453-0	3
20.137.453-0	5
20.137.453-0	7
20.137.453-0	9
20.137.453-0	11
20.137.453-0	13
20.137.453-0	15
20.137.453-0	17
20.137.453-0	19
11.556.157-8	19
11.556.157-8	7
11.454.225-2	3
11.454.225-2	9
11.454.225-2	15
4.393.487-8	17
4.393.487-8	15
4.393.487-8	13
4.393.487-8	11
4.393.487-8	9
4.393.487-8	7
4.393.487-8	5
4.393.487-8	3
4.393.487-8	1
19.597.739-2	1
22.996.118-0	5
22.996.118-0	15
22.996.118-0	19
22.934.525-2	19
22.934.525-2	9
1.386.982-9	1
1.386.982-9	3
1.386.982-9	5
1.386.982-9	7
1.386.982-9	9
1.386.982-9	11
1.386.982-9	13
1.386.982-9	15
1.386.982-9	17
1.386.982-9	19
12.637.498-7	19
12.637.498-7	13
30.251.727-7	17
30.251.727-7	19
30.712.700-7	19
30.712.700-7	17
30.712.700-7	15
13.806.941-5	1
13.806.941-5	3
25.848.333-7	9
25.848.333-7	11
10.253.793-5	13
10.253.793-5	15
10.253.793-5	17
10.253.793-5	19
4.515.948-9	1
4.515.948-9	3
\.


--
-- Data for Name: reunion; Type: TABLE DATA; Schema: public; Owner: tbduser
--

COPY public.reunion (cod, tema, ubicacion, capacidad, hora) FROM stdin;
1	Presupuesto 2011	sala 89	24	2010-12-01 05:15:51
3	Fin de año 2010	sala 426	20	2010-01-05 08:24:09
5	Fin de año 2005	sala 241	31	2005-10-12 02:33:54
7	Presupuesto 2005	sala 28	29	2004-07-08 10:47:56
9	Fin de año 2003	sala 271	21	2003-02-24 05:35:19
11	Contrataciones 2003	sala 267	24	2002-12-07 10:31:31
13	Contrataciones 2015	sala 77	30	2000-03-13 01:45:43
15	Presupuesto 2018	sala 31	24	2018-06-18 11:53:57
17	Contrataciones 2007	sala 456	29	2017-06-14 04:22:02
19	Presupuesto 2019	sala 307	29	2019-11-19 10:45:00
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

