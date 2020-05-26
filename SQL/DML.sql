CREATE DATABASE hospital
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    CONNECTION LIMIT = -1;

 -- Tablas de la base de datos
CREATE TABLE public."persona"
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

ALTER TABLE public."persona"
    OWNER to postgres;

--

CREATE TABLE public."ingreso"
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

ALTER TABLE public."ingreso"
    OWNER to postgres;

-- 
CREATE TABLE medico() INHERITS (persona);
ALTER TABLE public.medico
    ADD CONSTRAINT medico_pkey PRIMARY KEY (id);

--
CREATE TABLE public."consulta"
(
    num_consulta serial,
    consultorio bigint,
    fecha date,
    precio integer,
    id_persona bigint,
    id_medico bigint,
    CONSTRAINT consulta_pkey PRIMARY KEY (num_consulta)
);

ALTER TABLE public."consulta"
    OWNER to postgres;

-- 
CREATE TABLE public."especialidad"
(
    id serial,
    nombre_especialidad character varying,
    CONSTRAINT especialidad_pkey PRIMARY KEY (id)
);

ALTER TABLE public."especialidad"
    OWNER to postgres;

-- 
CREATE TABLE public.supervisar
(
    id_medico_supervisor integer,
    id_medico_supervisado integer
);

ALTER TABLE public.supervisar
    OWNER to postgres;


--
CREATE TABLE public.tener
(
    id_medico integer,
    id_especialidad integer
);

ALTER TABLE public.tener
    OWNER to postgres;




-- Relaciones

-- Relacion persona -> ingreso 
ALTER TABLE public.ingreso
    ADD CONSTRAINT persona_ingreso_fk FOREIGN KEY (id_persona)
    REFERENCES public.persona (id) MATCH SIMPLE
    ON UPDATE CASCADE
    ON DELETE CASCADE
    NOT VALID;



-- Relacion medico -> ingreso
ALTER TABLE public.ingreso
    ADD CONSTRAINT medico_ingreso_fk FOREIGN KEY (id_medico)
    REFERENCES public.medico (id) MATCH SIMPLE
    ON UPDATE CASCADE
    ON DELETE CASCADE
    NOT VALID;

-- Relacion medico -> consulta 
ALTER TABLE public.consulta
    ADD CONSTRAINT medico_consulta FOREIGN KEY (id_medico)
    REFERENCES public.medico (id) MATCH SIMPLE
    ON UPDATE CASCADE
    ON DELETE CASCADE
    NOT VALID;


-- Relacion persona -> consulta 
ALTER TABLE public.consulta
    ADD CONSTRAINT "person_consulta " FOREIGN KEY (id_persona)
    REFERENCES public.persona (id) MATCH SIMPLE
    ON UPDATE CASCADE
    ON DELETE CASCADE
    NOT VALID;


-- Relacion  medico -> medico recursiva
ALTER TABLE public.supervisar
    ADD CONSTRAINT medico_supervisor_medico_supervisado_fk FOREIGN KEY (id_medico_supervisor)
    REFERENCES public.medico (id) MATCH SIMPLE
    ON UPDATE CASCADE
    ON DELETE CASCADE
    NOT VALID;

ALTER TABLE public.supervisar
    ADD CONSTRAINT medico_supervisado_medico_supervisor_fk FOREIGN KEY (id_medico_supervisado)
    REFERENCES public.medico (id) MATCH SIMPLE
    ON UPDATE CASCADE
    ON DELETE CASCADE
    NOT VALID;


-- Relacion especialidad -> tener
ALTER TABLE public.tener
    ADD CONSTRAINT especialidad_tener_fkey FOREIGN KEY (id_especialidad)
    REFERENCES public.especialidad (id) MATCH SIMPLE
    ON UPDATE CASCADE
    ON DELETE CASCADE
    NOT VALID;

-- Relacion medico -> tener 

ALTER TABLE public.tener
    ADD CONSTRAINT medico_tener_fkey FOREIGN KEY (id_medico)
    REFERENCES public.medico (id) MATCH SIMPLE
    ON UPDATE CASCADE
    ON DELETE CASCADE
    NOT VALID;


