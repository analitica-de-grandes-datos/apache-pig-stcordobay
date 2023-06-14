/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT 
       firstname 
   FROM 
       u 
   WHERE 
       SUBSTRING(firstname, 0, 1) >= 'm';

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/


data = load 'data.csv' using PigStorage(',') as (id:int,name:chararray,secondname:chararray,date:chararray,favcolor:chararray,number:int);

filter_data = filter data by SUBSTRING(name, 0, 1) >= 'M';
output_data = foreach filter_data generate name;

store output_data into 'output/' using PigStorage(',');