--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Drop databases (except postgres and template1)
--

DROP DATABASE sigdiv_development;
DROP DATABASE sigdiv_production;
DROP DATABASE sigdiv_test;




--
-- Drop roles
--

DROP ROLE postgres;


--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'md5ed348175a97f96082cb9605d89caa099';






--
-- Databases
--

--
-- Database "template1" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.0 (Debian 13.0-1.pgdg100+1)
-- Dumped by pg_dump version 13.0 (Debian 13.0-1.pgdg100+1)

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

UPDATE pg_catalog.pg_database SET datistemplate = false WHERE datname = 'template1';
DROP DATABASE template1;
--
-- Name: template1; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE template1 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE template1 OWNER TO postgres;

\connect template1

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
-- Name: DATABASE template1; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: template1; Type: DATABASE PROPERTIES; Schema: -; Owner: postgres
--

ALTER DATABASE template1 IS_TEMPLATE = true;


\connect template1

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
-- Name: DATABASE template1; Type: ACL; Schema: -; Owner: postgres
--

REVOKE CONNECT,TEMPORARY ON DATABASE template1 FROM PUBLIC;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.0 (Debian 13.0-1.pgdg100+1)
-- Dumped by pg_dump version 13.0 (Debian 13.0-1.pgdg100+1)

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

DROP DATABASE postgres;
--
-- Name: postgres; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE postgres OWNER TO postgres;

\connect postgres

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
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- PostgreSQL database dump complete
--

--
-- Database "sigdiv_development" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.0 (Debian 13.0-1.pgdg100+1)
-- Dumped by pg_dump version 13.0 (Debian 13.0-1.pgdg100+1)

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
-- Name: sigdiv_development; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE sigdiv_development WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE sigdiv_development OWNER TO postgres;

\connect sigdiv_development

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

SET default_table_access_method = heap;

--
-- Name: active_storage_attachments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.active_storage_attachments (
    id bigint NOT NULL,
    name character varying NOT NULL,
    record_type character varying NOT NULL,
    record_id bigint NOT NULL,
    blob_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL
);


ALTER TABLE public.active_storage_attachments OWNER TO postgres;

--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.active_storage_attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.active_storage_attachments_id_seq OWNER TO postgres;

--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.active_storage_attachments_id_seq OWNED BY public.active_storage_attachments.id;


--
-- Name: active_storage_blobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.active_storage_blobs (
    id bigint NOT NULL,
    key character varying NOT NULL,
    filename character varying NOT NULL,
    content_type character varying,
    metadata text,
    byte_size bigint NOT NULL,
    checksum character varying NOT NULL,
    created_at timestamp without time zone NOT NULL
);


ALTER TABLE public.active_storage_blobs OWNER TO postgres;

--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.active_storage_blobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.active_storage_blobs_id_seq OWNER TO postgres;

--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.active_storage_blobs_id_seq OWNED BY public.active_storage_blobs.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO postgres;

--
-- Name: attachments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.attachments (
    id bigint NOT NULL,
    name character varying,
    description text,
    file character varying,
    debt_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.attachments OWNER TO postgres;

--
-- Name: attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.attachments_id_seq OWNER TO postgres;

--
-- Name: attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.attachments_id_seq OWNED BY public.attachments.id;


--
-- Name: creditors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.creditors (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    financial_agent boolean DEFAULT false
);


ALTER TABLE public.creditors OWNER TO postgres;

--
-- Name: creditors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.creditors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.creditors_id_seq OWNER TO postgres;

--
-- Name: creditors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.creditors_id_seq OWNED BY public.creditors.id;


--
-- Name: currencies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.currencies (
    id bigint NOT NULL,
    name character varying,
    formula character varying,
    description text,
    last_currency character varying,
    date_currency date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.currencies OWNER TO postgres;

--
-- Name: currencies_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.currencies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.currencies_id_seq OWNER TO postgres;

--
-- Name: currencies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.currencies_id_seq OWNED BY public.currencies.id;


--
-- Name: debts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.debts (
    id bigint NOT NULL,
    code integer,
    contract_value numeric,
    signature_date date,
    creditor_id integer,
    grace_period date,
    amortization_period date,
    purpose text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    amortization_type integer,
    financial_agent_id integer,
    applicable_legislation character varying,
    legislation_level integer,
    name character varying,
    notes text,
    category integer,
    currency_id integer,
    loan_term integer,
    interest_rate numeric,
    decimal_places integer,
    start_amt_next_month_to_grace_period boolean
);


ALTER TABLE public.debts OWNER TO postgres;

--
-- Name: debts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.debts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.debts_id_seq OWNER TO postgres;

--
-- Name: debts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.debts_id_seq OWNED BY public.debts.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO postgres;

--
-- Name: transaction_infos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transaction_infos (
    id bigint NOT NULL,
    formula character varying,
    payment_day integer,
    description text,
    debt_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    frequency integer,
    category_number integer,
    slug character varying,
    base numeric,
    bind_withdraw boolean
);


ALTER TABLE public.transaction_infos OWNER TO postgres;

--
-- Name: transaction_infos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.transaction_infos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.transaction_infos_id_seq OWNER TO postgres;

--
-- Name: transaction_infos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.transaction_infos_id_seq OWNED BY public.transaction_infos.id;


--
-- Name: transaction_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transaction_items (
    id bigint NOT NULL,
    value numeric,
    value_brl numeric,
    date date,
    exchange_rate numeric,
    start_balance numeric,
    start_outstanding_balance_brl numeric,
    transaction_info_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    internalization_date date,
    confirmed boolean,
    formula character varying
);


ALTER TABLE public.transaction_items OWNER TO postgres;

--
-- Name: transaction_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.transaction_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.transaction_items_id_seq OWNER TO postgres;

--
-- Name: transaction_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.transaction_items_id_seq OWNED BY public.transaction_items.id;


--
-- Name: active_storage_attachments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_storage_attachments ALTER COLUMN id SET DEFAULT nextval('public.active_storage_attachments_id_seq'::regclass);


--
-- Name: active_storage_blobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_storage_blobs ALTER COLUMN id SET DEFAULT nextval('public.active_storage_blobs_id_seq'::regclass);


--
-- Name: attachments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attachments ALTER COLUMN id SET DEFAULT nextval('public.attachments_id_seq'::regclass);


--
-- Name: creditors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.creditors ALTER COLUMN id SET DEFAULT nextval('public.creditors_id_seq'::regclass);


--
-- Name: currencies id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.currencies ALTER COLUMN id SET DEFAULT nextval('public.currencies_id_seq'::regclass);


--
-- Name: debts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.debts ALTER COLUMN id SET DEFAULT nextval('public.debts_id_seq'::regclass);


--
-- Name: transaction_infos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction_infos ALTER COLUMN id SET DEFAULT nextval('public.transaction_infos_id_seq'::regclass);


--
-- Name: transaction_items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction_items ALTER COLUMN id SET DEFAULT nextval('public.transaction_items_id_seq'::regclass);


--
-- Data for Name: active_storage_attachments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) FROM stdin;
\.


--
-- Data for Name: active_storage_blobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) FROM stdin;
\.


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2020-11-05 18:18:51.279647	2020-11-05 18:18:51.279647
\.


--
-- Data for Name: attachments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.attachments (id, name, description, file, debt_id, created_at, updated_at) FROM stdin;
1	contrato		ct_0412.704-29.2013_TransOceânica.pdf	1	2020-01-07 17:18:24.916505	2020-01-07 17:18:24.916505
2	Contrato CAF		CONTRATO_CAF_0161-2016_-_ASSINADO_PELO_PREFEITO.pdf	2	2020-03-16 19:12:34.648126	2020-03-16 19:12:34.648126
4	contrato		CONTRATO_CAF_0161-2016_-_ASSINADO_PELO_PREFEITO.pdf	3	2020-03-17 18:17:42.515291	2020-03-17 18:17:42.515291
6	teste upload	teste de upload 1	PDF_em_Branco.pdf	3	2020-04-28 14:38:11.293423	2020-04-28 14:38:11.293423
7	Contrato de Empréstimo 		Contrato_de_Emprestimo_2941OC__BR_BID.pdf	5	2020-04-29 16:02:32.157885	2020-04-29 16:02:32.157885
8	Contrato de Emprestimo	Contrato valor total de R$ 28.089.000,00 divido em 2 subcréditos, sendo o subcrédito "A" no valor de R$ 6.642.000,00 e subcrédito "B"  R$ 21.847.000,00.	ct._14.2.01161.1_-_BNDES_pmat.pdf	6	2020-04-29 17:05:40.712469	2020-04-29 17:05:40.712469
9	Contrato de Emprestimo	Contrato valor total de R$ 28.089.000,00 divido em 2 subcréditos, sendo o subcrédito "A" no valor de R$ 6.642.000,00 e subcrédito "B"  no valor de R$ 21.847.000,00.	ct._14.2.01161.1_-_BNDES_pmat.pdf	7	2020-04-29 17:11:19.083227	2020-04-29 17:11:55.553223
10	planilha		R.O._Sustentávél_-_CAF.xlsx	4	2020-04-30 01:30:22.41765	2020-04-30 01:30:22.41765
13	planilha		planilha_caixa_v2.xlsx	3	2020-05-07 00:28:29.000724	2020-05-07 00:28:29.000724
15	CONTRATO		CONTRATO_CAF_0161-2016_-_ASSINADO_PELO_PREFEITO.pdf	8	2020-05-18 03:13:33.091448	2020-05-18 03:13:33.091448
\.


--
-- Data for Name: creditors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.creditors (id, name, created_at, updated_at, financial_agent) FROM stdin;
1	CAIXA ECONÔMICA FEDERAL	2020-11-05 18:18:51.463421	2020-11-05 18:18:51.463421	t
2	Corporação Andina de Fomento - CAF	2020-11-05 18:18:51.471311	2020-11-05 18:18:51.471311	f
3	BNDES	2020-11-05 18:18:51.475838	2020-11-05 18:18:51.475838	t
4	BANCO DO BRASIL	2020-11-05 18:18:51.480439	2020-11-05 18:18:51.480439	t
5	BID	2020-11-05 18:18:51.485037	2020-11-05 18:18:51.485037	f
\.


--
-- Data for Name: currencies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.currencies (id, name, formula, description, last_currency, date_currency, created_at, updated_at) FROM stdin;
1	BRL	1	\N	\N	\N	2020-11-05 18:18:51.504361	2020-11-05 18:18:51.504361
2	USD	[BACEN1]	\N	\N	\N	2020-11-05 18:18:51.510309	2020-11-05 18:18:51.510309
3	URTJLP	[BNDES314]	\N	\N	\N	2020-11-05 18:18:51.514272	2020-11-05 18:18:51.514272
4	BRL	1	\N	\N	\N	2020-03-17 16:47:03.982513	2020-03-17 16:47:03.982513
5	USD	[BACEN1]	\N	\N	\N	2020-03-17 16:47:03.990784	2020-03-17 16:47:03.990784
6	URTJLP	[BNDES314]	\N	\N	\N	2020-03-17 16:47:03.999125	2020-03-17 16:47:03.999125
7	SELIC-2	[BNDES143]		\N	\N	2020-06-24 23:03:21.770042	2020-06-24 23:08:35.852729
8	LIBOR3 25 A 48M	[BNDES038]		\N	\N	2020-06-24 23:16:34.639846	2020-06-24 23:16:34.639846
\.


--
-- Data for Name: debts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.debts (id, code, contract_value, signature_date, creditor_id, grace_period, amortization_period, purpose, created_at, updated_at, amortization_type, financial_agent_id, applicable_legislation, legislation_level, name, notes, category, currency_id, loan_term, interest_rate, decimal_places, start_amt_next_month_to_grace_period) FROM stdin;
1	123456	292320000.0	2013-11-19	1	2017-11-19	2033-11-19	Programa destinado à Implantação do Corredor BRT TransOcênica - Charitas/Centro	2020-11-05 18:18:51.564145	2020-11-05 18:18:51.564145	1	\N	\N	\N	Caixa Transoceânica	\N	0	1	240	0.005	5	t
2	123789	100000000.0	2016-11-30	2	2021-05-30	2028-11-30	Programa região oceânica sustentável	2020-11-05 18:18:51.575838	2020-11-05 18:18:51.575838	0	1		\N	CAF		1	2	16	1.95	2	f
3	123799	26470000.0	2016-11-30	5	2019-04-15	2038-10-15	ProCidades - Programa de Desenvolvimento Urbano e Inclusão Social de Niterói	2020-11-05 18:18:51.585952	2020-11-05 18:18:51.585952	0	4		\N	BID		1	2	40	2.75	2	f
4	212345	6242000.0	2014-12-22	3	2017-02-15	2023-11-15	Programa de Modernização da Administração Tributária e da Gestão dos Setores Sociais Básicos - PMAT	2020-11-05 18:18:51.595513	2020-11-05 18:18:51.595513	0	3		\N	PMAT  - BNDES - SubC. A		0	1	72	2.2	4	f
5	212346	21847000.0	2014-12-22	3	2017-02-15	2023-11-15	Programa de Modernização da Administração Tributária e da Gestão dos Setores Sociais Básicos - PMAT	2020-11-05 18:18:51.613196	2020-11-05 18:18:51.613196	0	3		\N	PMAT  - BNDES - SubC. B		0	1	72	2.2	6	f
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.schema_migrations (version) FROM stdin;
20181123150812
20181123150845
20181204154339
20181204160614
20181204161949
20181204162827
20181204165320
20181204165354
20181204172415
20181214151944
20181214152035
20181214152402
20181217152939
20181218165740
20181221175527
20181221180221
20181227165515
20190109173130
20190110145821
20190116190903
20190117134059
20190122133804
20190122133844
20190218153020
20190218153106
20190218173752
20190218194936
20190219174653
20190225153116
20190227190850
20190227190953
20190227191021
20190227195217
20190228172511
20190228184229
20190326163958
20190326164558
20190329164210
20190329164225
20190329165048
20190329165114
20190404200906
20190409160627
20190409161126
20190509180846
20190509180910
20190509180933
20190509185645
20190509185858
20190509190013
20190524180248
20190524181004
20190527192353
20190605181907
20190605184638
20190606184647
20190607182344
20190802152325
20190802153441
20190802183529
20190806190924
20190806193127
20190813140250
20190814164515
20190910152147
20191008155630
20191025174708
20200310144724
20200310150056
20200506094533
20200604170956
20201008211338
20201102142940
\.


--
-- Data for Name: transaction_infos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transaction_infos (id, formula, payment_day, description, debt_id, created_at, updated_at, frequency, category_number, slug, base, bind_withdraw) FROM stdin;
1		15	\N	1	2020-11-05 18:18:51.638577	2020-11-05 18:18:51.638577	\N	1	D	\N	\N
2	[PGTO] - [SALDO] * [JUROS]	15	\N	1	2020-11-05 18:18:51.644265	2020-11-05 18:18:51.644265	1	2	A	\N	\N
3	[SALDO] * [JUROS]	15	\N	1	2020-11-05 18:18:51.648851	2020-11-05 18:18:51.648851	1	3	J	\N	\N
4	[SALDO] * (0.02 / 12)	15	Taxa Adm	1	2020-11-05 18:18:51.653487	2020-11-05 18:18:51.653487	1	4	TA	2.0	\N
5	[SALDO] * (0.007 / 12)	15	Taxa Risco	1	2020-11-05 18:18:51.658032	2020-11-05 18:18:51.658032	1	4	TR	0.7	\N
6	\N	\N	\N	1	2020-11-05 18:18:51.662678	2020-11-05 18:18:51.662678	\N	5	EE	\N	\N
7		30	\N	2	2020-11-05 18:18:51.668385	2020-11-05 18:18:51.668385	\N	1	D	\N	\N
8	[SALDO] / ([PARCELAS] - [N_PARCELA])	30	\N	2	2020-11-05 18:18:51.673242	2020-11-05 18:18:51.673242	6	2	A	\N	\N
9	[SALDO] * ((1.95 / 100 / 360) * [DELTA_DATA])	30	\N	2	2020-11-05 18:18:51.678397	2020-11-05 18:18:51.678397	6	3	J	\N	\N
10	([VALOR_CONTRATO] - [SALDO]) * ((0.35 / 100 / 360) * [DELTA_DATA])	30	Comissão de crédito	2	2020-11-05 18:18:51.683078	2020-11-05 18:18:51.683078	6	4	CC	0.35	t
11	\N	\N	\N	2	2020-11-05 18:18:51.687857	2020-11-05 18:18:51.687857	\N	5	EE	\N	\N
12		15	\N	3	2020-11-05 18:18:51.692813	2020-11-05 18:18:51.692813	\N	1	D	\N	\N
13	[SALDO] / ([PARCELAS] - [N_PARCELA])	15	\N	3	2020-11-05 18:18:51.697167	2020-11-05 18:18:51.697167	6	2	A	\N	\N
14	[SALDO] * ((1.95 / 100 / 360) * [DELTA_DATA])	15	\N	3	2020-11-05 18:18:51.701689	2020-11-05 18:18:51.701689	6	3	J	\N	\N
15	([VALOR_CONTRATO] - [SALDO]) * ((0.35 / 100 / 360) * [DELTA_DATA])	15	Comissão de crédito	3	2020-11-05 18:18:51.706023	2020-11-05 18:18:51.706023	6	4	CC	0.35	t
16		15	\N	4	2020-11-05 18:18:51.710995	2020-11-05 18:18:51.710995	\N	1	D	\N	\N
17	[SALDO] / ([PARCELAS] - [N_PARCELA])	15	\N	4	2020-11-05 18:18:51.71543	2020-11-05 18:18:51.71543	1	2	A	\N	\N
18	[SALDO] * ((1.95 / 100 / 360) * [DELTA_DATA])	15	\N	4	2020-11-05 18:18:51.720127	2020-11-05 18:18:51.720127	1	3	J	\N	\N
19	\N	\N	\N	4	2020-11-05 18:18:51.7245	2020-11-05 18:18:51.7245	\N	5	EE	\N	\N
20		15	\N	5	2020-11-05 18:18:51.728728	2020-11-05 18:18:51.728728	\N	1	D	\N	\N
21	[SALDO] / ([PARCELAS] - [N_PARCELA])	15	\N	5	2020-11-05 18:18:51.733046	2020-11-05 18:18:51.733046	1	2	A	\N	\N
22	[SALDO] * ((1.95 / 100 / 360) * [DELTA_DATA])	15	\N	5	2020-11-05 18:18:51.737628	2020-11-05 18:18:51.737628	1	3	J	\N	\N
23	\N	\N	\N	5	2020-11-05 18:18:51.742117	2020-11-05 18:18:51.742117	\N	5	EE	\N	\N
\.


