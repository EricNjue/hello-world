--
-- PostgreSQL database dump
--

-- Dumped from database version 10.4
-- Dumped by pg_dump version 10.4

-- Started on 2019-05-04 14:35:43

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12924)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2807 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 197 (class 1259 OID 308123)
-- Name: Transactions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Transactions" (
    "Id" uuid NOT NULL,
    "IntReferenceNumber" text,
    "ExtReferenceNumber" text,
    "Shortcode" text,
    "TenantId" text,
    "UserId" text,
    "Amount" double precision NOT NULL,
    "Source" text,
    "EntryDate" timestamp with time zone NOT NULL,
    "Description" text
);


ALTER TABLE public."Transactions" OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 308118)
-- Name: __EFMigrationsHistory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."__EFMigrationsHistory" (
    "MigrationId" character varying(150) NOT NULL,
    "ProductVersion" character varying(32) NOT NULL
);


ALTER TABLE public."__EFMigrationsHistory" OWNER TO postgres;

--
-- TOC entry 2799 (class 0 OID 308123)
-- Dependencies: 197
-- Data for Name: Transactions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Transactions" ("Id", "IntReferenceNumber", "ExtReferenceNumber", "Shortcode", "TenantId", "UserId", "Amount", "Source", "EntryDate", "Description") FROM stdin;
44c87847-5237-4f2a-b5ae-91e826e7ab18	5205168683344078	NDT91H8H0B	603098	f90110bc-81e7-42e2-863d-46988d04ecee	84175255-4797-4d3a-8109-3fc0a08401c7	-1010	AccountWithdrawal	2019-04-29 18:41:27.946736+03	
739212d3-cc06-488f-a50b-41ab680279fb	5205168683344078	NDT01H8H0C	603098	f90110bc-81e7-42e2-863d-46988d04ecee	84175255-4797-4d3a-8109-3fc0a08401c7	-1010	AccountWithdrawal	2019-04-29 19:21:24.697233+03	Account withdrawal. RefId: NDT01H8H0C
30642b57-b79d-4be9-9b80-1d122adb8cb4	5205168683344078	NDT01H8H0C	603098	f90110bc-81e7-42e2-863d-46988d04ecee	84175255-4797-4d3a-8109-3fc0a08401c7	-1010	AccountWithdrawal	2019-04-29 19:21:26.522099+03	Account withdrawal. RefId: NDT01H8H0C
a857791a-5f7a-48fe-99ec-d092e72b3662	5205168683344078	NDT01H8H0C	603098	f90110bc-81e7-42e2-863d-46988d04ecee	84175255-4797-4d3a-8109-3fc0a08401c7	-1010	AccountWithdrawal	2019-04-29 19:21:26.62252+03	Account withdrawal. RefId: NDT01H8H0C
b20118aa-0066-4c55-b902-53d20440a848	5205168683344078	NDT01H8H0C	603098	f90110bc-81e7-42e2-863d-46988d04ecee	84175255-4797-4d3a-8109-3fc0a08401c7	-1010	AccountWithdrawal	2019-04-29 19:21:27.56291+03	Account withdrawal. RefId: NDT01H8H0C
c0807646-8718-46d7-ae59-f0a7a3be4550	5205168683344078	NDT21H8H0E	603098	f90110bc-81e7-42e2-863d-46988d04ecee	84175255-4797-4d3a-8109-3fc0a08401c7	-1010	AccountWithdrawal	2019-04-29 19:35:00.730874+03	Account withdrawal. RefId: NDT21H8H0E
53054a67-fe31-4c02-a805-0e8bd759294a	5205168683344078	NDT81H8H0K	603098	f90110bc-81e7-42e2-863d-46988d04ecee	84175255-4797-4d3a-8109-3fc0a08401c7	-8950	AccountWithdrawal	2019-04-29 19:49:18.180364+03	Account withdrawal. RefId: NDT81H8H0K
7eca4edc-4961-4d17-8d1a-427d1b3da785	5205168683344078	NDU11H8H7V	603098	f90110bc-81e7-42e2-863d-46988d04ecee	84175255-4797-4d3a-8109-3fc0a08401c7	-1010	AccountWithdrawal	2019-04-30 19:26:35.249367+03	Account withdrawal. RefId: NDU11H8H7V
\.


--
-- TOC entry 2798 (class 0 OID 308118)
-- Dependencies: 196
-- Data for Name: __EFMigrationsHistory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."__EFMigrationsHistory" ("MigrationId", "ProductVersion") FROM stdin;
20190416133556_added-transactions-tuple	2.2.3-servicing-35854
20190428105558_initial-migration	2.2.3-servicing-35854
\.


--
-- TOC entry 2676 (class 2606 OID 308130)
-- Name: Transactions PK_Transactions; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Transactions"
    ADD CONSTRAINT "PK_Transactions" PRIMARY KEY ("Id");


--
-- TOC entry 2674 (class 2606 OID 308122)
-- Name: __EFMigrationsHistory PK___EFMigrationsHistory; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."__EFMigrationsHistory"
    ADD CONSTRAINT "PK___EFMigrationsHistory" PRIMARY KEY ("MigrationId");


-- Completed on 2019-05-04 14:35:44

--
-- PostgreSQL database dump complete
--

