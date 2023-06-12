/* 
Pregunta
===========================================================================

Para el archivo `data.tsv` compute la cantidad de registros por letra.
Almacene los resultados separados por comas. 

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
data = load 'data.tsv' using PigStorage('\t') as (letter:chararray,date:chararray,number:int);

groupdata = group data by letter; 
countletter = foreach groupdata generate group, COUNT(data); 


store countletter into 'output/' using PigStorage(',');