--
-- Data for Name: transaction_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transaction_items (id, value, value_brl, date, exchange_rate, start_balance, start_outstanding_balance_brl, transaction_info_id, created_at, updated_at, internalization_date, confirmed, formula) FROM stdin;
1	38267.1771676987	800224.9	2015-05-08	20.91152155	0.0	\N	1	2020-11-05 18:18:51.771084	2020-11-05 18:18:51.771084	\N	t	\N
2	100178.304001591	2099165.37	2015-06-19	20.95429136	38267.17717	\N	1	2020-11-05 18:18:51.778805	2020-11-05 18:18:51.778805	\N	t	\N
3	269454.113840257	5659740.67	2015-07-24	21.00446933	138445.48117	\N	1	2020-11-05 18:18:51.784593	2020-11-05 18:18:51.784593	\N	t	\N
4	172811.612402003	3636516.2	2015-08-21	21.0432398	407899.59501	\N	1	2020-11-05 18:18:51.790662	2020-11-05 18:18:51.790662	\N	t	\N
5	388238.148837079	8185330.12	2015-09-22	21.08327104	580711.20741	\N	1	2020-11-05 18:18:51.79615	2020-11-05 18:18:51.79615	\N	t	\N
6	180241.335471127	3807043.73	2015-10-22	21.12192367	968949.35625	\N	1	2020-11-05 18:18:51.801184	2020-11-05 18:18:51.801184	\N	t	\N
7	776149.536786542	16418436.94	2015-11-23	21.1537032	1149190.69172	\N	1	2020-11-05 18:18:51.807625	2020-11-05 18:18:51.807625	\N	t	\N
8	2027839.19399659	42965630.86	2015-12-17	21.18788856	1925340.22851	\N	1	2020-11-05 18:18:51.813246	2020-11-05 18:18:51.813246	\N	t	\N
9	1480367.51522129	31500447.14	2016-03-15	21.27880193	3953179.4225	\N	1	2020-11-05 18:18:51.818562	2020-11-05 18:18:51.818562	\N	t	\N
10	1986775.5527745	42393733.38	2016-05-06	21.33795804	5433546.93772	\N	1	2020-11-05 18:18:51.823582	2020-11-05 18:18:51.823582	\N	t	\N
11	383515.163323288	8207278.03	2016-06-27	21.40013959	7420322.4905	\N	1	2020-11-05 18:18:51.828518	2020-11-05 18:18:51.828518	\N	t	\N
12	611973.657811069	13121407.28	2016-07-29	21.44113086	7803837.65382	\N	1	2020-11-05 18:18:51.833503	2020-11-05 18:18:51.833503	\N	t	\N
13	573211.706951141	12319813.16	2016-08-30	21.49260563	8415811.31163	\N	1	2020-11-05 18:18:51.839508	2020-11-05 18:18:51.839508	\N	t	\N
14	577590.254823738	12435287.93	2016-09-30	21.52960135	8989023.01858	\N	1	2020-11-05 18:18:51.845104	2020-11-05 18:18:51.845104	\N	t	\N
15	508924.2218972	10973544.54	2016-10-28	21.56223671	9566613.27341	\N	1	2020-11-05 18:18:51.850259	2020-11-05 18:18:51.850259	\N	t	\N
16	715325.306302176	15447408.0	2016-11-30	21.5949413	10075537.49531	\N	1	2020-11-05 18:18:51.855394	2020-11-05 18:18:51.855394	\N	t	\N
17	550758.880241646	11909445.03	2016-12-22	21.62370042	10790862.80161	\N	1	2020-11-05 18:18:51.860226	2020-11-05 18:18:51.860226	\N	t	\N
18	270839.770669423	5869510.23	2017-01-31	21.67152267	11341621.68185	\N	1	2020-11-05 18:18:51.865178	2020-11-05 18:18:51.865178	\N	t	\N
19	286313.741213063	6207267.82	2017-03-02	21.67995079	11612461.45252	\N	1	2020-11-05 18:18:51.872379	2020-11-05 18:18:51.872379	\N	t	\N
20	109984.5161992	2388057.81	2017-05-02	21.71267277	11898775.19373	\N	1	2020-11-05 18:18:51.878003	2020-11-05 18:18:51.878003	\N	t	\N
21	295191.232075548	6417561.7	2017-06-30	21.74035338	12008759.70993	\N	1	2020-11-05 18:18:51.883554	2020-11-05 18:18:51.883554	\N	t	\N
22	351624.161135471	7653284.73	2017-09-18	21.76552574	12303950.94201	\N	1	2020-11-05 18:18:51.888953	2020-11-05 18:18:51.888953	\N	t	\N
23	252538.2031043	5496626.76	2017-11-13	21.76552574	12655575.10314	\N	1	2020-11-05 18:18:51.894076	2020-11-05 18:18:51.894076	\N	t	\N
24	288019.18248541	5496626.76	2018-02-15	1.0	12852099.2879	\N	1	2020-11-05 18:18:51.900057	2020-11-05 18:18:51.900057	\N	t	\N
25	208970.05587	5496626.76	2018-10-31	1.0	12905242.14372	\N	1	2020-11-05 18:18:51.905553	2020-11-05 18:18:51.905553	\N	t	\N
26	191.33589	4002.277414461063	2015-05-15	20.9175467	38267.17717	\N	3	2020-11-05 18:18:51.911105	2020-11-05 18:18:51.911105	\N	t	\N
27	692.22741	14500.1311260631854	2015-06-15	20.94706294	38267.17717	\N	3	2020-11-05 18:18:51.916132	2020-11-05 18:18:51.916132	\N	t	\N
28	2039.49798	42808.565676517173	2015-07-15	20.98975635	138445.48117	\N	3	2020-11-05 18:18:51.921381	2020-11-05 18:18:51.921381	\N	t	\N
29	2903.55604	61078.5217087749088	2015-08-15	21.03576472	407899.59501	\N	3	2020-11-05 18:18:51.926335	2020-11-05 18:18:51.926335	\N	t	\N
30	4844.74678	102096.4708982124998	2015-09-15	21.07364441	580711.20741	\N	3	2020-11-05 18:18:51.932121	2020-11-05 18:18:51.932121	\N	t	\N
31	5745.95346	121313.9227799800782	2015-10-15	21.11293167	968949.35625	\N	3	2020-11-05 18:18:51.937785	2020-11-05 18:18:51.937785	\N	t	\N
32	9626.70114	203574.4018255976238	2015-11-15	21.14684967	1149190.69172	\N	3	2020-11-05 18:18:51.943693	2020-11-05 18:18:51.943693	\N	t	\N
33	19765.89711	418712.0671858526289	2015-12-15	21.18355999	1925340.22851	\N	3	2020-11-05 18:18:51.950552	2020-11-05 18:18:51.950552	\N	t	\N
34	19765.89711	419474.6082194184171	2016-01-15	21.22213861	3953179.4225	\N	3	2020-11-05 18:18:51.955674	2020-11-05 18:18:51.955674	\N	t	\N
35	19765.89711	419948.1583964259705	2016-02-15	21.24609655	3953179.4225	\N	3	2020-11-05 18:18:51.96271	2020-11-05 18:18:51.96271	\N	t	\N
36	19765.89711	420594.6095724494223	2016-03-15	21.27880193	3953179.4225	\N	3	2020-11-05 18:18:51.969386	2020-11-05 18:18:51.969386	\N	t	\N
37	27167.73469	579157.3761854300146	2016-04-15	21.31783834	5433546.93772	\N	3	2020-11-05 18:18:51.974602	2020-11-05 18:18:51.974602	\N	t	\N
38	27167.73469	579957.7544933929224	2016-05-15	21.34729896	5433546.93772	\N	3	2020-11-05 18:18:51.98007	2020-11-05 18:18:51.98007	\N	t	\N
39	37101.61245	793390.650969422583	2016-06-15	21.38426334	7420322.4905	\N	3	2020-11-05 18:18:51.985818	2020-11-05 18:18:51.985818	\N	t	\N
40	39019.18827	835970.5056917445924	2016-07-15	21.42460012	7803837.65382	\N	3	2020-11-05 18:18:51.992968	2020-11-05 18:18:51.992968	\N	t	\N
41	42079.05656	903289.8357896383544	2016-08-15	21.46649449	8415811.31163	\N	3	2020-11-05 18:18:51.998459	2020-11-05 18:18:51.998459	\N	t	\N
42	44945.11509	966853.0554109991139	2016-09-15	21.51186071	8989023.01858	\N	3	2020-11-05 18:18:52.004054	2020-11-05 18:18:52.004054	\N	t	\N
43	47833.06637	1030645.697382419674	2016-10-15	21.5467202	9566613.27341	\N	3	2020-11-05 18:18:52.00939	2020-11-05 18:18:52.00939	\N	t	\N
44	50377.68748	1087127.27170447172	2016-11-15	21.579539	10075537.49531	\N	3	2020-11-05 18:18:52.014538	2020-11-05 18:18:52.014538	\N	t	\N
45	53954.31401	1166202.2024109351385	2016-12-15	21.61462385	10790862.80161	\N	3	2020-11-05 18:18:52.020568	2020-11-05 18:18:52.020568	\N	t	\N
46	56708.10841	1227907.7786289570253	2017-01-15	21.65312533	11341621.68185	\N	3	2020-11-05 18:18:52.027153	2020-11-05 18:18:52.027153	\N	t	\N
47	58062.30726	1258606.8782655311022	2017-02-15	21.67683197	11612461.45252	\N	3	2020-11-05 18:18:52.032649	2020-11-05 18:18:52.032649	\N	t	\N
48	59493.87597	1290663.3073926878055	2017-03-15	21.69405315	11898775.19373	\N	3	2020-11-05 18:18:52.038527	2020-11-05 18:18:52.038527	\N	t	\N
49	60043.79855	1303711.3497839504835	2017-04-15	21.71267277	12008759.70993	\N	3	2020-11-05 18:18:52.051615	2020-11-05 18:18:52.051615	\N	t	\N
50	60043.79855	1304118.727142658712	2017-05-15	21.71945744	12008759.70993	\N	3	2020-11-05 18:18:52.058107	2020-11-05 18:18:52.058107	\N	t	\N
51	60043.79855	1305040.3496140484155	2017-06-15	21.73480661	12008759.70993	\N	3	2020-11-05 18:18:52.063746	2020-11-05 18:18:52.063746	\N	t	\N
52	61519.75471	1337892.0608484309048	2017-07-17	21.74735688	12303950.94201	\N	3	2020-11-05 18:18:52.070914	2020-11-05 18:18:52.070914	\N	t	\N
53	61519.75471	1338624.7303671496498	2017-08-15	21.75926638	12303950.94201	\N	3	2020-11-05 18:18:52.075883	2020-11-05 18:18:52.075883	\N	t	\N
54	61519.75471	1339009.8046589912354	2017-09-15	21.76552574	12303950.94201	\N	3	2020-11-05 18:18:52.081231	2020-11-05 18:18:52.081231	\N	t	\N
55	63277.87552	1377276.2284030758848	2017-10-16	21.76552574	12655575.10314	\N	3	2020-11-05 18:18:52.086849	2020-11-05 18:18:52.086849	\N	t	\N
56	63277.87552	1377276.2284030758848	2017-11-16	21.76552574	12655575.10314	\N	3	2020-11-05 18:18:52.092829	2020-11-05 18:18:52.092829	\N	t	\N
57	64540.5665312297	1404759.362109662549202478	2017-12-15	21.76552574	12908113.30625	\N	3	2020-11-05 18:18:52.098003	2020-11-05 18:18:52.098003	\N	t	\N
58	64400.8806999382	1401719.026553174108509268	2018-01-15	21.76552574	12880176.13999	\N	3	2020-11-05 18:18:52.10325	2020-11-05 18:18:52.10325	\N	t	\N
59	64740.5284102816	1409111.637535185445448384	2018-02-15	21.76552574	12852099.2879	\N	3	2020-11-05 18:18:52.108108	2020-11-05 18:18:52.108108	\N	t	\N
60	65556.3443889012	1426868.301216933638916888	2018-03-15	21.76552574	13111268.87778	\N	3	2020-11-05 18:18:52.113711	2020-11-05 18:18:52.113711	\N	t	\N
61	65411.3751860724	1423712.970301256111703576	2018-04-15	21.76552574	13082275.03721	\N	3	2020-11-05 18:18:52.11868	2020-11-05 18:18:52.11868	\N	t	\N
62	65265.6811372294	1420541.862730998977984756	2018-05-15	21.76552574	13053136.22745	\N	3	2020-11-05 18:18:52.124679	2020-11-05 18:18:52.124679	\N	t	\N
63	65119.2586181423	1417354.899622893061632802	2018-06-15	21.76552574	13023851.72363	\N	3	2020-11-05 18:18:52.129472	2020-11-05 18:18:52.129472	\N	t	\N
64	64972.10399	1414152.0017763017026	2018-07-16	21.76552574	12994420.79729	\N	3	2020-11-05 18:18:52.134302	2020-11-05 18:18:52.134302	\N	t	\N
65	64824.21358	1410933.0892507475492	2018-08-15	21.76552574	12964842.71632	\N	3	2020-11-05 18:18:52.139246	2020-11-05 18:18:52.139246	\N	t	\N
66	64675.58372	1407698.0822071849528	2018-09-17	21.76552574	12935116.74495	\N	3	2020-11-05 18:18:52.144359	2020-11-05 18:18:52.144359	\N	t	\N
67	64526.21072	1404446.9003308239328	2018-10-15	21.76552574	12905242.14372	\N	3	2020-11-05 18:18:52.149295	2020-11-05 18:18:52.149295	\N	t	\N
68	64863.68764	1411792.2629197398536	2018-11-16	21.76552574	13084188.22536	\N	3	2020-11-05 18:18:52.15473	2020-11-05 18:18:52.15473	\N	t	\N
69	65267.62197	1420584.1059766245078	2018-12-15	21.76552574	13053524.39336	\N	3	2020-11-05 18:18:52.159649	2020-11-05 18:18:52.159649	\N	t	\N
70	65113.53621	1417230.3484011770454	2019-01-15	21.76552574	13022707.24221	\N	3	2020-11-05 18:18:52.164521	2020-11-05 18:18:52.164521	\N	t	\N
71	64958.68003	1413859.8222293889722	2019-02-15	21.76552574	12991736.0053	\N	3	2020-11-05 18:18:52.170963	2020-11-05 18:18:52.170963	\N	t	\N
72	64803.04956	1410472.4432286756744	2019-03-15	21.76552574	12960609.91221	\N	3	2020-11-05 18:18:52.177083	2020-11-05 18:18:52.177083	\N	t	\N
73	64646.64094	1407068.1273841077956	2019-04-15	21.76552574	12929328.18865	\N	3	2020-11-05 18:18:52.182219	2020-11-05 18:18:52.182219	\N	t	\N
74	64489.45028	1403646.7900277902072	2019-05-15	21.76552574	12897890.05647	\N	3	2020-11-05 18:18:52.187511	2020-11-05 18:18:52.187511	\N	t	\N
75	64331.47367	1400208.3460565172658	2019-06-15	21.76552574	12866294.73363	\N	3	2020-11-05 18:18:52.192511	2020-11-05 18:18:52.192511	\N	t	\N
76	64172.70717	1396752.7097141175558	2019-07-15	21.76552574	12834541.43418	\N	3	2020-11-05 18:18:52.197746	2020-11-05 18:18:52.197746	\N	t	\N
77	63.77863	1334.092471487021	2015-05-15	20.9175467	38267.17717	\N	4	2020-11-05 18:18:52.202695	2020-11-05 18:18:52.202695	\N	t	\N
78	230.74247	4833.3770420210618	2015-06-15	20.94706294	38267.17717	\N	4	2020-11-05 18:18:52.208887	2020-11-05 18:18:52.208887	\N	t	\N
79	679.83266	14269.521892172391	2015-07-15	20.98975635	138445.48117	\N	4	2020-11-05 18:18:52.214326	2020-11-05 18:18:52.214326	\N	t	\N
80	967.85201	20359.5071661390872	2015-08-15	21.03576472	407899.59501	\N	4	2020-11-05 18:18:52.219672	2020-11-05 18:18:52.219672	\N	t	\N
81	1614.91559	34032.1568958253519	2015-09-15	21.07364441	580711.20741	\N	4	2020-11-05 18:18:52.224458	2020-11-05 18:18:52.224458	\N	t	\N
82	1915.31782	40437.9742599933594	2015-10-15	21.11293167	968949.35625	\N	4	2020-11-05 18:18:52.229311	2020-11-05 18:18:52.229311	\N	t	\N
83	3208.90038	67858.1339418658746	2015-11-15	21.14684967	1149190.69172	\N	4	2020-11-05 18:18:52.234583	2020-11-05 18:18:52.234583	\N	t	\N
84	6588.63237	139570.6890619508763	2015-12-15	21.18355999	1925340.22851	\N	4	2020-11-05 18:18:52.240683	2020-11-05 18:18:52.240683	\N	t	\N
85	6588.63237	139824.8694064728057	2016-01-15	21.22213861	3953179.4225	\N	4	2020-11-05 18:18:52.246078	2020-11-05 18:18:52.246078	\N	t	\N
86	6588.63237	139982.7194654753235	2016-02-15	21.24609655	3953179.4225	\N	4	2020-11-05 18:18:52.251305	2020-11-05 18:18:52.251305	\N	t	\N
87	6588.63237	140198.2031908164741	2016-03-15	21.27880193	3953179.4225	\N	4	2020-11-05 18:18:52.256296	2020-11-05 18:18:52.256296	\N	t	\N
88	9055.91156	193052.4586574172104	2016-04-15	21.31783834	5433546.93772	\N	4	2020-11-05 18:18:52.26125	2020-11-05 18:18:52.26125	\N	t	\N
89	9055.91156	193319.2514266399776	2016-05-15	21.34729896	5433546.93772	\N	4	2020-11-05 18:18:52.268496	2020-11-05 18:18:52.268496	\N	t	\N
90	12367.20415	264463.550323140861	2016-06-15	21.38426334	7420322.4905	\N	4	2020-11-05 18:18:52.274517	2020-11-05 18:18:52.274517	\N	t	\N
91	13006.39609	278656.8352305815308	2016-07-15	21.42460012	7803837.65382	\N	4	2020-11-05 18:18:52.280284	2020-11-05 18:18:52.280284	\N	t	\N
92	14026.35219	301096.6120014344331	2016-08-15	21.46649449	8415811.31163	\N	4	2020-11-05 18:18:52.285733	2020-11-05 18:18:52.285733	\N	t	\N
93	14981.70503	322284.3518036663713	2016-09-15	21.51186071	8989023.01858	\N	4	2020-11-05 18:18:52.290493	2020-11-05 18:18:52.290493	\N	t	\N
94	15944.35546	343548.565865962292	2016-10-15	21.5467202	9566613.27341	\N	4	2020-11-05 18:18:52.295359	2020-11-05 18:18:52.295359	\N	t	\N
95	16792.56249	362375.75716289211	2016-11-15	21.579539	10075537.49531	\N	4	2020-11-05 18:18:52.300837	2020-11-05 18:18:52.300837	\N	t	\N
96	17984.77134	388734.067542360459	2016-12-15	21.61462385	10790862.80161	\N	4	2020-11-05 18:18:52.30635	2020-11-05 18:18:52.30635	\N	t	\N
97	18902.7028	409302.592804141924	2017-01-15	21.65312533	11341621.68185	\N	4	2020-11-05 18:18:52.311765	2020-11-05 18:18:52.311765	\N	t	\N
98	19354.10242	419535.6260885103674	2017-02-15	21.67683197	11612461.45252	\N	4	2020-11-05 18:18:52.316845	2020-11-05 18:18:52.316845	\N	t	\N
99	19831.29199	430221.1024642292685	2017-03-15	21.69405315	11898775.19373	\N	4	2020-11-05 18:18:52.321889	2020-11-05 18:18:52.321889	\N	t	\N
100	20014.59952	434570.4500003590704	2017-04-15	21.71267277	12008759.70993	\N	4	2020-11-05 18:18:52.326724	2020-11-05 18:18:52.326724	\N	t	\N
101	20014.59952	434706.2424532844288	2017-05-15	21.71945744	12008759.70993	\N	4	2020-11-05 18:18:52.33234	2020-11-05 18:18:52.33234	\N	t	\N
102	20014.59952	435013.4499437988272	2017-06-15	21.73480661	12008759.70993	\N	4	2020-11-05 18:18:52.337908	2020-11-05 18:18:52.337908	\N	t	\N
103	20506.5849	445964.020210319112	2017-07-17	21.74735688	12303950.94201	\N	4	2020-11-05 18:18:52.343474	2020-11-05 18:18:52.343474	\N	t	\N
104	20506.5849	446208.243383185662	2017-08-15	21.75926638	12303950.94201	\N	4	2020-11-05 18:18:52.348571	2020-11-05 18:18:52.348571	\N	t	\N
105	20506.5849	446336.601480445326	2017-09-15	21.76552574	12303950.94201	\N	4	2020-11-05 18:18:52.353866	2020-11-05 18:18:52.353866	\N	t	\N
106	21092.62517	459092.0760618068758	2017-10-16	21.76552574	12655575.10314	\N	4	2020-11-05 18:18:52.35927	2020-11-05 18:18:52.35927	\N	t	\N
107	21092.62517	459092.0760618068758	2017-11-16	21.76552574	12655575.10314	\N	4	2020-11-05 18:18:52.364766	2020-11-05 18:18:52.364766	\N	t	\N
108	21513.52218	468253.1207668509132	2017-12-15	21.76552574	12908113.30625	\N	4	2020-11-05 18:18:52.372012	2020-11-05 18:18:52.372012	\N	t	\N
109	21466.96023	467239.6754456213202	2018-01-15	21.76552574	12880176.13999	\N	4	2020-11-05 18:18:52.37767	2020-11-05 18:18:52.37767	\N	t	\N
110	21580.17614	469703.8792489038436	2018-02-15	21.76552574	12852099.2879	\N	4	2020-11-05 18:18:52.382486	2020-11-05 18:18:52.382486	\N	t	\N
111	21852.1148	475622.767152834952	2018-03-15	21.76552574	13111268.87778	\N	4	2020-11-05 18:18:52.387725	2020-11-05 18:18:52.387725	\N	t	\N
112	21803.79173	474570.9901289141302	2018-04-15	21.76552574	13082275.03721	\N	4	2020-11-05 18:18:52.393708	2020-11-05 18:18:52.393708	\N	t	\N
113	21755.22705	473513.954336319267	2018-05-15	21.76552574	13053136.22745	\N	4	2020-11-05 18:18:52.399039	2020-11-05 18:18:52.399039	\N	t	\N
114	21706.41954	472451.6332211089596	2018-06-15	21.76552574	13023851.72363	\N	4	2020-11-05 18:18:52.404271	2020-11-05 18:18:52.404271	\N	t	\N
115	21657.368	471384.00066465232	2018-07-16	21.76552574	12994420.79729	\N	4	2020-11-05 18:18:52.409518	2020-11-05 18:18:52.409518	\N	t	\N
116	21608.07119	470311.0296776974306	2018-08-15	21.76552574	12964842.71632	\N	4	2020-11-05 18:18:52.414472	2020-11-05 18:18:52.414472	\N	t	\N
117	21558.52791	469232.6941416134034	2018-09-17	21.76552574	12935116.74495	\N	4	2020-11-05 18:18:52.419704	2020-11-05 18:18:52.419704	\N	t	\N
118	21508.73691	468148.9668494930634	2018-10-15	21.76552574	12905242.14372	\N	4	2020-11-05 18:18:52.425763	2020-11-05 18:18:52.425763	\N	t	\N
119	21621.22921	470597.4209006948654	2018-11-16	21.76552574	13084188.22536	\N	4	2020-11-05 18:18:52.431378	2020-11-05 18:18:52.431378	\N	t	\N
120	21755.87399	473528.0353255415026	2018-12-15	21.76552574	13053524.39336	\N	4	2020-11-05 18:18:52.436836	2020-11-05 18:18:52.436836	\N	t	\N
121	21704.51207	472410.1161337256818	2019-01-15	21.76552574	13022707.24221	\N	4	2020-11-05 18:18:52.441966	2020-11-05 18:18:52.441966	\N	t	\N
122	21652.89334	471286.6073372445716	2019-02-15	21.76552574	12991736.0053	\N	4	2020-11-05 18:18:52.447148	2020-11-05 18:18:52.447148	\N	t	\N
123	21601.01652	470157.4810762252248	2019-03-15	21.76552574	12960609.91221	\N	4	2020-11-05 18:18:52.453481	2020-11-05 18:18:52.453481	\N	t	\N
124	21548.88031	469022.7090554841794	2019-04-15	21.76552574	12929328.18865	\N	4	2020-11-05 18:18:52.460536	2020-11-05 18:18:52.460536	\N	t	\N
125	21496.48343	467882.2634151484882	2019-05-15	21.76552574	12897890.05647	\N	4	2020-11-05 18:18:52.472856	2020-11-05 18:18:52.472856	\N	t	\N
126	21443.82456	466736.1154247241744	2019-06-15	21.76552574	12866294.73363	\N	4	2020-11-05 18:18:52.477948	2020-11-05 18:18:52.477948	\N	t	\N
127	21390.90239	465584.2365713725186	2019-07-15	21.76552574	12834541.43418	\N	4	2020-11-05 18:18:52.484128	2020-11-05 18:18:52.484128	\N	t	\N
128	22.32252	466.932354561684	2015-05-15	20.9175467	38267.17717	\N	5	2020-11-05 18:18:52.490673	2020-11-05 18:18:52.490673	\N	t	\N
129	80.75986	1691.6818704455884	2015-06-15	20.94706294	38267.17717	\N	5	2020-11-05 18:18:52.496272	2020-11-05 18:18:52.496272	\N	t	\N
130	237.94143	4994.3326412705805	2015-07-15	20.98975635	138445.48117	\N	5	2020-11-05 18:18:52.501556	2020-11-05 18:18:52.501556	\N	t	\N
131	338.7482	7125.827434523504	2015-08-15	21.03576472	407899.59501	\N	5	2020-11-05 18:18:52.50651	2020-11-05 18:18:52.50651	\N	t	\N
132	565.22046	11911.2549872966286	2015-09-15	21.07364441	580711.20741	\N	5	2020-11-05 18:18:52.511649	2020-11-05 18:18:52.511649	\N	t	\N
133	670.36124	14153.2910543364708	2015-10-15	21.11293167	968949.35625	\N	5	2020-11-05 18:18:52.51779	2020-11-05 18:18:52.51779	\N	t	\N
134	1123.11513	23750.3468162125071	2015-11-15	21.14684967	1149190.69172	\N	5	2020-11-05 18:18:52.523991	2020-11-05 18:18:52.523991	\N	t	\N
135	2306.02133	48849.7411822745867	2015-12-15	21.18355999	1925340.22851	\N	5	2020-11-05 18:18:52.529403	2020-11-05 18:18:52.529403	\N	t	\N
136	2306.02133	48938.7043028765513	2016-01-15	21.22213861	3953179.4225	\N	5	2020-11-05 18:18:52.534541	2020-11-05 18:18:52.534541	\N	t	\N
137	2306.02133	48993.9518235394115	2016-02-15	21.24609655	3953179.4225	\N	5	2020-11-05 18:18:52.5394	2020-11-05 18:18:52.5394	\N	t	\N
138	2306.02133	49069.3711274251669	2016-03-15	21.27880193	3953179.4225	\N	5	2020-11-05 18:18:52.545065	2020-11-05 18:18:52.545065	\N	t	\N
139	3169.56905	67568.360615367377	2016-04-15	21.31783834	5433546.93772	\N	5	2020-11-05 18:18:52.550707	2020-11-05 18:18:52.550707	\N	t	\N
140	3169.56905	67661.738084713188	2016-05-15	21.34729896	5433546.93772	\N	5	2020-11-05 18:18:52.555813	2020-11-05 18:18:52.555813	\N	t	\N
141	4328.52145	92562.242559638643	2016-06-15	21.38426334	7420322.4905	\N	5	2020-11-05 18:18:52.56122	2020-11-05 18:18:52.56122	\N	t	\N
142	4552.23863	97529.8922985666356	2016-07-15	21.42460012	7803837.65382	\N	5	2020-11-05 18:18:52.568383	2020-11-05 18:18:52.568383	\N	t	\N
143	4909.22327	105383.8142756347823	2016-08-15	21.46649449	8415811.31163	\N	5	2020-11-05 18:18:52.573349	2020-11-05 18:18:52.573349	\N	t	\N
144	5243.59676	112799.5231205272996	2016-09-15	21.51186071	8989023.01858	\N	5	2020-11-05 18:18:52.579817	2020-11-05 18:18:52.579817	\N	t	\N
145	5580.52441	120241.998031540082	2016-10-15	21.5467202	9566613.27341	\N	5	2020-11-05 18:18:52.585345	2020-11-05 18:18:52.585345	\N	t	\N
146	5877.39687	126831.51497464293	2016-11-15	21.579539	10075537.49531	\N	5	2020-11-05 18:18:52.590285	2020-11-05 18:18:52.590285	\N	t	\N
147	6294.66997	136056.9236614407845	2016-12-15	21.61462385	10790862.80161	\N	5	2020-11-05 18:18:52.595205	2020-11-05 18:18:52.595205	\N	t	\N
148	6615.94598	143255.9074814496734	2017-01-15	21.65312533	11341621.68185	\N	5	2020-11-05 18:18:52.600233	2020-11-05 18:18:52.600233	\N	t	\N
149	6773.93585	146837.4691960091245	2017-02-15	21.67683197	11612461.45252	\N	5	2020-11-05 18:18:52.605556	2020-11-05 18:18:52.605556	\N	t	\N
150	6940.9522	150577.38593840943	2017-03-15	21.69405315	11898775.19373	\N	5	2020-11-05 18:18:52.614211	2020-11-05 18:18:52.614211	\N	t	\N
151	7005.10983	152099.6574567003291	2017-04-15	21.71267277	12008759.70993	\N	5	2020-11-05 18:18:52.620062	2020-11-05 18:18:52.620062	\N	t	\N
152	7005.10983	152147.1848152106352	2017-05-15	21.71945744	12008759.70993	\N	5	2020-11-05 18:18:52.62498	2020-11-05 18:18:52.62498	\N	t	\N
153	7005.10983	152254.7074368599763	2017-06-15	21.73480661	12008759.70993	\N	5	2020-11-05 18:18:52.629824	2020-11-05 18:18:52.629824	\N	t	\N
154	7177.30472	156087.4071823484736	2017-07-17	21.74735688	12303950.94201	\N	5	2020-11-05 18:18:52.634974	2020-11-05 18:18:52.634974	\N	t	\N
155	7177.30472	156172.8852929113136	2017-08-15	21.75926638	12303950.94201	\N	5	2020-11-05 18:18:52.64065	2020-11-05 18:18:52.64065	\N	t	\N
156	7177.30472	156217.8106269834928	2017-09-15	21.76552574	12303950.94201	\N	5	2020-11-05 18:18:52.646428	2020-11-05 18:18:52.646428	\N	t	\N
157	7382.41881	159066.912498286962	2017-10-16	21.5467202	12655575.10314	\N	5	2020-11-05 18:18:52.652073	2020-11-05 18:18:52.652073	\N	t	\N
158	7382.41881	160682.2266325151694	2017-11-16	21.76552574	12655575.10314	\N	5	2020-11-05 18:18:52.656713	2020-11-05 18:18:52.656713	\N	t	\N
159	7529.73276	163888.5922031012424	2017-12-15	21.76552574	12908113.30625	\N	5	2020-11-05 18:18:52.661557	2020-11-05 18:18:52.661557	\N	t	\N
160	7513.43608	163533.8863950846992	2018-01-15	21.76552574	12880176.13999	\N	5	2020-11-05 18:18:52.668301	2020-11-05 18:18:52.668301	\N	t	\N
161	7665.06911	166834.2590125838914	2018-02-15	21.76552574	12852099.2879	\N	5	2020-11-05 18:18:52.674115	2020-11-05 18:18:52.674115	\N	t	\N
162	7648.24018	166467.9685034922332	2018-03-15	21.76552574	13111268.87778	\N	5	2020-11-05 18:18:52.679853	2020-11-05 18:18:52.679853	\N	t	\N
163	7631.32711	166099.8466430648114	2018-04-15	21.76552574	13082275.03721	\N	5	2020-11-05 18:18:52.685655	2020-11-05 18:18:52.685655	\N	t	\N
164	7614.32947	165729.8840721255578	2018-05-15	21.76552574	13053136.22745	\N	5	2020-11-05 18:18:52.691184	2020-11-05 18:18:52.691184	\N	t	\N
165	7597.24684	165358.0716491536616	2018-06-15	21.76552574	13023851.72363	\N	5	2020-11-05 18:18:52.696512	2020-11-05 18:18:52.696512	\N	t	\N
166	7580.0788	164984.400232628312	2018-07-16	21.76552574	12994420.79729	\N	5	2020-11-05 18:18:52.702211	2020-11-05 18:18:52.702211	\N	t	\N
167	7562.82492	164608.8604633734408	2018-08-15	21.76552574	12964842.71632	\N	5	2020-11-05 18:18:52.708017	2020-11-05 18:18:52.708017	\N	t	\N
168	7545.48477	164231.4429822129798	2018-09-17	21.76552574	12935116.74495	\N	5	2020-11-05 18:18:52.713259	2020-11-05 18:18:52.713259	\N	t	\N
169	7528.05792	163852.1384299708608	2018-10-15	21.76552574	12905242.14372	\N	5	2020-11-05 18:18:52.718611	2020-11-05 18:18:52.718611	\N	t	\N
170	7632.44313	166124.1374051011662	2018-11-16	21.76552574	13084188.22536	\N	5	2020-11-05 18:18:52.72368	2020-11-05 18:18:52.72368	\N	t	\N
171	7614.5559	165734.812440118866	2018-12-15	21.76552574	13053524.39336	\N	5	2020-11-05 18:18:52.728845	2020-11-05 18:18:52.728845	\N	t	\N
172	7596.57922	165343.5405488591228	2019-01-15	21.76552574	13022707.24221	\N	5	2020-11-05 18:18:52.734585	2020-11-05 18:18:52.734585	\N	t	\N
173	7578.51267	164950.3125898011258	2019-02-15	21.76552574	12991736.0053	\N	5	2020-11-05 18:18:52.739851	2020-11-05 18:18:52.739851	\N	t	\N
174	7560.35578	164555.1183331477772	2019-03-15	21.76552574	12960609.91221	\N	5	2020-11-05 18:18:52.745161	2020-11-05 18:18:52.745161	\N	t	\N
175	7542.10811	164157.9482020677514	2019-04-15	21.76552574	12929328.18865	\N	5	2020-11-05 18:18:52.750245	2020-11-05 18:18:52.750245	\N	t	\N
176	7523.7692	163758.792184419208	2019-05-15	21.76552574	12897890.05647	\N	5	2020-11-05 18:18:52.755357	2020-11-05 18:18:52.755357	\N	t	\N
177	7505.33859	163357.6402680603066	2019-06-15	21.76552574	12866294.73363	\N	5	2020-11-05 18:18:52.761159	2020-11-05 18:18:52.761159	\N	t	\N
178	7486.81584	162954.4828761597216	2019-07-15	21.76552574	12834541.43418	\N	5	2020-11-05 18:18:52.768251	2020-11-05 18:18:52.768251	\N	t	\N
179	27937.1662582689	608067.111297011230791486	2017-12-15	21.76552574	12908113.30625	\N	2	2020-11-05 18:18:52.774172	2020-11-05 18:18:52.774172	\N	t	\N
180	28076.8520900616	611107.446864408552985584	2018-01-15	21.76552574	12880176.13999	\N	2	2020-11-05 18:18:52.77999	2020-11-05 18:18:52.77999	\N	t	\N
181	28849.5926027462	627926.550383586010787188	2018-02-15	21.76552574	12852099.2879	\N	2	2020-11-05 18:18:52.785389	2020-11-05 18:18:52.785389	\N	t	\N
182	28993.8405657599	631066.183135503266109826	2018-03-15	21.76552574	13111268.87778	\N	2	2020-11-05 18:18:52.791464	2020-11-05 18:18:52.791464	\N	t	\N
183	29138.8097685887	634221.514051180793323138	2018-04-15	21.76552574	13082275.03721	\N	2	2020-11-05 18:18:52.797386	2020-11-05 18:18:52.797386	\N	t	\N
184	29284.5038174316	637392.621621435750489384	2018-05-15	21.76552574	13053136.22745	\N	2	2020-11-05 18:18:52.802983	2020-11-05 18:18:52.802983	\N	t	\N
185	29430.9263365188	640579.584729543843393912	2018-06-15	21.76552574	13023851.72363	\N	2	2020-11-05 18:18:52.807969	2020-11-05 18:18:52.807969	\N	t	\N
186	29578.08097	643782.4826923391678	2018-07-16	21.76552574	12994420.79729	\N	2	2020-11-05 18:18:52.813099	2020-11-05 18:18:52.813099	\N	t	\N
187	29725.97137	647001.3950002380638	2018-08-15	21.76552574	12964842.71632	\N	2	2020-11-05 18:18:52.818324	2020-11-05 18:18:52.818324	\N	t	\N
188	29874.60123	650236.4020438006602	2018-09-17	21.76552574	12935116.74495	\N	2	2020-11-05 18:18:52.82444	2020-11-05 18:18:52.82444	\N	t	\N
189	30023.97424	653487.5841378169376	2018-10-15	21.76552574	12905242.14372	\N	2	2020-11-05 18:18:52.830182	2020-11-05 18:18:52.830182	\N	t	\N
190	30663.83199	667414.4244653804226	2018-11-16	21.76552574	13084188.22536	\N	2	2020-11-05 18:18:52.835728	2020-11-05 18:18:52.835728	\N	t	\N
191	30817.15115	670751.496588795601	2018-12-15	21.76552574	13053524.39336	\N	2	2020-11-05 18:18:52.840766	2020-11-05 18:18:52.840766	\N	t	\N
192	30971.236912	674105.25420777411488	2019-01-15	21.76552574	13022707.24221	\N	2	2020-11-05 18:18:52.845971	2020-11-05 18:18:52.845971	\N	t	\N
193	31126.09309	677475.7803360311366	2019-02-15	21.76552574	12991736.0053	\N	2	2020-11-05 18:18:52.851766	2020-11-05 18:18:52.851766	\N	t	\N
194	31281.72356	680863.1593367444344	2019-03-15	21.76552574	12960609.91221	\N	2	2020-11-05 18:18:52.857503	2020-11-05 18:18:52.857503	\N	t	\N
195	31438.13218	684267.4751813123132	2019-04-15	21.76552574	12929328.18865	\N	2	2020-11-05 18:18:52.863036	2020-11-05 18:18:52.863036	\N	t	\N
196	31595.32284	687688.8125376299016	2019-05-15	21.76552574	12897890.05647	\N	2	2020-11-05 18:18:52.870004	2020-11-05 18:18:52.870004	\N	t	\N
197	31753.29945	691127.256508902843	2019-06-15	21.76552574	12866294.73363	\N	2	2020-11-05 18:18:52.875368	2020-11-05 18:18:52.875368	\N	t	\N
198	31912.06595	694582.892851302553	2019-07-15	21.76552574	12834541.43418	\N	2	2020-11-05 18:18:52.881019	2020-11-05 18:18:52.881019	\N	t	\N
199	2408990.48	7836446.03144	2017-05-30	3.253	0.0	\N	7	2020-11-05 18:18:52.887268	2020-11-05 18:18:52.887268	\N	t	\N
200	11015060.44	36140413.30364	2017-06-05	3.281	2408990.48	\N	7	2020-11-05 18:18:52.896237	2020-11-05 18:18:52.896237	\N	t	\N
201	4029385.92	13081401.38928	2017-10-20	3.2465	13424050.92	\N	7	2020-11-05 18:18:52.901217	2020-11-05 18:18:52.901217	\N	t	\N
202	2581628.5	8281864.228	2017-11-22	3.208	17453436.84	\N	7	2020-11-05 18:18:52.905808	2020-11-05 18:18:52.905808	\N	t	\N
203	4685650.71	15518875.15152	2017-12-20	3.312	20035065.34	\N	7	2020-11-05 18:18:52.910675	2020-11-05 18:18:52.910675	2017-12-22	t	\N
204	1380706.92	4960879.96356	2018-05-04	3.593	24720716.05	\N	7	2020-11-05 18:18:52.916719	2020-11-05 18:18:52.916719	2018-05-09	t	\N
205	3987951.0	15403460.7375	2018-07-05	3.8625	26101422.97	\N	7	2020-11-05 18:18:52.922355	2020-11-05 18:18:52.922355	2018-07-11	t	\N
206	6500000.0	23981750.0	2018-10-26	3.6895	30089373.97	\N	7	2020-11-05 18:18:52.927493	2020-11-05 18:18:52.927493	2018-10-30	t	\N
207	3350000.0	12830500.0	2019-03-12	3.83	36589373.97	\N	7	2020-11-05 18:18:52.932328	2020-11-05 18:18:52.932328	2018-03-18	t	\N
208	215629.57	697130.39981	2017-11-30	3.233	17453436.84	\N	9	2020-11-05 18:18:52.937359	2020-11-05 18:18:52.937359	\N	t	\N
209	434329.9	1617010.2177	2018-05-30	3.723	24720716.05	\N	9	2020-11-05 18:18:52.941946	2020-11-05 18:18:52.941946	\N	t	\N
210	638654.3	2471911.46815	2018-11-30	3.8705	36589373.97	\N	9	2020-11-05 18:18:52.948317	2020-11-05 18:18:52.948317	\N	t	\N
211	914022.69	3689909.59953	2019-05-30	4.037	39939373.97	\N	9	2020-11-05 18:18:52.952851	2020-11-05 18:18:52.952851	\N	t	\N
212	987323.42	3985824.64654	2019-11-30	4.037	39939373.97	\N	9	2020-11-05 18:18:52.95736	2020-11-05 18:18:52.95736	\N	t	\N
213	155517.3	502787.4309	2017-11-30	3.233	17453436.84	\N	10	2020-11-05 18:18:52.961987	2020-11-05 18:18:52.961987	\N	t	\N
214	131574.78	489852.90594	2018-05-30	3.723	24720716.05	\N	10	2020-11-05 18:18:52.968046	2020-11-05 18:18:52.968046	\N	t	\N
215	126109.11	488105.310255	2018-11-30	3.8705	36589373.97	\N	10	2020-11-05 18:18:52.972575	2020-11-05 18:18:52.972575	\N	t	\N
216	106800.29	431152.77073	2019-05-30	4.037	39939373.97	\N	10	2020-11-05 18:18:52.977482	2020-11-05 18:18:52.977482	\N	t	\N
217	107441.79	433742.50623	2019-11-30	4.037	39939373.97	\N	10	2020-11-05 18:18:52.982457	2020-11-05 18:18:52.982457	\N	t	\N
218	12030000.0	3006657.9	2014-11-14	0.400112931	0.0	\N	12	2020-11-05 18:18:52.987126	2020-11-05 18:18:52.987126	\N	t	\N
219	9943227.53	34304134.98	2016-05-31	0.289855072	1203000.0	\N	12	2020-11-05 18:18:52.993034	2020-11-05 18:18:52.993034	\N	t	\N
220	7591386.98	24296234.03	2017-12-22	0.3124511795	11146227.53	\N	12	2020-11-05 18:18:52.998038	2020-11-05 18:18:52.998038	2018-01-19	t	\N
221	5051688.4	3006657.9	2019-06-21	0.260960334	23320862.55	\N	12	2020-11-05 18:18:53.002669	2020-11-05 18:18:53.002669	2019-06-26	t	\N
222	5713.75	17426.92	2015-04-15	0.327869181702790854608846543	1203000.0	\N	14	2020-11-05 18:18:53.007872	2020-11-05 18:18:53.007872	\N	\N	\N
223	7165.93	28240.93	2015-10-15	0.253742706065274762552083094	1203000.0	\N	14	2020-11-05 18:18:53.013119	2020-11-05 18:18:53.013119	\N	\N	\N
224	11414.32	40264.01	2016-04-15	0.283486915486063111945382489	1203000.0	\N	14	2020-11-05 18:18:53.018189	2020-11-05 18:18:53.018189	\N	\N	\N
225	82242.95	260874.64	2016-10-15	0.315258508837808075173577623	11146227.53	\N	14	2020-11-05 18:18:53.023366	2020-11-05 18:18:53.023366	\N	\N	\N
226	114972.74	356530.47	2017-04-15	0.32247661749639518888806334	11146227.53	\N	14	2020-11-05 18:18:53.028918	2020-11-05 18:18:53.028918	\N	\N	\N
227	122525.9	390122.47	2017-10-15	0.314070348216548511035521743	11146227.53	\N	14	2020-11-05 18:18:53.034375	2020-11-05 18:18:53.034375	\N	\N	\N
228	202229.9	686853.63	2018-04-15	0.294429396842526696699557371	18737614.51	\N	14	2020-11-05 18:18:53.039083	2020-11-05 18:18:53.039083	\N	\N	\N
229	309632.66	1164373.62	2018-10-15	0.265922084356394127170280618	18737614.51	\N	14	2020-11-05 18:18:53.044663	2020-11-05 18:18:53.044663	\N	\N	\N
230	341394.19	1316928.09	2019-04-15	0.259235255586354756849328045	18737614.51	\N	14	2020-11-05 18:18:53.050299	2020-11-05 18:18:53.050299	\N	\N	\N
231	358098.87	1466056.77	2019-10-15	0.24425989315543353754302434	23320862.55	\N	14	2020-11-05 18:18:53.054982	2020-11-05 18:18:53.054982	\N	\N	\N
232	30639.93	74455.03	2014-10-15	0.411522633192142962000015311	0.0	\N	15	2020-11-05 18:18:53.059638	2020-11-05 18:18:53.059638	\N	\N	\N
233	31772.41	96905.85	2015-04-15	0.327868854150704008065560541	1203000.0	\N	15	2020-11-05 18:18:53.064301	2020-11-05 18:18:53.064301	\N	\N	\N
234	31670.28	124812.57	2015-10-15	0.253742711972039354689996368	1203000.0	\N	15	2020-11-05 18:18:53.07053	2020-11-05 18:18:53.07053	\N	\N	\N
235	81585.81	287793.94	2016-04-15	0.283486893434934731426241984	1203000.0	\N	15	2020-11-05 18:18:53.075466	2020-11-05 18:18:53.075466	\N	\N	\N
236	44557.91	141337.69	2016-10-15	0.315258513139701094591258708	11146227.53	\N	15	2020-11-05 18:18:53.080423	2020-11-05 18:18:53.080423	\N	\N	\N
237	38159.74	118333.35	2017-04-15	0.322476630637094276465594864	11146227.53	\N	15	2020-11-05 18:18:53.08538	2020-11-05 18:18:53.08538	\N	\N	\N
238	38414.39	122311.42	2017-10-15	0.314070346006938681604710337	11146227.53	\N	15	2020-11-05 18:18:53.090019	2020-11-05 18:18:53.090019	\N	\N	\N
239	26349.43	89493.2	2018-04-15	0.294429409161813411521769252	18737614.51	\N	15	2020-11-05 18:18:53.094632	2020-11-05 18:18:53.094632	\N	\N	\N
240	19383.93	72893.27	2018-10-15	0.265922080323739077695375718	18737614.51	\N	15	2020-11-05 18:18:53.099161	2020-11-05 18:18:53.099161	\N	\N	\N
241	19278.0	74364.89	2019-04-15	0.259235238564865758558911336	18737614.51	\N	15	2020-11-05 18:18:53.103546	2020-11-05 18:18:53.103546	\N	\N	\N
242	11356.59	46493.88	2019-10-15	0.244259889688707416976169767	23320862.55	\N	15	2020-11-05 18:18:53.107708	2020-11-05 18:18:53.107708	\N	\N	\N
243	468440.36	1807008.69	2019-04-15	0.259235255808316007600384036	18737614.51	\N	13	2020-11-05 18:18:53.11195	2020-11-05 18:18:53.11195	\N	\N	\N
244	597970.87	2448092.74	2019-10-15	0.244259892703247835292383572	23320862.55	\N	13	2020-11-05 18:18:53.116106	2020-11-05 18:18:53.116106	\N	\N	\N
245	125371.278	175000.0	2015-01-29	1.395854	0.0	\N	16	2020-11-05 18:18:53.120331	2020-11-05 18:18:53.120331	\N	t	\N
246	206385.691	290189.22	2015-02-24	1.406053	125371.278	\N	16	2020-11-05 18:18:53.124486	2020-11-05 18:18:53.124486	\N	t	\N
247	624784.5539	896391.52	2015-04-28	1.434721	331756.969	\N	16	2020-11-05 18:18:53.128629	2020-11-05 18:18:53.128629	\N	t	\N
248	522952.5584	799858.03	2015-10-26	1.529504	956541.5229	\N	16	2020-11-05 18:18:53.132759	2020-11-05 18:18:53.132759	\N	t	\N
249	858739.6504	1371244.92	2016-02-24	1.596811	1479494.0813	\N	16	2020-11-05 18:18:53.1371	2020-11-05 18:18:53.1371	\N	t	\N
250	548930.0373	884398.2	2016-03-18	1.611131	2338233.7317	\N	16	2020-11-05 18:18:53.141232	2020-11-05 18:18:53.141232	\N	t	\N
251	1094681.3614	1824918.12	2016-06-22	1.667077	2887163.769	\N	16	2020-11-05 18:18:53.145496	2020-11-05 18:18:53.145496	\N	t	\N
252	1178.1416	5678.8467	2015-04-15	1.12459645	331756.969	\N	18	2020-11-05 18:18:53.149833	2020-11-05 18:18:53.149833	\N	\N	\N
253	4701.1907	1.73571224	2015-07-15	1.12459645	956541.5229	\N	18	2020-11-05 18:18:53.154084	2020-11-05 18:18:53.154084	\N	\N	\N
254	5301.1531	4301.5484	2015-10-15	1.12459645	956541.5229	\N	18	2020-11-05 18:18:53.158259	2020-11-05 18:18:53.158259	\N	\N	\N
255	7754.1005	4301.5484	2016-01-15	1.12459645	1479494.0813	\N	18	2020-11-05 18:18:53.162536	2020-11-05 18:18:53.162536	\N	\N	\N
256	11517.4879	1.73571224	2016-04-15	1.65748987	2887163.769	\N	18	2020-11-05 18:18:53.16815	2020-11-05 18:18:53.16815	\N	\N	\N
\.


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.active_storage_attachments_id_seq', 1, false);


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.active_storage_blobs_id_seq', 1, false);


