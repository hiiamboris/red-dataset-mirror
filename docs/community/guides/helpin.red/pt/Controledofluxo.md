Original URL: <http://helpin.red/pt/Controledofluxo.html>

# Controle do fluxo

* * *

## Parse - Controle de fluxo:

* * *

PARSE  if

if esta o resultado de uma expressão lógica entre parênteses. Geralmente é seguido por  regra1 | regra 2 .

Se não houver uma escolha ordenada ( rule1 | rule 2 ) depois do  if, e o resultado da expressão for false ou none  o parsing é encerrado, retornando false.

Red\[]

block: \[6 3 7]

print parse block \[integer! integer! if (1 = 1) integer!] ;(1 = 1) verdadeiro, então continua

print parse block \[integer! integer! if (1 = 2) integer!] ;(1 = 2) falso, então encerra, retornando false

true

false

Com escolhas ordenadas: Se o resultado dessa expressão lógica for true , o loop de parse usará rule1 ; se for false ou none , usará rule2 para a próxima tentativa de match.

![](http://helpin.red/lib/NewItem237.png)

Red\[]

block: \[6 3 7]

print parse block \[integer! integer! if (1 = 1) \[integer! | string!]] ; 7 is an integer! -&gt; true

print parse block \[integer! integer! if (1 = 2) \[integer! | string!]] ; 7 is not a string! false

true

false

Outro exemplo simples:

Red\[]

block: \[1 2]

print parse block \[set value integer! if (value = 1) to end]

block: \[2 2]

print parse block \[set value integer! if (value = 1) to end]

true

false

PARSE  then

Independentemente da falha ou sucesso do que segue, pule a próxima regra alternativa. Ou seja, quando um then for encontrado, a próxima regra alternativa será desativada.

Não achei bons exemplos para isso.

PARSE  into

Muda o input para uma série (string or block) e faz o parse com a regra.

Não achei bons exemplos para isso.

PARSE  fail

Força a regra corrent a falhar e faz um backtrack (volta para o input anterior).

Não achei bons exemplos para isso. Acho que é relaciodado com matching loops (any, some and while) apenas.

PARSE  break

Sai de um matching loop, retornando success.

Não achei bons exemplos para isso. Acho que é relaciodado com matching loops (any, some and while) apenas, especificamente para oferecer uma maneira de evitar loops infinitos.

PARSE  reject

Sai de um matching loop, retornando failure.

Não achei bons exemplos para isso. Acho que é relaciodado com matching loops (any, some and while) apenas.
