--
-- PostgreSQL database dump
--

-- Dumped from database version 10.4
-- Dumped by pg_dump version 10.4

-- Started on 2019-05-04 14:00:12

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
-- TOC entry 2936 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 206 (class 1259 OID 307989)
-- Name: OpenIddictApplications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."OpenIddictApplications" (
    "ClientId" text NOT NULL,
    "ClientSecret" text,
    "ConcurrencyToken" text,
    "ConsentType" text,
    "DisplayName" text,
    "Id" text NOT NULL,
    "Permissions" text,
    "PostLogoutRedirectUris" text,
    "Properties" text,
    "RedirectUris" text,
    "Type" text NOT NULL
);


ALTER TABLE public."OpenIddictApplications" OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 308005)
-- Name: OpenIddictAuthorizations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."OpenIddictAuthorizations" (
    "ApplicationId" text,
    "ConcurrencyToken" text,
    "Id" text NOT NULL,
    "Properties" text,
    "Scopes" text,
    "Status" text NOT NULL,
    "Subject" text NOT NULL,
    "Type" text NOT NULL
);


ALTER TABLE public."OpenIddictAuthorizations" OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 307997)
-- Name: OpenIddictScopes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."OpenIddictScopes" (
    "ConcurrencyToken" text,
    "Description" text,
    "DisplayName" text,
    "Id" text NOT NULL,
    "Name" text NOT NULL,
    "Properties" text,
    "Resources" text
);


ALTER TABLE public."OpenIddictScopes" OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 308018)
-- Name: OpenIddictTokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."OpenIddictTokens" (
    "ApplicationId" text,
    "AuthorizationId" text,
    "ConcurrencyToken" text,
    "CreationDate" timestamp with time zone,
    "ExpirationDate" timestamp with time zone,
    "Id" text NOT NULL,
    "Payload" text,
    "Properties" text,
    "ReferenceId" text,
    "Status" text,
    "Subject" text NOT NULL,
    "Type" text NOT NULL
);


ALTER TABLE public."OpenIddictTokens" OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 308064)
-- Name: Policies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Policies" (
    "Id" uuid NOT NULL,
    "Name" text NOT NULL,
    "Description" text,
    "ApplicationId" text DEFAULT ''::text NOT NULL
);


ALTER TABLE public."Policies" OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 307907)
-- Name: RoleClaims; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."RoleClaims" (
    "Id" integer NOT NULL,
    "RoleId" text NOT NULL,
    "ClaimType" text,
    "ClaimValue" text
);


ALTER TABLE public."RoleClaims" OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 307905)
-- Name: RoleClaims_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."RoleClaims_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."RoleClaims_Id_seq" OWNER TO postgres;

--
-- TOC entry 2937 (class 0 OID 0)
-- Dependencies: 199
-- Name: RoleClaims_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."RoleClaims_Id_seq" OWNED BY public."RoleClaims"."Id";


--
-- TOC entry 197 (class 1259 OID 307889)
-- Name: Roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Roles" (
    "Id" text NOT NULL,
    "Name" character varying(256),
    "NormalizedName" character varying(256),
    "ConcurrencyStamp" text
);


ALTER TABLE public."Roles" OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 307923)
-- Name: UserClaims; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."UserClaims" (
    "Id" integer NOT NULL,
    "UserId" text NOT NULL,
    "ClaimType" text,
    "ClaimValue" text
);


ALTER TABLE public."UserClaims" OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 307921)
-- Name: UserClaims_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."UserClaims_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."UserClaims_Id_seq" OWNER TO postgres;

--
-- TOC entry 2938 (class 0 OID 0)
-- Dependencies: 201
-- Name: UserClaims_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."UserClaims_Id_seq" OWNED BY public."UserClaims"."Id";


--
-- TOC entry 203 (class 1259 OID 307937)
-- Name: UserLogins; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."UserLogins" (
    "LoginProvider" text NOT NULL,
    "ProviderKey" text NOT NULL,
    "ProviderDisplayName" text,
    "UserId" text NOT NULL
);


ALTER TABLE public."UserLogins" OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 308080)
-- Name: UserPolicies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."UserPolicies" (
    "Id" uuid NOT NULL,
    "PolicyId" uuid NOT NULL,
    "UserId" text NOT NULL,
    "TenantId" text
);


ALTER TABLE public."UserPolicies" OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 307950)
-- Name: UserRoles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."UserRoles" (
    "UserId" text NOT NULL,
    "RoleId" text NOT NULL
);


