/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT 
       firstname,
       color
   FROM 
       u 
   WHERE color = 'blue' AND firstname LIKE 'Z%';

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

*/

data = load 'data.csv' using PigStorage(',') as (id:int, name:chararray, secondname:chararray, date:chararray,f avcolor:chararray, number:int);


filter_data = filter data by (favcolor == 'blue' and name matches 'Z.*');
output_data = foreach filter_data generate name, favcolor;

store output_data into 'output/' using PigStorage(' ');
