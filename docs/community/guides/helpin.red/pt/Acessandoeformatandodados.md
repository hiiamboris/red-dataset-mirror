Original URL: <http://helpin.red/pt/Acessandoeformatandodados.html>

# Acessando e formatando dados

* * *

* * *

### native! get

Toda palavra em Red, as nativas e as que você cria, vão para um dicionário. Se a palavra é associada com uma expressão, o dicionário mantém toda a expressão que pode ou não ser avaliada, dependendo do tipo do comando que busca a palavra.

Se você quer saber qual a descrição da palavra que está no dicionário, você usa  get . Note que quando você se refere a uma palavra em Red (a própria palavra, não o valor) você a precede com um apóstrofe ( ' ).  get te devolve até o "significado das palavras pré-definidad do Red, mas retorna um erro se usada com um valor, por exemplo  integer!  pair! tuple! :

&gt;&gt; get 'print  
\== make native! [[  
       "Output...

&gt;&gt; get 'get  
\== make native! [[  
       "Return...

&gt;&gt; a: 7  
\== 7

&gt;&gt; get 'a  
\== 7

&gt;&gt; a: \[7 + 2]  
\== \[7 + 2]

&gt;&gt; get 'a  
\== \[7 + 2]

&gt;&gt; get 8  
\*\** Script Error: get does not allow integer! for its word argument

action! mold

mold tranforma um  datatype! (por exemplo um block!, um integer! uma series! etc.) em uma string e a retorna:

&gt;&gt; type? 8  
\== integer!

&gt;&gt; type? mold 8  
\== string!

&gt;&gt; print \[4 + 2]  
6

&gt;&gt; print mold \[4 + 2]  
\[4 + 2]

Refinamentos  
/only - Exclui os colchetes externos se o valor for um block!  
/all - Retorna o valor em um formato carregável (loadable).  
/flat - Exclui toda a indentação.  
/part - Limita o comprimento do resultado (argumento é um integer!)

action! form

form também tranforma um datatype! em uma string mas, dependendo to tipo, o resultado pode não conter informações extras, tais como \[] {} e "", que seriam incluidas por  mold. Útil para [Manipulação de strings e texto](https://ungaretti.gitbooks.io/red-language-notebook/content/string-and-text-manipulation.html).

Red \[]

print "---------MOLD----------"

print mold {My house

       is a very

       funny house}

print "---------FORM----------"        

print form {My house

       is a very

       funny house}

print "---------MOLD----------"        

print mold \[3 5 7]

print "---------FORM----------"        

print form \[3 5 7]

---------MOLD----------

"My house^/^-is a very^/^-funny house"

---------FORM----------

My house

   is a very

   funny house

---------MOLD----------

\[3 5 7]

---------FORM----------

3 5 7

O refinamento /part limita o número de caracteres retornado.

#### Principais usos para mold e form:

mold é basicamente usado para transformar uma série em código que pode ser salvo (save) e interpretado depois.

form é basicamente usado para gerar texto normal a partir de uma série.

&gt;&gt; a: \[b: drop-down data\[ "one" "two" "three"]\[print a/text]]  
\== \[b: drop-down data \["one" "two" "three"] \[print a/text]]

&gt;&gt; mold a  
\== {\[b: drop-down data \["one" "two" "three"] \[print a/text]]}

&gt;&gt; form a  
\== "b drop-down data one two three print a/text"

### function! probe

probe imprime o argumento sem fazer avaliações, mas também o retorna. Lembre que print faz a avalição do seu argumento. probe imprime o argumento "como ele é", por assim dizer.  
Pode ser usado para depurar o programa (debugging) como uma forma de mostrar o código sem alterá-lo.

&gt;&gt; print \[3 + 2]  
5

&gt;&gt; probe \[3 + 2] \[3 + 2]  
\== \[3 + 2]

&gt;&gt; print probe \[3 + 2]  
\[3 + 2]  
5

### native! reduce

Faz a avalição de uma expressão dentro de um bloco e retorna um novo bloco com os valores avaliádos. Dê uma olhada no  [capítulo sobre computação](http://helpin.red/Avaliacaocomputacao.html).

&gt;&gt; a: \[3 + 5 2 - 8 9 &gt; 3]  
\== \[3 + 5 2 - 8 9 &gt; 3]

&gt;&gt; reduce a  
\== \[8 -6 true]

&gt;&gt; b:\[3 + 5 2 + 9 7 &gt; 2 \[6 + 6 3 &gt; 9]]  
\== \[3 + 5 2 + 9 7 &gt; 2 \[6 + 6 3 &gt; 9]]

&gt;&gt; reduce b  
\== \[8 11 true \[6 + 6 3 &gt; 9]]                ;it does not evaluate expressions of blocks inside blocks

&gt;&gt; b  
\== \[3 + 5 2 + 9 7 &gt; 2 \[6 + 6 3 &gt; 9]]        ;the original block remains unchanged.

/into        =&gt; Põe o resultado em um bloco existente ao invés de criar um novo bloco.

### function! collect e keep

### Collect coleta em um novo bloco todos os valores passados pela função  keep .

### Em outras palavras: cria um novo bloco mantendo os valores determinados por  keep, normalmente valores que atendem a uma determinada condição.

Red \[]

a: \[11 "house" 34.2 "dog" 22]

b: collect [

       foreach element a \[if string? element \[keep element]] ;keeps string elements

       ]

print b

house dog

/into        =&gt;  Coloca em um buffer ao invés de um criar um bloco (retorna a posição após a inserção).

syntax: collect/into \[........] &lt;bloco de saída existente&gt;

Red \[]

c: \["one" "two"]                                ; creating the output block with some elements

a: \[11 "house" 34.2 "dog" 22]   ; a generic series

collect/into [

       foreach element a \[if scalar? element \[keep element]] ;keeps numbers of a

       ] c                                                        ;appends them into c

print c

one two 11 34.2 22

### native! compose

Retorna a cópia de um bloco, avaliando apenas os  paren! (coisas dentro de parêntesis).

Compose é muito importante para o [dialeto DRAW](http://helpin.red/Draw.html);

Red \[]

a: \[add 3 5 (add 3 5) 9 + 8 (9 + 8)]

print compose a                        ;print evaluates everything!!

probe compose a                        ;probe prints "as is"

8 8 17 17  
\[add 3 5 8 9 + 8 17]

    /deep        =&gt; faz o compose dentro de blocos aninhados (blocos dentro de blocos).

Red \[]

a: \[add 3 5 (add 3 5) \[9 + 8 (9 + 8)]]

probe compose a                

probe compose/deep a        

\[add 3 5 8 \[9 + 8 (9 + 8)]]  
\[add 3 5 8 \[9 + 8 17]]

    /only        =&gt; faz o compose de blocos aninhados como blocos contendo seus valores.

    /into        =&gt; põe o resultado dentro de um bloco existente, ao invés de criar um novo bloco.

sintaxe: compose/into \[........] &lt;bloco de saída existente&gt;

Red \[]

a: \[add 3 5 (add 3 5) 9 + 8 (9 + 8)]

b: \[]

compose/into a b

probe b

\[add 3 5 8 9 + 8 17]