ALTER TABLE public."UserRoles" OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 307968)
-- Name: UserTokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."UserTokens" (
    "UserId" text NOT NULL,
    "LoginProvider" text NOT NULL,
    "Name" text NOT NULL,
    "Value" text
);


ALTER TABLE public."UserTokens" OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 307897)
-- Name: Users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Users" (
    "Id" text NOT NULL,
    "UserName" character varying(256),
    "NormalizedUserName" character varying(256),
    "Email" character varying(256),
    "NormalizedEmail" character varying(256),
    "EmailConfirmed" boolean NOT NULL,
    "PasswordHash" text,
    "SecurityStamp" text,
    "ConcurrencyStamp" text,
    "PhoneNumber" text,
    "PhoneNumberConfirmed" boolean NOT NULL,
    "TwoFactorEnabled" boolean NOT NULL,
    "LockoutEnd" timestamp with time zone,
    "LockoutEnabled" boolean NOT NULL,
    "AccessFailedCount" integer NOT NULL,
    "_2FAMethod" text
);


ALTER TABLE public."Users" OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 307884)
-- Name: __EFMigrationsHistory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."__EFMigrationsHistory" (
    "MigrationId" character varying(150) NOT NULL,
    "ProductVersion" character varying(32) NOT NULL
);


ALTER TABLE public."__EFMigrationsHistory" OWNER TO postgres;

--
-- TOC entry 2737 (class 2604 OID 307910)
-- Name: RoleClaims Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RoleClaims" ALTER COLUMN "Id" SET DEFAULT nextval('public."RoleClaims_Id_seq"'::regclass);


--
-- TOC entry 2738 (class 2604 OID 307926)
-- Name: UserClaims Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UserClaims" ALTER COLUMN "Id" SET DEFAULT nextval('public."UserClaims_Id_seq"'::regclass);


--
-- TOC entry 2923 (class 0 OID 307989)
-- Dependencies: 206
-- Data for Name: OpenIddictApplications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."OpenIddictApplications" ("ClientId", "ClientSecret", "ConcurrencyToken", "ConsentType", "DisplayName", "Id", "Permissions", "PostLogoutRedirectUris", "Properties", "RedirectUris", "Type") FROM stdin;
mvc	AQAAAAEAACcQAAAAEI/+lLi/3+lu+fZVoBvf7GLabN3uzvWv7dj/JpYyYT3SO0Gce5LW4pDujA+zNc3ZWA==	0b231811-2f47-41ca-a840-9b69ac330acb	\N	MVC client application	98ce5897-2aa2-4572-af49-c66ed3ae5fe3	["ept:authorization","ept:logout","ept:token","gt:authorization_code","gt:refresh_token","scp:email","scp:profile","scp:roles"]	["http://localhost:53507/signout-callback-oidc"]	\N	["http://localhost:53507/signin-oidc"]	confidential
mobileapp	AQAAAAEAACcQAAAAEN6cPi9OIzcWTMh8GIxNBLWwDb7I+TRmpfQ71mHpUKgnpVne9PLlV1SNDB1ewQ7g2g==	bc1d2acc-03a9-49ff-9042-5af9ee8349ec	\N	Counter One Mobile Application	b92b33e3-6241-4d9c-b78f-227a8f10a148	["ept:authorization","ept:logout","ept:token","gt:authorization_code","gt:refresh_token","scp:email","scp:profile","scp:roles"]	\N	\N	["http://192.201.243.56/auth/android/salvon.mobile.apps/callback"]	confidential
postman	\N	5d84d0b2-1354-43b6-9bef-92c35cd0d8d9	\N	Postman	325f957d-ebfc-4fff-a0eb-011d02b81d1b	["ept:authorization","ept:token","gt:authorization_code","scp:email","scp:profile","scp:roles"]	\N	\N	["https://www.getpostman.com/oauth2/callback"]	public
\.


