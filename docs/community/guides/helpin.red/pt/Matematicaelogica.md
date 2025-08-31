Original URL: <http://helpin.red/pt/Matematicaelogica.html>

# Matemática e lógica

* * *

* * *

Notas interessantes:

- Você pode usar um ponto ou uma vírgula como separador de decimal em um  float!:

&gt;&gt; 5,5 + 9.2    ; vírgula no primeiro e ponto no segundo  
\== 14.7                ; A saída é sempre com ponto

- Se você usar apóstrofos para melhorar a leitura, o Red os ignora:

&gt;&gt; 5'420'120,00 * 2  
\== 10840240.0

- Você pode usar strings como input de fórmulas usando do:

&gt;&gt; do "2 + 5"  
\== 7

A maior parte da matemática e da lógica do Red é usual, exceto talvez a ordem de computação. Abaixo segue uma lista de operadores (palavras) usados para cálculos, acrescidos de algumas notas que achei úteis. A maior parte não precisa de uma descrição detalhada.

## Matemática

#### O básico:

O grupo a seguir possui um operador funcional (por exemplo, add) e um infixo (por exemplo, "+"). Eles aceitam number! char! pair! tuple! ou vector! como argumentos (exceto power?).

Note que se você usar o operador funcional, ele vai antes dos operandos (por exemplo: 3 + 4 &lt;=&gt; add 3 4).

### action! add  ou   op! +

&gt;&gt; add 3x4 2x3

== 5x7

&gt;&gt; now/time + 0:5:0   ; added five minutes to current time

== 7:16:27

### action! subtract  ou  op!  -

&gt;&gt; subtract 33 13

== 20

&gt;&gt; 3.4.6 - 1.2.1

== 2.2.5

&gt;&gt; now/month - 3  ;is october now

== 7

### action! multiply  ou  op! *

&gt;&gt; multiply 3x2 2x5

== 6x10

&gt;&gt; 2.3.4 * 3.7.2

== 6.21.8

### action! divide  ou op! /

&gt;&gt; divide 3x5 2

== 1x2        ;truncate result because pair! is made of integer!

&gt;&gt; divide 8 3 ;truncate result because both are integer!

== 2

&gt;&gt; 8 / 3.0        ;3.0 is a float! so result is float!

== 2.666666666666667

### action! power  ou op! \**

&gt;&gt; 3 \** 3

== 27

### action! absolute

Avalia uma expressão e retorna o valor absoluto, isto é, um número positivo.

&gt;&gt; absolute 2 - 7

== 5

### action! negate

Inverte o sinal de um valor, ou seja: positivo &lt;=&gt; negativo

&gt;&gt; negate 3x2

== -3x-2

### float! pi

3,141592...

### action! random

Retorna um valor aleatório do mesmo tipo que seu argumento.

Se o argumento for um inteiro, retorna um inteiro entre 1 (inclusive) e o argumento (inclusive).

Se o argumento for float, retorna um float entre 0 (inclusive) e o argumento (inclusive).

Se o argumento for uma série, ele embaralha os elementos.

&gt;&gt; random 10  
\== 2

&gt;&gt; random 33x33  
\== 13x23

&gt;&gt; random 1  
\== 1

&gt;&gt; random 1.0  
\== 0.07588539741741744

&gt;&gt; random "abcde"  
\== "cedab"

&gt;&gt; random 10:20:05  
\== 8:02:32.5867693

Refinamentos:

/ seed - Reinicia ou randomiza. Eu acho que o uso disso é se a sua função aleatória é chamada muitas vezes dentro de um programa.Nesse caso, ele pode não ser tão aleatório, a menos que você o reinicie com seed.

/ secure - TBD: Retorna um número aleatório criptograficamente seguro.

/ only - Escolha um valor aleatório de uma série.

&gt;&gt; random/only \["fly" "bee" "ant" "owl" "dog"]  
\== "fly"

&gt;&gt; random/only "aeiou"  
\== #"o"

### action! round

Retorna o valor inteiro mais próximo. Metades (por exemplo, 0,5) são arredondadas para zero por padrão.

&gt;&gt; round 2.3  
\== 2.0

&gt;&gt; round 2.5  
\== 3.0

&gt;&gt; round -2.3  
\== -2.0

&gt;&gt; round -2.5  
\== -3.0

Refinamentos:

/to - Você fornece a "precisão" do seu arredondamento:

&gt;&gt; round/to 6.8343278 0.1  
\== 6.8

&gt;&gt; round/to 6.8343278 0.01  
\== 6.83

&gt;&gt; round/to 6.8343278 0.001  
\== 6.834

/even - Metades (por exemplo, 0,5) são arredondadas e não "para cima" como padrão, mas em direção ao número inteiro par.

&gt;&gt; round/even 2.5  
\== 2.0                ;not 3

/down - simplesmente trunca o número, mas mantém o número um float!.

&gt;&gt; round/down 3.9876  
\== 3.0

&gt;&gt; round/down -3.876  
\== -3.0

/half-down - Metades (0,5) são arredondados em direção ao zero, e não para longe do zero.

&gt;&gt; round/half-down 2.5  
\== 2.0

&gt;&gt; round/half-down -2.5  
\== -2.0

/floor - Arredonda na direção negativa

&gt;&gt; round/floor 3.8  
\== 3.0

&gt;&gt; round/floor -3.8  
\== -4.0

/ceiling - Arredonda na direção positiva

&gt;&gt; round/ceiling 2.2  
\== 3.0

&gt;&gt; round/ceiling -2.8  
\== -2.0

/half-ceiling - Metades arredondadas na direção positiva

&gt;&gt; round/half-ceiling 2.5  
\== 3.0

