Original URL: <http://helpin.red/pt/Datatypes.html>

# Datatypes

* * *

## Datatypes - tipos de dados

* * *

#### Pode ser uma boa idéia você dar uma olhada antes no [capítulo sobre séries](http://helpin.red/BlocksSeries.html), uma vez que alguns exemplos usam palavras pré-definidas que estão listadas lá.

#### Datatypes básicos:

#### ♦ none!

O equivalente a "null" em outras linguagens de programação. Um dado não-existente.

&gt;&gt; a: \[1 2 3 4 5]  
\== \[1 2 3 4 5]  
&gt;&gt; pick a 7  
\== none

#### ♦ logic!

Além dos clássicos  true e false, Red reconhece também  on , off, yes e no como tipos de dado logic! .

&gt;&gt; a: 2 b: 3  
\== 3  
&gt;&gt; a &gt; b  
\== false

&gt;&gt; a: on  
\== true  
&gt;&gt; a  
\== true

&gt;&gt; a: off  
\== false  
&gt;&gt; a  
\== false

&gt;&gt; a: yes  
\== true  
&gt;&gt; a  
\== true

&gt;&gt; a: no  
\== false  
&gt;&gt; a  
\== false

#### ♦ string!

Uma série de caracteres dentro de aspas ou colchetes {}. Se uma string se estende por mais de uma linha, os colchetes são obrigatórios.

