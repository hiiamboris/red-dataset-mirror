Original URL: <http://helpin.red/pt/Guardandooinput.html>

# Guardando o input

* * *

* * *

PARSE set e PARSE copy

Ambos pegam o input da próxima regra de parse, se for bem-sucedida.

set atribui o input a uma variável e copy, atribui uma cópia deste a uma variável.

Red\[]

a: \["fox" "rat" "elk"]        

parse a [  

       "fox"

       set b                ;pronto para atribuir se a próxima regra for bem-sucedida. Poderia ter usado copy.

       "rat"        ;sucesso, então "rat" =&gt; b

       "elk"  

]        

print b

rat

PARSE collect e PARSE keep

Se você tem um bloco de "collect" dentro do seu bloco de regras, o parse não vai mais retornar um  true ou false, ao invés disso, vai retornar um bloco com todos os sucessos que foram precedidos da palavra (comando) keep .

Red\[]

a:  \["fox" "dog" "owl" "rat" "elk" "cat"]                ; input block

print parse a [

       collect[

       keep "fox"        ; sucesso, será mantida

       "dog"

       "owl"

       keep "rat"  ; sucesso, será mantida

       keep "cow"        ; FALHOU! NÃO será mantida

       "cat"

               ]

]

fox rat

PARSE collect set

parse vai retornar true ou false, e inserir todos os sucessos precedidos da palavra keep em um novo bloco.

Red\[]

a:  \["fox" "dog" "owl" "rat" "elk" "cat"]                ;

print parse a [

       collect set b [                                        ; cria b para guardar os keeps

       keep "fox"        ; sucesso, será mantida

       "dog"

       "owl"

       keep "rat"  ; sucesso, será mantida

       keep "cow"        ; FALHOU! NÃO será mantida

       "cat"

               ]

]

print b

false

fox rat

PARSE collect into

parse vai retornar true ou false, e inserir todos os sucessos precedidos da palavra keep em um bloco existente. Parece que faz um append no bloco.

Red\[]

a:  \["fox" "dog" "owl" "rat" "elk" "cat"]                ; input block

b:""                                                                ; must create block first

print parse a [

       collect into b [

       keep "fox"        ; sucesso, será mantida

       "dog"

       "owl"

       keep "rat"  ; sucesso, será mantida

       keep "cow"        ; FALHOU! NÃO será mantida

       "cat"

               ]

]

print b

false

foxrat

Coletando o input usando a sintaxe de set-word (dois pontos)

Durante o processamento do parse, você pode atribuir a parte restante de um input a uma palavra (variável):

Red\[]

a:  \["fox" "dog" "owl" "rat" "elk" "cat"]

print parse a [  

       "fox"

       "dog"  

       b:

]

probe b

false

\["owl" "rat" "elk" "cat"]
