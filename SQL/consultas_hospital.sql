--EJERCICO A


-- EJERCICIO B
SELECT * FROM persona
JOIN consulta ON ( persona.id = consulta.id_persona)
WHERE 
	EXTRACT(DAY FROM persona.nacimiento) = EXTRACT( DAY FROM consulta.fecha) AND  
	EXTRACT(MONTH FROM persona.nacimiento) = EXTRACT( MONTH FROM consulta.fecha);

-- EJERCICIO C
SELECT 
		MAX(a.count)
FROM (
	SELECT id , "nombre","paterno","nacimiento","calle","cp", "num", count(id_medico) 
	FROM "medico" inner join consulta on (consulta.id_medico = medico.id )
	GROUP BY id 
)a;


-- EJERCICIO E 
SELECT * FROM persona 
JOIN consulta ON (persona.id = consulta.id_persona)
JOIN medico ON (consulta.id_medico = medico .id)
WHERE persona.es_paciente = true and persona.es_medico =true;


-- EJERCICIO F
SELECT  * FROM persona
LEFT JOIN consulta ON (persona.id = consulta.id_persona)
WHERE  consulta.id_persona IS NULL;
-- EJERCICIO G

select * 
from persona 
join consulta on (persona.id = consulta.id_persona);