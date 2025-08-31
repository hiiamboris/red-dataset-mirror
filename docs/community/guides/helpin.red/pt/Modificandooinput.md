Original URL: <http://helpin.red/pt/Modificandooinput.html>

# Modificando o input

* * *

## Parse - Modifying input:

* * *

PARSE  insert

Insere um valor no bloco de input na posição corrente.

Red\[]

a:  \["fox" "dog" "owl" "rat"]

print parse a [

       "fox"        

       "dog"

       insert 33

       "owl"

       "rat"  

]

print a

true

fox dog 33 owl rat

PARSE  remove

Remove do bloco de input um valor que tenha uma correspondência bem-sucedida.

Red\[]

a:  \["fox" "dog" "owl" "rat"]

print parse a [

       "fox"

       remove

       "dog"

       remove

       "owl"

       "rat"  

]

print a

true

fox rat

PARSE  change

Altera uma correspondência bem-sucedida:

Red\[]

a:  \["fox" "dog" "owl" "rat"]

print parse a [

       "fox"        

       "dog"

       change "owl" "COW"

       "owl"

       "rat"  

]

print a

false

fox dog COW rat
