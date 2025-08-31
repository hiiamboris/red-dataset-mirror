Original URL: <http://helpin.red/pt/Copiando.html>

# Copiando

* * *

## Copying

* * *

 AVISO AOS INICIANTES: Se você está atribuindo o valor de uma palavra (variável) a outra palavra (variável) em Red, use COPY!

&gt;&gt; var1: var2                ;só se você tiver certeza do que está fazendo

&gt;&gt; var1: copy var2        ;pode te poupar horas tentando debugar.

action! copy

Atribui uma cópia do dado a uma nova palavra.

Pode ser usado para copiar séries e [objetos](http://helpin.red/Objetos.html).

Não é usado em itens simples como: integer! float! char! etc. Para estes, podemos usar apenas os dois pontos (:).

Primeiro vejamos uma atribuição simples:

![](http://helpin.red/lib/copy1.png)

&gt;&gt; s: \[ "cat" "dog" "fox" "cow" "fly" "ant" "bee" ]  
\== \["cat" "dog" "fox" "cow" "fly" "ant" "bee"]

&gt;&gt; b: s  
\== \["cat" "dog" "fox" "cow" "fly" "ant" "bee"]

&gt;&gt; take/part s 4  
\== \["cat" "dog" "fox" "cow"]

&gt;&gt; b  
\== \["fly" "ant" "bee"]                ;b changes!!

Agora com copy:

![](http://helpin.red/lib/copy2.png)

&gt;&gt; s: \[ "cat" "dog" "fox" "cow" "fly" "ant" "bee" ]  
\== \["cat" "dog" "fox" "cow" "fly" "ant" "bee"]

&gt;&gt; b: copy s  
\== \["cat" "dog" "fox" "cow" "fly" "ant" "bee"]

&gt;&gt; take/part s 4  
\== \["cat" "dog" "fox" "cow"]

&gt;&gt; b  
\== \["cat" "dog" "fox" "cow" "fly" "ant" "bee"]

Se você tiver uma série aninhada, por exemplo, um bloco dentro de uma série, copy não altera a referência para esta série aninhada. Se você quiser criar uma cópia independente, você precisa usar o refinamento /deep para criar uma cópia "profunda".

/part

Limita o tamanho do resultado, onde o tamanho é dado por um  number! ou series!

&gt;&gt; a: "my house is a very funny house"  
&gt;&gt; b: copy/part a 8  
\== "my house"

/types

Copia apenas tipos específicos de valores não-escalares.

/deep

Copia valores aninhados, conforme mencionado acima.
