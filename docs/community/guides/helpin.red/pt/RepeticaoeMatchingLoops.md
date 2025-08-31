Original URL: <http://helpin.red/pt/RepeticaoeMatchingLoops.html>

# Repetição e Matching Loops

* * *

* * *

## Palavras-chave:  some, any, opt, while.

Palavra-chave ou valor

Descrição

3 &lt;regra&gt;

repita a regra 3 vezes

1 3 &lt;regra&gt;

repita a regra de 1 a 3 vezes

0 3 &lt;regra&gt;

repita a regra de 0 a 3 vezes

some

repita sua (s) regra (s) enquanto (e se) obtiver um true (match) da regra. Retorna false se não obtiver pelo menos uma correspondência (faz com que a análise seja false ).

any

repita sua (s) regra (s) até obter um false (sem correspondência) da regra. Sempre retorna true para a expressão de análise.

while

veja o texto abaixo.

[]()Número de Repetição Conhecido - Exemplos

&gt;&gt; parse "fogfogfog" \[3 "fog"]; determined exactly

== true

&gt;&gt; parse "fogfogfog" \[0 5 "fog"]; determined by range

== true                              

Exemplos de script para número exato de repetições:

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

Ou um intervalo:

Red\[]

a:  \["rat" "rat" "elk" "cat"]

print parse a [  

   0 4 "rat"        ; will return success if there is from zero up to four "rat"

       "elk"  

       "cat"    

]

true

Matching Loops:

PARSE some, PARSE any

Novamente:

some - repita a (s) regra (s) enquanto (e se) obtiver um true (correspondência) da regra. Retorna false se não obtiver pelo menos uma correspondência (faz com que a análise seja false).

any - repete a (s) regra (s) até obter um false (sem correspondência) da regra. Sempre retorna true para a expressão de análise

Ambos retornam sucesso enquanto encontrarem correspondências na entrada, a diferença é que some requer pelo menos uma ocorrência da entrada (correspondência), enquanto any retornará sucesso mesmo sem correspondência.

Red\[]

a:  \["fox" "dog" "fox" "dog" "fox" "dog" "elk" "cat"]

print parse a [

       some \["fox" "dog"]

       "elk"

       "cat"

]

print parse a [

       any \["fox" "dog"]

       "elk"

       "cat"

]

true

true

* * *

Red\[]

a:  \["elk" "cat"]

print parse a [

       some \["fox" "dog"]

       "elk"

       "cat"

]

print parse a [

       any \["fox" "dog"]

       "elk"

       "cat"

]

false

true

Exemplo que mostra o comportamento "loop" mais claramente:

Red \[]

txt: {In a one-story blue house, there was a blue person,

a blue cat – everything was blue! What color were the stairs?}

print parse txt \[some \[thru "blue" (print "I found blue!")] to end]

I found blue!

I found blue!

I found blue!

I found blue!

true

&gt;&gt;

Explicando o exemplo:

[some

       \[thru "blue" (print "I found blue!")] ; essa regra vai se repetir enquanto encontrar um match

to end]

- primeiro loop:

In a one-story blue house, there was a blue person,

a blue cat – everything was blue! What color were the stairs?

-&gt; achou um match, então repete \[thru "blue" (print "I found blue!")]

- segundo loop:

In a one-story blue house, there was a blue person,

a blue cat – everything was blue! What color were the stairs?

-&gt; achou um match, então repete \[thru "blue" (print "I found blue!")]

- terceiro loop:

In a one-story blue house, there was a blue person,

a blue cat – everything was blue! What color were the stairs?

-&gt;  achou um match, então repete \[thru "blue" (print "I found blue!")]

- quarto loop:

In a one-story blue house, there was a blue person,

a blue cat – everything was blue! What color were the stairs?

-&gt;  achou um match, então repete \[thru "blue" (print "I found blue!")]

-&gt; SEM match, então sai do loop de some e vai para a próxima regra:  to end, que é um match, porque simplesmente vai para o fim.

Uma vez que todas as regras acharam um match (some achou mais que um), o parse retorna  true.

PARSE while

Definitivamento não é para principiantes, como é explicado a seguir por  by @9214 do [gitter.](https://gitter.im/red/help)

Como a explicação é complexa e minha tradução deficiente, acredito que a leitura do original em inglês seja necessária para um completo entendimento. Desculpe.

"

&gt;&gt; parse x: \[a 1 a 1]\[while \[ahead \['a change quote 1 2] | 'a quote 2]]

== true

&gt;&gt; x

== \[a 2 a 2]

&gt;&gt; parse x: \[a 1 a 1]\[any \[ahead \['a change quote 1 2] | 'a quote 2]]

== false

&gt;&gt; x

== \[a 2 a 1]

A principal diferença entre while e any é que o primeiro continua executando o parse mesmo se o index não avança após uma correspondência bem-sucedida, enquanto o segundo falha tão logo o index permaneça na mesma posição, mesmo que a correspondência tenha sido bem-sucedida.

Foi por isso que eu usei o ahead - é uma regra que faz a correspondência "à frente", mas mantém o index onde está. No exemplo acima,  ahead \['a change quote 1 2] vai fazer a correspondência com sucesso, e 1 depois de "a" vai ser mudado para 2, mas a posição do input não vai avançar, porque o ahead olha para frente, enquando fica no mesmo lugar. Os resultados são:

- Com while, primeiro ahead ... muda 1 para 2 sem avançar o input, mas uma vez que while não se importa com isso, ele vai para a próxima iteração, na qual uma regra de alto nível vai falhar e dar um passo atrás (uma opção após  | ) para  'a quote 2, que vai dar uma corrêspondência bem-sucedida (porque nós acabamos de mudar a 1  para  a 2  e avançar o input, assim nos levanod ao marcador  end e fazendo o parsing bem sucedido de toda a série.

<!--THE END-->

- Entretanto, com any, primeiro ahead ... muda  1  para  2 , não avança o input, e o  any, por ser exigente sobre o avanço do input, resulta em falha sem chegar à segunda iteração.

O uso do while é complicado. Na minha experiência, eu o usei para parsing sensível a contexto (isto é, primeiro você olha para a frente e para trás, determinando o contexto de um token, e só então decide o que fazer; "olhar para frente e para trás requer a correspondência de várias regras enquando você não sai do lugar, na posição corrente\*) e também em situações onde o input precisa ser modificado durante o parsing (exemplo acima), ou se o parsing depende de algum estado externo. Também se mostrou útil para  deep-first traversal of tree-like structures (n.t. não sei traduzi isso) .- a situação é a mesma, você está mexendo com node, fazendo correspondências com regras, mas a posição não deve avançar se você fizer uma correspondência, senão você perde a referência do node corrente.

Portanto, while não é amigável para principiantes e você não precisa se preocupar com ele se você está começando. Ele é útil sem situações mais avançadas, onde você precisa de um controle seguro sobre o parsing."
