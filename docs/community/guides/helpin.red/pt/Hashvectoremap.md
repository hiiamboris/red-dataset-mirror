Original URL: <http://helpin.red/pt/Hashvectoremap.html>

# Hash!, vector! e map!

* * *

* * *

Eu acho que estes datatypes são especiais e merecem um capítulo só para eles. Eles melhoram consideravelmente a qualidade e a velocidade do seu trabalho.

Hash! e vector! são séries de alta performance, ou seja, são mais rápidos no tratamento de séries grandes.

Eu sugiro que você dê uma olhada no capítulo [Blocks &amp; Series](http://helpin.red/BlocksSeries.html) antes de estudar este.

#### ♦ hash!

hash! é uma série que é  "hashed" (indexada?) para fazer as buscas mais rápidas. Uma vez que o processo de "hashing" consome recursos, não vale a pena usar  hash!  para séries que vão sofrer buscas apenas poucas vezes. Entretanto, se as buscas forem constantes, há vantagem em fazer da sua série um  hash! . O website do Rebol website diz que as buscas chegam a ser 650 vezes mais rápidas do que usando séries normais.

&gt;&gt; a: make hash! \[a 33 b 44 c 52]  
\== make hash! \[a 33 b 44 c 52]

&gt;&gt; select a \[c]  
\== 52

&gt;&gt; select a 'c  
\== 52

&gt;&gt; a/b  
\== 44

#### Nada realmente novo, é só uma série.

#### ♦ vector!

Vectors são séries de alta performance para  integer! ,float!, char! ou percent!

Para criar um vector! você deve usar make vector!

#### Enquanto hash! permite buscas mais rápidas na série,   vector! permite que operações matemáticas com a série sejam mais rápidas, pois são executadas na série toda de uma vez só.

&gt;&gt; a: make vector! \[33 44 52]  
\== make vector! \[33 44 52]

&gt;&gt; print a  
33 44 52

&gt;&gt; print a * 8  
264 352 416

#### Note que você não poderia fazer isso numa série normal:

&gt;&gt; a: \[2 3 4 5]

== \[2 3 4 5]

&gt;&gt; print a * 2

\*\** Script Error: * does not allow block! for its value1 argument

\*\** Where: *

\*\** Stack:  

#### ♦ map!

Maps são dicionários de alta performance que associam chaves com valores (chave1: val1  chave2: val2  chave3: val3...).

Maps não são séries. Você não pode usar a maioria da palavras pré-definidas (comandos) de séries .

Para pôr e recuperar valores do dicionário, se deve usar  select (series) e o comando especial: put.

&gt;&gt; a: make map! \["mini" 33 "winny" 44 "mo" 55]  
\== #(  
       "mini" 33  
       "winny" 44  
       "mo" 55  
...

&gt;&gt; print a  
"mini" 33  
"winny" 44  
"mo" 55

&gt;&gt; print select a "winny"  
44

&gt;&gt; put a "winny" 99  
\== 99

&gt;&gt; print a  
"mini" 33  
"winny" 99  
"mo" 55
