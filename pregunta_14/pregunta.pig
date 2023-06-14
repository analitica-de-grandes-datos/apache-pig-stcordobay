/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT 
       color 
   FROM 
       u 
   WHERE 
       color NOT LIKE 'b%';

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

*/

data = load 'data.csv' using PigStorage(',') as (id:int,name:chararray,secondname:chararray,date:chararray,favcolor:chararray,number:int);

selectcolor = filter data by not(favcolor matches 'b.*');
output_color = foreach selectcolor generate favcolor;



store output_color into 'output/' using PigStorage(',');
