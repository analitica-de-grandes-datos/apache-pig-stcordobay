/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT 
       birthday, 
       DATE_FORMAT(birthday, "yyyy"),
       DATE_FORMAT(birthday, "yy"),
   FROM 
       persons
   LIMIT
       5;

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
data = load 'data.csv' using PigStorage(',') as (id:int, name:chararray, secondname:chararray, date:chararray, favcolor:chararray, number:int);

output_data = foreach data generate SUBSTRING(date, 0, 4), SUBSTRING(date, 2, 4);

store output_data into 'output/' using PigStorage(',');