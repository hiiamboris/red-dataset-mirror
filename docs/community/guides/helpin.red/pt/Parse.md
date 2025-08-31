Original URL: <http://helpin.red/pt/Parse.html>

# Parse

* * *

* * *

Parse é um "dialeto" do Red (um DSL- domain specific language para ser preciso), isto é, uma mini linguagem embutitda dentro do Red. O interpretador Red que vem com o download já possui algumas destas linguagens: VID para criação de GUIs, DRAW para gráficos e PARSE.

Parse deve ser estudado como uma pequena linguagem de programação.

native! parse

parse pega cada elemento de um input e o submete a uma regra correspondente em um bloco de regras. Retorna true se todas as regras forem atendidas ou false, se alguma falhar (fracassar) em atender à respectiva regra.

O exemplo mais básico seria simplesmente checar se cada elemento do bloco de input é igual ao elemento correspondente no bloco de regras;

Red\[]

a:  \["fox" "dog" "owl" "rat" "elk" "cat"]                ; bloco de input

print parse a \["fox" "dog" "owl" "rat" "elk" "cat"]

true

Para deixar mais clara a descrição do parse, vou reescrever o exemplo acima com outra formatação:

Red\[]

a:  \["fox" "dog" "owl" "rat" "elk" "cat"]                ; bloco de input

print parse a [   ;aqui começam as regras:

       "fox"  ; elemento 1 atende regra 1 =&gt; sucesso

       "dog"  ; elemento 2 atende regra 2 =&gt; sucesso

       "owl"  ; elemento 3 atende regra 3 =&gt; sucesso

       "rat"  ; elemento 4 atende regra 4 =&gt; sucesso

       "elk"  ; elemento 5 atende regra 5 =&gt; sucesso

       "cat"  ; elemento 6 atende regra 6 =&gt; sucesso  

]

; como todos os elementos atendem às suas regras, o resultado é "true"

true

A correspondência pode ser com datatypes:

Red\[]

a:  \[33 18.2 #"c" "rat"]        ; input block

print parse a [  

       integer!        

       float!

       char!

       string!

]

true

## Código normal do Red pode ser inserido dentro do bloco de regras usando parêntesis:

Red\[]

a:  \["fox" "dog" "owl" "rat" "elk"]                ; input block

print parse a [  

       "fox"

       "dog"

       "owl"

       (loop 3 \[print "just regular code here!"])

       "rat"

       "elk"  

]

just regular code here!

just regular code here!

just regular code here!

true

As regras aceitam o operador lógico "ou" representado por "|":

Red\[]

a: \["fox" "rat" "elk"]        

b: \["fox" "owl" "elk"]        

print parse a [  

       "fox"

       \["rat" | "owl"]                ;note os colchetes

       "elk"  

]

print parse b [  

       "fox"

       \["rat" | "owl"| "cat" | "whatever"]

       "elk"  

]

true

true

As regras podem ser repetidas adicionando o número de repetições (ou intervalo) antes delas:

Red\[]

a:  \["fox" "dog" "owl" "rat" "elk" "cat"]

print parse a [  

   4 skip        ; see command skip at Parse/Matching

       "elk"  

       "cat"    

]

true

Red\[]

a:  \["rat" "rat" "rat" "rat" "elk" "cat"]

print parse a [  

   4 "rat"

       "elk"  

       "cat"    

]

true

Ou intervalo:

Red\[]

a:  \["rat" "rat" "elk" "cat"]

print parse a [  

   0 4 "rat"        ; will return success if there is from zero up to four "rat"

       "elk"  

       "cat"    

]

true

Refinamentos do Parse:

    /case        =&gt;

    /part        =&gt;

    /trace       =&gt;

Esclarecimento importante:

O comando parse retorna true ou false, mas o matching (tentativa de ver se a entrada atende à regra) envia ao parse sucesso ou fracasso  (success ou failure). É importante entender isso para não fazer confusão.

![](http://helpin.red/lib/NewItem238.png)
