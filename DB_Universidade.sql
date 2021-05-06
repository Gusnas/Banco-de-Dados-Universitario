--
-- PostgreSQL database dump
--

-- Dumped from database version 13.1
-- Dumped by pg_dump version 13.1

-- Started on 2021-05-05 23:21:16

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
-- TOC entry 5 (class 2615 OID 41251)
-- Name: projeto; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA projeto;


ALTER SCHEMA projeto OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 206 (class 1259 OID 41252)
-- Name: departamento; Type: TABLE; Schema: projeto; Owner: postgres
--

CREATE TABLE projeto.departamento (
    num_dep integer NOT NULL,
    nome_dep character varying,
    escritorio_principal character varying,
    chefe character varying
);


ALTER TABLE projeto.departamento OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 41258)
-- Name: estudantes_pos; Type: TABLE; Schema: projeto; Owner: postgres
--

CREATE TABLE projeto.estudantes_pos (
    cpf character varying NOT NULL,
    nome character varying,
    idade integer,
    programa_pos character varying
);


ALTER TABLE projeto.estudantes_pos OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 41264)
-- Name: professores; Type: TABLE; Schema: projeto; Owner: postgres
--

CREATE TABLE projeto.professores (
    cpf character varying NOT NULL,
    nome character varying,
    idade integer,
    "posição" character varying,
    especialidade character varying
);


ALTER TABLE projeto.professores OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 41270)
-- Name: projetos; Type: TABLE; Schema: projeto; Owner: postgres
--

CREATE TABLE projeto.projetos (
    num_projeto integer NOT NULL,
    nome_financ character varying,
    data_inic date,
    data_fin date,
    financiamento real,
    cpf_gerente character varying
);


ALTER TABLE projeto.projetos OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 41276)
-- Name: vinculo_pg; Type: TABLE; Schema: projeto; Owner: postgres
--

CREATE TABLE projeto.vinculo_pg (
    cpf character varying NOT NULL,
    tipo character varying,
    num_dep_principal integer,
    cpf_conselheiro character varying
);


ALTER TABLE projeto.vinculo_pg OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 41282)
-- Name: vinculos_projeto; Type: TABLE; Schema: projeto; Owner: postgres
--

CREATE TABLE projeto.vinculos_projeto (
    cpf character varying NOT NULL,
    num_projeto integer NOT NULL,
    tipo character varying NOT NULL,
    cpf_supervisor character varying
);


ALTER TABLE projeto.vinculos_projeto OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 41288)
-- Name: vinculos_trabalho; Type: TABLE; Schema: projeto; Owner: postgres
--

CREATE TABLE projeto.vinculos_trabalho (
    num_dep integer NOT NULL,
    cpf character varying NOT NULL,
    porcentagem_hora real
);


ALTER TABLE projeto.vinculos_trabalho OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 41347)
-- Name: visao_projetoscaros; Type: VIEW; Schema: projeto; Owner: postgres
--

CREATE VIEW projeto.visao_projetoscaros AS
 SELECT x.num_projeto,
    x.nome_financ AS financiador,
    y.nome AS gerente
   FROM projeto.projetos x,
    projeto.professores y
  WHERE ((x.financiamento > (70000)::double precision) AND ((x.cpf_gerente)::text = (y.cpf)::text));


ALTER TABLE projeto.visao_projetoscaros OWNER TO postgres;

--
-- TOC entry 3054 (class 0 OID 41252)
-- Dependencies: 206
-- Data for Name: departamento; Type: TABLE DATA; Schema: projeto; Owner: postgres
--

INSERT INTO projeto.departamento VALUES (1, 'Teleinformática', '23', '321.057.097-85');
INSERT INTO projeto.departamento VALUES (2, 'Computação', '18', '733.578.173-24');
INSERT INTO projeto.departamento VALUES (3, 'Engenharia Elétrica', '08A', '532.621.211-09');


--
-- TOC entry 3055 (class 0 OID 41258)
-- Dependencies: 207
-- Data for Name: estudantes_pos; Type: TABLE DATA; Schema: projeto; Owner: postgres
--