--
-- TOC entry 2925 (class 0 OID 308005)
-- Dependencies: 208
-- Data for Name: OpenIddictAuthorizations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."OpenIddictAuthorizations" ("ApplicationId", "ConcurrencyToken", "Id", "Properties", "Scopes", "Status", "Subject", "Type") FROM stdin;
325f957d-ebfc-4fff-a0eb-011d02b81d1b	490e40d9-ccdb-4bfc-a95c-34f640b0256c	84167274-c1d2-4f8c-8173-c9976b75ec2c	\N	["openid","email","profile","roles"]	valid	16aff1dd-7ddc-4fab-8e51-e65431c52d69	ad-hoc
325f957d-ebfc-4fff-a0eb-011d02b81d1b	aca624e7-d011-4354-b25c-c4bf6fcfac4f	bcf50d7c-fb50-4a97-a60f-36442e0867ee	\N	["openid","email","profile","roles"]	valid	16aff1dd-7ddc-4fab-8e51-e65431c52d69	ad-hoc
325f957d-ebfc-4fff-a0eb-011d02b81d1b	671faf28-c9a8-497c-a643-c2356968c94d	80a9d2e6-7781-4b92-a5c9-ef43f518cdca	\N	["openid","email","profile","roles"]	valid	16aff1dd-7ddc-4fab-8e51-e65431c52d69	ad-hoc
325f957d-ebfc-4fff-a0eb-011d02b81d1b	7702e66e-ab14-4ef5-88f4-d10d85ead409	b05367d6-2bb9-42f5-ba74-dc853d1c83d6	\N	["openid","email","profile","roles"]	valid	ff77c88a-fdc7-4ec0-ba91-3a76ea1da6e4	ad-hoc
325f957d-ebfc-4fff-a0eb-011d02b81d1b	b9e41d45-f4b9-4d3a-b2e0-cca3d10e9a6c	7f28a4f5-a284-4b5a-b172-90a3f0c38cfa	\N	["openid","email","profile","roles"]	valid	02a04928-de4e-4460-963d-7153b50ec4d1	ad-hoc
325f957d-ebfc-4fff-a0eb-011d02b81d1b	dc794722-fde6-46a4-813e-0d6dbcb3a6c6	20016739-eaa3-49b0-8ab4-c4c591100329	\N	["openid","email","profile","roles"]	valid	02a04928-de4e-4460-963d-7153b50ec4d1	ad-hoc
325f957d-ebfc-4fff-a0eb-011d02b81d1b	4623b24d-26c3-40dd-b781-cbddeed31985	494aef83-c406-4f65-80e2-ce0b5749e7cc	\N	["openid","email","profile","roles"]	valid	02a04928-de4e-4460-963d-7153b50ec4d1	ad-hoc
325f957d-ebfc-4fff-a0eb-011d02b81d1b	1cf0707c-8b9c-432a-a6ac-8eaec09bf5ba	45adbe4e-be53-4b19-9544-920613b76830	\N	["openid","email","profile","roles"]	valid	02a04928-de4e-4460-963d-7153b50ec4d1	ad-hoc
325f957d-ebfc-4fff-a0eb-011d02b81d1b	b476f7f4-adab-4609-9a47-8317ab037744	1067cc77-5db5-4e1e-a302-4c83394d886f	\N	["openid","email","profile","roles"]	valid	02a04928-de4e-4460-963d-7153b50ec4d1	ad-hoc
325f957d-ebfc-4fff-a0eb-011d02b81d1b	07bb642f-1e8e-49fd-8602-8e534f2cfa54	67fcbbf9-9f77-499f-aecf-b6afdba161e0	\N	["openid","email","profile","roles"]	valid	02a04928-de4e-4460-963d-7153b50ec4d1	ad-hoc
325f957d-ebfc-4fff-a0eb-011d02b81d1b	904a31ff-8e6e-4629-b400-aaa1829d4632	427fc203-f2fc-4915-b9b4-b202d7d7bb30	\N	["openid","email","profile","roles"]	valid	02a04928-de4e-4460-963d-7153b50ec4d1	ad-hoc
325f957d-ebfc-4fff-a0eb-011d02b81d1b	e7d7dc44-df1d-42c1-b5fb-b200d3d5e97c	f5571dd1-7dd8-4267-a72e-82494f953342	\N	["openid","email","profile","roles"]	valid	02a04928-de4e-4460-963d-7153b50ec4d1	ad-hoc
\.


--
-- TOC entry 2924 (class 0 OID 307997)
-- Dependencies: 207
-- Data for Name: OpenIddictScopes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."OpenIddictScopes" ("ConcurrencyToken", "Description", "DisplayName", "Id", "Name", "Properties", "Resources") FROM stdin;
\.


