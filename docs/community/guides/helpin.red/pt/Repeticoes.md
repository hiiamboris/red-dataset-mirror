Original URL: <http://helpin.red/pt/Repeticoes.html>

# Repetições

* * *

* * *

native! loop

Executa um bloco um dado número de vezes:

Red\[]

loop 3 \[print "hello!"]

hello!  
hello!  
hello!  
&gt;&gt;

native! repeat

repeat é o mesmo que loop, mas possui um índice que é incrementado a cada repetição:

Red\[]

repeat i 3 \[print i]

1  
2  
3  
&gt;&gt;

native! forall

Executa um bloco enquanto avança em uma série:

Red\[]

a: \["china" "japan" "korea" "usa"]

forall a \[print a]

china japan korea usa  
japan korea usa  
korea usa  
usa  
&gt;&gt;

native! foreach

Executa um bloco para cada elemento da série:

Red\[]

a: \["china" "japan" "korea" "usa"]

foreach i a \[print i]

china  
japan  
korea  
usa  
&gt;&gt;

native! while

Executa um bloco enquanto uma condição é verdadeira:

Red\[]

i: 1

while \[i &lt; 5] [

print i

       i: i + 1

]

1  
2  
3  
4  
&gt;&gt;

native! until

Executa um bloco até que este bloco retorne  true .

Red\[]

i: 4

until [

       print i

       i: i - 1

       i &lt; 0        ;  &lt;= condition

]

4  
3  
2  
1  
0  
&gt;&gt;

native! break

Força uma saída da repetição.

##### /return

Força a saída e retorna um dado valor, como um código ou uma mensagem.

native! forever

Cria um loop infinito.
