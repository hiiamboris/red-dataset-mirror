Original URL: <http://helpin.red/pt/Outrasbases.html>

# Outras bases

* * *

* * *

### native! to-hex

### Converte um integer! em um hexadecimal ( issue! datatype) com um # e 0's na frente).

&gt;&gt; to-hex 10  
\== #0000000A

&gt;&gt; to-hex 16  
\== #00000010

&gt;&gt; to-hex 15  
\== #0000000F

### /size        =&gt; Especifica o número de dígitos no resultado hexadecimal.

&gt;&gt; to-hex/size 15 4  
\== #000F

&gt;&gt; to-hex/size 10 2  
\== #0A

### native!  enbase e native! debase,

### Estes são usados para codificar e decodificar strings codificadas em binário (binary -coded strings). Não é exatamente conversão de bases e, honestamente, eu não sei o uso disso, mas funciona assim:

&gt;&gt; enbase "my house"  
\== "bXkgaG91c2U="

&gt;&gt; probe to-string debase "bXkgaG91c2U="  
"my house"  
\== "my house"

### /base        =&gt; base binária utilizada. Pode ser 64 (default), 16 ou 2.

&gt;&gt; enbase/base "Hi" 2  
\== "0100100001101001"

&gt;&gt; probe to-string debase/base "0100100001101001" 2  
"Hi"  
\== "Hi"

### native! dehex

### Converte URLs que usam caracteres codificados em hexadecimal (%xx).

&gt;&gt; dehex "www.mysite.com/this%20is%20my%20page"  
\== "www.mysite.com/this is my page" ; Hex 20 (%20) é espaço "  "

&gt;&gt; dehex "%33%44%55"  
\== "3DU"  
; %33 é hex para "3", %44 é hex para "D" e %55 é hex para "U".

### Funções de manipulação de bits (bitwise):

### op! &gt;&gt;   [Red-specs](https://github.com/meijeru/red.specs-public/blob/master/specs.adoc#84-bitwise-functions)  [Red-by-example](http://www.red-by-example.org/#xgtxgt)

### right shift - [documentação](https://github.com/meijeru/red.specs-public/blob/master/specs.adoc#84-bitwise-functions) diz: "os bits mais baixos são jogados fora e os mais altos duplicados".

&gt;&gt; 144 &gt;&gt; 2

== 36

### ![](http://helpin.red/lib/NewItem234.png)

### Não consegui entender como duplicar o bit mais alto se for 1. Tentei usar palavras de 32 bits, mas o Red as converte para floats.

### op! &lt;&lt;   [Red-specs](https://github.com/meijeru/red.specs-public/blob/master/specs.adoc#84-bitwise-functions)  [Red-by-example](http://www.red-by-example.org/#xltxlt)

### left shift - bits mais altos são jogados fora, bit zero e adicionado à direita.

&gt;&gt; 17 &lt;&lt; 1

== 34

### ![](http://helpin.red/lib/NewItem235.png)

### op! &gt;&gt;&gt;  [Red-specs](https://github.com/meijeru/red.specs-public/blob/master/specs.adoc#84-bitwise-functions)  [Red-by-example](http://www.red-by-example.org/#xgtxgtxgt)

### logical shift -  bits mais baixos são jogados fora, zeros são adicionados à esquerda. Não entendo porque é diferente de  &gt;&gt;.

### op! and  &amp;  and~   [Red-specs](https://github.com/meijeru/red.specs-public/blob/master/specs.adoc#84-bitwise-functions)  [Red-by-example](http://www.red-by-example.org/#and)

&gt;&gt; 27 and 50

== 18

0

0

0

1

1

0

1

1

27

0

0

1

1

0

0

1

0

50

and

0

0

0

1

0

0

1

0

18

A versão funcional (não infixa) de and é and~

### op! or  &amp;  or~   [Red-specs](https://github.com/meijeru/red.specs-public/blob/master/specs.adoc#84-bitwise-functions)  [Red-by-example](http://www.red-by-example.org/#or)

&gt;&gt; 27 or 50

== 59

0

0

0

1

1

0

1

1

27

0

0

1

1

0

0

1

0

50

or

0

0

1

1

1

0

1

1

59

A versão funcional (não infixa) de or é or~

### op! xor  &amp;  xor~   [Red-specs](https://github.com/meijeru/red.specs-public/blob/master/specs.adoc#84-bitwise-functions)  [Red-by-example](http://www.red-by-example.org/#xor)

&gt;&gt; 27 xor 50

== 41

0

0

0

1

1

0

1

1

27

0

0

1

1

0

0

1

0

50

xor

0

0

1

0

1

0

0

1

41

A versão funcional (não infixa) de xor é xor~

### action! complement   [Red-specs](https://github.com/meijeru/red.specs-public/blob/master/specs.adoc#84-bitwise-functions)  [Red-by-example](http://www.red-by-example.org/#complement)

### a fazer -

a fazer