--
-- Name: attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.attachments_id_seq', 15, true);


--
-- Name: creditors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.creditors_id_seq', 10, true);


--
-- Name: currencies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.currencies_id_seq', 8, true);


--
-- Name: debts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.debts_id_seq', 15, true);


--
-- Name: transaction_infos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.transaction_infos_id_seq', 78, true);


--
-- Name: transaction_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.transaction_items_id_seq', 509, true);


--
-- Name: active_storage_attachments active_storage_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT active_storage_attachments_pkey PRIMARY KEY (id);


--
-- Name: active_storage_blobs active_storage_blobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_storage_blobs
    ADD CONSTRAINT active_storage_blobs_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: attachments attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attachments
    ADD CONSTRAINT attachments_pkey PRIMARY KEY (id);


--
-- Name: creditors creditors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.creditors
    ADD CONSTRAINT creditors_pkey PRIMARY KEY (id);


--
-- Name: currencies currencies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.currencies
    ADD CONSTRAINT currencies_pkey PRIMARY KEY (id);


--
-- Name: debts debts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.debts
    ADD CONSTRAINT debts_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: transaction_infos transaction_infos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction_infos
    ADD CONSTRAINT transaction_infos_pkey PRIMARY KEY (id);


--
-- Name: transaction_items transaction_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction_items
    ADD CONSTRAINT transaction_items_pkey PRIMARY KEY (id);


