Original URL: <http://helpin.red/pt/Usandowords.html>

# Usando words

* * *

* * *

Já que um programa Red é uma série de palavras (words), é uma boa ideia dar uma olhada nelas.

word

Uma palavra por si só (não um dado) não significa muito para o Red. Cada palavra deve ter um valor associado a ela enquanto computada. Esse valor pode vir da computação de uma expressão ou do "dicionário". Neste último caso, pode ser dados ou ação.

&gt;&gt; myBirthday  
\*\** Script Error: myBirthday has no value

word:

Os dois pontos depois de uma palavra a associa a algo no dicionário. É a "atribuição" clássica de outras linguagens de programação. A propósito, esta é um set-word! datatype.

![](http://helpin.red/lib/NewItem174.png)

&gt;&gt; myBirthday: 30/07/1963  
\== 30-Jul-1963  
&gt;&gt; print myBirthday  
30-Jul-1963

As palavras podem estar associadas ao código (ação) também:

&gt;&gt; a: \[print "hello"]  
\== \[print "hello"]  
&gt;&gt; do a  
hello

:word

Os dois pontos antes de uma palavra faz com que esta retorne o que estiver associado a ela no dicionário sem qualquer avaliação. Valores e ações são retornados "como estão". Esse é um  get-word! datatype.

![](http://helpin.red/lib/NewItem173.png)

&gt;&gt; myBirthday: 30/07/1963  
\== 30-Jul-1963  
&gt;&gt; partyDay: :myBirthday  
\== 30-Jul-1963  
&gt;&gt; print partyDay  
30-Jul-1963

Se uma palavra estiver associada a uma ação, dois pontos antes dela retornam o código inteiro dessa ação. Isso cria uma situação interessante se você usá-la com as funções internas do Red:

&gt;&gt; imprimire: :print  
\== make native! [[  
   "Outputs a value followed by a newline"  
   ...  
&gt;&gt; imprimire "hello"  
hello

O que aconteceu acima é que "imprimire" agora tem a mesma funcionalidade de print . Algo mais ou menos assim:

![](http://helpin.red/lib/NewItem172.png)

Important notes:

- a sintaxe :word também é usada para acessar dados em uma série, conforme descrito em [Blocos &amp; Series;](http://helpin.red/BlocksSeries.html)
- se você redefinir funções internas do Red, poderá causar uma falha, não por causa da alteração em si, mas porque todas as outras funções internas que dependem do significado original dessa palavra podem não funcionar corretamente.

'word

Retorna a própria palavra, isto é: apenas um grupo de letras (mas não uma string! Apenas um símbolo). É um lit-word! datatype.

&gt;&gt; print something  
\*\** Script Error: something has no value  
\*\** Where: print  
\*\** Stack:  

&gt;&gt; print 'something  
something

&gt;&gt; type? :print  
\== native!  
&gt;&gt; type? 'print  
\== word!

/word

A barra antes de uma palavra a transforma em um refinamento. Obviamente, esse é um refinement! datatype.

### native! set

### Atribui um valor a uma palavra. Parece-me como sendo o mesmo que os dois pontos depois da palavra ...

&gt;&gt; set 'test 33  
\== 33

### ... exceto que você pode definir muitas palavras de uma só vez:

&gt;&gt; set \[a b c] 10  
\== 10  
&gt;&gt; b  
\== 10

### native! unset

A definição prévia de uma palavre pode ser desfeita a qualquer momento usando unset:

&gt;&gt; set 'test "hello"  
\== "hello"  
&gt;&gt; print test  
hello  
&gt;&gt; unset 'test  
&gt;&gt; print test  
\*\** Script Error: test has no value
