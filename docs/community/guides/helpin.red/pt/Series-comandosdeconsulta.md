Original URL: <http://helpin.red/pt/Series-comandosdeconsulta.html>

# Séries- comandos de consulta

* * *

* * *

Existem tantos comandos para manipular séries que eu os dividi em dois capítulos: um para os comandos de consulta, que apenas obtém informações sobre a série, sem alterá-la e outro para os comandos de alteração, que efetivamente alteram a série.

Os comandos de consulta apenas retornam valores, mas note que você pode criar uma nova série atribuindo a esta o valor retornado.

### action! length?

Retorna o tamanho da série, do índice corrente até o fim.

&gt;&gt; a: \[1 3 5 7 9 11 13 15 17]  
\== \[1 3 5 7 9 11 13 15 17]

&gt;&gt; length? a  
\== 9

&gt;&gt; length? find a 13                ;veja o comando "find"  
\== 3                                ;do "13" ao tail existem 3 elementos

### function! empty?

Retorna true se a série for vazia, do contrário retorna  false.

&gt;&gt; a: \[3 4 5]  
\== \[3 4 5]

&gt;&gt; empty? a  
\== false

&gt;&gt; b:\[]  
\== \[]

&gt;&gt; empty? b  
\== true

### action! pick

Retorna o valor do elemento da posição dada pelo segundo argumento.

