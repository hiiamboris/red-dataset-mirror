Original URL: <http://helpin.red/pt/Transformacoes2D.html>

# Transformações 2D

* * *

## DRAW - 2D transforms

* * *

DRAW  rotate

Exemplo de uma rotação de 30º centrada em 0x0:

![](http://helpin.red/lib/NewItem148.png)

Da [Documentação oficial do Red](https://doc.red-lang.org/en/draw.html) (com eventuais pequenas mudanças):

Sintaxe

rotate &lt;ângulo&gt; &lt;centro&gt; \[&lt;commands&gt;]  
rotate 'pen &lt;ângulo&gt; rotate 'fill-pen &lt;ângulo&gt;

&lt;ângulo&gt; :  ângulo em graus (integer! float!).  
&lt;centro&gt; : (opcional) centro de rotação (pair!).  
&lt;commands&gt; : (opcional) Comandos do dialeto Draw.

Descrição

Define a rotação no sentido horário em um determinado ponto, em graus. Se o centro opcional não for fornecido, a rotação é sobre a origem do atual sistema de coordenadas do usuário. Números negativos podem ser usados ​​para rotação no sentido anti-horário. Quando um bloco é fornecido como último argumento, a rotação será aplicada apenas aos comandos nesse bloco.

Quando as palavras-chave 'pen' ou 'fill-pen' são usadas, a rotação é aplicada respectivamente à caneta atual ou à caneta de preenchimento atual.

Red \[needs: view]

view [

       base draw [

           pen red

               box 20x20 50x40 ; retângulo horizontal

               rotate 30 40x40 ; Rotação de 30 graus centrada em 40x40

               pen yellow

               box 20x20 50x40 ; mesmo comando, outro retângulo

               ]

]

![](http://helpin.red/lib/NewItem97.png)

DRAW  scale

Exemplo de um scale de 1.2 em ambos os eixos, x e y:

![](http://helpin.red/lib/NewItem149.png)

Da [Documentação oficial do Red](https://doc.red-lang.org/en/draw.html) (com eventuais pequenas mudanças):

Sintaxe

scale &lt;scale-x&gt; &lt;scale-y&gt; \[&lt;commands&gt;]  
scale 'pen &lt;scale-x&gt; &lt;scale-y&gt;  
scale 'fill-pen &lt;scale-x&gt; &lt;scale-y&gt;

&lt;scale-x&gt; : escala em X (number!).  
&lt;scale-y&gt; : escala em Y (number!).  
&lt;commands&gt; : (opcional) Comandos do dialeto Draw.

Descrição

Define os valores da escala. Os valores dados são multiplicadores; use valores maiores que um para aumentar a escala; use valores menores que um para diminuí-lo. Quando um bloco é fornecido como último argumento, o scaling será aplicado apenas aos comandos desse bloco.

Quando as palavras-chave 'pen' ou 'fill-pen' são usadas, a escala será aplicada, respectivamente, à caneta atual ou à caneta de preenchimento atual.

Red \[needs: view]

view [

       base draw [

           pen red

               box 20x20 50x40 ; horizontal rectangle

               scale 1.3 1.3 ;30% bigger in both x and y

               pen yellow

               box 20x20 50x40 ; same command, different box

               ]

]

![](http://helpin.red/lib/NewItem98.png)

DRAW  translate

Exemplo de uma translação nos eixos x e y:

![](http://helpin.red/lib/NewItem150.png)

A translação leva todo o sistema de coordenadas para a nova posição.

Da [Documentação oficial do Red](https://doc.red-lang.org/en/draw.html) (com eventuais pequenas mudanças):

Sintaxe

translate &lt;offset&gt; \[&lt;commands&gt;]  
translate 'pen &lt;offset&gt;  
translate 'fill-pen &lt;offset&gt;

&lt;offset&gt; : quantidades de translação (pair!).  
&lt;commands&gt; : (opcional) Comandos do dialeto Draw.

Descrição

Define a origem para os comandos de desenho. Vários comandos de conversão terão um efeito cumulativo. Quando um bloco é fornecido como último argumento, a translação será aplicada apenas aos comandos desse bloco.

Quando as palavras-chave 'pen' ou 'fill-pen' são usadas, a translação é aplicada respectivamente à caneta atual ou à caneta de preenchimento atual.

Red \[needs: view]

view [

       base draw [

           pen red

               box 20x20 50x40 ; horizontal rectângulo

               translate 25x25

               pen yellow

               box 20x20 50x40 ; same command, different box

               ]

]

![](http://helpin.red/lib/NewItem99.png)

DRAW  skew

Um sistema de coordenadas skewed é quando os eixos não são ortogonais.

![](http://helpin.red/lib/NewItem155.png)

O comando skew inclina os eixos x e/ou y um dado número de graus.

Da [Documentação oficial do Red](https://doc.red-lang.org/en/draw.html) (com eventuais pequenas mudanças):

Sintaxe

skew &lt;skew-x&gt; &lt;skew-y&gt; \[&lt;commands&gt;] skew 'pen &lt;skew-x&gt; &lt;skew-y&gt;  
skew 'fill-pen &lt;skew-x&gt; &lt;skew-y&gt;

&lt;skew-x&gt; : inclinação do eixo X em graus (integer! float!).  
&lt;skew-y&gt; : (opcional) inclinação do eixo Y em graus (integer! float!).  
&lt;commands&gt; : (opcional) Comandos do dialeto Draw.

Description

Define um sistema de coordenadas inclinado do original pelo número de graus fornecido. Se &lt;skew-y&gt; não for fornecido, será considerado zero. Quando um bloco é fornecido como último argumento, a inclinação será aplicada somente aos comandos nesse bloco.

Quando as palavras-chave 'pen' ou 'fill-pen' são usadas, a inclinação é aplicada respectivamente à caneta atual ou à caneta de preenchimento atual.

Red \[needs: view]

view [

       base draw [

               pen yellow                ; só desenha duas flechas

           line 30x30 30x60 25x55

               line 30x60 35x55

               line 30x30 60x30 55x35

               line 60x30 55x25

               pen black                ; só desenha uma grade

               box 0x0 80x80

               line 0x20 80x20 0x20 0x40 80x40 80x60 0x60

               line 20x0 20x80 20x0 40x0 40x80 60x80 60x0

               text 45x5 "X"        

               text 10x40 "Y"

       ]

       base draw [

               skew 20 0 ;inclina o eixo x 20 graus

               pen yellow

           line 30x30 30x60 25x55

               line 30x60 35x55

               line 30x30 60x30 55x35

               line 60x30 55x25

               pen black

               box 0x0 80x80

               line 0x20 80x20 0x20 0x40 80x40 80x60 0x60

               line 20x0 20x80 20x0 40x0 40x80 60x80 60x0

               text 45x5 "X" ;the text does not follow skew!

               text 10x40 "Y"

       ]

       base draw [

               skew 0 20 ; inclina o eixo y 20 graus

               pen yellow

           line 30x30 30x60 25x55

               line 30x60 35x55

               line 30x30 60x30 55x35

               line 60x30 55x25

               pen black

               box 0x0 80x80

               line 0x20 80x20 0x20 0x40 80x40 80x60 0x60

               line 20x0 20x80 20x0 40x0 40x80 60x80 60x0

               text 45x5 "X"

               text 10x40 "Y"

       ]

       base draw [

               skew 20 20 ; inclina os dois eixos 20 graus

               pen yellow

           line 30x30 30x60 25x55

               line 30x60 35x55

               line 30x30 60x30 55x35

               line 60x30 55x25

               pen black

               box 0x0 80x80

               line 0x20 80x20 0x20 0x40 80x40 80x60 0x60

               line 20x0 20x80 20x0 40x0 40x80 60x80 60x0

               text 45x5 "X"

               text 10x40 "Y"

       ]

]

![](http://helpin.red/lib/NewItem151.png)

DRAW  transform

Executa a translação, rotação e escala em um único comando. A transformação abaixo usa 0x0 como ponto de ancoragem (ponto de referência), gira 20º, escala para 1,5 em ambos os eixos e translada 20 unidades nos eixos x e y:

Red \[needs: view]

view [

       base 120x120 draw [

           pen red

               box 20x20 50x40 ; retângulo horizontal

               transform 0x0 20 1.5 1.5 20x20

               pen yellow

               box 20x20 50x40 ; mesmo comando, outro retângulo

               ]

]

![](http://helpin.red/lib/NewItem156.png)

Se um bloco for fornecido como último argumento, essas transformações serão aplicadas apenas aos comandos nesse bloco.

Red \[needs: view]

view [

       base 120x120 draw [

           pen red

               box 20x20 50x40 ; primeiro retângulo, vermelho

               transform 0x0 20 1.5 1.5 20x20 [

                       pen yellow

                       box 20x20 50x40 ; segundo retângulo, amarelo

               ]

               pen blue

               box 25x25 55x45 ; terceiro retângulo, azul

               ]

]

![](http://helpin.red/lib/NewItem158.png)

Da [Documentação oficial do Red](https://doc.red-lang.org/en/draw.html) (com eventuais pequenas mudanças):

Sintaxe

transform &lt;centro&gt; &lt;ângulo&gt; &lt;scale-x&gt; &lt;scale-y&gt; &lt;translation&gt; \[&lt;commands&gt;]  
transform 'pen &lt;centro&gt; &lt;ângulo&gt; &lt;scale-x&gt; &lt;scale-y&gt; &lt;translation&gt;  
transform 'fill-pen &lt;centro&gt; &lt;ângulo&gt; &lt;scale-x&gt; &lt;scale-y&gt; &lt;translation&gt;

&lt;centro&gt; : (opcional) centro de rotação (pair!).  
&lt;ângulo&gt; : ângulo de rotação em graus (integer! float!).  
&lt;scale-x&gt; : escala em X (number!).  
&lt;scale-y&gt; : escala em Y (number!).  
&lt;translation&gt; : valores de translação (pair!).  
&lt;commands&gt; : (opcional) Comandos do dialeto Draw.

Descrição

Define uma transformação, como translação, escala e rotação. Quando um bloco é fornecido como último argumento, a transformação será aplicada apenas aos comandos nesse bloco.

Quando as palavras-chave 'pen' ou 'fill-pen' são usadas, a transformação é aplicada respectivamente à caneta atual ou à caneta de preenchimento atual.

DRAW  clip

Limita a área de desenho a um retângulo.

![](http://helpin.red/lib/NewItem159.png)

Red \[needs: view]

view [

       base

       draw [

                 pen black

               fill-pen red circle 15x40 30

               fill-pen blue circle 30x40 30

               fill-pen yellow circle 45x40 30

               fill-pen cyan circle 60x40 30

               fill-pen purple circle 75x40 30

       ]

       base

       draw [

               clip 10x40 60x70

               pen black

               fill-pen red circle 15x40 30

               fill-pen blue circle 30x40 30

               fill-pen yellow circle 45x40 30

               fill-pen cyan circle 60x40 30

               fill-pen purple circle 75x40 30

       ]

]

![](http://helpin.red/lib/NewItem160.png)

Se um bloco é fornecido como último argumento, o recorte é aplicado apenas aos comandos nesse bloco, ou seja, após o bloco, toda a área se torna novamente uma tela.

Da [Documentação oficial do Red](https://doc.red-lang.org/en/draw.html) (com eventuais pequenas mudanças):

Sintaxe

clip &lt;start&gt; &lt;end&gt; &lt;mode&gt; \[&lt;commands&gt;]  
clip \[&lt;shape&gt;] &lt;mode&gt; \[&lt;commands&gt;]

&lt;start&gt; : canto superior esquerdo da área de recorte (pair!)  
&lt;end&gt; : canto inf. direito da área de recorte (pair!)  
&lt;mode&gt; : (opcional) modo de mistura das áreas recortadas (word!)  
&lt;commands&gt; : (opcional) Comandos do dialeto Draw.  
&lt;shape&gt; : Comandos do dialeto Shape.

Descrição

Define uma região retangular de recorte definida com dois pontos (início e fim) ou uma região com formato arbitrário definida por um bloco de comandos de sub-dialetos Shape. Esse recorte se aplica a todos os comandos subseqüentes do Draw. Quando um bloco é fornecido como último argumento, o recorte será aplicado apenas aos comandos nesse bloco.

Além disso, o modo de combinação entre uma nova região de recorte e a anterior pode ser definido como um dos seguintes:

- - - - - - replace (default)
          - intersect
          - union
          - xor
          - exclude

De todos este modos, eu só consegui entender  replace e exclude. Você pode tentar os outros.

Red \[needs: view]

view [

       base

       draw [

               line-width 5

               pen red line 0x70 10x80 80x80 80x70 10x0

               pen blue line 0x60 20x80 80x80 80x60 20x0

               pen yellow line 0x50 30x80 80x80 80x50 30x0

               pen cyan line 0x40 40x80 80x80 80x40 40x0

               pen green line 0x30 50x80 80x80 80x30 50x0

               pen purple line 0x20 60x80 80x80 80x20 60x0

               pen gold line 0x10 70x80 80x80 80x10 70x0

               pen pink line 0x0 80x80 80x80

               clip 10x40 60x70 replace ;default

               pen red line 0x10 10x0 80x0 80x10 10x80

               pen blue line 0x20 20x0 80x0 80x20 20x80

               pen yellow line 0x30 30x0 80x0 80x30 30x80

               pen cyan line 0x40 40x0 80x0 80x40 40x80

               pen green line 0x50 50x0 80x0 80x50 50x80

               pen purple line 0x60 60x0 80x0 80x60 60x80

               pen gold line 0x70 70x0 80x0 80x70 70x80

               pen pink line 0x80 80x0 80x80

       ]

       base

       draw [

               line-width 5

               pen red line 0x70 10x80 80x80 80x70 10x0

               pen blue line 0x60 20x80 80x80 80x60 20x0

               pen yellow line 0x50 30x80 80x80 80x50 30x0

               pen cyan line 0x40 40x80 80x80 80x40 40x0

               pen green line 0x30 50x80 80x80 80x30 50x0

               pen purple line 0x20 60x80 80x80 80x20 60x0

               pen gold line 0x10 70x80 80x80 80x10 70x0

               pen pink line 0x0 80x80 80x80

               clip 10x40 60x70 exclude

               pen red line 0x10 10x0 80x0 80x10 10x80

               pen blue line 0x20 20x0 80x0 80x20 20x80

               pen yellow line 0x30 30x0 80x0 80x30 30x80

               pen cyan line 0x40 40x0 80x0 80x40 40x80

               pen green line 0x50 50x0 80x0 80x50 50x80

               pen purple line 0x60 60x0 80x0 80x60 60x80

               pen gold line 0x70 70x0 80x0 80x70 70x80

               pen pink line 0x80 80x0 80x80

       ]

]

![](http://helpin.red/lib/NewItem161.png)

Ou, usando uma imagem:

Red \[needs: view]

picture: load %smallballoon.jpeg

view [

       base

       draw [

               line-width 5

               pen red line 0x70 10x80 80x80 80x70 10x0

               pen blue line 0x60 20x80 80x80 80x60 20x0

               pen yellow line 0x50 30x80 80x80 80x50 30x0

               pen cyan line 0x40 40x80 80x80 80x40 40x0

               pen green line 0x30 50x80 80x80 80x30 50x0

               pen purple line 0x20 60x80 80x80 80x20 60x0

               pen gold line 0x10 70x80 80x80 80x10 70x0

               pen pink line 0x0 80x80 80x80

               clip 10x40 60x70 replace ;default

               image picture

       ]

       base

       draw [

               line-width 5

               pen red line 0x70 10x80 80x80 80x70 10x0

               pen blue line 0x60 20x80 80x80 80x60 20x0

               pen yellow line 0x50 30x80 80x80 80x50 30x0

               pen cyan line 0x40 40x80 80x80 80x40 40x0

               pen green line 0x30 50x80 80x80 80x30 50x0

               pen purple line 0x20 60x80 80x80 80x20 60x0

               pen gold line 0x10 70x80 80x80 80x10 70x0

               pen pink line 0x0 80x80 80x80

               clip 10x40 60x70 exclude

               image picture

       ]

]

![](http://helpin.red/lib/NewItem162.png)
