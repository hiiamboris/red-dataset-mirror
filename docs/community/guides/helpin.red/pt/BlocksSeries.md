Original URL: <http://helpin.red/pt/BlocksSeries.html>

# Blocks &amp; Séries

* * *

* * *

##### Blocks

Red é construído com "blocks". Em essência, qualquer coisa delimitada por colchetes é um bloco:\[um block], \[outro block \[block dentro de um block]]

##### Séries

Séries são um tópico essencial em Red. Na verdade, os dados e até mesmo o próprio programa em Red são séries. Os elementos de uma série podem ser qualquer coisa dentro do léxico do Red: dados, palavras, funções, objetos e outras séries.

##### Strings etc.

Note que strings são tratadas pelo Red como séries de caracteres, então as técnicas de manipular séries também podem ser usadas para operações com strngs. Entretanto, como as manipulações com strings são tão importantes, tem um capítulo especial para [Manipulação de strings e textos](http://helpin.red/Manipulacaodestringsetexto.html).

Na verdade, vários outros datatypes também são séries e podem ser manipulados com as palavras pré-definidas (comandos) descritos nos próximos capítulos.

##### Matrizes (Arrays)

Outras linguagens de programação tem um datatype chamado matriz (array). Não é difícil perceber que uma matriz de uma dimensão é simplesmente uma série, e matrizes multi-dimensionais são séries dentro de séries.

Aqui está um exemplo de uma matriz 3 x 2:

&gt;&gt; a: \[\[1 2]\[3 4]\[5 6]]  
\== \[\[1 2] \[3 4] \[5 6]]

Para acessar seus elementos, você pode usar "/":

&gt;&gt; a/1  
\== \[1 2]

&gt;&gt; a/1/1  
\== 1

&gt;&gt; a/3/2  
\== 6