Strings são séries, e podem ser manipulados usando os comandos descritos no [capítulo sobre séries](http://helpin.red/BlocksSeries.html).

&gt;&gt; a: "my string"  
\== "my string"

&gt;&gt; a: {my string}  
\== "my string"

&gt;&gt; a: {my  
{ string}        ;o primeiro "{" não é um erro, é como o console mostra. Tente!  
\== "my^/string"  
&gt;&gt; print a  
my  
string

&gt;&gt; a: "my new                          ;tentando usar aspas para fazer uma string com mais de uma linha.  
\*\** Syntax Error: invalid value at {"my new}

#### ♦ char!

Precedidos por # e dentro de aspas, valors  char! representam um ponto de Unicode. São integers (inteiros) que se estendem de hexadecimal 00 a hexadecimal 10FFFF. (0 a 1,114,111 em decimal.)

#"A" é um char!

"A" é um string!

Podem se submeter a operações matemáticas:.

&gt;&gt; a: "my string"  
\== "my string"  
&gt;&gt; pick a 2  
\== #"y"  
&gt;&gt; poke a 3 #"X"  
\== #"X"  
&gt;&gt; a  
\== "myXstring"

&gt;&gt; a: #"b"  
\== #"b"  
&gt;&gt; a: a + 1  
\== #"c"

#### ♦ integer!

signed numbers de 32 bits. vão de −2,147,483,648 a 2,147,483,647. Se um número cai fora destes limites, o Red designa um float! datatype.

Nota: Dividir dois inteiros (integer!) dá um resultado truncado:

&gt;&gt; 7 / 2  
\== 3

#### ♦ float!

Números floating point de 64 bits. Representados por números com um ponto ou usando a notação exponencial.

&gt;&gt; 7.0 / 2  
\== 3.5

&gt;&gt; 3e2  
\== 300.0

&gt;&gt; 6.0 / 7  
\== 0.8571428571428571

#### ♦ file!

#### Tipo que representa arquivos é é precedido por %. Se você não está usando o path corrente, você tem que adicionar o path usando aspas. Barras e barras invertidas ("/" "\\" ) são convertidos automaticamente pelo Red conforme o sistema operacional.

&gt;&gt; write %myfirstfile.txt "This is my first file"

&gt;&gt; write %"C:\\Users\\André\\Documents\\RED\\mysecondfile.txt" "This is my second file"

#### ♦ path!

Usado para acessar dados dentro de estruturas usando "/". Pode ser usado em diferentes situações, por exemplo:

&gt;&gt; a: \[23 45 89]  
\== \[23 45 89]  
&gt;&gt; print a/2  
45

Barras "/" também são usadas para acessar objetos e refinamentos. Eu desconheço o funcionamento interno do Red, mas me parece que se trata de casos do datatype path! .

#### ♦ time!

Tempo expresso em horas:minutos:segundos.subsegundos. Note que segundos e subsegundos são separados por um ponto e não por dois pontos. Você pode acessar cada um deles usando refinamentos. Veja o capítulo sobre [Tempo e temporização](http://helpin.red/Tempoetemporizacao.html).

&gt;&gt; mymoment: 8:59:33.4  
\== 8:59:33.4  
&gt;&gt; mymoment/minute: mymoment/minute + 1  
\== 60  
&gt;&gt; mymoment == 9:00:33.4

&gt;&gt; a: now/time/precise        ; o datatype de "a" é time!  
\== 22:05:46.805                  
&gt;&gt; type? a  
\== time!  
&gt;&gt; a/hour  
\== 22  
&gt;&gt; a/minute  
\== 5  
&gt;&gt; a/second  
\== 46.805                        ;second é um float!

#### ♦ date!

O Red aceita datas em uma grande variedade de formatos:

&gt;&gt; print 31-10-2017  
31-Oct-2017  
&gt;&gt; print 31/10/2017  
31-Oct-2017  
&gt;&gt; print 2017-10-31  
31-Oct-2017  
&gt;&gt; print 31/Oct/2017  
31-Oct-2017  
&gt;&gt; print 31-october-2017  
31-Oct-2017  
&gt;&gt; print 31/oct/2017  
31-Oct-2017  
&gt;&gt; print 31/oct/17                ;só funciona se o ano é o último campo, mas cuidado: 1917 or 2017?.  
31-Oct-2017

O Red também checa se as datas são válidas, e até leva em consideração anos bisextos.  
Você pode acessar dia, mês e ano usando refinamentos:

&gt;&gt; a: 31-oct-2017  
\== 31-Oct-2017  
&gt;&gt; print a/day  
31  
&gt;&gt; print a/month  
10  
&gt;&gt; print a/year  
2017

#### ♦ point! e ♦ pair!

Point! e pair! me parecem ser a mesma coisa. Provavelmente pair! existe para manter a compatibilidade com Rebol.  
Representam pontos em um sistema cartesiano de coordenadas (eixos "x" e "y"). São compostos de dois inteiros separados por "x", por exemplo 23x45.

&gt;&gt; a: 12x23  
\== 12x23  
&gt;&gt; a: 2 * a  
\== 24x46  
&gt;&gt; print a/x  
24  
&gt;&gt; print a/y  
46

#### ♦ percent!

Representado adicionando "%" após o número.

&gt;&gt; a: 100 * 11.2%  
\== 11.2  
&gt;&gt; a: 1000 * 11.3%  
\== 113.0

#### ♦ tuple!

Um  tuple! é uma lista de 3 até 12 bytes (inteiros de 0 a 255) separados por pontos. Note que 2 números separados por ponto fazem um float! não um tuple!  
Tuples são úteis para representar coisas como número de versões, número de IP e cores (exemplo: 0.225.0)  
Um tuple! não é uma série, assim, a maior parte das operações de séries dão um erro se aplicadas a tuples!. Algumas operações que podem ser aplicadas a tuples! são: random, add, divide, multiply, remainder, subtract, and, or, xor, length?, pick (não poke), reverse.

&gt;&gt; a: 1.2.3.4  
\== 1.2.3.4  
&gt;&gt; a: 2 * a  
\== 2.4.6.8  
&gt;&gt; print pick a 3  
6  
&gt;&gt; a/3: random 255  
\== 41  
&gt;&gt; a  
\== 2.4.41.8

#### Classes de Datatypes  ♦ number! e ♦ scalar!

Alguns datatypes são classes de datatypes.

 integer!, float!, percent!  pertencem ao datatype number!.

E qualquer um dos datatypes seguintes é também um  scalar! datatype: char!, integer!, float!, pair!, percent!, tuple!, time!, date!