INSERT INTO projeto.estudantes_pos VALUES ('604.078.503-99', 'Rodrigo Rodrigues', 25, 'Mestrado');
INSERT INTO projeto.estudantes_pos VALUES ('604.708.511-99', 'Miguel Cervantes', 25, 'Doutorado');
INSERT INTO projeto.estudantes_pos VALUES ('065.654.988-74', 'André Sombra', 24, 'Mestrado');
INSERT INTO projeto.estudantes_pos VALUES ('951.357.753-25', 'Marie Cachet', 21, 'Mestrado');
INSERT INTO projeto.estudantes_pos VALUES ('966.588.302-87', 'Kauane Leticia', 26, 'Mestrado');
INSERT INTO projeto.estudantes_pos VALUES ('699.321.586-98', 'Takaro Nakara', 32, 'Doutorado');
INSERT INTO projeto.estudantes_pos VALUES ('569.654.258-19', 'Lenny Leonard', 30, 'Doutorado');
INSERT INTO projeto.estudantes_pos VALUES ('897.965.368-14', 'Julio Caesar', 28, 'Doutorado');
INSERT INTO projeto.estudantes_pos VALUES ('159.753.357-15', 'Varg Vikernes', 22, 'Mestrado');
INSERT INTO projeto.estudantes_pos VALUES ('951.895.698-45', 'Luiz Velasco', 21, 'Mestrado');
INSERT INTO projeto.estudantes_pos VALUES ('554.624.486-25', 'Ted Kaczynski', 30, 'Doutorado');
INSERT INTO projeto.estudantes_pos VALUES ('456.985.325-65', 'Mikael Nicolau', 26, 'Mestrado');
INSERT INTO projeto.estudantes_pos VALUES ('231.598.852-21', 'João Almeida', 27, 'Doutorado');


--
-- TOC entry 3056 (class 0 OID 41264)
-- Dependencies: 208
-- Data for Name: professores; Type: TABLE DATA; Schema: projeto; Owner: postgres
--

INSERT INTO projeto.professores VALUES ('546.657.238-68', 'Julio Farias', 32, 'Substituto', 'Teoria de Grafos');
INSERT INTO projeto.professores VALUES ('246.647.238-68', 'Jorge Fonseca', 38, 'Efetivo', 'Visão Computacional');
INSERT INTO projeto.professores VALUES ('356.135.207-95', 'Paulo Escariotes', 28, 'Substituto', 'Computação em Nuvem');
INSERT INTO projeto.professores VALUES ('321.057.097-85', 'Bashar al Assad', 47, 'Efetivo', 'Computação em Nuvem');
INSERT INTO projeto.professores VALUES ('532.621.211-09', 'Jarias Josefin', 50, 'Efetivo', 'Internet das Coisas');
INSERT INTO projeto.professores VALUES ('120.579.133-03', 'Ariosto Caligula', 61, 'Efetivo', 'Processamento de Imagens');
INSERT INTO projeto.professores VALUES ('820.552.232-83', 'Samia Klouse', 39, 'Efetivo', 'Processamento de Imagens');
INSERT INTO projeto.professores VALUES ('221.535.535-85', 'Karine Andrômeda', 25, 'Substituto', 'Processamento de Imagens');
INSERT INTO projeto.professores VALUES ('133.588.123-94', 'Alexandra Moraes', 29, 'Efetivo', 'Robótica');
INSERT INTO projeto.professores VALUES ('733.578.173-24', 'Gertrudes Belona', 74, 'Efetivo', 'Teoria de Grafos');


--
-- TOC entry 3057 (class 0 OID 41270)
-- Dependencies: 209
-- Data for Name: projetos; Type: TABLE DATA; Schema: projeto; Owner: postgres
--

INSERT INTO projeto.projetos VALUES (1, 'Sony', '2019-02-28', '2021-02-27', 80000, '321.057.097-85');
INSERT INTO projeto.projetos VALUES (2, 'Samsung', '2017-03-15', '2021-03-23', 150000, '133.588.123-94');
INSERT INTO projeto.projetos VALUES (3, 'Lenovo', '2019-08-05', '2020-08-06', 36000, '733.578.173-24');
INSERT INTO projeto.projetos VALUES (4, 'LG', '2018-11-14', '2020-12-09', 70000, '246.647.238-68');
INSERT INTO projeto.projetos VALUES (5, 'STM', '2017-09-22', '2021-01-15', 90000, '532.621.211-09');


