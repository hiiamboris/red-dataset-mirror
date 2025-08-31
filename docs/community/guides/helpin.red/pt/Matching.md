Original URL: <http://helpin.red/pt/Matching.html>

# Matching

* * *

## Parse - Matching:

* * *

PARSE skip

Pula um elemento:

Red\[]

a:  \["fox" "dog" "owl" "rat" "elk" "cat"] ; input block

print parse a [   ;here the rules begin:

       "fox"  

       skip   ; simplesmente pula este elemente

       "owl"  

       "rat"  

       "elk"  

       "cat"    

]

true

Outro exemplo, notando que string são séries de caracteres, e são um tipo comum de input para o parse:

Red \[]

a: "XYZhello"

print parse a \[skip skip skip "hello"]

true

Ou, mais elegantemente (veja [repetição](http://helpin.red/RepeticaoeMatchingLoops.html#known)):

Red \[]

a: "XYZhello"

print parse a \[3 skip "hello"]

true

PARSE  to PARSE  thru

Pula elementos até achar uma correspondência. thru posiciona o input após a correspondência, to posiciona antes desta.

Red\[]

a: "big black cat"

parse a \[ to "black" insert "FAT "]

print a

big FAT black cat

Red\[]

a: "big black cat"

parse a \[ thru "black" insert " FAT"]

print a

big black FAT cat

Assim:

![](http://helpin.red/lib/NewItem231.png)

Exemplo de to:

Red\[]

a:  \["fox" "dog" "owl" "rat" "elk" "cat" "bat"] ; input block

print parse a [   ;here the rules begin:

       "fox"                ; rule 1 matches element 1 =&gt; true

       to "elk"        ; skips all elements until...

                       ; ...it finds a match, but..

       "elk"                ; ... it also checks if the match fits the rule

       "cat"                ; rules for the elements...

       "bat"                ; ... following the match

]

true

Exemplo de thru:

Red\[]

a:  \["fox" "dog" "owl" "rat" "elk" "cat" "bat"] ; input block

print parse a [   ;here the rules begin:

       "fox"                ; rule 1 matches element 1 =&gt; true

       thru "elk"        ; skips all elements until...

                       ; ...it finds a match

       "cat"                ; rules for the elements...

       "bat"                ; ... following the match

]

true

PARSE end

Retorna true se todos os elementos do input foram checados pelo parse.

Red\[]

a:  \[33 18.2 #"c" "rat"] ; input block

print parse a [  

       integer!        

       float!

       char!

       string!

       end

]

true

PARSE ahead

Verifica se o próximo elemento atende à regra:

Red\[]

a:  \["fox" "dog" "owl" "rat"]        ; input block

print parse a [  

       "fox"        

       "dog"

       ahead "owl" ;verifica se o próximo item atende =&gt; ok

       "owl"

       "rat"

]

true

PARSE none

Sempre retorna sucesso.

Red\[]

a:  \["fox" "dog" "owl" "rat"]  ; input block

print parse a [  

       "fox"        

       "dog"

       none        ; não faz nada, mas ações podem ser inseridas aqui

       "owl"

       "rat"

]

true

PARSE opt

Se encontra uma correspondência, retorna sucesso e o parse segue para o próximo input. Se o input não atende à regra, simplesmente ignora o input atual e segue testando a correspondência para o próximo input.

Red\[]

a:  \["fox" "dog" "owl" "rat"]  ; input block

print parse a [  

       "fox"  ; ok

       "dog"  ; ok

       opt "owl"  ; item 3 atende regra 3 =&gt;ok

       "rat"  ; item 4 atende regra 4 =&gt; ok

]

print parse a [  

       "fox"  ; ok

       "dog"  ; ok

       opt "BAT"        ; não tem "BAT" no input, então o parse pula esta regra...

       "owl"  ; ... e testa o input nesta próxima regra =&gt;ok

       "rat"  ; ok  

]

true

true

Outro exemplo:

Red \[]

a:  \["Mrs" "Robinson"]

print parse a \[opt "Mrs" "Robinson"] ;TRUE

a:  \["Robinson"]

print parse a \[opt "Mrs" "Robinson"] ;TRUE, the "Mrs" is OPTional

a:  \["Miss" "Robinson"]

print parse a \[opt "Mrs" "Robinson"] ; FALSE, "Mrs" is optional, but "Miss" is wrong!

Mais um exemplo:

   a: \[ "elk" "cat" "owl"]

parse a \[ opt \[ "fig" ] "elk" "cat" "owl" ]  ; never or at least once

true

parse a \[ opt \[ "elk" "cat" ] "owl" ]      ; never or at least once        

true

parse a \[ opt \[ "elk" "owl" ]  "cat" ]     ; never or at least once        

false *

         * Se a entrada não corresponder à regra do opt , a análise ignorará essa regra e verificará a mesma entrada pela regra a seguir..

Ainda mais um exemplo de opt :

hd: "mountaintrack"       ; string  

parse hd \[ opt "mountain" "track"]   ; == true      

parse hd \[ opt "mountain" "rights"]   ; == false

PARSE  not

A definição oficial da regra not é de que "inverte o resultado da sub-regra". Para mim, parece ser uma regra que exclui uma possível correspondência da próxima regra. Note que o input não é "consumido" (não "anda").

Red\[]

a:  \["fox" "dog" "owl" "rat"]

print parse a [  

       "fox"

       "dog"  

       not "owl" ;não consome input

       skip ;qualquer coisa aqui menos "owl" - fails!

       "rat"

]

print parse a [  

       "fox"

       "dog"  

       not "COW" ; não consome input

       skip ;qualquer coisa aqui, menos "COW" - success!

       "rat"

]

false

true

PARSE  quote

Verifica a correspondência do argumento exatamente como é (literalmente), exceto para paren! (coisas entre parêntesis).

Isto dá um erro:

&gt;&gt; parse \[x] \[x]

\*\** Script Error: PARSE - invalid rule or usage of rule: x

\*\** Where: parse

\*\** Stack:

Mas isso funciona:

&gt;&gt; parse \[x] \[quote x]

== true

&gt;&gt; parse \['x] \[quote 'x]

== true

&gt;&gt; parse \[\[x]] \[quote \[x]]

== true
