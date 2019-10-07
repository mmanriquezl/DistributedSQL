--
-- PostgreSQL database dump
--


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

