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
data = load 'data.tsv' using PigStorage('\t') as (letter: chararray, multiple_letter: bag{}, chain: map[]);

count_data = foreach data generate flatten(chain) as key;
count_data = group count_data by key;
count_data = foreach count_data generate group, COUNT(result);

store count_data into 'output' using PigStorage(',');

--chain_data = foreach data generate flatten(chain) as character;

--grouped_data = group chain_data by character;

--count_data = foreach grouped_data generate group,  COUNT(grouped_data);

--store count_data into 'output' using PigStorage(',');