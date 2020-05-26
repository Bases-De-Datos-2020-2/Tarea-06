CREATE DATABASE hospital
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    CONNECTION LIMIT = -1;

 --
CREATE TABLE public."Persona"
(
    id serial,
    nombre character varying(50),
    paterno character varying(20),
    materno character varying(20),
    nacimiento date,
    calle character varying(100),
    num numeric,
    estado character varying(100),
    cp numeric,
    es_paciente boolean,
    es_medico boolean,
    CONSTRAINT person_pkey PRIMARY KEY (id)
);

ALTER TABLE public."Persona"
    OWNER to postgres;

--

CREATE TABLE public."Ingreso"
(
    num_ingreso serial,
    motivo character varying,
    fecha date,
    habitacion integer,
    tipo_cama character varying,
    id_persona bigint,
    id_medico bigint,
    PRIMARY KEY (num_ingreso)
);

ALTER TABLE public."Ingreso"
    OWNER to postgres;

-- 
CREATE TABLE public."medico"
(
    id_medico bigint
)


ALTER TABLE public."medico"
    OWNER to postgres;

--
CREATE TABLE public."Consulta"
(
    num_consulta serial,
    consultorio bigint,
    fecha date,
    precio integer,
    id_persona bigint,
    id_medivo bigint,
    CONSTRAINT consulta_pkey PRIMARY KEY (num_consulta)
);

ALTER TABLE public."Consulta"
    OWNER to postgres;

-- 
CREATE TABLE public."Especialidad"
(
    id serial,
    nombre_especialidad character varying,
    CONSTRAINT especialidad_pkey PRIMARY KEY (id)
);

ALTER TABLE public."Especialidad"
    OWNER to postgres;