--
-- TOC entry 3058 (class 0 OID 41276)
-- Dependencies: 210
-- Data for Name: vinculo_pg; Type: TABLE DATA; Schema: projeto; Owner: postgres
--

INSERT INTO projeto.vinculo_pg VALUES ('604.078.503-99', 'Mestrado', 2, '604.708.511-99');
INSERT INTO projeto.vinculo_pg VALUES ('604.708.511-99', 'Doutorado', 2, NULL);
INSERT INTO projeto.vinculo_pg VALUES ('065.654.988-74', 'Mestrado', 3, '699.321.586-98');
INSERT INTO projeto.vinculo_pg VALUES ('951.357.753-25', 'Mestrado', 1, '897.965.368-14');
INSERT INTO projeto.vinculo_pg VALUES ('966.588.302-87', 'Mestrado', 2, '569.654.258-19');
INSERT INTO projeto.vinculo_pg VALUES ('699.321.586-98', 'Doutorado', 3, NULL);
INSERT INTO projeto.vinculo_pg VALUES ('569.654.258-19', 'Doutorado', 2, NULL);
INSERT INTO projeto.vinculo_pg VALUES ('897.965.368-14', 'Doutorado', 1, NULL);
INSERT INTO projeto.vinculo_pg VALUES ('159.753.357-15', 'Mestrado', 2, '569.654.258-19');
INSERT INTO projeto.vinculo_pg VALUES ('951.895.698-45', 'Mestrado', 1, '231.598.852-21');
INSERT INTO projeto.vinculo_pg VALUES ('554.624.486-25', 'Doutorado', 3, NULL);
INSERT INTO projeto.vinculo_pg VALUES ('456.985.325-65', 'Mestrado', 2, '604.078.503-99');
INSERT INTO projeto.vinculo_pg VALUES ('231.598.852-21', 'Doutorado', 1, NULL);


--
-- TOC entry 3059 (class 0 OID 41282)
-- Dependencies: 211
-- Data for Name: vinculos_projeto; Type: TABLE DATA; Schema: projeto; Owner: postgres
--

INSERT INTO projeto.vinculos_projeto VALUES ('604.078.503-99', 1, 'Assistente', '321.057.097-85');
INSERT INTO projeto.vinculos_projeto VALUES ('604.708.511-99', 2, 'Assistente', '246.647.238-68');
INSERT INTO projeto.vinculos_projeto VALUES ('065.654.988-74', 3, 'Assistente', '356.135.207-95');
INSERT INTO projeto.vinculos_projeto VALUES ('951.357.753-25', 2, 'Assistente', '321.057.097-85');
INSERT INTO projeto.vinculos_projeto VALUES ('966.588.302-87', 2, 'Assistente', '133.588.123-94');
INSERT INTO projeto.vinculos_projeto VALUES ('699.321.586-98', 1, 'Assistente', '120.579.133-03');
INSERT INTO projeto.vinculos_projeto VALUES ('569.654.258-19', 5, 'Assistente', '820.552.232-83');
INSERT INTO projeto.vinculos_projeto VALUES ('897.965.368-14', 4, 'Assistente', '246.647.238-68');
INSERT INTO projeto.vinculos_projeto VALUES ('159.753.357-15', 5, 'Assistente', '532.621.211-09');
INSERT INTO projeto.vinculos_projeto VALUES ('951.895.698-45', 3, 'Assistente', '733.578.173-24');
INSERT INTO projeto.vinculos_projeto VALUES ('554.624.486-25', 4, 'Assistente', '120.579.133-03');
INSERT INTO projeto.vinculos_projeto VALUES ('456.985.325-65', 3, 'Assistente', '356.135.207-95');
INSERT INTO projeto.vinculos_projeto VALUES ('231.598.852-21', 1, 'Assistente', '733.578.173-24');
INSERT INTO projeto.vinculos_projeto VALUES ('546.657.238-68', 4, 'Co-pesquisador', NULL);
INSERT INTO projeto.vinculos_projeto VALUES ('246.647.238-68', 2, 'Co-pesquisador', NULL);
INSERT INTO projeto.vinculos_projeto VALUES ('246.647.238-68', 4, 'Pesquisador Principal', NULL);
INSERT INTO projeto.vinculos_projeto VALUES ('356.135.207-95', 3, 'Pesquisador Principal', NULL);
INSERT INTO projeto.vinculos_projeto VALUES ('321.057.097-85', 1, 'Pesquisador Principal', NULL);
INSERT INTO projeto.vinculos_projeto VALUES ('321.057.097-85', 2, 'Co-pesquisador', NULL);
INSERT INTO projeto.vinculos_projeto VALUES ('532.621.211-09', 5, 'Co-pesquisador', NULL);
INSERT INTO projeto.vinculos_projeto VALUES ('120.579.133-03', 1, 'Co-pesquisador', NULL);
INSERT INTO projeto.vinculos_projeto VALUES ('820.552.232-83', 5, 'Pesquisador Principal', NULL);
INSERT INTO projeto.vinculos_projeto VALUES ('221.535.535-85', 3, 'Co-pesquisador', NULL);
INSERT INTO projeto.vinculos_projeto VALUES ('133.588.123-94', 2, 'Pesquisador Principal', NULL);
INSERT INTO projeto.vinculos_projeto VALUES ('733.578.173-24', 1, 'Co-pesquisador', NULL);
INSERT INTO projeto.vinculos_projeto VALUES ('604.078.503-99', 2, 'Assistente', '246.647.238-68');


