--- Importar la data

create table Nacionalidades (
Nacionalidad varchar(50),
Grupo_edad  varchar(100),
Sexo Varchar(10),
Periodo varchar(100),
Total bigint
)

------ ajustar la tabla 


SET datestyle = 'ISO, DMY';
SET lc_time = 'es_ES.UTF-8';


SELECT * , TO_CHAR(
           TO_DATE(
               REPLACE(REPLACE(
                   CASE 
                       WHEN periodo LIKE '%enero%' THEN REPLACE(periodo, 'enero', 'January')
                       WHEN periodo LIKE '%febrero%' THEN REPLACE(periodo, 'febrero', 'February')
                       WHEN periodo LIKE '%marzo%' THEN REPLACE(periodo, 'marzo', 'March')
                       WHEN periodo LIKE '%abril%' THEN REPLACE(periodo, 'abril', 'April')
                       WHEN periodo LIKE '%mayo%' THEN REPLACE(periodo, 'mayo', 'May')
                       WHEN periodo LIKE '%junio%' THEN REPLACE(periodo, 'junio', 'June')
                       WHEN periodo LIKE '%julio%' THEN REPLACE(periodo, 'julio', 'July')
                       WHEN periodo LIKE '%agosto%' THEN REPLACE(periodo, 'agosto', 'August')
                       WHEN periodo LIKE '%septiembre%' THEN REPLACE(periodo, 'septiembre', 'September')
                       WHEN periodo LIKE '%octubre%' THEN REPLACE(periodo, 'octubre', 'October')
                       WHEN periodo LIKE '%noviembre%' THEN REPLACE(periodo, 'noviembre', 'November')
                       WHEN periodo LIKE '%diciembre%' THEN REPLACE(periodo, 'diciembre', 'December')
                       ELSE periodo
                   END
               , 'de ', ''), ' ', '-'),
               'DD-Month-YYYY'
           ), 
           'DD/MM/YYYY'
       ) AS fecha_convertida 
into Nacionalidades_Fecha
FROM Nacionalidades;

---- Creacion tabla final 

SELECT 
    nacionalidad,
    grupo_edad,
    sexo,
    fecha_convertida,
    EXTRACT(MONTH FROM TO_DATE(fecha_convertida, 'DD/MM/YYYY')) AS mes,
    EXTRACT(YEAR FROM TO_DATE(fecha_convertida, 'DD/MM/YYYY')) AS año,
    TO_CHAR(TO_DATE(fecha_convertida, 'DD/MM/YYYY'), 'MM-YYYY') AS Periodo,
    total
INTO Nacionalidades_2	
FROM 
    Nacionalidades_fecha;






