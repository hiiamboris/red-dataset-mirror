Original URL: <http://helpin.red/pt/Manipulacaodestringsetexto.html>

# Manipulação de strings e texto

* * *

* * *

### Nota: nos exemplos, algumas linhas de saída do console foram retiradas para clareza.

function! split

Cria um [bloco (uma série)](http://helpin.red/BlocksSeries.html) contendo as partes de uma string separadas por um delimitador. Este delimitador é dado como um argumento.  split é particularmente útil para analisar e manipular [arquivos de texto](http://helpin.red/Arquivos.html) e no dialeto de [parse](http://helpin.red/Parse.html).

&gt;&gt; s: "My house is a very funny house"  
&gt;&gt; split s " "                                                        ;every space is a delimiter.  
\== \["My" "house" "is" "a" "very" "funny" "" "" "" "" "house"] ;result is a series with 11 elements.

&gt;&gt; s: "My house ; is a very ; funny house"  
&gt;&gt; split s ";"                                                        ;split happens at the semi-colons.  
\== \["My house " " is a very " " funny house"]        ;result is a series with 3 elements.

### removing characters: action! trim

A palavra trim sem refinamentos, remove os espaços em branco e os tabs do começo e do fim de uma string. Também remove none de um bloco ou um objeto. O valor do argumento é alterado. Possui refinamentos para retirar caracteres específicos..

Refinements:

/head - Remove só da head (início).  
/tail - Remove só da tail (final).  
/auto - Auto-indenta linhas relativas à primeirla linha.  
/lines - Remove todos os line-breaks e espaços extras.  
/all - Remove todos os espaços, mas não os line-breaks.  
/with - A mesma coisa que /all, mas remove caracteres em um argumento "with" fornecido por você. Deve ser char! string! ou integer!

&gt;&gt; e: " spaces before and after "    
&gt;&gt; trim e  
\== "spaces before and after"

#### trim espaços antes:

&gt;&gt; e: " spaces before and after "  
&gt;&gt; trim/head e  
\== "spaces before and after "

#### trim espaços depois:

&gt;&gt; e: " spaces before and after "  
&gt;&gt; trim/tail e  
\== " spaces before and after"

#### trim caracteres específicos:

&gt;&gt; d: "our house in the middle of our street"  
&gt;&gt; trim/with d " "  
\== "ourhouseinthemiddleofourstreet"

&gt;&gt; a: "house"  
&gt;&gt; trim/with a "u"  
\== "hose"

### o oposto de trim: function! pad

pad expande uma string para um determinado tamanho usando espaços. O default é adicionar espaços à direita, mas com o refinamento /left, os espaços são adicionados à esquerda, ou seja, no início. Cuidado, pois a string original é modificada.

&gt;&gt; a: "House"  
&gt;&gt; pad a 10  
\== "House "

&gt;&gt; pad/left a 20  
\== " House "

### contatenação de texto: function! rejoin

&gt;&gt; a: "house" b: " " c: "entrance"  
&gt;&gt; rejoin \[a b c]  
\== "house entrance"

ou, usando append - modifica a série original.

&gt;&gt; append a c  
\== "house entrance"

&gt;&gt; a: "house" b: " " c: "entrance"

&gt;&gt; append a c  
\== "houseentrance"

&gt;&gt; append a append b c  
\== "houseentrance entrance"                ; "a" foi alterada para "houseentrance" na última manipulação

### transformando séries em texto: action! form

form transforma uma série em uma string, removendo os colchetes e adicionando espaços entre os elementos.  form foi visto também no capítulo [Acessando e formatando dados](http://helpin.red/Acessandoeformatandodados.html).

&gt;&gt; a: \["my" "house" 23 47 4 + 8 \["a" "bee" "cee"]]  
&gt;&gt; form a  
\== "my house 23 47 4 + 8 a bee cee"

/part

O refinamento /part limita o número de caracteres da string criada.

&gt;&gt; a: \["my" "house" 23 47 4 + 8 \["a" "bee" "cee"]]  
&gt;&gt; form/part a 8  
\== "my house"

### comprimento da string: action! length?

&gt;&gt; f: "my house"  
&gt;&gt; length? f          
\== 8

### parte esquerda da string:

usando copy/part :

&gt;&gt; s: "nasty thing"  
&gt;&gt; b: copy/part s 5  
\== "nasty"

### parte direita da string:

usando at :

&gt;&gt; s: "nasty thing"  
&gt;&gt; at tail s -5  
\== "thing"

usando remove/part - isto muda a série original, cuidado!

&gt;&gt; s: "nasty thing"  
&gt;&gt; remove/part s 6  
\== "thing"

### parte do meio da string:

usando copy/part e at:

&gt;&gt; a: "abcdefghijkl"  
&gt;&gt; copy/part at a 4 3  
\== "def"

### inserindo strings:

no começo, usando insert:

&gt;&gt; s: "house"  
&gt;&gt; insert s "beautiful "

&gt;&gt; s  
\== "beautiful house"

no fim, usando append:

&gt;&gt; s: "beautiful"  
&gt;&gt; append s " day"  
\== "beautiful day"

no meio, usando insert at:

&gt;&gt; s: "nasty thing"  
&gt;&gt; insert at s 7 "little "

&gt;&gt; s  
\== "nasty little thing"

native! lowercase - letras minúsculas

Muda a string original, cuidado.

&gt;&gt; a: "mY HoUse"  
&gt;&gt; lowercase a  
\== "my house"

/part

&gt;&gt; a: "mY HoUse"  
&gt;&gt; lowercase/part a 2  
\== "my HoUse"

native! uppercase - letras maiúsculas

&gt;&gt; a: "mY HoUse"  
&gt;&gt; uppercase a  
\== "MY HOUSE"

/part

&gt;&gt; a: "mY HoUse"  
&gt;&gt; uppercase/part a 2  
\== "MY HoUse"