![](http://helpin.red/lib/pick.png)

&gt;&gt; pick \["cat" "dog" "mouse" "fly"] 2  
\== "dog"

&gt;&gt; pick "delicious" 4  
\== #"i"

### action! at

Returns a série a partir de um elemento cuja posição é dada pelo segundo argumento.

&gt;&gt; at \["cat" "dog" "fox" "cow" "fly" "ant" "bee" ] 4  
\== \["cow" "fly" "ant" "bee"]

### action! select e action! find

Ambos fazem uma busca na série por um determinado valor. A busca é da esquerda para a direita, exceto se forem utilizados os refinamentos  /reverse ou /last .

Quando eles encontram o valor procurado:

- select retorna o próximo valor da série após a correspondência:

&gt;&gt; select \["cat" "dog" "fox" "cow" "fly" "ant" "bee" ] \["cow"]  
\== "fly"

- find retorna a série a partir da correspondência até o fim:

&gt;&gt; find \["cat" "dog" "fox" "cow" "fly" "ant" "bee" ] \["cow"]  
\== \["cow" "fly" "ant" "bee"]

##### /part

Limita a busca pela correspondência a um determinado número de elementos:

&gt;&gt; select/part \["cat" "dog" "fox" "cow" "fly" "ant" "bee" ] \["cow"]  3  
\== none

&gt;&gt; select/part \["cat" "dog" "fox" "cow" "fly" "ant" "bee" ] \["fox"]  3  
\== "cow"

&gt;&gt; find/part \["cat" "dog" "fox" "cow" "fly" "ant" "bee" ] \["cow"]  3  
\== none

&gt;&gt; find/part \["cat" "dog" "fox" "cow" "fly" "ant" "bee" ] \["cow"]  4  
\== \["cow" "fly" "ant" "bee"]

##### /only

Trata o valor de busca como um bloco:

&gt;&gt; find/only \["cat" "dog" "fox" "cow" "fly" "ant" "bee" ] \["cow" "fly"]        ;finds nothing  
\== none

&gt;&gt; find/only \["cat" "dog" "fox" \["cow" "fly"] "ant" "bee" ] \["cow" "fly"]        ;finds the block  
\== \[\["cow" "fly"] "ant" "bee"]

##### /case

Leva em conta letras maiúsculas e minúsculas

##### /skip

Trata a série como um conjunto de grupos, onde cada grupo tem um valor fixo. A correspondência é buscada apenas com o primeiro item de cada grupo. Abaixo eu ressaltem os "grupos" em amarelo e a correspondência em rosa:

&gt;&gt; find/skip \["cat" "dog"  "fox" "dog"  "dog" "dog" "cow" "dog"  "fly" "dog"  "ant" "dog"  "bee" "dog"] \["dog"]  2  
\== \["dog" "dog" "cow" "dog" "fly" "dog" "ant" "dog" "bee" "dog"]

##### /last

Encontra a correspondência a partir do fim da série (tail).

&gt;&gt; find/last \[33 11 22 44 11 12] 11  
\== \[11 12]

##### /reverse

O mesmo que  /last , mas a partir do índice corrente que pode ser atribuído, por exemplo, pelo comando  at .

##### find/tail

Normalmente find retorna o resultado incluíndo a correspondência. Com  /tail o valor é retornado é a parte APÓS a correspondência, de forma similar a  select

&gt;&gt; find \["cat" "dog" "fox" "cow" "fly" "ant" "bee" ] "fly"  
\== \["fly" "ant" "bee"]

&gt;&gt; find/tail \["cat" "dog" "fox" "cow" "fly" "ant" "bee" ] "fly"  
\== \["ant" "bee"]

##### find/match

Quando se usa /match, a comparação é feita com o começo da série. Além disso, o valor retornado se inicia após a correspondência.

&gt;&gt; find/match \["cat" "dog" "fox" "cow" "fly" "ant" "bee"] "fly"  
\== none                ;no match

&gt;&gt; find/match \["cat" "dog" "fox" "cow" "fly" "ant" "bee"] "cat"  
\== \["dog" "fox" "cow" "fly" "ant" "bee"]                        ;match

### function! last

Retorna o último valor da série.

&gt;&gt; last \["cat" "dog" "fox" "cow" "fly" "ant" "bee"]  
\== "bee"

### function! extract

Extrai valores da série em intervalos regulares, retornando uma nova série.

&gt;&gt; extract \[1 2 3 4 5 6 7 8 9] 3  
\== \[1 4 7]

&gt;&gt; extract "abcdefghij" 2  
\== "acegi"

##### /index

Extrai valores a partir de um índice.

##### /into

Faz um "append" dos valores extraídos para uma dada série.

&gt;&gt; newseries: \[] ;cria uma série vazia - necessário pois extract/into não inicializa uma nova série.  
\== \[]

&gt;&gt; extract/into "abcdefghij" 2 newseries  
\== \[#"a" #"c" #"e" #"g" #"i"]

&gt;&gt; extract/into \["cat" "dog" "fox" "cow" "fly" "ant" "bee" "owl"] 2 newseries  
\== \[#"a" #"c" #"e" #"g" #"i" "cat" "fox" "fly" "bee"]

### action! copy

### Veja o capítulo [Copiando](http://helpin.red/Copiando.html).

## Conjuntos:

### native! union

Retorna o resultado da união de duas séries. Valores duplicados só são incluídos uma vez:

&gt;&gt; union \[3 4 5 6] \[5 6 7 8]  
\== \[3 4 5 6 7 8]

/case

Leva em consideração maiúsculas e minúsculas.

/skip

Trata a série como grupos de tamanho fixo.

&gt;&gt; union/case \[A a b c] \[b c C]  
\== \[A a b c C]

Com o refinamento /skip, apenas o primeiro elemento de cada grupo (tamanho dado pelo argumento) é comparado. Se houverem valores duplicados, os valores da primeira série são mantidos:

&gt;&gt; union/skip \[a b c c d e e f f] \[a j k c y m e z z] 3  
\== \[a b c c d e e f f]

&gt;&gt; union/skip \[k b c c d e e f f] \[a j k c y m e z z] 3  
\== \[k b c c d e e f f a j k]

### native! difference

Retorna apenas os elementos que não estão presentes em ambas as séries.

&gt;&gt; difference \[3 4 5 6] \[5 6 7 8]  
\== \[3 4 7 8]

/case

Leva em consideração maiúsculas e minúsculas.

/skip

Trata a série como grupos de tamanho fixo.

### native! intersect

Retorna apenas os elementos que estão presentes em ambas as séries:

&gt;&gt; intersect \[3 4 5 6] \[5 6 7 8]  
\== \[5 6]

/case

Leva em consideração maiúsculas e minúsculas.

/skip

Trata a série como grupos de tamanho fixo.

### native! unique

Retorna a série removendo todos os elementos duplicados:

&gt;&gt; unique \[1 2 2 3 4 4 1 7 7]  
\== \[1 2 3 4 7]

Allows the refinements:

/skip

Trata a série como grupos de tamanho fixo.

### native! exclude

Retorna uma série onde os elementos do segundo argumento são removidos do primeiro:

&gt;&gt; a: \[1 2 3 4 5 6 7 8]  
\== \[1 2 3 4 5 6 7 8]

&gt;&gt; exclude a \[2 5 8]  
\== \[1 3 4 6 7]

&gt;&gt; a  
\== \[1 2 3 4 5 6 7 8]

Não encontrei na documentação, mas eu acho que a série retornada é composta por elementos não-repetidos:

&gt;&gt; exclude "my house is a very funny house" "aeiou"  
\== "my hsvrfn"

&gt;&gt; exclude \[1 1 2 2 3 3 4 4 5 5 6 6] \[2 4]  
\== \[1 3 5 6]

/case

Leva em consideração maiúsculas e minúsculas.

/skip

Trata a série como grupos de tamanho fixo.
