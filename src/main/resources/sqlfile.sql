--
-- PostgreSQL database dump
--

-- Dumped from database version 10.10 (Ubuntu 10.10-1.pgdg18.04+1)
-- Dumped by pg_dump version 10.10 (Ubuntu 10.10-1.pgdg18.04+1)

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
\.


--
-- Data for Name: participantes; Type: TABLE DATA; Schema: public; Owner: tbduser
--

COPY public.participantes (rut, cod) FROM stdin;
\.


--
-- Data for Name: reunion; Type: TABLE DATA; Schema: public; Owner: tbduser
--

COPY public.reunion (cod, tema, ubicacion, capacidad, hora) FROM stdin;
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
    ADD CONSTRAINT participantes_pkey PRIMARY KEY (rut);


--
-- Name: reunion reunion_pkey; Type: CONSTRAINT; Schema: public; Owner: tbduser
--

ALTER TABLE ONLY public.reunion
    ADD CONSTRAINT reunion_pkey PRIMARY KEY (cod);


--
-- PostgreSQL database dump complete
--

