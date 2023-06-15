/*
Pregunta
===========================================================================

Para el archivo `data.tsv` genere una tabla que contenga la primera columna,
la cantidad de elementos en la columna 2 y la cantidad de elementos en la 
columna 3 separados por coma. La tabla debe estar ordenada por las 
columnas 1, 2 y 3.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
data = load 'data.tsv' using PigStorage('\t') as (letter: chararray, multiple_letter: bag{t: tuple(x: chararray)}, chain: map[]);

counted_data = foreach data generate letter, SIZE(multiple_letter) as multiletter_count, SIZE(chain) as chain_count;
order_counted = order counted_data by letter, multiletter_count, chain_count;

store order_counted into 'output/' using PigStorage(',');