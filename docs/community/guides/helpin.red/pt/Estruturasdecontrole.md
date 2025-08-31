Original URL: <http://helpin.red/pt/Estruturasdecontrole.html>

# Estruturas de controle

* * *

* * *

native! if

Executa um bloco se o teste for  true.

if &lt;test&gt; \[ block ]

&gt;&gt; if 10 &gt; 4 \[print "large"]  
large

native! unless

A mesma coisa que  if not. Executa um bloco só se o teste for  false.

unless &lt;test&gt; \[ block (se teste false) ]

&gt;&gt; unless 10 &gt; 4 \[print "large"]  
\== none

&gt;&gt; unless 4 &gt; 10 \[print "large"]  
large

native! either

Um novo nome para o clássico if-else. Executa o primeiro bloco se o teste for true ou executa o segundo bloco se o teste for false.

either &lt;test&gt; \[true block] \[false block]

&gt;&gt; either 10 &gt; 4 \[print "bigger"] \[print "smaller"]  
bigger

&gt;&gt; either 4 &gt; 10 \[print "bigger"] \[print "smaller"]  
smaller

native! switch

Executa o bloco correspondente a um determinado valor:

Red\[]

switch 20 [

       10 \[print "ten"]

       20 \[print "twenty"]

       30 \[print "thirty"]

]

twenty

/default

Se o programa não encontrar uma correspondência, executa um bloco default.

Red\[]

switch/default 15 [

       10 \[print "ten"]

       20 \[print "twenty"]

       30 \[print "thirty"]

]\[ print "none of them"]        ;default block

none of them

native! case

Faz uma série de testes, executando o bloco correspondente ao primeiro teste que retorna  true .

Red\[]

case [

       10 &gt; 20 \[print "not ok!"]

       20 &gt; 10 \[print "this is it!"]

       30 &gt; 10 \[print "also ok!"]

]

this is it!

/all

Executa todos os testes que retornam true .

Red\[]

case/all [

       10 &gt; 20 \[print "not ok!"]

       20 &gt; 10 \[print "this is it!"]

       30 &gt; 10 \[print "also ok!"]

]

this is it!  
also ok!

native! catch &amp; throw

Catch e throw podem ser usados para criar estruturas de controle complexas. Na sua forma mais simples catch recebe o return de um entre vários throws:

Red\[]

a: 10

print catch [

       if a &lt; 10 \[throw "too small"]

       if a = 10 \[throw "just right"]

       if a &gt; 10 \[throw "too big"]

]

just right

## catch/name

## faz o catch de um throw com nome.

## throw/name

## faz throws de um catch com nome.

* * *

## Controle Booleano (lógica)

native! all

Avalia todas as expressões em um bloco. Se alguma retorna false, o retorno do all é  none, senão retorna o resultado da última computação.

![](http://helpin.red/lib/all.png)

&gt;&gt; john: "boy"  
\== "boy"

&gt;&gt; alice: "girl"  
\== "girl"

&gt;&gt; all \[john = "boy" alice = "girl" 10 + 3]        ;todas verdadeiras, a última computação é retornada.  
\== 13

&gt;&gt; all \[john = "boy" alice = "boy" 10 + 3]        ; alice = "boy" é false!  
\== none

native! any

Avalia cada expressão em um bloco e retorna o primeiro valor que não é  false. Se todos os valores forem  false retorna none.

![](http://helpin.red/lib/any.png)

&gt;&gt; john: "boy"  
\== "boy"

&gt;&gt; alice: "girl"  
\== "girl"

&gt;&gt; any \[john = "girl"  alice = "girl"  10 + 3]        ;alice = "girl" não é falso: retorna !  
\== true

&gt;&gt; any \[john = "girl"  10 + 3  5 &gt; 2]                        ; 10 + 3 não é falso: retorna!  
\== 13