--
-- TOC entry 2926 (class 0 OID 308018)
-- Dependencies: 209
-- Data for Name: OpenIddictTokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."OpenIddictTokens" ("ApplicationId", "AuthorizationId", "ConcurrencyToken", "CreationDate", "ExpirationDate", "Id", "Payload", "Properties", "ReferenceId", "Status", "Subject", "Type") FROM stdin;
325f957d-ebfc-4fff-a0eb-011d02b81d1b	84167274-c1d2-4f8c-8173-c9976b75ec2c	06e7ebc8-bdd8-4f62-8061-1578de2d60ec	2019-04-26 18:08:54+03	2019-04-26 18:13:54+03	e6c30396-fa0a-4d4b-a458-37f8e9bb65eb	\N	\N	\N	redeemed	16aff1dd-7ddc-4fab-8e51-e65431c52d69	authorization_code
325f957d-ebfc-4fff-a0eb-011d02b81d1b	bcf50d7c-fb50-4a97-a60f-36442e0867ee	e6701f06-f169-46b9-9d5a-44d84f6ac12d	2019-04-26 18:09:16+03	2019-04-26 18:14:16+03	51fdaac2-abdd-4319-8b01-81897ce05fbf	\N	\N	\N	redeemed	16aff1dd-7ddc-4fab-8e51-e65431c52d69	authorization_code
325f957d-ebfc-4fff-a0eb-011d02b81d1b	80a9d2e6-7781-4b92-a5c9-ef43f518cdca	cb1f8a5f-4b65-4faa-82e9-7197d6781ecb	2019-04-26 19:00:13+03	2019-04-26 19:05:13+03	aba910aa-48ce-4e09-a133-f08c644a8e0e	\N	\N	\N	redeemed	16aff1dd-7ddc-4fab-8e51-e65431c52d69	authorization_code
325f957d-ebfc-4fff-a0eb-011d02b81d1b	b05367d6-2bb9-42f5-ba74-dc853d1c83d6	f18e3e96-24bd-4295-8c0c-8d585bb0b60a	2019-04-28 09:41:47+03	2019-04-28 09:46:47+03	d0d6710c-1017-41a2-a9f2-fb22fb8fef65	\N	\N	\N	redeemed	ff77c88a-fdc7-4ec0-ba91-3a76ea1da6e4	authorization_code
325f957d-ebfc-4fff-a0eb-011d02b81d1b	7f28a4f5-a284-4b5a-b172-90a3f0c38cfa	a5ceb0d5-49b4-4c42-8ffe-f78b04dd34e6	2019-04-29 22:10:55+03	2019-04-29 22:15:55+03	3d5fe069-6336-4c8b-9b3f-9d321a1467e9	\N	\N	\N	redeemed	02a04928-de4e-4460-963d-7153b50ec4d1	authorization_code
325f957d-ebfc-4fff-a0eb-011d02b81d1b	20016739-eaa3-49b0-8ab4-c4c591100329	4ff733b1-83d2-438c-aaf4-8eef963e70c6	2019-04-30 10:54:51+03	2019-04-30 10:59:51+03	84915566-87d1-420c-ba1f-c031f41379d7	\N	\N	\N	redeemed	02a04928-de4e-4460-963d-7153b50ec4d1	authorization_code
325f957d-ebfc-4fff-a0eb-011d02b81d1b	494aef83-c406-4f65-80e2-ce0b5749e7cc	0add58c9-61b2-42af-b2c8-db9fed49c717	2019-04-30 16:21:01+03	2019-04-30 16:26:01+03	6ea5f7d5-e3ea-4d4b-a3e0-fa64a4366c34	\N	\N	\N	redeemed	02a04928-de4e-4460-963d-7153b50ec4d1	authorization_code
325f957d-ebfc-4fff-a0eb-011d02b81d1b	45adbe4e-be53-4b19-9544-920613b76830	2f0f3646-5aec-4757-aba6-524ca3e6040d	2019-04-30 16:53:02+03	2019-04-30 16:58:02+03	015f9448-38bd-41da-92d4-bb65db668380	\N	\N	\N	redeemed	02a04928-de4e-4460-963d-7153b50ec4d1	authorization_code
325f957d-ebfc-4fff-a0eb-011d02b81d1b	1067cc77-5db5-4e1e-a302-4c83394d886f	b33c3331-d58d-41bf-b97c-5d45f48cdc86	2019-04-30 18:17:24+03	2019-04-30 18:22:24+03	3140d304-d74a-49a7-ae62-1087e9f50a34	\N	\N	\N	redeemed	02a04928-de4e-4460-963d-7153b50ec4d1	authorization_code
325f957d-ebfc-4fff-a0eb-011d02b81d1b	67fcbbf9-9f77-499f-aecf-b6afdba161e0	19572676-e078-4c9a-a48e-5a9ce0d837f0	2019-04-30 18:17:45+03	2019-04-30 18:22:45+03	80ad0cf0-a99e-4cfb-ac95-9e70bd9443cf	\N	\N	\N	redeemed	02a04928-de4e-4460-963d-7153b50ec4d1	authorization_code
325f957d-ebfc-4fff-a0eb-011d02b81d1b	427fc203-f2fc-4915-b9b4-b202d7d7bb30	305af7f7-577b-47a1-b1d8-5057237ddfeb	2019-04-30 19:18:21+03	2019-04-30 19:23:21+03	3247f953-0987-41be-b28f-99eff3980e26	\N	\N	\N	redeemed	02a04928-de4e-4460-963d-7153b50ec4d1	authorization_code
325f957d-ebfc-4fff-a0eb-011d02b81d1b	f5571dd1-7dd8-4267-a72e-82494f953342	669a77d3-8eb4-42b6-b139-69fb329cd41c	2019-05-04 13:50:43+03	2019-05-04 13:55:43+03	6cb360c6-f05f-46ca-b1c1-b4133308f07e	\N	\N	\N	redeemed	02a04928-de4e-4460-963d-7153b50ec4d1	authorization_code
\.


