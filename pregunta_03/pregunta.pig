/*
Pregunta
===========================================================================

Obtenga los cinco (5) valores más pequeños de la 3ra columna.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
data = load 'data.tsv' using PigStorage('\t') as (letter:chararray,date:chararray,number:int);
ordered_data = order data by number asc;

limit_data = limit ordered_data 5;

filter_column = foreach limit_data generate number;

store filter_column into 'output/' using PigStorage(',');