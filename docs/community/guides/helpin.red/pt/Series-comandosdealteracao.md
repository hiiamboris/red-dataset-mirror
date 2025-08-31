Original URL: <http://helpin.red/pt/Series-comandosdealteracao.html>

# Séries- comandos de alteração

* * *

* * *

Estes comandos alteram a série original:

### action! clear

Apaga os elementos da série.

Simplesmente atribuir " " (string vazia) ou zero para uma série não vai produzir os resultados esperados. A lógica do Red parece fazer com que ele "lembre" de coisas de forma inesperada. Para realmente limpar uma série, você precisa usar o clear.

&gt;&gt; a: \[11 22 33 "cat"]  
\== \[11 22 33 "cat"]

&gt;&gt; clear a  
\== \[]

&gt;&gt; a  
\== \[]

### action! poke

Altera o valor de um elemento da série na posição dada pelo segundo argumento. O novo valor da posição é dado pelo terceiro argumento.

![](http://helpin.red/lib/poke.png)

&gt;&gt; x: \["cat" "dog" "mouse" "fly"]  
\== \["cat" "dog" "mouse" "fly"]

&gt;&gt; poke x 3 "BULL"  
\== "BULL"

&gt;&gt; x  
\== \["cat" "dog" "BULL" "fly"]

&gt;&gt; s: "abcdefghijklmn"  
\== "abcdefghijklmn"

&gt;&gt; poke s 4 #"W"  
\== #"W"

&gt;&gt; s  
\== "abcWefghijklmn"

### action! append

Insere os valores do segundo argumento no final da série. Altera apenas a primeira série original.

![](http://helpin.red/lib/append.png)

&gt;&gt; x: \["cat" "dog" "mouse" "fly"]  
\== \["cat" "dog" "mouse" "fly"]

&gt;&gt; append x "HOUSE"  
\== \["cat" "dog" "mouse" "fly" "HOUSE"]

&gt;&gt; x  
\== \["cat" "dog" "mouse" "fly" "HOUSE"]

&gt;&gt; x: \["cat" "dog" "mouse" "fly"]  
\== \["cat" "dog" "mouse" "fly"]

&gt;&gt; y: \["Sky" "Bull"]  
\== \["Sky" "Bull"]

&gt;&gt; append x y  
\== \["cat" "dog" "mouse" "fly" "Sky" "Bull"]

&gt;&gt; x  
\== \["cat" "dog" "mouse" "fly" "Sky" "Bull"]

&gt;&gt; append "abcd" "EFGH"  
\== "abcdEFGH"

#### /part

Limita o numero de elementos do append.

&gt;&gt; append/part \["a" "b" "c"] \["A" "B" "C" "D" "E"]  2  
\== \["a" "b" "c" "A" "B"]

#### /only

Faz o append da série B na série A, mas B vai como um bloco:

&gt;&gt; append/only \["a" "b" "c"] \["A" "B"]  
\== \["a" "b" "c" \["A" "B"]]

#### /dup

Faz o append da série B na série A  um determinado número de vezes. Acho que não devia se chamar dup de "duplicado", pois pode triplicar, quadruplicar...

&gt;&gt; append/dup \["a" "b" "c"] \["A" "B"] 3  
\== \["a" "b" "c" "A" "B" "A" "B" "A" "B"]

### action! insert

É como o append, mas as adição é feita no entry index corrente (normalmente o começo). Enquanto o append retorna a série a partir do head, o  insert returna a partir da inserção. Isto permite que sejam feitos muitas operações de insert em cadeia e ajuda a calcular o tamanho da parte inserida, mas note que  a: insert a xxx não altera  "a"!

![](http://helpin.red/lib/insert.png)

&gt;&gt; a: "abcdefgh"  
\== "abcdefgh"

&gt;&gt; insert a "OOO"  
\== "abcdefgh"

&gt;&gt; a  
\== "OOOabcdefgh"

![](http://helpin.red/lib/insert2.png)

&gt;&gt; a: "abcdefgh"  
\== "abcdefgh"

&gt;&gt; insert at a 3 "OOO"  
\== "cdefgh"

&gt;&gt; a  
\== "abOOOcdefgh"

#### /part

Insere apenas um dado número de elementos do segundo argumento.

#### /only

Permite a inserção como bloco.

#### /dup

Permite a inserção um dado número de vezes:

&gt;&gt; a: "abcdefg"  
\== "abcdefg"

&gt;&gt; insert/dup a "XYZ" 3  
\== "abcdefg"

&gt;&gt; a  
\== "XYZXYZXYZabcdefg"

function! replace

Substitui os elementos de uma série.

![](http://helpin.red/lib/replace.png)

&gt;&gt; replace \["cat" "dog" "mouse" "fly" "Sky" "Bull"] "mouse" "HORSE"  
\== \["cat" "dog" "HORSE" "fly" "Sky" "Bull"]

##### /all

Susbstitui todas as ocorrências:

&gt;&gt; a: "my nono house nono is nono nice"  
\== "my nono house nono is nono nice"

&gt;&gt; replace/all a "nono " ""  
\== "my house is nice"

action! sort

Ordena a série.

![](http://helpin.red/lib/changerssort.png)

&gt;&gt; sort \[8 4 3 9 0 1 5 2 7 6]  
\== \[0 1 2 3 4 5 6 7 8 9]

&gt;&gt; sort "sorting strings is useless"  
\== " eeggiiilnnorrsssssssttu"

### /case

### Leva em consideração letras maiúsculas e minúsculas.

### /skip

### Trata a série como grupos de elementos de tamanho definido.

### /compare

### Para comparar offset, block ou function. (?)

### /part

### Ordena só parte da série.

### /all

### Compara todos os campos. (?)

### /reverse

### Reverte a ordem da ordenação.

### /stable

### Ordenação estável. (?)

action! remove

Remove o primeiro elemento da série.

![](http://helpin.red/lib/remove1.png)

&gt;&gt; s: \["cat" "dog" "fox" "cow" "fly" "ant" "bee"]  
\== \["cat" "dog" "fox" "cow" "fly" "ant" "bee"]

&gt;&gt; remove s  
\== \["dog" "fox" "cow" "fly" "ant" "bee"]

#### /part

Remove um determinado número de elementos.

![](http://helpin.red/lib/removepart.png)

&gt;&gt; s: "abcdefghij"  
\== "abcdefghij"

&gt;&gt; remove/part s 4  
\== "efghij"

Note que você pode fazer a mesma coisa com remove at \[0 1 2 3 4 5] 2 .

### native! remove-each

### Assim como  foreach, este comando executa um bloco para cada elemento da série. Se o bloco retornar true, o comando remove o elemento correspondente da série:

Red \[]

a: \["dog" 23 3.5 "house" 45]

remove-each i a \[string? i] ;removes all strings

print a

23 3.5 45

Red \[]

a: "   my house in the middle of our street"

remove-each i a \[i = #" "] ;removes all spaces

print a

myhouseinthemiddleofourstreet

action! take

Remove o PRIMEIRO elemento da série e retorna este primeiro elemento.

&gt;&gt; s: \["cat" "dog" "fox" "cow" "fly" "ant" "bee"]  
\== \["cat" "dog" "fox" "cow" "fly" "ant" "bee"]

&gt;&gt; take s  
\== "cat"

&gt;&gt; s  
\== \["dog" "fox" "cow" "fly" "ant" "bee"]

##### /last

Remove o último elemento da série e retorna este elemento.

&gt;&gt; s: \["cat" "dog" "fox" "cow" "fly" "ant" "bee"]  
\== \["cat" "dog" "fox" "cow" "fly" "ant" "bee"]

&gt;&gt; take/last s  
\== "bee"

&gt;&gt; s  
\== \["cat" "dog" "fox" "cow" "fly" "ant"]

 take/last e append podem ser usados para fazer operações tipo "pilha" (stack).

##### /part

Remove um determinado número de elementos do começo de uma série e os dá como retorno.

&gt;&gt; s: \["cat" "dog" "fox" "cow" "fly" "ant" "bee"]  
\== \["cat" "dog" "fox" "cow" "fly" "ant" "bee"]

&gt;&gt; take/part s 3  
\== \["cat" "dog" "fox"]

&gt;&gt; s  
\== \["cow" "fly" "ant" "bee"]

### /deep

### A documentação diz que "Copy nested values". Não entendi.

action! move

Move um ou mais elementos do segundo argumento para o primeiro. Altera as duas séries.

![](http://helpin.red/lib/move1.png)

/part

Para mover mais de um elemento.

![](http://helpin.red/lib/move2.png)

&gt;&gt; a: \[a b c d]  
\== \[a b c d]

&gt;&gt; b: \[1 2 3 4]  
\== \[1 2 3 4]

&gt;&gt; move a b  
\== \[b c d]

&gt;&gt; a  
\== \[b c d]

&gt;&gt; b  
\== \[a 1 2 3 4]

&gt;&gt; move/part a b 2  
\== \[d]

&gt;&gt; a  
\== \[d]

&gt;&gt; b  
\== \[b c a 1 2 3 4]

move pode ser usado em combinação com outros comandos para mover elementos dentro de uma mesma série:

&gt;&gt; a: \[1 2 3 4 5]  
\== \[1 2 3 4 5]

&gt;&gt; move a tail a  
\== \[2 3 4 5 1]

&gt;&gt; move/part a tail a 3  
\== \[5 1 2 3 4]

action! change

Altera os primeiros elementos de uma série e retorna a série após a mudança. Modifica a primeira série original, não a segunda.

![](http://helpin.red/lib/change.png)

&gt;&gt; a: \[1 2 3 4 5]  
\== \[1 2 3 4 5]

&gt;&gt; change a \[a b]  
\== \[3 4 5]

&gt;&gt; a  
\== \[a b 3 4 5]

/part

Limita a quantidade de mudanças a um dado número de elementos.

/only

Muda uma série como série.

/dup  
Faz a mudança um determinado número de vezes.

function! alter

Pode remover ou fazzer um append na série. Se  alter NÃO encontrar o elemento na série, ele faz o append desse elemento e retorna  true. Se ele encontra o elemento, remove-o , e retorna  false.

&gt;&gt; a: \["cat" "dog" "fly" "bat" "owl"]  
\== \["cat" "dog" "fly" "bat" "owl"]

&gt;&gt; alter a "dog"  
\== false

&gt;&gt; a  
\== \["cat" "fly" "bat" "owl"]

&gt;&gt; alter a "HOUSE"  
\== true

&gt;&gt; a  
\== \["cat" "fly" "bat" "owl" "HOUSE"]

action! swap

Troca os primeiros elementos de duas séries. Retorna a primeira série, mas modifica as duas:

![](http://helpin.red/lib/swap.png)

&gt;&gt; a: \[1 2 3 4]   b: \[a b c d]

&gt;&gt; swap a b  
\== \[a 2 3 4]

&gt;&gt; a  
\== \[a 2 3 4]

&gt;&gt; b  
\== \[1 b c d]

Com find , por exemplo, pode ser usado para trocar quaisquer elementos de duas séries ou mesmo elementos dentro de uma mesma série:

&gt;&gt; a: \[1 2 3 4 5] b: \["dog" "bat" "owl" "rat"]  
\== \["dog" "bat" "owl" "rat"]

&gt;&gt; swap find a 3 find b "owl"  
\== \["owl" 4 5]

&gt;&gt; a  
\== \[1 2 "owl" 4 5]

&gt;&gt; b  
\== \["dog" "bat" 3 "rat"]

action! reverse

Reverte a ordem dos elementos de uma série:

&gt;&gt; reverse \[1 2 3]  
\== \[3 2 1]

&gt;&gt; reverse "abcde"  
\== "edcba"

/part   limita o número de elementos a serem revertidos:

&gt;&gt; reverse/part "abcdefghi" 4  
\== "dcbaefghi"