--
-- TOC entry 3060 (class 0 OID 41288)
-- Dependencies: 212
-- Data for Name: vinculos_trabalho; Type: TABLE DATA; Schema: projeto; Owner: postgres
--

INSERT INTO projeto.vinculos_trabalho VALUES (2, '546.657.238-68', 100);
INSERT INTO projeto.vinculos_trabalho VALUES (1, '246.647.238-68', 50);
INSERT INTO projeto.vinculos_trabalho VALUES (2, '356.135.207-95', 60);
INSERT INTO projeto.vinculos_trabalho VALUES (1, '321.057.097-85', 50);
INSERT INTO projeto.vinculos_trabalho VALUES (1, '532.621.211-09', 100);
INSERT INTO projeto.vinculos_trabalho VALUES (3, '120.579.133-03', 30);
INSERT INTO projeto.vinculos_trabalho VALUES (2, '820.552.232-83', 40);
INSERT INTO projeto.vinculos_trabalho VALUES (1, '221.535.535-85', 100);
INSERT INTO projeto.vinculos_trabalho VALUES (3, '133.588.123-94', 100);
INSERT INTO projeto.vinculos_trabalho VALUES (1, '733.578.173-24', 100);
INSERT INTO projeto.vinculos_trabalho VALUES (3, '356.135.207-95', 40);
INSERT INTO projeto.vinculos_trabalho VALUES (1, '820.552.232-83', 60);
INSERT INTO projeto.vinculos_trabalho VALUES (3, '246.647.238-68', 50);
INSERT INTO projeto.vinculos_trabalho VALUES (2, '120.579.133-03', 70);
INSERT INTO projeto.vinculos_trabalho VALUES (3, '321.057.097-85', 50);


--
-- TOC entry 2902 (class 2606 OID 41295)
-- Name: departamento departamento_pkey; Type: CONSTRAINT; Schema: projeto; Owner: postgres
--

ALTER TABLE ONLY projeto.departamento
    ADD CONSTRAINT departamento_pkey PRIMARY KEY (num_dep);


--
-- TOC entry 2904 (class 2606 OID 41297)
-- Name: estudantes_pos estudantes_pos_pkey; Type: CONSTRAINT; Schema: projeto; Owner: postgres
--

ALTER TABLE ONLY projeto.estudantes_pos
    ADD CONSTRAINT estudantes_pos_pkey PRIMARY KEY (cpf);


--
-- TOC entry 2914 (class 2606 OID 41299)
-- Name: vinculos_trabalho pkey; Type: CONSTRAINT; Schema: projeto; Owner: postgres
--

ALTER TABLE ONLY projeto.vinculos_trabalho
    ADD CONSTRAINT pkey PRIMARY KEY (num_dep, cpf);


--
-- TOC entry 2912 (class 2606 OID 41301)
-- Name: vinculos_projeto pkey_vp; Type: CONSTRAINT; Schema: projeto; Owner: postgres
--

ALTER TABLE ONLY projeto.vinculos_projeto
    ADD CONSTRAINT pkey_vp PRIMARY KEY (cpf, num_projeto);


