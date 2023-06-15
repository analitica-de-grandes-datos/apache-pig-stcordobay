/*
Pregunta
===========================================================================

Para el archivo `data.tsv` compute Calcule la cantidad de registros en que 
aparece cada letra minúscula en la columna 2.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
data = load 'data.tsv' using PigStorage('\t') as (letter: chararray, multiple_letter: bag{t: tuple(x: chararray)}, chain: chararray);


separate_data = foreach data generate flatten(multiple_letter) as x;
grouped = group separate_data by x;
count_letter = foreach grouped generate group as x, COUNT(separate_data) as count;

store count_letter into 'output/' using PigStorage(',');