--
-- TOC entry 2927 (class 0 OID 308064)
-- Dependencies: 210
-- Data for Name: Policies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Policies" ("Id", "Name", "Description", "ApplicationId") FROM stdin;
\.


--
-- TOC entry 2917 (class 0 OID 307907)
-- Dependencies: 200
-- Data for Name: RoleClaims; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."RoleClaims" ("Id", "RoleId", "ClaimType", "ClaimValue") FROM stdin;
\.


--
-- TOC entry 2914 (class 0 OID 307889)
-- Dependencies: 197
-- Data for Name: Roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Roles" ("Id", "Name", "NormalizedName", "ConcurrencyStamp") FROM stdin;
df18ea6a-5e69-422a-905f-10e88087cce0	Admin	ADMIN	5be27e06-1469-4fd5-b225-562cad57c4c2
ec45827c-b3ea-497e-b0ab-e73c0b76cf40	Manager	MANAGER	2ff3507b-4a21-46ca-8dd1-bdd5919a7386
2e8ccf98-af1a-4446-ba75-9021452a5281	Member	MEMBER	d262fd3f-8e0b-4dda-9f66-b81db1e30590
dfb847dc-08bb-4934-84e0-bf314da8f8bb	Staff	STAFF	188d212f-f880-4373-b659-8e4a9ac415ba
488acfab-71a3-4f08-8f25-3d077418101f	Tenant	TENANT	9d511a47-dd37-4da7-a8f1-e31140214852
\.


--
-- TOC entry 2919 (class 0 OID 307923)
-- Dependencies: 202
-- Data for Name: UserClaims; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."UserClaims" ("Id", "UserId", "ClaimType", "ClaimValue") FROM stdin;
\.


--
-- TOC entry 2920 (class 0 OID 307937)
-- Dependencies: 203
-- Data for Name: UserLogins; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."UserLogins" ("LoginProvider", "ProviderKey", "ProviderDisplayName", "UserId") FROM stdin;
Google	114613869116323554550	Google	02a04928-de4e-4460-963d-7153b50ec4d1
\.


--
-- TOC entry 2928 (class 0 OID 308080)
-- Dependencies: 211
-- Data for Name: UserPolicies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."UserPolicies" ("Id", "PolicyId", "UserId", "TenantId") FROM stdin;
\.


--
-- TOC entry 2921 (class 0 OID 307950)
-- Dependencies: 204
-- Data for Name: UserRoles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."UserRoles" ("UserId", "RoleId") FROM stdin;
7019203f-2a38-4894-ae38-6d9c5872d840	dfb847dc-08bb-4934-84e0-bf314da8f8bb
\.


--
-- TOC entry 2922 (class 0 OID 307968)
-- Dependencies: 205
-- Data for Name: UserTokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."UserTokens" ("UserId", "LoginProvider", "Name", "Value") FROM stdin;
\.


