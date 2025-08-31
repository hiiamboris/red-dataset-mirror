Original URL: <http://helpin.red/pt/Objetos.html>

# Objetos

* * *

* * *

Um objeto é um "pacote" que agrupa dados e/ou funções, usualmente (sempre?) atribuído a uma palavra (variável). Para acessar um atributo de um objeto em Red, nós usamos a barra (/) como separador. Isto é pouco usual, pois a maoria das linguagens usa um ponto mas, depois que você se acostuma, me parece mais intuitivo já similar a um path (caminho).

#### Criando um objeto:

action! make object! , function! context and  function! object

Você pode usar make object! ,  object ou context para criar um objeto. Eles são o mesmo comando. object e context são só simplificações de make object!.

Red \[]

myobject: object [

       x: 10

       y: 20

       f: function \[a b] \[a + b]

       name: none

       tel: none

]

myobject/name: "Dimitri"

myobject/tel: #3333-3333

print myobject/x

print myobject/y

print myobject/f 3 5

print myobject/name

print myobject/tel

10

20

8

Dimitri

3333-3333

A computação é feita apenas quando você cria um  object! (é o constructor). Note que o comando print no código abaixo não é executado quando o objeto é acessado:

&gt;&gt; myobject: object \[print "hello" a: 1 b: 2]  
hello  
\== make object! [  
       a: 1  
       b: 2  
]

&gt;&gt; myobject/a  
\== 1

#### Auto-referência:

Quando um objeto precisa fazer uma referência a si próprio, usamos a palavra  self :

Red \[]

myobject: object [

       x: 10

       y: 20

       f: function \[a b] \[a + b]

       autoanalisys: does \[print self]

]

myobject/autoanalisys

x: 10

y: 20

f: func \[a b]\[a + b]

autoanalisys: func \[]\[print self]

#### Clonando um objeto e inheritance (herança):

Simplesmente atribui um objeto a outro apenas cria um vinculo aos mesmos dados. Se o primeiro muda, o segundo muda também:

&gt;&gt; a: object \[x: 10]                ;lines of the console deleted for the sake of clarity.  
&gt;&gt; b: a                                ;lines of the console deleted for the sake of clarity.  
&gt;&gt; a/x: 20  
\== 20

&gt;&gt; b/x  
\== 20                                ;changed too!

Para fazer uma cópia verdadeira e independente, use copy:

&gt;&gt; a: object \[x: 10]                ;lines of the console deleted for the sake of clarity.  
&gt;&gt; b: copy a                        ;lines of the console deleted for the sake of clarity.  
&gt;&gt; a/x: 20  
\== 20

&gt;&gt; b/x  
\== 10                                ;NO change! b is a true copy.

Se quisermos criar um objeto que herde (inherits) o primeiro objeto, nós usamos  make &lt;original object&gt; &lt;new specifications&gt;:

Red \[]

a: object \[x: 3]

b: make a \[y: 12]

print b

x: 3

y: 12

### find e select - para objetos

find simplemente checa se o campo existe, retornando  true ou none .

select faz a mesma coisa, mas se o campo existe, retorna seu valor.

Red \[]

obj: object \[a: 44]

print find obj 'a

print select obj 'a

print find obj 'x

print select obj 'something

true

44

none

none

Note que ambos buscam a palavra (indicado pelo símbolo ' antes), não pela própria variável. Para acessar a variável, se usa um simples path como obj/a.
