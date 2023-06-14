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
data = LOAD 'data.tsv' using PigStorage('\t') as (col1: chararray, col2: bag{}, col3: map[]);

result = FOREACH data GENERATE FLATTEN(col3) AS key;
result = GROUP result BY key;
result = FOREACH result GENERATE group, COUNT(result);

STORE result INTO 'output' USING PigStorage(',');

--data = load 'data.tsv' as (letter: chararray, multiple_letter: bag{}, chain: map[]);
--data = load 'data.tsv' using PigStorage('\t') as (letter: chararray, multiple_letter: bag{}, chain: map[]);

--chain_data = foreach data generate flatten(chain) as character;

--grouped_data = group chain_data by character;

--count_data = foreach grouped_data generate group,  COUNT(grouped_data);

--store count_data into 'output' using PigStorage(',');