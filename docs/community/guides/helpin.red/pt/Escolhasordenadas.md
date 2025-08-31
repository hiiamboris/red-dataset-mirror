Original URL: <http://helpin.red/pt/Escolhasordenadas.html>

# Escolhas ordenadas

* * *

## Parse - Ordered Choices

* * *

Regras aceitam um operador "escolha ordenada", representado por "|"

Se um bloco de regras separado por "|" é encontrado pelo parse, ele tentará cada regra, da esquerda para a direita até encontrar uma correspondência, retornando sucesso e indo para a próxima regra após este bloco. Se nenhum deles resultar em uma correspondência, é claro, ele falhará e a análise será interrompida retornando false.

![](http://helpin.red/lib/NewItem193.png)

Isso é semelhante a um operador lógico "ou" , mas a ordem é importante.

Exemplo1:

Red\[]

a: \["fox" "rat" "elk"]        

b: \["fox" "owl" "elk"]        

print parse a [  

       "fox"

       \["rat" | "owl"]                ;notice enclosing brackets

       "elk"  

]

print parse b [  

       "fox"

       \["rat" | "owl"| "cat" | "whatever"]

       "elk"  

]

true

true

Exemplo 2:

Red\[]

print parse \["this is a string"] \[ integer! (print "integer") | string! (print "string") | char! (print "char")]

string

true

![](http://helpin.red/lib/NewItem192.png)

Exemplo3:

Red\[]

a: \["string" 3 #"A"] ; that is a string!, an integer! and a char!

print parse a \[integer! (print "I") | string! (print "S") | time! (print "T")]

S

false

Repetindo o script com parse-trace em vez de print parse (destaques de cor, novas linhas, fonte em negrito e comentários adicionados por edição):

--&gt;

  match: [integer! (print "I") | string! (print "S") | time

  input: \["string" 3 #"A"]  

  ==&gt; not matched

  match: \[string! (print "S") | time! (print "T")]

  input: \["string" 3 #"A"]  

  ==&gt; matched        

                                       ;keeps going to execute commands in parenthesis

  match: \[(print "S") | time! (print "T")]

  input: \[3 #"A"]  

S  

  match: \[| time! (print "T")]

  input: \[3 #"A"]  

return: false                 ;too much input and not enough rules -&gt; false

Para obter true , podemos adicionar mais regras para a escolha ordenada bem sucedida ...

Red\[]

a: \["string" 3 #"A"] ; that is a string!, an integer! and a char!

print parse a \[integer! (print "I") | string! (print "S") integer! char! | integer! (print "T")]

S

true

... ou colocar as escolhas ordenadas entre parênteses e adicionar regras ao bloco de regras principal:

Red\[]

a: \["string" 3 #"A"] ; that is a string!, an integer! and a char!

print parse a \[\[integer! (print "I") | string! (print "S") | time! (print "T")] integer! char!]

S

true
