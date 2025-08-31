Original URL: <http://helpin.red/pt/Funcoes.html>

# Funções

* * *

* * *

Funções devem ser declaradas antes de ser usadas, portanto devem ser escritas no topo do seu programa. Entretando isso não é necessário se uma função é chamada por outra função.

native! func

Variáveis criadas dentro de uma função criada com func são globais. Elas são vistas por todo o programa.

Uma função é criada com func da seguinte forma:

&lt;function name&gt;: func \[&lt;argument1&gt; &lt;argument2&gt; ... &lt;argument n&gt;] \[ &lt;actions performed on arguments&gt;]

Red \[]

mysum: func \[a b] \[a + b]

print mysum 3 4

7

Demonstrando que as variáveis são globais:

Red \[]

mysum: func \[a b] [

       mynumber: a + b

       print mynumber

]

mynumber: 20

mysum 3 4

print mynumber

7

7

native! function

function faz as suas variaveis locais, ou seja, "esconde" as variáveis dentro da função do resto do programa.

Repetindo o programa assima, mas usando function ao invés de func:

Red \[]

mysum: function \[a b] [

       mynumber: a + b

       print mynumber

]

mynumber: 20

mysum 3 4

print mynumber

Resultados diferentes:

7

20

#### Forçando as variáveis a serem globais, com o refinamento /extern:

Red \[]

myfunc: function \[/extern a b] [

       a: 22

       b: 33

]

a: 7

b: 9

myfunc

print a

print b

22

33

#### Definindo o tipo de argumento:

Você pode forçar os argumentos a serem de um determinado tipo de datatype:

Red \[]

mysum: function \[a \[integer!] b\[integer!]] \[print a + b]

print mysum 3.2 4        ; oops! 3.2 is a float!

\*\** Script Error: mysum does not allow float! for its a argument

\*\** Where: mysum

\*\** Stack: mysum

Você pode permitir vários  datatypes:

Red \[]

mysum: function \[a \[integer! float!] b\[integer!]] \[print a + b]

print mysum 3.2 4

7.2

Ou usar uma classe superior de datatypes:

Red \[]

mysum: function \[a \[number!] b\[number!]] \[print a + b]

print mysum 3.2 4

7.2

#### Retornando valores de uma função:  native! return

O valor de retorno de uma função pode ser ou o último valor avaliado por ela ou um determnado explicitamente pela palavra  return:

Exemplo com o último valor avaliado:

Red \[]

myfunc: function \[] [

       8 + 9

       3 + 3

       print "got here"        ; isso é executado

       10 + 5                ; isso é retornado

]

print myfunc

got here

15

Exemplo com return :

Red \[]

myfunc: function \[] [

       8 + 9

       return 3 + 3                        ; this is returned

       print "never got here"        ; NOT executed

       10 + 5                                

]

print myfunc

6

#### Criando seus próprios refinamentos:

Você pode criar refinamentos para suas funções, como os refinamentos nativos do Red: &lt;minhfunção&gt;/&lt;meurefinamento&gt;. Os refinamentos são valores booleanos (true ou false) que são checados pela função:

Red \[]

myfunc: function \[a /up   b /down   c] [

       if up \[print a + b]

       if down \[print a - c]

]

myfunc/up 10 3

myfunc/down 10 3

13

7

Note que argumentos não são obrigatórios para refinamentos.

#### Atribuindo funções para palavras (variáveis)

Para atribuir uma função a uma palavra (variável) você deve preceder a função com dois pontos: &lt;palavra&gt;: :&lt;função&gt;

&gt;&gt; mysum: func \[a b] \[a + b]

== func \[a b]\[a + b]

&gt;&gt; a: :mysum

== func \[a b]\[a + b]

&gt;&gt; a 3 9

== 12

native! does

Se a sua função não precisa de argumentos ou variáveis locais, use a palavra  does para criá-la:

Red \[]

greeting: does [

       print "Hello"

       print "Stranger"

]

greeting

Hello

Stranger

native! has

Se a sua função não usa argumentos, mas tem variáveis locais, use a palavra has para criá-la.  has transforma o argumento em uma variável local. Compare os três programas abaixo. O primeiro usa has sem argumento, portanto "number" é uma variável global. O segundo dá a "number" um argumento, fazendo-o local. E o terceiro mostra que uma função com argumento precisa que o argumento seja enviado pelo evento de chamada:

  ![](http://helpin.red/lib/has1.png) ![](http://helpin.red/lib/has2.png) ![](http://helpin.red/lib/has3.png)

native! exit

Sai da função sem retornar nenhum número.
