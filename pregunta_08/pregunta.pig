/*
Pregunta
===========================================================================

Para el archivo `data.tsv` compute la cantidad de registros por letra de la 
columna 2 y clave de al columna 3; esto es, por ejemplo, la cantidad de 
registros en tienen la letra `b` en la columna 2 y la clave `jjj` en la 
columna 3 es:

  ((b,jjj), 216)

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

data = load 'data.tsv' using PigStorage('\t') as (letter: chararray, multiple_letter: bag{t: tuple(x: chararray)}, chain: bag{t: tuple(value: chararray)});

separate_data = foreach data generate flatten(multiple_letter) as letra, flatten(chain) as key;
group_data = group separate_data by (letra, key);
output_data = foreach group_data generate $0 as letra, SIZE($1) as valor;

store output_data into 'output/' using PigStorage(',');