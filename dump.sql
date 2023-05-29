--
-- PostgreSQL database dump
--

-- Dumped from database version 12.15 (Ubuntu 12.15-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.15 (Ubuntu 12.15-0ubuntu0.20.04.1)

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
-- Name: classes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.classes (
    id integer NOT NULL,
    class text NOT NULL
);


--
-- Name: classes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.classes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: classes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.classes_id_seq OWNED BY public.classes.id;


--
-- Name: delivery; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.delivery (
    id integer NOT NULL,
    "classId" integer NOT NULL,
    "studentId" integer NOT NULL,
    "projectId" integer NOT NULL,
    link text NOT NULL,
    grade text
);


--
-- Name: delivery_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.delivery_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: delivery_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.delivery_id_seq OWNED BY public.delivery.id;


--
-- Name: projects; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.projects (
    id integer NOT NULL,
    project text NOT NULL
);


--
-- Name: projects_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.projects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.projects_id_seq OWNED BY public.projects.id;


--
-- Name: students; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.students (
    id integer NOT NULL,
    name text NOT NULL,
    cpf text NOT NULL,
    email text NOT NULL,
    image text NOT NULL,
    "classId" integer NOT NULL,
    "inputData" date DEFAULT now(),
    "outputData" date
);


--
-- Name: students_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.students_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: students_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.students_id_seq OWNED BY public.students.id;


--
-- Name: classes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.classes ALTER COLUMN id SET DEFAULT nextval('public.classes_id_seq'::regclass);


--
-- Name: delivery id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.delivery ALTER COLUMN id SET DEFAULT nextval('public.delivery_id_seq'::regclass);


--
-- Name: projects id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.projects ALTER COLUMN id SET DEFAULT nextval('public.projects_id_seq'::regclass);


--
-- Name: students id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.students ALTER COLUMN id SET DEFAULT nextval('public.students_id_seq'::regclass);


--
-- Data for Name: classes; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.classes VALUES (1, 'Turma 8');
INSERT INTO public.classes VALUES (2, 'Turma 9');
INSERT INTO public.classes VALUES (3, 'Turma 10');
INSERT INTO public.classes VALUES (4, 'Turma 11');


--
-- Data for Name: delivery; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.delivery VALUES (1, 1, 1, 1, 'https://www.google.com.br/', 'Acima das expectativas');
INSERT INTO public.delivery VALUES (3, 1, 3, 2, 'https://www.devmedia.com.br/trabalhando-com-eventos-em-javascript/28521', 'undefined');
INSERT INTO public.delivery VALUES (4, 1, 1, 3, 'https://www.google.com.br/', 'Abaixo das expectativas');
INSERT INTO public.delivery VALUES (5, 4, 9, 2, 'https://www.google.com.br/', 'Dentro das expectativas');
INSERT INTO public.delivery VALUES (6, 2, 10, 3, 'https://www.google.com.br/', 'Abaixo das expectativas');


--
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.projects VALUES (1, 'DrovenEats');
INSERT INTO public.projects VALUES (2, 'DrovenParrots');
INSERT INTO public.projects VALUES (3, 'DrovenShortly');


--
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.students VALUES (1, 'Joao', '123', 'joao@hotmail.com', 'https://www.pontotel.com.br/wp-content/uploads/2022/05/imagem-corporativa.jpg', 1, '2023-05-27', NULL);
INSERT INTO public.students VALUES (3, 'Gabriel', '12345678910', 'Gabriel@hotmail.com', 'https://www.pontotel.com.br/wp-content/uploads/2022/05/imagem-corporativa.jpg', 1, '2023-05-27', NULL);
INSERT INTO public.students VALUES (6, 'Gabriela', '12345678911', 'Gabriela@hotmail.com', 'https://www.pontotel.com.br/wp-content/uploads/2022/05/imagem-corporativa.jpg', 1, '2023-05-27', NULL);
INSERT INTO public.students VALUES (9, 'Gustavo Olimpio', '12345578912', 'gustavo@hotmail.com', 'data:image/jpeg;base64,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', 4, '2023-05-28', NULL);
INSERT INTO public.students VALUES (10, 'Gustavo Olimpio', '11111111111', 'olimpio@hotmail.com', 'https://www.google.com.br/?hl=pt-BR', 2, '2023-05-28', NULL);
INSERT INTO public.students VALUES (11, 'Ronaldo', '22222222222', 'ronaldo@hotmail.com', 'https://www.google.com.br/', 3, '2023-05-28', NULL);


--
-- Name: classes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.classes_id_seq', 4, true);


--
-- Name: delivery_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.delivery_id_seq', 6, true);


--
-- Name: projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.projects_id_seq', 3, true);


--
-- Name: students_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.students_id_seq', 11, true);


--
-- Name: classes classes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.classes
    ADD CONSTRAINT classes_pkey PRIMARY KEY (id);


--
-- Name: delivery delivery_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.delivery
    ADD CONSTRAINT delivery_pkey PRIMARY KEY (id);


--
-- Name: projects projects_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


--
-- Name: students students_cpf_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_cpf_key UNIQUE (cpf);


--
-- Name: students students_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_email_key UNIQUE (email);


--
-- Name: students students_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (id);


--
-- Name: delivery delivery_classId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.delivery
    ADD CONSTRAINT "delivery_classId_fkey" FOREIGN KEY ("classId") REFERENCES public.classes(id);


--
-- Name: delivery delivery_projectId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.delivery
    ADD CONSTRAINT "delivery_projectId_fkey" FOREIGN KEY ("projectId") REFERENCES public.projects(id);


--
-- Name: delivery delivery_studentId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.delivery
    ADD CONSTRAINT "delivery_studentId_fkey" FOREIGN KEY ("studentId") REFERENCES public.students(id);


--
-- Name: students students_classId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT "students_classId_fkey" FOREIGN KEY ("classId") REFERENCES public.classes(id);


--
-- PostgreSQL database dump complete
--