&gt;&gt; round/half-ceiling -2.5  
\== -2.0

### native! square-root

Raiz quadrada. Usa qualquer número! como argumento.

* * *

#### Restos etc.:

### action! remainder or  op! //

Usa number! char! pair! tuple! e  vector! como argumentos. Retorna o resto da divisão do primeiro pelo segundo valor.

&gt;&gt; remainder 15 6  
\== 3

&gt;&gt; remainder -15 6  
\== -3

&gt;&gt; remainder 4.67 2  
\== 0.67

&gt;&gt; 17 // 5  
\== 2

&gt;&gt; 4.8 // 2.2  
\== 0.3999999999999995

#### op! %

Retorna o resto quando um valor é dividido por outro.

### function! modulo

Da documentação: "Wrapper para MOD que lida com erros como REMAINDER. Valores insignificantes (comparados com A e B) são arredondados para zero". Não consigo entender isso.

&gt;&gt; modulo 9 4  
\== 1

&gt;&gt; modulo -15 6  
\== 3

&gt;&gt; modulo -15 -6  
\== 3

&gt;&gt; modulo -15 7                ;?????  
\== 6

&gt;&gt; modulo -15 -7        ;?????  
\== 6

* * *

#### Logarítimos etc.:

### function! exp

Eleva e (o número natural) à potência do argumento.

### native! log-10

Retorna o logaritmo base 10 do argumento.

### native! log-2

Retorna o logaritmo base 2 do argumento.

### native! log-e

Retorna o logaritmo base e do argumento.

* * *

#### Trigonometria:

Todas as funções trigonométricas com nomes longos (arccosine, cosine etc) usam graus como padrão, mas aceitam o refinamento /radians para usar esta unidade. As versões de nome abreviado (acos, cos etc.) tomam radianos como argumentos e exigem que seja um número!

### function! acos  ou  native! arccosine

### function! asin  ou native! arcsine

### function! atan  ou  native! arctangent

#### Retorna o arco tangente trigonométrico.

### function! atan2  ou  native! arctangent2

#### Retorna o ângulo do ponto y / x em radianos, quando medido no sentido anti-horário a partir do eixo x de um círculo (onde 0x0 representa o centro do círculo). O valor de retorno está entre -pi e + pi.

### function! cos  ou  native! cosine

### function! sin  ou  native! sine

### function! tan  ou  native! tangent

* * *

#### Extras:

#### native! max

Retorna o maior de dois argumentos. Argumentos podem ser escalares! ou série!

Não tenho certeza de como ele seleciona a série maior, mas parece escolher a série com o primeiro maior valor da esquerda para a direita.

&gt;&gt; max 8 12  
\== 12

&gt;&gt; max "abd" "abc"  
\== "abd"

&gt;&gt; max \[1 2 3] \[3 2 1]  
\== \[3 2 1]

&gt;&gt; max \[1 2 99] \[3 2 1]  
\== \[3 2 1]

Na comparação de dois pair! , retorna o maior para cada elemento:

&gt;&gt; max 12x6 7x34  
\== 12x34

#### native! min

Retorna o menor de dois argumentos. As notas de max aplicam-se aqui também.

### action! odd?

Retorna true se o argumento (integer!) é ímpar, senão retorna false .

### action! even?

Retorna true se o argumento (integer!) é par, senão retorna false .

#### native! positive?

true se for maior que zero. Nota: falso se zero.

#### native! negative?

true se menor que zero. Nota: falso se zero.

#### native! zero?

true somente se o argumento for zero.

### function! math

Avalia um bloco! usando as regras matemáticas normais de precedência, ou seja, as divisões e multiplicações são avaliadas antes de adições e subtrações e assim por diante.

### function! within?

Tem 3 argumentos do par! tipo. A primeira é a coordenada de um ponto (origem no canto superior esquerdo). Os outros dois descrevem um retângulo, o primeiro é sua origem superior esquerda e o segundo é a largura e a altura. Se o ponto estiver dentro ou na borda, retorna true , caso contrário, retorna false .

#### native! NaN?

Retorna true se o argumento for "não um número", caso contrário, false.

#### native! NaN

#### Retorna TRUE se o número for Não-um-número.

### function! a-an

#### Retorna a variante apropriada de "a" ou "an" (língua inglesa- simples, vs 100% gramaticalmente correto).

* * *

## Logic

### action! and~   ou  op! and (infix)

#### native! equal?   ou   op! =

#### native! greater-or-equal?  ou  op! &gt;=

#### native! greater?  ou  op! &gt;

#### native! lesser-or-equal?   ou  op! &lt;=

#### native! lesser?  ou  op! &lt;

#### native! not

#### native! not-equal?   ou   op! &lt;&gt;

### action! or~  ou  op! or (infix)

#### native! same?  ou  op! =?

Retorna true os argumentos se referem aos mesmos dados (objeto, string etc.), ou seja, ambos se referem ao mesmo espaço na memória.

&gt;&gt; a: \[1 2 3]  
\== \[1 2 3]

&gt;&gt; b: a                ; b points to the same data as a  
\== \[1 2 3]

&gt;&gt; a =? b  
\== true                ; they are the same

&gt;&gt; c: \[1 2 3]  
\== \[1 2 3]

&gt;&gt; c =? a                ; c is equal to a, but is not the same data in memory.  
\== false

#### native! strict-equal?  or  op! ==

Retorna true se os argumentos forem exatamente iguais, com o mesmo tipo de dados, letras maiúsculas / minúsculas (strings) etc.

&gt;&gt; a: "house"  
&gt;&gt; b: "House"  
&gt;&gt; a = b  
\== true

&gt;&gt; a == b  
\== false
