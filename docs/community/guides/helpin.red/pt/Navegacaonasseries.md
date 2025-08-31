Original URL: <http://helpin.red/pt/Navegacaonasseries.html>

# Navegação nas séries

* * *

* * *

- O primeiro elemento de uma série é chamado  "head". Como veremos, ele pode não ser o "first" (primeiro) dependendo de como manipulamos a série;
- DEPOIS último elemento da série tem uma coisa chamada "tail" (cauda). Ele não tem um valor.
- Toda a série tem um "entry index". A melhor definição disto é "onde a parte utilizável da série começa. Muitas operações com séries tem esse "entry index" como ponto de partida. Você pode mover o entry index para frente e para trás para mudar o resultado de suas operações.
- Todo elemento da séria tem um número "índex" começando com 1 (não zero!) na primeira posição.
- Começando na posição do entry index, os elementos da série tem apelidos: "first" para o primeiro, "second" para o segundo "third"para o terceiro, "fourth" para o quarto e  "fifth" para o quinto.

Nota: eu inventei o nome "entry index". Não está na documentação. Eu já ví o "entry index" sendo chamando apenas de "index", mas eu não gosto disso, pois pode causer confusão com o número index dos elementos da série.

### action! head? action! tail? action! index?

Essas palavras pre-definidas retornam informações sobre a posição do entry index. Se o entry index está na head, head? returna true, senão false. A mesma lógica se aplica para tail?. index? retorna o número index da posição do entry index.

Os exemplos a seguir devem deixar o seu uso claro:.

Primeiro criamos a série s com os strings "cat" "dog" "fox" "cow" "fly" "ant" "bee" :

&gt;&gt; s: \[ "cat" "dog" "fox" "cow" "fly" "ant" "bee" ]  
\== \["cat" "dog" "fox" "cow" "fly" "ant" "bee"]

Teremos algo assim:

![](http://helpin.red/lib/series1b.png)

&gt;&gt; head? s  
\== true

&gt;&gt; index? s  
\== 1

&gt;&gt; print first s  
cat

### action! head  action! tail

head move o entry index para o primeiro elemento da série, o "head".

tail move o entry index para a posição APÓS o último elemento da série, o "tail".

head e tail por si só não alteram a série, head apenas retorna toda a série, e  tail não retorna nada. Para alterar uma série é preciso fazer uma atribuição de valor, por exemplo: list: head list

### action! next

next move o entry index um elemento em direção ao tail. Note que  next apenas retorna a série, não a modifica. Assim, simplesmente repetir next na mesma série não vai fazer o entry index ir além da segunda posição, pois você estará aplicando o comando na série original, onde o entry index ainda esta no primeiro elemento. Assim, para a maior parte dos usos, é preciso fazer uma atribuição, por exemplo: s: next s.

&gt;&gt; s: next s  
\== \["dog" "fox" "cow" "fly" "ant" "bee"]

Agora temos:

![](http://helpin.red/lib/series2b.png)

&gt;&gt; print s  
dog fox cow fly ant bee

&gt;&gt; head? s  
\== false

&gt;&gt; print first s  
dog

&gt;&gt; index? s  
\== 2

Note que, apesar do primeiro elemento agora ser "dog", seu índice ainda continua sendo 2!

### action! back

back é o oposto de next: move o entry index um elemento em direção ao "head". Se você usar back na nossa série s, "cat" é trazido de volta! Ele nunca foi "apagado"!

Isto significa que o Red nunca descartou nada da antiga série s. Essa é uma das peculiaridades do Red, os dados estão sempre lá, no próprio código.

Depois de mover o índice da nossa série s, mesmo que você atribua esta série a outra palavra (variável), como b(b: s) você ainda pode executar movimentações e recuperar valores "escondidos na série b, pois b e s apontam para os mesmos dados.

Se você quer evitar isso , você deve criar a sua nova variável usando copy

Como já foi mencionado antes, em Red, diferentemente das outras linguagens, a variável (palavra) é associada aos dados, e não o contrário.

### action! skip

Move o entry index um determinado número de elementos em direção ao tail.

![](http://helpin.red/lib/series3b.png)

&gt;&gt; s: skip s 3  
\== \["fly" "ant" "bee"]

&gt;&gt; print s  
fly ant bee

&gt;&gt; print first s  
fly

&gt;&gt; print index? s  
5

Se o número de skips for maior que o número de elementos da série, o entry index permanece na tail.

&gt;&gt; s: skip s 100  
\== \[]

![](http://helpin.red/lib/series4b.png)

&gt;&gt; tail? s  
\== true

&gt;&gt; index? s  
\== 8

Você também pode executar um número negativo de skips, o que faz o entry index ir em direção ao head:

&gt;&gt; s: skip s -4  
\== \["cow" "fly" "ant" "bee"]

![](http://helpin.red/lib/series5b.png)

&gt;&gt; print first s  
cow

&gt;&gt; print index? s  
4