--
-- TOC entry 2915 (class 0 OID 307897)
-- Dependencies: 198
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Users" ("Id", "UserName", "NormalizedUserName", "Email", "NormalizedEmail", "EmailConfirmed", "PasswordHash", "SecurityStamp", "ConcurrencyStamp", "PhoneNumber", "PhoneNumberConfirmed", "TwoFactorEnabled", "LockoutEnd", "LockoutEnabled", "AccessFailedCount", "_2FAMethod") FROM stdin;
7019203f-2a38-4894-ae38-6d9c5872d840	evahshiko81@gmail.com	EVAHSHIKO81@GMAIL.COM	evahshiko81@gmail.com	EVAHSHIKO81@GMAIL.COM	f	AQAAAAEAACcQAAAAEBESN0pKLzfWF5uT4jCWIPuaI7UVv0nbu7YOxX7fJQRdn3ppvyb+Pj5mu3CCoq6UEg==	VJCAPKZFENZYYZXH4AM4336BUMMAQEFT	ae4cdab1-e2b3-4bdd-b5cc-794e40e19d58	\N	f	f	\N	t	0	\N
02a04928-de4e-4460-963d-7153b50ec4d1	eric.gitonga38@gmail.com	ERIC.GITONGA38@GMAIL.COM	eric.gitonga38@gmail.com	ERIC.GITONGA38@GMAIL.COM	f	\N	N4H2DU2E44R2VRZZ7XXVZN2RBZYTWDKS	17ce8c0b-a12d-4b76-8244-84280f55dd9b	\N	f	f	\N	t	0	\N
\.


--
-- TOC entry 2913 (class 0 OID 307884)
-- Dependencies: 196
-- Data for Name: __EFMigrationsHistory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."__EFMigrationsHistory" ("MigrationId", "ProductVersion") FROM stdin;
20181007072014_postgresql-migration	2.2.4-servicing-10062
20181007072131_openiddictcore-migration	2.2.4-servicing-10062
20181007073221_openiddictcore-migration-1	2.2.4-servicing-10062
20181007082115_modified-applicationuser	2.2.4-servicing-10062
20181023145100_added-2fafield	2.2.4-servicing-10062
20190328100140_AddedPolicyTuple	2.2.4-servicing-10062
20190328134222_AddedUserPolicyTuple	2.2.4-servicing-10062
20190329080949_added-iidentifier	2.2.4-servicing-10062
20190409062615_initial-setup	2.2.4-servicing-10062
20190409063142_database-recreation	2.2.4-servicing-10062
\.


--
-- TOC entry 2939 (class 0 OID 0)
-- Dependencies: 199
-- Name: RoleClaims_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."RoleClaims_Id_seq"', 1, false);


--
-- TOC entry 2940 (class 0 OID 0)
-- Dependencies: 201
-- Name: UserClaims_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."UserClaims_Id_seq"', 1, false);


--
-- TOC entry 2765 (class 2606 OID 307996)
-- Name: OpenIddictApplications PK_OpenIddictApplications; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."OpenIddictApplications"
    ADD CONSTRAINT "PK_OpenIddictApplications" PRIMARY KEY ("Id");


--
-- TOC entry 2771 (class 2606 OID 308012)
-- Name: OpenIddictAuthorizations PK_OpenIddictAuthorizations; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."OpenIddictAuthorizations"
    ADD CONSTRAINT "PK_OpenIddictAuthorizations" PRIMARY KEY ("Id");


--
-- TOC entry 2768 (class 2606 OID 308004)
-- Name: OpenIddictScopes PK_OpenIddictScopes; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."OpenIddictScopes"
    ADD CONSTRAINT "PK_OpenIddictScopes" PRIMARY KEY ("Id");


--
-- TOC entry 2776 (class 2606 OID 308025)
-- Name: OpenIddictTokens PK_OpenIddictTokens; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."OpenIddictTokens"
    ADD CONSTRAINT "PK_OpenIddictTokens" PRIMARY KEY ("Id");


--
-- TOC entry 2778 (class 2606 OID 308071)
-- Name: Policies PK_Policies; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Policies"
    ADD CONSTRAINT "PK_Policies" PRIMARY KEY ("Id");


--
-- TOC entry 2751 (class 2606 OID 307915)
-- Name: RoleClaims PK_RoleClaims; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RoleClaims"
    ADD CONSTRAINT "PK_RoleClaims" PRIMARY KEY ("Id");