--
-- TOC entry 2906 (class 2606 OID 41303)
-- Name: professores professores_pkey; Type: CONSTRAINT; Schema: projeto; Owner: postgres
--

ALTER TABLE ONLY projeto.professores
    ADD CONSTRAINT professores_pkey PRIMARY KEY (cpf);


--
-- TOC entry 2908 (class 2606 OID 41305)
-- Name: projetos projetos_pkey; Type: CONSTRAINT; Schema: projeto; Owner: postgres
--

ALTER TABLE ONLY projeto.projetos
    ADD CONSTRAINT projetos_pkey PRIMARY KEY (num_projeto);


--
-- TOC entry 2910 (class 2606 OID 41307)
-- Name: vinculo_pg vinculo_pg_pkey; Type: CONSTRAINT; Schema: projeto; Owner: postgres
--

ALTER TABLE ONLY projeto.vinculo_pg
    ADD CONSTRAINT vinculo_pg_pkey PRIMARY KEY (cpf);


--
-- TOC entry 2922 (class 2620 OID 41352)
-- Name: estudantes_pos conferir_aconselhamento; Type: TRIGGER; Schema: projeto; Owner: postgres
--

CREATE TRIGGER conferir_aconselhamento BEFORE DELETE ON projeto.estudantes_pos FOR EACH ROW EXECUTE FUNCTION public.conferir_aconselhamento();


--
-- TOC entry 2915 (class 2606 OID 41308)
-- Name: departamento departamento_chefe_fkey; Type: FK CONSTRAINT; Schema: projeto; Owner: postgres
--

ALTER TABLE ONLY projeto.departamento
    ADD CONSTRAINT departamento_chefe_fkey FOREIGN KEY (chefe) REFERENCES projeto.professores(cpf);


--
-- TOC entry 2920 (class 2606 OID 41313)
-- Name: vinculos_trabalho fkey1; Type: FK CONSTRAINT; Schema: projeto; Owner: postgres
--

ALTER TABLE ONLY projeto.vinculos_trabalho
    ADD CONSTRAINT fkey1 FOREIGN KEY (num_dep) REFERENCES projeto.departamento(num_dep) NOT VALID;


--
-- TOC entry 2921 (class 2606 OID 41318)
-- Name: vinculos_trabalho fkey2; Type: FK CONSTRAINT; Schema: projeto; Owner: postgres
--

ALTER TABLE ONLY projeto.vinculos_trabalho
    ADD CONSTRAINT fkey2 FOREIGN KEY (cpf) REFERENCES projeto.professores(cpf) NOT VALID;


--
-- TOC entry 2916 (class 2606 OID 41323)
-- Name: projetos fkey_p; Type: FK CONSTRAINT; Schema: projeto; Owner: postgres
--

ALTER TABLE ONLY projeto.projetos
    ADD CONSTRAINT fkey_p FOREIGN KEY (cpf_gerente) REFERENCES projeto.professores(cpf) NOT VALID;


--
-- TOC entry 2917 (class 2606 OID 41328)
-- Name: vinculo_pg fkey_pg; Type: FK CONSTRAINT; Schema: projeto; Owner: postgres
--

ALTER TABLE ONLY projeto.vinculo_pg
    ADD CONSTRAINT fkey_pg FOREIGN KEY (cpf) REFERENCES projeto.estudantes_pos(cpf) NOT VALID;


--
-- TOC entry 2918 (class 2606 OID 41333)
-- Name: vinculo_pg fkey_pg_2; Type: FK CONSTRAINT; Schema: projeto; Owner: postgres
--

ALTER TABLE ONLY projeto.vinculo_pg
    ADD CONSTRAINT fkey_pg_2 FOREIGN KEY (num_dep_principal) REFERENCES projeto.departamento(num_dep) NOT VALID;


--
-- TOC entry 2919 (class 2606 OID 41338)
-- Name: vinculos_projeto fkey_vp; Type: FK CONSTRAINT; Schema: projeto; Owner: postgres
--

ALTER TABLE ONLY projeto.vinculos_projeto
    ADD CONSTRAINT fkey_vp FOREIGN KEY (num_projeto) REFERENCES projeto.projetos(num_projeto) NOT VALID;


-- Completed on 2021-05-05 23:21:17

--
-- PostgreSQL database dump complete
--