--
-- Name: index_active_storage_attachments_on_blob_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_active_storage_attachments_on_blob_id ON public.active_storage_attachments USING btree (blob_id);


--
-- Name: index_active_storage_attachments_uniqueness; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_active_storage_attachments_uniqueness ON public.active_storage_attachments USING btree (record_type, record_id, name, blob_id);


--
-- Name: index_active_storage_blobs_on_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_active_storage_blobs_on_key ON public.active_storage_blobs USING btree (key);


--
-- Name: active_storage_attachments fk_rails_c3b3935057; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT fk_rails_c3b3935057 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- PostgreSQL database dump complete
--

--
-- Database "sigdiv_production" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.0 (Debian 13.0-1.pgdg100+1)
-- Dumped by pg_dump version 13.0 (Debian 13.0-1.pgdg100+1)

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
-- Name: sigdiv_production; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE sigdiv_production WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE sigdiv_production OWNER TO postgres;

\connect sigdiv_production

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

SET default_table_access_method = heap;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO postgres;

--
-- Name: attachments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.attachments (
    id bigint NOT NULL,
    name character varying,
    description text,
    file character varying,
    debt_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.attachments OWNER TO postgres;

--
-- Name: attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.attachments_id_seq OWNER TO postgres;

--
-- Name: attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.attachments_id_seq OWNED BY public.attachments.id;


--
-- Name: creditors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.creditors (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    financial_agent boolean DEFAULT false
);


ALTER TABLE public.creditors OWNER TO postgres;

--
-- Name: creditors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.creditors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.creditors_id_seq OWNER TO postgres;

--
-- Name: creditors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.creditors_id_seq OWNED BY public.creditors.id;


--
-- Name: currencies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.currencies (
    id bigint NOT NULL,
    name character varying,
    formula character varying,
    description text,
    last_currency character varying,
    date_currency date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.currencies OWNER TO postgres;

--
-- Name: currencies_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.currencies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.currencies_id_seq OWNER TO postgres;

--
-- Name: currencies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.currencies_id_seq OWNED BY public.currencies.id;


--
-- Name: debts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.debts (
    id bigint NOT NULL,
    code integer,
    contract_value numeric,
    signature_date date,
    creditor_id integer,
    grace_period date,
    amortization_period date,
    purpose text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    amortization_type integer,
    financial_agent_id integer,
    applicable_legislation character varying,
    legislation_level integer,
    name character varying,
    notes text,
    category integer,
    currency_id integer,
    loan_term integer,
    interest_rate numeric,
    decimal_places integer,
    start_amt_next_month_to_grace_period boolean
);


ALTER TABLE public.debts OWNER TO postgres;

--
-- Name: debts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.debts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.debts_id_seq OWNER TO postgres;

--
-- Name: debts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.debts_id_seq OWNED BY public.debts.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO postgres;

--
-- Name: transaction_infos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transaction_infos (
    id bigint NOT NULL,
    formula character varying,
    payment_day integer,
    description text,
    debt_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    frequency integer,
    category_number integer,
    slug character varying,
    base numeric,
    bind_withdraw boolean
);


ALTER TABLE public.transaction_infos OWNER TO postgres;

--
-- Name: transaction_infos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.transaction_infos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.transaction_infos_id_seq OWNER TO postgres;

--
-- Name: transaction_infos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.transaction_infos_id_seq OWNED BY public.transaction_infos.id;


--
-- Name: transaction_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transaction_items (
    id bigint NOT NULL,
    value numeric,
    value_brl numeric,
    date date,
    exchange_rate numeric,
    start_balance numeric,
    start_outstanding_balance_brl numeric,
    transaction_info_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    internalization_date date,
    confirmed boolean,
    formula character varying
);


ALTER TABLE public.transaction_items OWNER TO postgres;

--
-- Name: transaction_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.transaction_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.transaction_items_id_seq OWNER TO postgres;

--
-- Name: transaction_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.transaction_items_id_seq OWNED BY public.transaction_items.id;


--
-- Name: attachments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attachments ALTER COLUMN id SET DEFAULT nextval('public.attachments_id_seq'::regclass);


--
-- Name: creditors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.creditors ALTER COLUMN id SET DEFAULT nextval('public.creditors_id_seq'::regclass);


--
-- Name: currencies id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.currencies ALTER COLUMN id SET DEFAULT nextval('public.currencies_id_seq'::regclass);


--
-- Name: debts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.debts ALTER COLUMN id SET DEFAULT nextval('public.debts_id_seq'::regclass);


--
-- Name: transaction_infos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction_infos ALTER COLUMN id SET DEFAULT nextval('public.transaction_infos_id_seq'::regclass);


--
-- Name: transaction_items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction_items ALTER COLUMN id SET DEFAULT nextval('public.transaction_items_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	production	2020-10-27 21:01:34.259257	2020-10-27 21:01:34.259257
\.


--
-- Data for Name: attachments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.attachments (id, name, description, file, debt_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: creditors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.creditors (id, name, created_at, updated_at, financial_agent) FROM stdin;
1	CAIXA ECONÔMICA FEDERAL	2020-10-27 21:01:34.383808	2020-10-27 21:01:34.383808	t
2	Corporação Andina de Fomento - CAF	2020-10-27 21:01:34.389306	2020-10-27 21:01:34.389306	f
3	BNDES	2020-10-27 21:01:34.391531	2020-10-27 21:01:34.391531	t
4	BANCO DO BRASIL	2020-10-27 21:01:34.394827	2020-10-27 21:01:34.394827	t
5	BID	2020-10-27 21:01:34.397309	2020-10-27 21:01:34.397309	f
\.


--
-- Data for Name: currencies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.currencies (id, name, formula, description, last_currency, date_currency, created_at, updated_at) FROM stdin;
1	BRL	1	\N	\N	\N	2020-10-27 21:01:34.41078	2020-10-27 21:01:34.41078
2	USD	[BACEN1]	\N	\N	\N	2020-10-27 21:01:34.413362	2020-10-27 21:01:34.413362
3	URTJLP	[BNDES314]	\N	\N	\N	2020-10-27 21:01:34.415346	2020-10-27 21:01:34.415346
\.


--
-- Data for Name: debts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.debts (id, code, contract_value, signature_date, creditor_id, grace_period, amortization_period, purpose, created_at, updated_at, amortization_type, financial_agent_id, applicable_legislation, legislation_level, name, notes, category, currency_id, loan_term, interest_rate, decimal_places, start_amt_next_month_to_grace_period) FROM stdin;
1	123456	292320000.0	2013-11-19	1	2017-11-19	2033-11-19	Programa destinado à Implantação do Corredor BRT TransOcênica - Charitas/Centro	2020-10-27 21:01:34.448745	2020-10-27 21:01:34.448745	1	\N	\N	\N	Caixa Transoceânica	\N	0	1	240	0.005	5	t
2	123789	100000000.0	2016-11-30	2	2021-05-30	2028-11-30	Programa região oceânica sustentável	2020-10-27 21:01:34.454653	2020-10-27 21:01:34.454653	0	1		\N	CAF		1	2	16	1.95	2	f
3	123799	26470000.0	2016-11-30	5	2019-04-15	2038-10-15	ProCidades - Programa de Desenvolvimento Urbano e Inclusão Social de Niterói	2020-10-27 21:01:34.459633	2020-10-27 21:01:34.459633	0	4		\N	BID		1	2	40	2.75	2	f
4	212345	6242000.0	2014-12-22	3	2017-02-15	2023-11-15	Programa de Modernização da Administração Tributária e da Gestão dos Setores Sociais Básicos - PMAT	2020-10-27 21:01:34.465354	2020-10-27 21:01:34.465354	0	3		\N	PMAT  - BNDES - SubC. A		0	1	72	2.2	4	f
5	212346	21847000.0	2014-12-22	3	2017-02-15	2023-11-15	Programa de Modernização da Administração Tributária e da Gestão dos Setores Sociais Básicos - PMAT	2020-10-27 21:01:34.470223	2020-10-27 21:01:34.470223	0	3		\N	PMAT  - BNDES - SubC. B		0	1	72	2.2	6	f
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.schema_migrations (version) FROM stdin;
20181123150812
20181123150845
20181204154339
20181204160614
20181204161949
20181204162827
20181204165320
20181204165354
20181204172415
20181214151944
20181214152035
20181214152402
20181217152939
20181218165740
20181221175527
20181221180221
20181227165515
20190109173130
20190110145821
20190116190903
20190117134059
20190122133804
20190122133844
20190218153020
20190218153106
20190218173752
20190218194936
20190219174653
20190225153116
20190227190850
20190227190953
20190227191021
20190227195217
20190228172511
20190228184229
20190326163958
20190326164558
20190329164210
20190329164225
20190329165048
20190329165114
20190404200906
20190409160627
20190409161126
20190509180846
20190509180910
20190509180933
20190509185645
20190509185858
20190509190013
20190524180248
20190524181004
20190527192353
20190605181907
20190605184638
20190606184647
20190607182344
20190802152325
20190802153441
20190802183529
20190806190924
20190806193127
20190813140250
20190814164515
20190910152147
20191008155630
20191025174708
20200310144724
20200310150056
20200506094533
20200604170956
20201008211338
\.


--
-- Data for Name: transaction_infos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transaction_infos (id, formula, payment_day, description, debt_id, created_at, updated_at, frequency, category_number, slug, base, bind_withdraw) FROM stdin;
1		15	\N	1	2020-10-27 21:01:34.487752	2020-10-27 21:01:34.487752	\N	1	D	\N	\N
2	[PGTO] - [SALDO] * [JUROS]	15	\N	1	2020-10-27 21:01:34.490236	2020-10-27 21:01:34.490236	1	2	A	\N	\N
3	[SALDO] * [JUROS]	15	\N	1	2020-10-27 21:01:34.492514	2020-10-27 21:01:34.492514	1	3	J	\N	\N
4	[SALDO] * (0.02 / 12)	15	Taxa Adm	1	2020-10-27 21:01:34.495576	2020-10-27 21:01:34.495576	1	4	TA	2.0	\N
5	[SALDO] * (0.007 / 12)	15	Taxa Risco	1	2020-10-27 21:01:34.497788	2020-10-27 21:01:34.497788	1	4	TR	0.7	\N
6	\N	\N	\N	1	2020-10-27 21:01:34.500224	2020-10-27 21:01:34.500224	\N	5	EE	\N	\N
7		30	\N	2	2020-10-27 21:01:34.502436	2020-10-27 21:01:34.502436	\N	1	D	\N	\N
8	[SALDO] / ([PARCELAS] - [N_PARCELA])	30	\N	2	2020-10-27 21:01:34.504706	2020-10-27 21:01:34.504706	6	2	A	\N	\N
9	[SALDO] * ((1.95 / 100 / 360) * [DELTA_DATA])	30	\N	2	2020-10-27 21:01:34.506829	2020-10-27 21:01:34.506829	6	3	J	\N	\N
10	([VALOR_CONTRATO] - [SALDO]) * ((0.35 / 100 / 360) * [DELTA_DATA])	30	Comissão de crédito	2	2020-10-27 21:01:34.509136	2020-10-27 21:01:34.509136	6	4	CC	0.35	t
11	\N	\N	\N	2	2020-10-27 21:01:34.512477	2020-10-27 21:01:34.512477	\N	5	EE	\N	\N
12		15	\N	3	2020-10-27 21:01:34.514717	2020-10-27 21:01:34.514717	\N	1	D	\N	\N
13	[SALDO] / ([PARCELAS] - [N_PARCELA])	15	\N	3	2020-10-27 21:01:34.517524	2020-10-27 21:01:34.517524	6	2	A	\N	\N
14	[SALDO] * ((1.95 / 100 / 360) * [DELTA_DATA])	15	\N	3	2020-10-27 21:01:34.5211	2020-10-27 21:01:34.5211	6	3	J	\N	\N
15	([VALOR_CONTRATO] - [SALDO]) * ((0.35 / 100 / 360) * [DELTA_DATA])	15	Comissão de crédito	3	2020-10-27 21:01:34.523617	2020-10-27 21:01:34.523617	6	4	CC	0.35	t
16		15	\N	4	2020-10-27 21:01:34.526774	2020-10-27 21:01:34.526774	\N	1	D	\N	\N
17	[SALDO] / ([PARCELAS] - [N_PARCELA])	15	\N	4	2020-10-27 21:01:34.529506	2020-10-27 21:01:34.529506	1	2	A	\N	\N
18	[SALDO] * ((1.95 / 100 / 360) * [DELTA_DATA])	15	\N	4	2020-10-27 21:01:34.531914	2020-10-27 21:01:34.531914	1	3	J	\N	\N
19	\N	\N	\N	4	2020-10-27 21:01:34.534152	2020-10-27 21:01:34.534152	\N	5	EE	\N	\N
20		15	\N	5	2020-10-27 21:01:34.536216	2020-10-27 21:01:34.536216	\N	1	D	\N	\N
21	[SALDO] / ([PARCELAS] - [N_PARCELA])	15	\N	5	2020-10-27 21:01:34.538376	2020-10-27 21:01:34.538376	1	2	A	\N	\N
22	[SALDO] * ((1.95 / 100 / 360) * [DELTA_DATA])	15	\N	5	2020-10-27 21:01:34.540557	2020-10-27 21:01:34.540557	1	3	J	\N	\N
23	\N	\N	\N	5	2020-10-27 21:01:34.54312	2020-10-27 21:01:34.54312	\N	5	EE	\N	\N
\.


--
-- Data for Name: transaction_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transaction_items (id, value, value_brl, date, exchange_rate, start_balance, start_outstanding_balance_brl, transaction_info_id, created_at, updated_at, internalization_date, confirmed, formula) FROM stdin;
1	38267.1771676987	800224.9	2015-05-08	20.91152155	0.0	\N	1	2020-10-27 21:01:34.563999	2020-10-27 21:01:34.563999	\N	t	\N
2	100178.304001591	2099165.37	2015-06-19	20.95429136	38267.17717	\N	1	2020-10-27 21:01:34.567216	2020-10-27 21:01:34.567216	\N	t	\N
3	269454.113840257	5659740.67	2015-07-24	21.00446933	138445.48117	\N	1	2020-10-27 21:01:34.570215	2020-10-27 21:01:34.570215	\N	t	\N
4	172811.612402003	3636516.2	2015-08-21	21.0432398	407899.59501	\N	1	2020-10-27 21:01:34.573273	2020-10-27 21:01:34.573273	\N	t	\N
5	388238.148837079	8185330.12	2015-09-22	21.08327104	580711.20741	\N	1	2020-10-27 21:01:34.575833	2020-10-27 21:01:34.575833	\N	t	\N
6	180241.335471127	3807043.73	2015-10-22	21.12192367	968949.35625	\N	1	2020-10-27 21:01:34.57926	2020-10-27 21:01:34.57926	\N	t	\N
7	776149.536786542	16418436.94	2015-11-23	21.1537032	1149190.69172	\N	1	2020-10-27 21:01:34.581822	2020-10-27 21:01:34.581822	\N	t	\N
8	2027839.19399659	42965630.86	2015-12-17	21.18788856	1925340.22851	\N	1	2020-10-27 21:01:34.584693	2020-10-27 21:01:34.584693	\N	t	\N
9	1480367.51522129	31500447.14	2016-03-15	21.27880193	3953179.4225	\N	1	2020-10-27 21:01:34.587474	2020-10-27 21:01:34.587474	\N	t	\N
10	1986775.5527745	42393733.38	2016-05-06	21.33795804	5433546.93772	\N	1	2020-10-27 21:01:34.590276	2020-10-27 21:01:34.590276	\N	t	\N
11	383515.163323288	8207278.03	2016-06-27	21.40013959	7420322.4905	\N	1	2020-10-27 21:01:34.593219	2020-10-27 21:01:34.593219	\N	t	\N
12	611973.657811069	13121407.28	2016-07-29	21.44113086	7803837.65382	\N	1	2020-10-27 21:01:34.596586	2020-10-27 21:01:34.596586	\N	t	\N
13	573211.706951141	12319813.16	2016-08-30	21.49260563	8415811.31163	\N	1	2020-10-27 21:01:34.59921	2020-10-27 21:01:34.59921	\N	t	\N
14	577590.254823738	12435287.93	2016-09-30	21.52960135	8989023.01858	\N	1	2020-10-27 21:01:34.601854	2020-10-27 21:01:34.601854	\N	t	\N
15	508924.2218972	10973544.54	2016-10-28	21.56223671	9566613.27341	\N	1	2020-10-27 21:01:34.604382	2020-10-27 21:01:34.604382	\N	t	\N
16	715325.306302176	15447408.0	2016-11-30	21.5949413	10075537.49531	\N	1	2020-10-27 21:01:34.606572	2020-10-27 21:01:34.606572	\N	t	\N
17	550758.880241646	11909445.03	2016-12-22	21.62370042	10790862.80161	\N	1	2020-10-27 21:01:34.608961	2020-10-27 21:01:34.608961	\N	t	\N
18	270839.770669423	5869510.23	2017-01-31	21.67152267	11341621.68185	\N	1	2020-10-27 21:01:34.61232	2020-10-27 21:01:34.61232	\N	t	\N
19	286313.741213063	6207267.82	2017-03-02	21.67995079	11612461.45252	\N	1	2020-10-27 21:01:34.614988	2020-10-27 21:01:34.614988	\N	t	\N
20	109984.5161992	2388057.81	2017-05-02	21.71267277	11898775.19373	\N	1	2020-10-27 21:01:34.617656	2020-10-27 21:01:34.617656	\N	t	\N
21	295191.232075548	6417561.7	2017-06-30	21.74035338	12008759.70993	\N	1	2020-10-27 21:01:34.621506	2020-10-27 21:01:34.621506	\N	t	\N
22	351624.161135471	7653284.73	2017-09-18	21.76552574	12303950.94201	\N	1	2020-10-27 21:01:34.624962	2020-10-27 21:01:34.624962	\N	t	\N
23	252538.2031043	5496626.76	2017-11-13	21.76552574	12655575.10314	\N	1	2020-10-27 21:01:34.62993	2020-10-27 21:01:34.62993	\N	t	\N
24	288019.18248541	5496626.76	2018-02-15	1.0	12852099.2879	\N	1	2020-10-27 21:01:34.633012	2020-10-27 21:01:34.633012	\N	t	\N
25	208970.05587	5496626.76	2018-10-31	1.0	12905242.14372	\N	1	2020-10-27 21:01:34.636152	2020-10-27 21:01:34.636152	\N	t	\N
26	191.33589	4002.277414461063	2015-05-15	20.9175467	38267.17717	\N	3	2020-10-27 21:01:34.638961	2020-10-27 21:01:34.638961	\N	t	\N
27	692.22741	14500.1311260631854	2015-06-15	20.94706294	38267.17717	\N	3	2020-10-27 21:01:34.641448	2020-10-27 21:01:34.641448	\N	t	\N
28	2039.49798	42808.565676517173	2015-07-15	20.98975635	138445.48117	\N	3	2020-10-27 21:01:34.645914	2020-10-27 21:01:34.645914	\N	t	\N
29	2903.55604	61078.5217087749088	2015-08-15	21.03576472	407899.59501	\N	3	2020-10-27 21:01:34.648788	2020-10-27 21:01:34.648788	\N	t	\N
30	4844.74678	102096.4708982124998	2015-09-15	21.07364441	580711.20741	\N	3	2020-10-27 21:01:34.651748	2020-10-27 21:01:34.651748	\N	t	\N
31	5745.95346	121313.9227799800782	2015-10-15	21.11293167	968949.35625	\N	3	2020-10-27 21:01:34.654867	2020-10-27 21:01:34.654867	\N	t	\N
32	9626.70114	203574.4018255976238	2015-11-15	21.14684967	1149190.69172	\N	3	2020-10-27 21:01:34.657808	2020-10-27 21:01:34.657808	\N	t	\N
33	19765.89711	418712.0671858526289	2015-12-15	21.18355999	1925340.22851	\N	3	2020-10-27 21:01:34.661313	2020-10-27 21:01:34.661313	\N	t	\N
34	19765.89711	419474.6082194184171	2016-01-15	21.22213861	3953179.4225	\N	3	2020-10-27 21:01:34.663888	2020-10-27 21:01:34.663888	\N	t	\N
35	19765.89711	419948.1583964259705	2016-02-15	21.24609655	3953179.4225	\N	3	2020-10-27 21:01:34.666708	2020-10-27 21:01:34.666708	\N	t	\N
36	19765.89711	420594.6095724494223	2016-03-15	21.27880193	3953179.4225	\N	3	2020-10-27 21:01:34.669495	2020-10-27 21:01:34.669495	\N	t	\N
37	27167.73469	579157.3761854300146	2016-04-15	21.31783834	5433546.93772	\N	3	2020-10-27 21:01:34.672162	2020-10-27 21:01:34.672162	\N	t	\N
38	27167.73469	579957.7544933929224	2016-05-15	21.34729896	5433546.93772	\N	3	2020-10-27 21:01:34.67453	2020-10-27 21:01:34.67453	\N	t	\N
39	37101.61245	793390.650969422583	2016-06-15	21.38426334	7420322.4905	\N	3	2020-10-27 21:01:34.677656	2020-10-27 21:01:34.677656	\N	t	\N
40	39019.18827	835970.5056917445924	2016-07-15	21.42460012	7803837.65382	\N	3	2020-10-27 21:01:34.680792	2020-10-27 21:01:34.680792	\N	t	\N
41	42079.05656	903289.8357896383544	2016-08-15	21.46649449	8415811.31163	\N	3	2020-10-27 21:01:34.683412	2020-10-27 21:01:34.683412	\N	t	\N
42	44945.11509	966853.0554109991139	2016-09-15	21.51186071	8989023.01858	\N	3	2020-10-27 21:01:34.68607	2020-10-27 21:01:34.68607	\N	t	\N
43	47833.06637	1030645.697382419674	2016-10-15	21.5467202	9566613.27341	\N	3	2020-10-27 21:01:34.688694	2020-10-27 21:01:34.688694	\N	t	\N
44	50377.68748	1087127.27170447172	2016-11-15	21.579539	10075537.49531	\N	3	2020-10-27 21:01:34.691394	2020-10-27 21:01:34.691394	\N	t	\N
45	53954.31401	1166202.2024109351385	2016-12-15	21.61462385	10790862.80161	\N	3	2020-10-27 21:01:34.694625	2020-10-27 21:01:34.694625	\N	t	\N
46	56708.10841	1227907.7786289570253	2017-01-15	21.65312533	11341621.68185	\N	3	2020-10-27 21:01:34.697738	2020-10-27 21:01:34.697738	\N	t	\N
47	58062.30726	1258606.8782655311022	2017-02-15	21.67683197	11612461.45252	\N	3	2020-10-27 21:01:34.700551	2020-10-27 21:01:34.700551	\N	t	\N
48	59493.87597	1290663.3073926878055	2017-03-15	21.69405315	11898775.19373	\N	3	2020-10-27 21:01:34.703391	2020-10-27 21:01:34.703391	\N	t	\N
49	60043.79855	1303711.3497839504835	2017-04-15	21.71267277	12008759.70993	\N	3	2020-10-27 21:01:34.706519	2020-10-27 21:01:34.706519	\N	t	\N
50	60043.79855	1304118.727142658712	2017-05-15	21.71945744	12008759.70993	\N	3	2020-10-27 21:01:34.710203	2020-10-27 21:01:34.710203	\N	t	\N
51	60043.79855	1305040.3496140484155	2017-06-15	21.73480661	12008759.70993	\N	3	2020-10-27 21:01:34.713373	2020-10-27 21:01:34.713373	\N	t	\N
52	61519.75471	1337892.0608484309048	2017-07-17	21.74735688	12303950.94201	\N	3	2020-10-27 21:01:34.716027	2020-10-27 21:01:34.716027	\N	t	\N
53	61519.75471	1338624.7303671496498	2017-08-15	21.75926638	12303950.94201	\N	3	2020-10-27 21:01:34.720444	2020-10-27 21:01:34.720444	\N	t	\N
54	61519.75471	1339009.8046589912354	2017-09-15	21.76552574	12303950.94201	\N	3	2020-10-27 21:01:34.723426	2020-10-27 21:01:34.723426	\N	t	\N
55	63277.87552	1377276.2284030758848	2017-10-16	21.76552574	12655575.10314	\N	3	2020-10-27 21:01:34.726514	2020-10-27 21:01:34.726514	\N	t	\N
56	63277.87552	1377276.2284030758848	2017-11-16	21.76552574	12655575.10314	\N	3	2020-10-27 21:01:34.729931	2020-10-27 21:01:34.729931	\N	t	\N
57	64540.5665312297	1404759.362109662549202478	2017-12-15	21.76552574	12908113.30625	\N	3	2020-10-27 21:01:34.732538	2020-10-27 21:01:34.732538	\N	t	\N
58	64400.8806999382	1401719.026553174108509268	2018-01-15	21.76552574	12880176.13999	\N	3	2020-10-27 21:01:34.735	2020-10-27 21:01:34.735	\N	t	\N
59	64740.5284102816	1409111.637535185445448384	2018-02-15	21.76552574	12852099.2879	\N	3	2020-10-27 21:01:34.737313	2020-10-27 21:01:34.737313	\N	t	\N
60	65556.3443889012	1426868.301216933638916888	2018-03-15	21.76552574	13111268.87778	\N	3	2020-10-27 21:01:34.739932	2020-10-27 21:01:34.739932	\N	t	\N
61	65411.3751860724	1423712.970301256111703576	2018-04-15	21.76552574	13082275.03721	\N	3	2020-10-27 21:01:34.742367	2020-10-27 21:01:34.742367	\N	t	\N
62	65265.6811372294	1420541.862730998977984756	2018-05-15	21.76552574	13053136.22745	\N	3	2020-10-27 21:01:34.745575	2020-10-27 21:01:34.745575	\N	t	\N
63	65119.2586181423	1417354.899622893061632802	2018-06-15	21.76552574	13023851.72363	\N	3	2020-10-27 21:01:34.748019	2020-10-27 21:01:34.748019	\N	t	\N
64	64972.10399	1414152.0017763017026	2018-07-16	21.76552574	12994420.79729	\N	3	2020-10-27 21:01:34.750371	2020-10-27 21:01:34.750371	\N	t	\N
65	64824.21358	1410933.0892507475492	2018-08-15	21.76552574	12964842.71632	\N	3	2020-10-27 21:01:34.752815	2020-10-27 21:01:34.752815	\N	t	\N
66	64675.58372	1407698.0822071849528	2018-09-17	21.76552574	12935116.74495	\N	3	2020-10-27 21:01:34.754993	2020-10-27 21:01:34.754993	\N	t	\N
67	64526.21072	1404446.9003308239328	2018-10-15	21.76552574	12905242.14372	\N	3	2020-10-27 21:01:34.7573	2020-10-27 21:01:34.7573	\N	t	\N
68	64863.68764	1411792.2629197398536	2018-11-16	21.76552574	13084188.22536	\N	3	2020-10-27 21:01:34.760473	2020-10-27 21:01:34.760473	\N	t	\N
69	65267.62197	1420584.1059766245078	2018-12-15	21.76552574	13053524.39336	\N	3	2020-10-27 21:01:34.763331	2020-10-27 21:01:34.763331	\N	t	\N
70	65113.53621	1417230.3484011770454	2019-01-15	21.76552574	13022707.24221	\N	3	2020-10-27 21:01:34.765879	2020-10-27 21:01:34.765879	\N	t	\N
71	64958.68003	1413859.8222293889722	2019-02-15	21.76552574	12991736.0053	\N	3	2020-10-27 21:01:34.768408	2020-10-27 21:01:34.768408	\N	t	\N
72	64803.04956	1410472.4432286756744	2019-03-15	21.76552574	12960609.91221	\N	3	2020-10-27 21:01:34.770833	2020-10-27 21:01:34.770833	\N	t	\N
73	64646.64094	1407068.1273841077956	2019-04-15	21.76552574	12929328.18865	\N	3	2020-10-27 21:01:34.773387	2020-10-27 21:01:34.773387	\N	t	\N
74	64489.45028	1403646.7900277902072	2019-05-15	21.76552574	12897890.05647	\N	3	2020-10-27 21:01:34.775929	2020-10-27 21:01:34.775929	\N	t	\N
75	64331.47367	1400208.3460565172658	2019-06-15	21.76552574	12866294.73363	\N	3	2020-10-27 21:01:34.779073	2020-10-27 21:01:34.779073	\N	t	\N
76	64172.70717	1396752.7097141175558	2019-07-15	21.76552574	12834541.43418	\N	3	2020-10-27 21:01:34.781659	2020-10-27 21:01:34.781659	\N	t	\N
77	63.77863	1334.092471487021	2015-05-15	20.9175467	38267.17717	\N	4	2020-10-27 21:01:34.784441	2020-10-27 21:01:34.784441	\N	t	\N
78	230.74247	4833.3770420210618	2015-06-15	20.94706294	38267.17717	\N	4	2020-10-27 21:01:34.787248	2020-10-27 21:01:34.787248	\N	t	\N
79	679.83266	14269.521892172391	2015-07-15	20.98975635	138445.48117	\N	4	2020-10-27 21:01:34.789923	2020-10-27 21:01:34.789923	\N	t	\N
80	967.85201	20359.5071661390872	2015-08-15	21.03576472	407899.59501	\N	4	2020-10-27 21:01:34.792578	2020-10-27 21:01:34.792578	\N	t	\N
81	1614.91559	34032.1568958253519	2015-09-15	21.07364441	580711.20741	\N	4	2020-10-27 21:01:34.79592	2020-10-27 21:01:34.79592	\N	t	\N
82	1915.31782	40437.9742599933594	2015-10-15	21.11293167	968949.35625	\N	4	2020-10-27 21:01:34.7985	2020-10-27 21:01:34.7985	\N	t	\N
83	3208.90038	67858.1339418658746	2015-11-15	21.14684967	1149190.69172	\N	4	2020-10-27 21:01:34.801346	2020-10-27 21:01:34.801346	\N	t	\N
84	6588.63237	139570.6890619508763	2015-12-15	21.18355999	1925340.22851	\N	4	2020-10-27 21:01:34.804167	2020-10-27 21:01:34.804167	\N	t	\N
85	6588.63237	139824.8694064728057	2016-01-15	21.22213861	3953179.4225	\N	4	2020-10-27 21:01:34.80688	2020-10-27 21:01:34.80688	\N	t	\N
86	6588.63237	139982.7194654753235	2016-02-15	21.24609655	3953179.4225	\N	4	2020-10-27 21:01:34.80975	2020-10-27 21:01:34.80975	\N	t	\N
87	6588.63237	140198.2031908164741	2016-03-15	21.27880193	3953179.4225	\N	4	2020-10-27 21:01:34.813026	2020-10-27 21:01:34.813026	\N	t	\N
88	9055.91156	193052.4586574172104	2016-04-15	21.31783834	5433546.93772	\N	4	2020-10-27 21:01:34.816243	2020-10-27 21:01:34.816243	\N	t	\N
89	9055.91156	193319.2514266399776	2016-05-15	21.34729896	5433546.93772	\N	4	2020-10-27 21:01:34.820464	2020-10-27 21:01:34.820464	\N	t	\N
90	12367.20415	264463.550323140861	2016-06-15	21.38426334	7420322.4905	\N	4	2020-10-27 21:01:34.823534	2020-10-27 21:01:34.823534	\N	t	\N
91	13006.39609	278656.8352305815308	2016-07-15	21.42460012	7803837.65382	\N	4	2020-10-27 21:01:34.826662	2020-10-27 21:01:34.826662	\N	t	\N
92	14026.35219	301096.6120014344331	2016-08-15	21.46649449	8415811.31163	\N	4	2020-10-27 21:01:34.830548	2020-10-27 21:01:34.830548	\N	t	\N
93	14981.70503	322284.3518036663713	2016-09-15	21.51186071	8989023.01858	\N	4	2020-10-27 21:01:34.833898	2020-10-27 21:01:34.833898	\N	t	\N
94	15944.35546	343548.565865962292	2016-10-15	21.5467202	9566613.27341	\N	4	2020-10-27 21:01:34.837211	2020-10-27 21:01:34.837211	\N	t	\N
95	16792.56249	362375.75716289211	2016-11-15	21.579539	10075537.49531	\N	4	2020-10-27 21:01:34.840318	2020-10-27 21:01:34.840318	\N	t	\N
96	17984.77134	388734.067542360459	2016-12-15	21.61462385	10790862.80161	\N	4	2020-10-27 21:01:34.851655	2020-10-27 21:01:34.851655	\N	t	\N
97	18902.7028	409302.592804141924	2017-01-15	21.65312533	11341621.68185	\N	4	2020-10-27 21:01:34.854251	2020-10-27 21:01:34.854251	\N	t	\N
98	19354.10242	419535.6260885103674	2017-02-15	21.67683197	11612461.45252	\N	4	2020-10-27 21:01:34.856839	2020-10-27 21:01:34.856839	\N	t	\N
99	19831.29199	430221.1024642292685	2017-03-15	21.69405315	11898775.19373	\N	4	2020-10-27 21:01:34.859433	2020-10-27 21:01:34.859433	\N	t	\N
100	20014.59952	434570.4500003590704	2017-04-15	21.71267277	12008759.70993	\N	4	2020-10-27 21:01:34.862834	2020-10-27 21:01:34.862834	\N	t	\N
101	20014.59952	434706.2424532844288	2017-05-15	21.71945744	12008759.70993	\N	4	2020-10-27 21:01:34.865373	2020-10-27 21:01:34.865373	\N	t	\N
102	20014.59952	435013.4499437988272	2017-06-15	21.73480661	12008759.70993	\N	4	2020-10-27 21:01:34.868248	2020-10-27 21:01:34.868248	\N	t	\N
103	20506.5849	445964.020210319112	2017-07-17	21.74735688	12303950.94201	\N	4	2020-10-27 21:01:34.87086	2020-10-27 21:01:34.87086	\N	t	\N
104	20506.5849	446208.243383185662	2017-08-15	21.75926638	12303950.94201	\N	4	2020-10-27 21:01:34.873533	2020-10-27 21:01:34.873533	\N	t	\N
105	20506.5849	446336.601480445326	2017-09-15	21.76552574	12303950.94201	\N	4	2020-10-27 21:01:34.876292	2020-10-27 21:01:34.876292	\N	t	\N
106	21092.62517	459092.0760618068758	2017-10-16	21.76552574	12655575.10314	\N	4	2020-10-27 21:01:34.879603	2020-10-27 21:01:34.879603	\N	t	\N
107	21092.62517	459092.0760618068758	2017-11-16	21.76552574	12655575.10314	\N	4	2020-10-27 21:01:34.882345	2020-10-27 21:01:34.882345	\N	t	\N
108	21513.52218	468253.1207668509132	2017-12-15	21.76552574	12908113.30625	\N	4	2020-10-27 21:01:34.885175	2020-10-27 21:01:34.885175	\N	t	\N
109	21466.96023	467239.6754456213202	2018-01-15	21.76552574	12880176.13999	\N	4	2020-10-27 21:01:34.887756	2020-10-27 21:01:34.887756	\N	t	\N
110	21580.17614	469703.8792489038436	2018-02-15	21.76552574	12852099.2879	\N	4	2020-10-27 21:01:34.890181	2020-10-27 21:01:34.890181	\N	t	\N
111	21852.1148	475622.767152834952	2018-03-15	21.76552574	13111268.87778	\N	4	2020-10-27 21:01:34.892886	2020-10-27 21:01:34.892886	\N	t	\N
112	21803.79173	474570.9901289141302	2018-04-15	21.76552574	13082275.03721	\N	4	2020-10-27 21:01:34.896519	2020-10-27 21:01:34.896519	\N	t	\N
113	21755.22705	473513.954336319267	2018-05-15	21.76552574	13053136.22745	\N	4	2020-10-27 21:01:34.899172	2020-10-27 21:01:34.899172	\N	t	\N
114	21706.41954	472451.6332211089596	2018-06-15	21.76552574	13023851.72363	\N	4	2020-10-27 21:01:34.901964	2020-10-27 21:01:34.901964	\N	t	\N
115	21657.368	471384.00066465232	2018-07-16	21.76552574	12994420.79729	\N	4	2020-10-27 21:01:34.904701	2020-10-27 21:01:34.904701	\N	t	\N
116	21608.07119	470311.0296776974306	2018-08-15	21.76552574	12964842.71632	\N	4	2020-10-27 21:01:34.907215	2020-10-27 21:01:34.907215	\N	t	\N
117	21558.52791	469232.6941416134034	2018-09-17	21.76552574	12935116.74495	\N	4	2020-10-27 21:01:34.909878	2020-10-27 21:01:34.909878	\N	t	\N
118	21508.73691	468148.9668494930634	2018-10-15	21.76552574	12905242.14372	\N	4	2020-10-27 21:01:34.912884	2020-10-27 21:01:34.912884	\N	t	\N
119	21621.22921	470597.4209006948654	2018-11-16	21.76552574	13084188.22536	\N	4	2020-10-27 21:01:34.91595	2020-10-27 21:01:34.91595	\N	t	\N
120	21755.87399	473528.0353255415026	2018-12-15	21.76552574	13053524.39336	\N	4	2020-10-27 21:01:34.920402	2020-10-27 21:01:34.920402	\N	t	\N
121	21704.51207	472410.1161337256818	2019-01-15	21.76552574	13022707.24221	\N	4	2020-10-27 21:01:34.923489	2020-10-27 21:01:34.923489	\N	t	\N
122	21652.89334	471286.6073372445716	2019-02-15	21.76552574	12991736.0053	\N	4	2020-10-27 21:01:34.926664	2020-10-27 21:01:34.926664	\N	t	\N
123	21601.01652	470157.4810762252248	2019-03-15	21.76552574	12960609.91221	\N	4	2020-10-27 21:01:34.929486	2020-10-27 21:01:34.929486	\N	t	\N
124	21548.88031	469022.7090554841794	2019-04-15	21.76552574	12929328.18865	\N	4	2020-10-27 21:01:34.932605	2020-10-27 21:01:34.932605	\N	t	\N
125	21496.48343	467882.2634151484882	2019-05-15	21.76552574	12897890.05647	\N	4	2020-10-27 21:01:34.935303	2020-10-27 21:01:34.935303	\N	t	\N
126	21443.82456	466736.1154247241744	2019-06-15	21.76552574	12866294.73363	\N	4	2020-10-27 21:01:34.937821	2020-10-27 21:01:34.937821	\N	t	\N
127	21390.90239	465584.2365713725186	2019-07-15	21.76552574	12834541.43418	\N	4	2020-10-27 21:01:34.94018	2020-10-27 21:01:34.94018	\N	t	\N
128	22.32252	466.932354561684	2015-05-15	20.9175467	38267.17717	\N	5	2020-10-27 21:01:34.942876	2020-10-27 21:01:34.942876	\N	t	\N
129	80.75986	1691.6818704455884	2015-06-15	20.94706294	38267.17717	\N	5	2020-10-27 21:01:34.946018	2020-10-27 21:01:34.946018	\N	t	\N
130	237.94143	4994.3326412705805	2015-07-15	20.98975635	138445.48117	\N	5	2020-10-27 21:01:34.948736	2020-10-27 21:01:34.948736	\N	t	\N
131	338.7482	7125.827434523504	2015-08-15	21.03576472	407899.59501	\N	5	2020-10-27 21:01:34.951359	2020-10-27 21:01:34.951359	\N	t	\N
132	565.22046	11911.2549872966286	2015-09-15	21.07364441	580711.20741	\N	5	2020-10-27 21:01:34.953769	2020-10-27 21:01:34.953769	\N	t	\N
133	670.36124	14153.2910543364708	2015-10-15	21.11293167	968949.35625	\N	5	2020-10-27 21:01:34.956209	2020-10-27 21:01:34.956209	\N	t	\N
134	1123.11513	23750.3468162125071	2015-11-15	21.14684967	1149190.69172	\N	5	2020-10-27 21:01:34.958801	2020-10-27 21:01:34.958801	\N	t	\N
135	2306.02133	48849.7411822745867	2015-12-15	21.18355999	1925340.22851	\N	5	2020-10-27 21:01:34.961455	2020-10-27 21:01:34.961455	\N	t	\N
136	2306.02133	48938.7043028765513	2016-01-15	21.22213861	3953179.4225	\N	5	2020-10-27 21:01:34.963979	2020-10-27 21:01:34.963979	\N	t	\N
137	2306.02133	48993.9518235394115	2016-02-15	21.24609655	3953179.4225	\N	5	2020-10-27 21:01:34.966394	2020-10-27 21:01:34.966394	\N	t	\N
138	2306.02133	49069.3711274251669	2016-03-15	21.27880193	3953179.4225	\N	5	2020-10-27 21:01:34.969021	2020-10-27 21:01:34.969021	\N	t	\N
139	3169.56905	67568.360615367377	2016-04-15	21.31783834	5433546.93772	\N	5	2020-10-27 21:01:34.971623	2020-10-27 21:01:34.971623	\N	t	\N
140	3169.56905	67661.738084713188	2016-05-15	21.34729896	5433546.93772	\N	5	2020-10-27 21:01:34.974922	2020-10-27 21:01:34.974922	\N	t	\N
141	4328.52145	92562.242559638643	2016-06-15	21.38426334	7420322.4905	\N	5	2020-10-27 21:01:34.978389	2020-10-27 21:01:34.978389	\N	t	\N
142	4552.23863	97529.8922985666356	2016-07-15	21.42460012	7803837.65382	\N	5	2020-10-27 21:01:34.981196	2020-10-27 21:01:34.981196	\N	t	\N
143	4909.22327	105383.8142756347823	2016-08-15	21.46649449	8415811.31163	\N	5	2020-10-27 21:01:34.984219	2020-10-27 21:01:34.984219	\N	t	\N
144	5243.59676	112799.5231205272996	2016-09-15	21.51186071	8989023.01858	\N	5	2020-10-27 21:01:34.987386	2020-10-27 21:01:34.987386	\N	t	\N
145	5580.52441	120241.998031540082	2016-10-15	21.5467202	9566613.27341	\N	5	2020-10-27 21:01:34.990241	2020-10-27 21:01:34.990241	\N	t	\N
146	5877.39687	126831.51497464293	2016-11-15	21.579539	10075537.49531	\N	5	2020-10-27 21:01:34.992904	2020-10-27 21:01:34.992904	\N	t	\N
147	6294.66997	136056.9236614407845	2016-12-15	21.61462385	10790862.80161	\N	5	2020-10-27 21:01:34.99556	2020-10-27 21:01:34.99556	\N	t	\N
148	6615.94598	143255.9074814496734	2017-01-15	21.65312533	11341621.68185	\N	5	2020-10-27 21:01:34.99795	2020-10-27 21:01:34.99795	\N	t	\N
149	6773.93585	146837.4691960091245	2017-02-15	21.67683197	11612461.45252	\N	5	2020-10-27 21:01:35.000638	2020-10-27 21:01:35.000638	\N	t	\N
150	6940.9522	150577.38593840943	2017-03-15	21.69405315	11898775.19373	\N	5	2020-10-27 21:01:35.003492	2020-10-27 21:01:35.003492	\N	t	\N
151	7005.10983	152099.6574567003291	2017-04-15	21.71267277	12008759.70993	\N	5	2020-10-27 21:01:35.006693	2020-10-27 21:01:35.006693	\N	t	\N
152	7005.10983	152147.1848152106352	2017-05-15	21.71945744	12008759.70993	\N	5	2020-10-27 21:01:35.009934	2020-10-27 21:01:35.009934	\N	t	\N
153	7005.10983	152254.7074368599763	2017-06-15	21.73480661	12008759.70993	\N	5	2020-10-27 21:01:35.013646	2020-10-27 21:01:35.013646	\N	t	\N
154	7177.30472	156087.4071823484736	2017-07-17	21.74735688	12303950.94201	\N	5	2020-10-27 21:01:35.016721	2020-10-27 21:01:35.016721	\N	t	\N
155	7177.30472	156172.8852929113136	2017-08-15	21.75926638	12303950.94201	\N	5	2020-10-27 21:01:35.02069	2020-10-27 21:01:35.02069	\N	t	\N
156	7177.30472	156217.8106269834928	2017-09-15	21.76552574	12303950.94201	\N	5	2020-10-27 21:01:35.023246	2020-10-27 21:01:35.023246	\N	t	\N
157	7382.41881	159066.912498286962	2017-10-16	21.5467202	12655575.10314	\N	5	2020-10-27 21:01:35.025773	2020-10-27 21:01:35.025773	\N	t	\N
158	7382.41881	160682.2266325151694	2017-11-16	21.76552574	12655575.10314	\N	5	2020-10-27 21:01:35.028488	2020-10-27 21:01:35.028488	\N	t	\N
159	7529.73276	163888.5922031012424	2017-12-15	21.76552574	12908113.30625	\N	5	2020-10-27 21:01:35.03094	2020-10-27 21:01:35.03094	\N	t	\N
160	7513.43608	163533.8863950846992	2018-01-15	21.76552574	12880176.13999	\N	5	2020-10-27 21:01:35.033289	2020-10-27 21:01:35.033289	\N	t	\N
161	7665.06911	166834.2590125838914	2018-02-15	21.76552574	12852099.2879	\N	5	2020-10-27 21:01:35.035787	2020-10-27 21:01:35.035787	\N	t	\N
162	7648.24018	166467.9685034922332	2018-03-15	21.76552574	13111268.87778	\N	5	2020-10-27 21:01:35.038689	2020-10-27 21:01:35.038689	\N	t	\N
163	7631.32711	166099.8466430648114	2018-04-15	21.76552574	13082275.03721	\N	5	2020-10-27 21:01:35.041269	2020-10-27 21:01:35.041269	\N	t	\N
164	7614.32947	165729.8840721255578	2018-05-15	21.76552574	13053136.22745	\N	5	2020-10-27 21:01:35.044196	2020-10-27 21:01:35.044196	\N	t	\N
165	7597.24684	165358.0716491536616	2018-06-15	21.76552574	13023851.72363	\N	5	2020-10-27 21:01:35.046769	2020-10-27 21:01:35.046769	\N	t	\N
166	7580.0788	164984.400232628312	2018-07-16	21.76552574	12994420.79729	\N	5	2020-10-27 21:01:35.049471	2020-10-27 21:01:35.049471	\N	t	\N
167	7562.82492	164608.8604633734408	2018-08-15	21.76552574	12964842.71632	\N	5	2020-10-27 21:01:35.052088	2020-10-27 21:01:35.052088	\N	t	\N
168	7545.48477	164231.4429822129798	2018-09-17	21.76552574	12935116.74495	\N	5	2020-10-27 21:01:35.05453	2020-10-27 21:01:35.05453	\N	t	\N
169	7528.05792	163852.1384299708608	2018-10-15	21.76552574	12905242.14372	\N	5	2020-10-27 21:01:35.057033	2020-10-27 21:01:35.057033	\N	t	\N
170	7632.44313	166124.1374051011662	2018-11-16	21.76552574	13084188.22536	\N	5	2020-10-27 21:01:35.059413	2020-10-27 21:01:35.059413	\N	t	\N
171	7614.5559	165734.812440118866	2018-12-15	21.76552574	13053524.39336	\N	5	2020-10-27 21:01:35.061972	2020-10-27 21:01:35.061972	\N	t	\N
172	7596.57922	165343.5405488591228	2019-01-15	21.76552574	13022707.24221	\N	5	2020-10-27 21:01:35.064327	2020-10-27 21:01:35.064327	\N	t	\N
173	7578.51267	164950.3125898011258	2019-02-15	21.76552574	12991736.0053	\N	5	2020-10-27 21:01:35.066735	2020-10-27 21:01:35.066735	\N	t	\N
174	7560.35578	164555.1183331477772	2019-03-15	21.76552574	12960609.91221	\N	5	2020-10-27 21:01:35.070679	2020-10-27 21:01:35.070679	\N	t	\N
175	7542.10811	164157.9482020677514	2019-04-15	21.76552574	12929328.18865	\N	5	2020-10-27 21:01:35.073166	2020-10-27 21:01:35.073166	\N	t	\N
176	7523.7692	163758.792184419208	2019-05-15	21.76552574	12897890.05647	\N	5	2020-10-27 21:01:35.075894	2020-10-27 21:01:35.075894	\N	t	\N
177	7505.33859	163357.6402680603066	2019-06-15	21.76552574	12866294.73363	\N	5	2020-10-27 21:01:35.078444	2020-10-27 21:01:35.078444	\N	t	\N
178	7486.81584	162954.4828761597216	2019-07-15	21.76552574	12834541.43418	\N	5	2020-10-27 21:01:35.081038	2020-10-27 21:01:35.081038	\N	t	\N
179	27937.1662582689	608067.111297011230791486	2017-12-15	21.76552574	12908113.30625	\N	2	2020-10-27 21:01:35.083524	2020-10-27 21:01:35.083524	\N	t	\N
180	28076.8520900616	611107.446864408552985584	2018-01-15	21.76552574	12880176.13999	\N	2	2020-10-27 21:01:35.086017	2020-10-27 21:01:35.086017	\N	t	\N
181	28849.5926027462	627926.550383586010787188	2018-02-15	21.76552574	12852099.2879	\N	2	2020-10-27 21:01:35.08838	2020-10-27 21:01:35.08838	\N	t	\N
182	28993.8405657599	631066.183135503266109826	2018-03-15	21.76552574	13111268.87778	\N	2	2020-10-27 21:01:35.090708	2020-10-27 21:01:35.090708	\N	t	\N
183	29138.8097685887	634221.514051180793323138	2018-04-15	21.76552574	13082275.03721	\N	2	2020-10-27 21:01:35.093312	2020-10-27 21:01:35.093312	\N	t	\N
184	29284.5038174316	637392.621621435750489384	2018-05-15	21.76552574	13053136.22745	\N	2	2020-10-27 21:01:35.095716	2020-10-27 21:01:35.095716	\N	t	\N
185	29430.9263365188	640579.584729543843393912	2018-06-15	21.76552574	13023851.72363	\N	2	2020-10-27 21:01:35.098486	2020-10-27 21:01:35.098486	\N	t	\N
186	29578.08097	643782.4826923391678	2018-07-16	21.76552574	12994420.79729	\N	2	2020-10-27 21:01:35.102918	2020-10-27 21:01:35.102918	\N	t	\N
187	29725.97137	647001.3950002380638	2018-08-15	21.76552574	12964842.71632	\N	2	2020-10-27 21:01:35.105572	2020-10-27 21:01:35.105572	\N	t	\N
188	29874.60123	650236.4020438006602	2018-09-17	21.76552574	12935116.74495	\N	2	2020-10-27 21:01:35.108492	2020-10-27 21:01:35.108492	\N	t	\N
189	30023.97424	653487.5841378169376	2018-10-15	21.76552574	12905242.14372	\N	2	2020-10-27 21:01:35.111145	2020-10-27 21:01:35.111145	\N	t	\N
190	30663.83199	667414.4244653804226	2018-11-16	21.76552574	13084188.22536	\N	2	2020-10-27 21:01:35.114061	2020-10-27 21:01:35.114061	\N	t	\N
191	30817.15115	670751.496588795601	2018-12-15	21.76552574	13053524.39336	\N	2	2020-10-27 21:01:35.116798	2020-10-27 21:01:35.116798	\N	t	\N
192	30971.236912	674105.25420777411488	2019-01-15	21.76552574	13022707.24221	\N	2	2020-10-27 21:01:35.120798	2020-10-27 21:01:35.120798	\N	t	\N
193	31126.09309	677475.7803360311366	2019-02-15	21.76552574	12991736.0053	\N	2	2020-10-27 21:01:35.123474	2020-10-27 21:01:35.123474	\N	t	\N
194	31281.72356	680863.1593367444344	2019-03-15	21.76552574	12960609.91221	\N	2	2020-10-27 21:01:35.126512	2020-10-27 21:01:35.126512	\N	t	\N
195	31438.13218	684267.4751813123132	2019-04-15	21.76552574	12929328.18865	\N	2	2020-10-27 21:01:35.129641	2020-10-27 21:01:35.129641	\N	t	\N
196	31595.32284	687688.8125376299016	2019-05-15	21.76552574	12897890.05647	\N	2	2020-10-27 21:01:35.133674	2020-10-27 21:01:35.133674	\N	t	\N
197	31753.29945	691127.256508902843	2019-06-15	21.76552574	12866294.73363	\N	2	2020-10-27 21:01:35.137001	2020-10-27 21:01:35.137001	\N	t	\N
198	31912.06595	694582.892851302553	2019-07-15	21.76552574	12834541.43418	\N	2	2020-10-27 21:01:35.139774	2020-10-27 21:01:35.139774	\N	t	\N
199	2408990.48	7836446.03144	2017-05-30	3.253	0.0	\N	7	2020-10-27 21:01:35.142594	2020-10-27 21:01:35.142594	\N	t	\N
200	11015060.44	36140413.30364	2017-06-05	3.281	2408990.48	\N	7	2020-10-27 21:01:35.145633	2020-10-27 21:01:35.145633	\N	t	\N
201	4029385.92	13081401.38928	2017-10-20	3.2465	13424050.92	\N	7	2020-10-27 21:01:35.148567	2020-10-27 21:01:35.148567	\N	t	\N
202	2581628.5	8281864.228	2017-11-22	3.208	17453436.84	\N	7	2020-10-27 21:01:35.151477	2020-10-27 21:01:35.151477	\N	t	\N
203	4685650.71	15518875.15152	2017-12-20	3.312	20035065.34	\N	7	2020-10-27 21:01:35.154353	2020-10-27 21:01:35.154353	2017-12-22	t	\N
204	1380706.92	4960879.96356	2018-05-04	3.593	24720716.05	\N	7	2020-10-27 21:01:35.157271	2020-10-27 21:01:35.157271	2018-05-09	t	\N
205	3987951.0	15403460.7375	2018-07-05	3.8625	26101422.97	\N	7	2020-10-27 21:01:35.160447	2020-10-27 21:01:35.160447	2018-07-11	t	\N
206	6500000.0	23981750.0	2018-10-26	3.6895	30089373.97	\N	7	2020-10-27 21:01:35.163759	2020-10-27 21:01:35.163759	2018-10-30	t	\N
207	3350000.0	12830500.0	2019-03-12	3.83	36589373.97	\N	7	2020-10-27 21:01:35.166501	2020-10-27 21:01:35.166501	2018-03-18	t	\N
208	215629.57	697130.39981	2017-11-30	3.233	17453436.84	\N	9	2020-10-27 21:01:35.169583	2020-10-27 21:01:35.169583	\N	t	\N
209	434329.9	1617010.2177	2018-05-30	3.723	24720716.05	\N	9	2020-10-27 21:01:35.172243	2020-10-27 21:01:35.172243	\N	t	\N
210	638654.3	2471911.46815	2018-11-30	3.8705	36589373.97	\N	9	2020-10-27 21:01:35.174445	2020-10-27 21:01:35.174445	\N	t	\N
211	914022.69	3689909.59953	2019-05-30	4.037	39939373.97	\N	9	2020-10-27 21:01:35.177135	2020-10-27 21:01:35.177135	\N	t	\N
212	987323.42	3985824.64654	2019-11-30	4.037	39939373.97	\N	9	2020-10-27 21:01:35.179534	2020-10-27 21:01:35.179534	\N	t	\N
213	155517.3	502787.4309	2017-11-30	3.233	17453436.84	\N	10	2020-10-27 21:01:35.181875	2020-10-27 21:01:35.181875	\N	t	\N
214	131574.78	489852.90594	2018-05-30	3.723	24720716.05	\N	10	2020-10-27 21:01:35.184086	2020-10-27 21:01:35.184086	\N	t	\N
215	126109.11	488105.310255	2018-11-30	3.8705	36589373.97	\N	10	2020-10-27 21:01:35.187326	2020-10-27 21:01:35.187326	\N	t	\N
216	106800.29	431152.77073	2019-05-30	4.037	39939373.97	\N	10	2020-10-27 21:01:35.189785	2020-10-27 21:01:35.189785	\N	t	\N
217	107441.79	433742.50623	2019-11-30	4.037	39939373.97	\N	10	2020-10-27 21:01:35.191988	2020-10-27 21:01:35.191988	\N	t	\N
218	12030000.0	3006657.9	2014-11-14	0.400112931	0.0	\N	12	2020-10-27 21:01:35.194248	2020-10-27 21:01:35.194248	\N	t	\N
219	9943227.53	34304134.98	2016-05-31	0.289855072	1203000.0	\N	12	2020-10-27 21:01:35.19644	2020-10-27 21:01:35.19644	\N	t	\N
220	7591386.98	24296234.03	2017-12-22	0.3124511795	11146227.53	\N	12	2020-10-27 21:01:35.198409	2020-10-27 21:01:35.198409	2018-01-19	t	\N
221	5051688.4	3006657.9	2019-06-21	0.260960334	23320862.55	\N	12	2020-10-27 21:01:35.200432	2020-10-27 21:01:35.200432	2019-06-26	t	\N
222	5713.75	17426.92	2015-04-15	0.327869181702790854608846543	1203000.0	\N	14	2020-10-27 21:01:35.202506	2020-10-27 21:01:35.202506	\N	\N	\N
223	7165.93	28240.93	2015-10-15	0.253742706065274762552083094	1203000.0	\N	14	2020-10-27 21:01:35.204427	2020-10-27 21:01:35.204427	\N	\N	\N
224	11414.32	40264.01	2016-04-15	0.283486915486063111945382489	1203000.0	\N	14	2020-10-27 21:01:35.206508	2020-10-27 21:01:35.206508	\N	\N	\N
225	82242.95	260874.64	2016-10-15	0.315258508837808075173577623	11146227.53	\N	14	2020-10-27 21:01:35.208688	2020-10-27 21:01:35.208688	\N	\N	\N
226	114972.74	356530.47	2017-04-15	0.32247661749639518888806334	11146227.53	\N	14	2020-10-27 21:01:35.210902	2020-10-27 21:01:35.210902	\N	\N	\N
227	122525.9	390122.47	2017-10-15	0.314070348216548511035521743	11146227.53	\N	14	2020-10-27 21:01:35.213068	2020-10-27 21:01:35.213068	\N	\N	\N
228	202229.9	686853.63	2018-04-15	0.294429396842526696699557371	18737614.51	\N	14	2020-10-27 21:01:35.215224	2020-10-27 21:01:35.215224	\N	\N	\N
229	309632.66	1164373.62	2018-10-15	0.265922084356394127170280618	18737614.51	\N	14	2020-10-27 21:01:35.217363	2020-10-27 21:01:35.217363	\N	\N	\N
230	341394.19	1316928.09	2019-04-15	0.259235255586354756849328045	18737614.51	\N	14	2020-10-27 21:01:35.220704	2020-10-27 21:01:35.220704	\N	\N	\N
231	358098.87	1466056.77	2019-10-15	0.24425989315543353754302434	23320862.55	\N	14	2020-10-27 21:01:35.223293	2020-10-27 21:01:35.223293	\N	\N	\N
232	30639.93	74455.03	2014-10-15	0.411522633192142962000015311	0.0	\N	15	2020-10-27 21:01:35.225655	2020-10-27 21:01:35.225655	\N	\N	\N
233	31772.41	96905.85	2015-04-15	0.327868854150704008065560541	1203000.0	\N	15	2020-10-27 21:01:35.228151	2020-10-27 21:01:35.228151	\N	\N	\N
234	31670.28	124812.57	2015-10-15	0.253742711972039354689996368	1203000.0	\N	15	2020-10-27 21:01:35.230549	2020-10-27 21:01:35.230549	\N	\N	\N
235	81585.81	287793.94	2016-04-15	0.283486893434934731426241984	1203000.0	\N	15	2020-10-27 21:01:35.232986	2020-10-27 21:01:35.232986	\N	\N	\N
236	44557.91	141337.69	2016-10-15	0.315258513139701094591258708	11146227.53	\N	15	2020-10-27 21:01:35.235317	2020-10-27 21:01:35.235317	\N	\N	\N
237	38159.74	118333.35	2017-04-15	0.322476630637094276465594864	11146227.53	\N	15	2020-10-27 21:01:35.237498	2020-10-27 21:01:35.237498	\N	\N	\N
238	38414.39	122311.42	2017-10-15	0.314070346006938681604710337	11146227.53	\N	15	2020-10-27 21:01:35.239788	2020-10-27 21:01:35.239788	\N	\N	\N
239	26349.43	89493.2	2018-04-15	0.294429409161813411521769252	18737614.51	\N	15	2020-10-27 21:01:35.24193	2020-10-27 21:01:35.24193	\N	\N	\N
240	19383.93	72893.27	2018-10-15	0.265922080323739077695375718	18737614.51	\N	15	2020-10-27 21:01:35.244168	2020-10-27 21:01:35.244168	\N	\N	\N
241	19278.0	74364.89	2019-04-15	0.259235238564865758558911336	18737614.51	\N	15	2020-10-27 21:01:35.246307	2020-10-27 21:01:35.246307	\N	\N	\N
242	11356.59	46493.88	2019-10-15	0.244259889688707416976169767	23320862.55	\N	15	2020-10-27 21:01:35.248588	2020-10-27 21:01:35.248588	\N	\N	\N
243	468440.36	1807008.69	2019-04-15	0.259235255808316007600384036	18737614.51	\N	13	2020-10-27 21:01:35.250622	2020-10-27 21:01:35.250622	\N	\N	\N
244	597970.87	2448092.74	2019-10-15	0.244259892703247835292383572	23320862.55	\N	13	2020-10-27 21:01:35.252782	2020-10-27 21:01:35.252782	\N	\N	\N
245	125371.278	175000.0	2015-01-29	1.395854	0.0	\N	16	2020-10-27 21:01:35.254685	2020-10-27 21:01:35.254685	\N	t	\N
246	206385.691	290189.22	2015-02-24	1.406053	125371.278	\N	16	2020-10-27 21:01:35.256666	2020-10-27 21:01:35.256666	\N	t	\N
247	624784.5539	896391.52	2015-04-28	1.434721	331756.969	\N	16	2020-10-27 21:01:35.258959	2020-10-27 21:01:35.258959	\N	t	\N
248	522952.5584	799858.03	2015-10-26	1.529504	956541.5229	\N	16	2020-10-27 21:01:35.261285	2020-10-27 21:01:35.261285	\N	t	\N
249	858739.6504	1371244.92	2016-02-24	1.596811	1479494.0813	\N	16	2020-10-27 21:01:35.263674	2020-10-27 21:01:35.263674	\N	t	\N
250	548930.0373	884398.2	2016-03-18	1.611131	2338233.7317	\N	16	2020-10-27 21:01:35.26595	2020-10-27 21:01:35.26595	\N	t	\N
251	1094681.3614	1824918.12	2016-06-22	1.667077	2887163.769	\N	16	2020-10-27 21:01:35.268075	2020-10-27 21:01:35.268075	\N	t	\N
252	1178.1416	5678.8467	2015-04-15	1.12459645	331756.969	\N	18	2020-10-27 21:01:35.271008	2020-10-27 21:01:35.271008	\N	\N	\N
253	4701.1907	1.73571224	2015-07-15	1.12459645	956541.5229	\N	18	2020-10-27 21:01:35.273947	2020-10-27 21:01:35.273947	\N	\N	\N
254	5301.1531	4301.5484	2015-10-15	1.12459645	956541.5229	\N	18	2020-10-27 21:01:35.276518	2020-10-27 21:01:35.276518	\N	\N	\N
255	7754.1005	4301.5484	2016-01-15	1.12459645	1479494.0813	\N	18	2020-10-27 21:01:35.27984	2020-10-27 21:01:35.27984	\N	\N	\N
256	11517.4879	1.73571224	2016-04-15	1.65748987	2887163.769	\N	18	2020-10-27 21:01:35.282931	2020-10-27 21:01:35.282931	\N	\N	\N
\.


--
-- Name: attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.attachments_id_seq', 1, false);


--
-- Name: creditors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.creditors_id_seq', 5, true);


--
-- Name: currencies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.currencies_id_seq', 4, true);


--
-- Name: debts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.debts_id_seq', 5, true);


--
-- Name: transaction_infos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.transaction_infos_id_seq', 23, true);


--
-- Name: transaction_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.transaction_items_id_seq', 256, true);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: attachments attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attachments
    ADD CONSTRAINT attachments_pkey PRIMARY KEY (id);


--
-- Name: creditors creditors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.creditors
    ADD CONSTRAINT creditors_pkey PRIMARY KEY (id);


--
-- Name: currencies currencies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.currencies
    ADD CONSTRAINT currencies_pkey PRIMARY KEY (id);


--
-- Name: debts debts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.debts
    ADD CONSTRAINT debts_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: transaction_infos transaction_infos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction_infos
    ADD CONSTRAINT transaction_infos_pkey PRIMARY KEY (id);


--
-- Name: transaction_items transaction_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction_items
    ADD CONSTRAINT transaction_items_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

--
-- Database "sigdiv_test" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.0 (Debian 13.0-1.pgdg100+1)
-- Dumped by pg_dump version 13.0 (Debian 13.0-1.pgdg100+1)

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
-- Name: sigdiv_test; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE sigdiv_test WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE sigdiv_test OWNER TO postgres;

\connect sigdiv_test

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
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

