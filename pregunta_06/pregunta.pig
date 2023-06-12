/*
Pregunta
===========================================================================

Para el archivo `data.tsv` Calcule la cantidad de registros por clave de la 
columna 3. En otras palabras, cuántos registros hay que tengan la clave 
`aaa`?

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
data = load 'data.tsv' using PigStorage('\t') as (letter: chararray, multiple_letter: bag{t: tuple(x: chararray)}, chain: bag{t: tuple(value: chararray)});

chain_data = foreach data generate flatten(chain);

flattened_data = foreach chain_data generate flatten($0);
divided_data = foreach flattened_data generate flatten(TOKENIZE($0, '#')) as (letters: chararray, number: int);
grouped_data = group divided_data by letters;

count_data = foreach grouped_data generate group as letters, COUNT(divided_data) as count;

store count_data into 'output/' using PigStorage(',');