--
-- TOC entry 2743 (class 2606 OID 307896)
-- Name: Roles PK_Roles; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Roles"
    ADD CONSTRAINT "PK_Roles" PRIMARY KEY ("Id");


--
-- TOC entry 2754 (class 2606 OID 307931)
-- Name: UserClaims PK_UserClaims; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UserClaims"
    ADD CONSTRAINT "PK_UserClaims" PRIMARY KEY ("Id");


--
-- TOC entry 2757 (class 2606 OID 307944)
-- Name: UserLogins PK_UserLogins; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UserLogins"
    ADD CONSTRAINT "PK_UserLogins" PRIMARY KEY ("LoginProvider", "ProviderKey");


--
-- TOC entry 2781 (class 2606 OID 308087)
-- Name: UserPolicies PK_UserPolicies; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UserPolicies"
    ADD CONSTRAINT "PK_UserPolicies" PRIMARY KEY ("Id");


--
-- TOC entry 2760 (class 2606 OID 307957)
-- Name: UserRoles PK_UserRoles; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UserRoles"
    ADD CONSTRAINT "PK_UserRoles" PRIMARY KEY ("UserId", "RoleId");


--
-- TOC entry 2762 (class 2606 OID 307975)
-- Name: UserTokens PK_UserTokens; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UserTokens"
    ADD CONSTRAINT "PK_UserTokens" PRIMARY KEY ("UserId", "LoginProvider", "Name");


--
-- TOC entry 2747 (class 2606 OID 308095)
-- Name: Users PK_Users; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "PK_Users" PRIMARY KEY ("Id");


--
-- TOC entry 2741 (class 2606 OID 307888)
-- Name: __EFMigrationsHistory PK___EFMigrationsHistory; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."__EFMigrationsHistory"
    ADD CONSTRAINT "PK___EFMigrationsHistory" PRIMARY KEY ("MigrationId");


--
-- TOC entry 2745 (class 1259 OID 307986)
-- Name: EmailIndex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "EmailIndex" ON public."Users" USING btree ("NormalizedEmail");


--
-- TOC entry 2763 (class 1259 OID 308036)
-- Name: IX_OpenIddictApplications_ClientId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IX_OpenIddictApplications_ClientId" ON public."OpenIddictApplications" USING btree ("ClientId");


--
-- TOC entry 2769 (class 1259 OID 308037)
-- Name: IX_OpenIddictAuthorizations_ApplicationId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_OpenIddictAuthorizations_ApplicationId" ON public."OpenIddictAuthorizations" USING btree ("ApplicationId");


--
-- TOC entry 2766 (class 1259 OID 308038)
-- Name: IX_OpenIddictScopes_Name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IX_OpenIddictScopes_Name" ON public."OpenIddictScopes" USING btree ("Name");


--
-- TOC entry 2772 (class 1259 OID 308039)
-- Name: IX_OpenIddictTokens_ApplicationId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_OpenIddictTokens_ApplicationId" ON public."OpenIddictTokens" USING btree ("ApplicationId");


--
-- TOC entry 2773 (class 1259 OID 308040)
-- Name: IX_OpenIddictTokens_AuthorizationId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_OpenIddictTokens_AuthorizationId" ON public."OpenIddictTokens" USING btree ("AuthorizationId");


--
-- TOC entry 2774 (class 1259 OID 308041)
-- Name: IX_OpenIddictTokens_ReferenceId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IX_OpenIddictTokens_ReferenceId" ON public."OpenIddictTokens" USING btree ("ReferenceId");


--
-- TOC entry 2749 (class 1259 OID 307981)
-- Name: IX_RoleClaims_RoleId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_RoleClaims_RoleId" ON public."RoleClaims" USING btree ("RoleId");


--
-- TOC entry 2752 (class 1259 OID 307983)
-- Name: IX_UserClaims_UserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_UserClaims_UserId" ON public."UserClaims" USING btree ("UserId");


--
-- TOC entry 2755 (class 1259 OID 307984)
-- Name: IX_UserLogins_UserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_UserLogins_UserId" ON public."UserLogins" USING btree ("UserId");


--
-- TOC entry 2779 (class 1259 OID 308093)
-- Name: IX_UserPolicies_PolicyId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_UserPolicies_PolicyId" ON public."UserPolicies" USING btree ("PolicyId");


