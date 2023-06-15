/*
Pregunta
===========================================================================

Ordene el archivo `data.tsv`  por letra y valor (3ra columna). Escriba el
resultado separado por comas.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

     >>> Escriba el codigo del mapper a partir de este punto <<<
*/
data = load 'data.tsv' using PigStorage('\t') as (letter:chararray,date:chararray,number:int);
ordered_data = order data by letter, number;

store ordered_data into 'output/' using PigStorage(',');