--
-- TOC entry 2758 (class 1259 OID 307985)
-- Name: IX_UserRoles_RoleId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_UserRoles_RoleId" ON public."UserRoles" USING btree ("RoleId");


--
-- TOC entry 2744 (class 1259 OID 307982)
-- Name: RoleNameIndex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "RoleNameIndex" ON public."Roles" USING btree ("NormalizedName");


--
-- TOC entry 2748 (class 1259 OID 307987)
-- Name: UserNameIndex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "UserNameIndex" ON public."Users" USING btree ("NormalizedUserName");


--
-- TOC entry 2788 (class 2606 OID 308013)
-- Name: OpenIddictAuthorizations FK_OpenIddictAuthorizations_OpenIddictApplications_Application~; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."OpenIddictAuthorizations"
    ADD CONSTRAINT "FK_OpenIddictAuthorizations_OpenIddictApplications_Application~" FOREIGN KEY ("ApplicationId") REFERENCES public."OpenIddictApplications"("Id") ON DELETE RESTRICT;


--
-- TOC entry 2789 (class 2606 OID 308026)
-- Name: OpenIddictTokens FK_OpenIddictTokens_OpenIddictApplications_ApplicationId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."OpenIddictTokens"
    ADD CONSTRAINT "FK_OpenIddictTokens_OpenIddictApplications_ApplicationId" FOREIGN KEY ("ApplicationId") REFERENCES public."OpenIddictApplications"("Id") ON DELETE RESTRICT;


--
-- TOC entry 2790 (class 2606 OID 308031)
-- Name: OpenIddictTokens FK_OpenIddictTokens_OpenIddictAuthorizations_AuthorizationId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."OpenIddictTokens"
    ADD CONSTRAINT "FK_OpenIddictTokens_OpenIddictAuthorizations_AuthorizationId" FOREIGN KEY ("AuthorizationId") REFERENCES public."OpenIddictAuthorizations"("Id") ON DELETE RESTRICT;


--
-- TOC entry 2782 (class 2606 OID 307916)
-- Name: RoleClaims FK_RoleClaims_Roles_RoleId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RoleClaims"
    ADD CONSTRAINT "FK_RoleClaims_Roles_RoleId" FOREIGN KEY ("RoleId") REFERENCES public."Roles"("Id") ON DELETE CASCADE;


--
-- TOC entry 2783 (class 2606 OID 308096)
-- Name: UserClaims FK_UserClaims_Users_UserId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UserClaims"
    ADD CONSTRAINT "FK_UserClaims_Users_UserId" FOREIGN KEY ("UserId") REFERENCES public."Users"("Id") ON DELETE CASCADE;


--
-- TOC entry 2784 (class 2606 OID 308101)
-- Name: UserLogins FK_UserLogins_Users_UserId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UserLogins"
    ADD CONSTRAINT "FK_UserLogins_Users_UserId" FOREIGN KEY ("UserId") REFERENCES public."Users"("Id") ON DELETE CASCADE;


--
-- TOC entry 2791 (class 2606 OID 308088)
-- Name: UserPolicies FK_UserPolicies_Policies_PolicyId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UserPolicies"
    ADD CONSTRAINT "FK_UserPolicies_Policies_PolicyId" FOREIGN KEY ("PolicyId") REFERENCES public."Policies"("Id") ON DELETE CASCADE;


--
-- TOC entry 2785 (class 2606 OID 307958)
-- Name: UserRoles FK_UserRoles_Roles_RoleId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UserRoles"
    ADD CONSTRAINT "FK_UserRoles_Roles_RoleId" FOREIGN KEY ("RoleId") REFERENCES public."Roles"("Id") ON DELETE CASCADE;


--
-- TOC entry 2786 (class 2606 OID 308106)
-- Name: UserRoles FK_UserRoles_Users_UserId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UserRoles"
    ADD CONSTRAINT "FK_UserRoles_Users_UserId" FOREIGN KEY ("UserId") REFERENCES public."Users"("Id") ON DELETE CASCADE;


--
-- TOC entry 2787 (class 2606 OID 308111)
-- Name: UserTokens FK_UserTokens_Users_UserId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UserTokens"
    ADD CONSTRAINT "FK_UserTokens_Users_UserId" FOREIGN KEY ("UserId") REFERENCES public."Users"("Id") ON DELETE CASCADE;


-- Completed on 2019-05-04 14:00:13

--
-- PostgreSQL database dump complete
--

