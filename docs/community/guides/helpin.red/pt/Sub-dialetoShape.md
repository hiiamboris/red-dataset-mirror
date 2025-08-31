Original URL: <http://helpin.red/pt/Sub-dialetoShape.html>

# Sub-dialeto Shape

* * *

* * *

O sub-dialeto Shape permite criar formas (desenhos, shapes) como blocos.

Alguns aspectos me lembram de "gráficos de tartaruga" ("turtle-graphics"). Você pode mover a caneta sem desenhar e as coordenadas podem ser absolutas (em relação à face) ou relativas (em relação à última posição).

O sub-dialeto shape também "fecha" as formas para você, permitido o uso de  fill-pen para adicionar cores e padrões.

Você pode usar  fill-pen , pen , line-width , line-join e line-cap como comandos no bloco de shape, mas apenas o último comando vai ser usado para toda a forma.

O sub-dialeto Shape é baseado em gráficos SVG. Eu achei os links abaixo úteis para entender alguns conceitos:

[https://developer.mozilla.org/en-US/docs/Web/SVG/Tutorial/Paths](https://developer.mozilla.org/en-US/docs/Web/SVG/Tutorial/Paths)

[http://www.w3.org/TR/SVG11/paths.html](http://www.w3.org/TR/SVG11/paths.html)

⊕ line

O exemplo mais básico:

Red \[needs: view]

myshape: \[line 10x10 70x70]

view compose/deep/only [

       base draw [

           shape (myshape)

       ]

]

![](http://helpin.red/lib/NewItem117.png)

Note o compose/deep/only e os parentesis ao redor do nome da shape. Pelo que eu sei, você precisa usá-los quando trabalha com Shapes.

Fechamento automático

No exemplo abaixo, apenas duas linhas são, de fato, desenhadas. A terceira linha, de fechamento, é automática. Eu adicionei o fill-pen para ilustrar o conceito melhor:

Red \[needs: view]

myshape: [

       line 10x70 40x10 70x70 ;só duas linhas

]

view compose/deep/only \[base draw \[ fill-pen blue shape (myshape)]]

![](http://helpin.red/lib/NewItem121.png)

⊕ move

Exemplo mais basico:

Red \[needs: view]

myshape: [

       line 10x10 70x70 ;linha de 10x10 para 70x70

       move 10x70 ;move a pen sem desenhar para 10x70

       line 10x10 ;desenha uma linha da posição corrente (10x70) até 10x10

]

view compose/deep/only \[base draw \[shape (myshape)]]

![](http://helpin.red/lib/NewItem119.png)

posições relativas

As coordenadas se tornam relativas se você adicionar um apóstrofe (') antes do comando:

Red \[needs: view]

myshape: [

       line 10x40 40x40 ;linha horizontal no meio

       'move 0x-10 ;nova posição corrente RELATIVA à antiga (acima do meio)

       'line 20x0 ;desenha uma pequena linha horizontal RELATIVA a posição corrente

]

view compose/deep/only \[base draw \[shape (myshape)]]

![](http://helpin.red/lib/NewItem120.png)

⊕ hline e ⊕ vline

Desenham linhas horizontais ou verticais a partir da posição corrente.

Red \[needs: view]

myshape: [

       move 10x10 ; coloca a caneta em 10x10

       hline 30 ;linha horizontal X =30

       vline 30 ;linha vertical Y = 30

       'hline 30 ;linha horizontal de 30 pixels (maior que a hline acima)

       'vline 30 ;linha vertical de 30 pixels

       'hline -20 ; só para mostrar o uso de distâncias negativas RELATIVAS

       ; o dialeto shape vai fechar a forma agora.

]

view compose/deep/only \[base draw \[shape (myshape)]]

![](http://helpin.red/lib/NewItem122.png)

⊕ arc

Da [Documentação oficial do Red](https://doc.red-lang.org/en/draw.html) (com eventuais pequenas mudanças):

Sintaxe

arc &lt;end&gt; &lt;radius-x&gt; &lt;radius-y&gt; &lt;angle&gt; sweep large (absolute)  
'arc &lt;end&gt; &lt;radius-x&gt; &lt;radius-y&gt; &lt;angle&gt; sweep large (relative)

&lt;end&gt; : arc's end point (pair!).  
&lt;radius-x&gt; : radius of the circle along x axis (integer! float!).  
&lt;radius-y&gt; : radius of the circle along y axis (integer! float!).  
&lt;angle&gt; : angle between the starting and ending points of the arc in degrees (integer! float!).  
sweep : (optional) draw the arc in the positive angle direction.  
large : (optional) produces an inflated arc (goes with 'sweep option).

Descrição

Desenha o arco de um círculo entre a posição atual da caneta e o ponto final, usando valores de raio. O arco é definido por um valor de ângulo

Aqui está uma explicação sobre como o arco funciona. Como você define sua linha (dois pontos) e sua elipse (raio-x, raio-y e ângulo), existem apenas duas posições para a elipse que fazem de sua linha um acorde para ela. As opções sweep, large e sweep large definem qual arco dessas elipses aparecerá em seu desenho. Observe que na ilustração abaixo, o ângulo da elipse é zero.

![](http://helpin.red/lib/NewItem134.png)

In the arc definition you only inform the arc's end position. That is because the start position is the current pen position. So, if arc is your first command in a shape, you must first move to the position you want to start at.

Na definição do arc, você só informa a posição final do arco. Isso porque a posição inicial é a posição atual da caneta. Então, se arc é seu primeiro comando em uma forma, você deve primeiro ir para a posição onde deseja começar.

Red \[needs: view]

myshape\_1: [

   move 35x50

   arc  55x70 15 30 0

]

myshape\_2: [

   move 35x50

   arc  55x70 15 30 0 large sweep

]

myshape\_3: [

   move 35x50

   arc  55x70 15 30 0 sweep

]

myshape\_4: [

   move 35x50

   arc  55x70 15 30 0 large

]

view compose/deep/only [

       base 100x120 draw \[fill-pen blue shape (myshape\_1)]

       base 100x120 draw \[fill-pen blue shape (myshape\_2)]

       base 100x120 draw \[fill-pen blue shape (myshape\_3)]

       base 100x120 draw \[fill-pen blue shape (myshape\_4)]

]

![](http://helpin.red/lib/NewItem133.png)

Com um ângulo:

Red \[needs: view]

myshape\_1: [

   move 35x50

   arc  55x70 15 30 30

]

myshape\_2: [

   move 35x50

   arc  55x70 15 30 30 large sweep

]

view compose/deep/only [

       base 100x120 draw \[fill-pen blue shape (myshape\_1)]

       base 100x120 draw \[fill-pen blue shape (myshape\_2)]

]

![](http://helpin.red/lib/NewItem135.png)

Um círculo:

Red \[needs: view]

myshape\_1: [

   move 56x40

   arc  56x41 16 16 0 large

]

view compose/deep/only \[base  draw \[fill-pen blue shape (myshape\_1)]]

![](http://helpin.red/lib/NewItem136.png)

⊕ qcurve

Da [Documentação oficial do Red](https://doc.red-lang.org/en/draw.html) (com eventuais pequenas mudanças):

Sintaxe

qcurve &lt;point&gt; &lt;point&gt; ... (absolute)  
'qcurve &lt;point&gt; &lt;point&gt; ... (relative)

&lt;point&gt; : coordinates of a point (pair!).

Descrição

Desenha uma curva quadrática de Bézier a partir de uma sequência de pontos, a partir da posição atual da caneta. Pelo menos 2 pontos são necessários para produzir uma curva (o primeiro ponto é o ponto de partida implícito).

Desenha uma curva Bezier quadrática a partir de uma sequência de 3 pontos. O script a seguir desenha duas curvas uasndo &lt;ponto de partida&gt;  &lt;ponto de controle &gt; &lt;ponto de chegada/ponto de partidat&gt; &lt;ponto de controle &gt; &lt;ponto de chegada&gt;. Permite cordenadas apsolutas ou relativas  (para relativas usar 'qcurve) .

Red \[needs: view]

myshape: [

   move 5x40

   qcurve  20x20 40x76 60x20 76x40

]

view compose/deep/only [

       base  draw [

               pen blue

               circle 5x40 2 ;mostra ponto de partida 1

               circle 40x76 2 ;mostra ponto de chegada 1/ponto de partida 2

               circle 76x40 2 ;mostra ponto de chegada 2

               pen green

               circle 20x20 2 ;mostra ponto de controle 1

               circle 60x20 2 ;mostra ponto de controle 2

               pen yellow

               shape (myshape)

               ]

]

Eu adicionei a localização aproximada dos pontos fixos (azul) e os pontos de controle (verde) na imagem abaixo. Eles não são gerados pelo programa, eu editei a imagem.

![](http://helpin.red/lib/NewItem137.png)

⊕ curve

Da [Documentação oficial do Red](https://doc.red-lang.org/en/draw.html) (com eventuais pequenas mudanças):

Sintaxe

curve &lt;point&gt; &lt;point&gt; &lt;point&gt; ... (absolute)  
'curve &lt;point&gt; &lt;point&gt; &lt;point&gt; ... (relative)

&lt;point&gt; : coordinates of a point (pair!).

Descrição

Desenha uma curva cúbica de Bezier a partir de uma sequência de pontos, a partir da posição atual da caneta. Pelo menos 3 pontos são necessários para produzir uma curva (o primeiro ponto é o ponto de partida implícito).

Desenha uma curva Bezier cúbica usando &lt;ponto de partida (posição corrente)&gt; &lt;ponto de controle 1 (argumento)&gt; &lt;controlponto de controle 2 (argument0)&gt; &lt;ponto de chegada (argumento)&gt; . Permite coordenadas absolutas ou relativas (para relativa 'curve).

Red \[needs: view]

myshape\_1: [

       move 10x70 ; ponto de partida

       curve 30x20 50x20 70x70 ; ponto de controle; ponto de controle; ponto de chegada

]

view compose/deep/only \[base draw \[ pen yellow shape (myshape\_1)]]

Eu adicionei a localização aproximada dos pontos fixos (azul) e os pontos de controle (verde) nas imagens abaixo. Eles não são gerados pelo programa, eu os editei.

![](http://helpin.red/lib/NewItem141.png)

Você pode adicionar mais pontos ao comando curve eles vão criar uma nova curva independente:

Red \[needs: view]

myshape\_1: [

       move 10x70 ; ponto de partida

       curve        30x20 ;primeiro ponto de controle

                       50x20 ;segundo ponto de controle

                       70x70 ;ponto de chegada da primeira curva/ponto de partida da segunda curva

                       90x40 ;primeiro ponto de controle da segunda curva

                       110x100 ;segundo ponto de controle da segunda curva

                       130x70 ponto de chegada da segunda curva

]

view compose/deep/only \[base 150x100 draw \[ pen yellow shape(myshape\_1)]]

![](http://helpin.red/lib/NewItem140.png)

⊕ qcurv

Sintaxe

qcurv &lt;point&gt; (absolute)  
'qcurv &lt;point&gt; (relative)

&lt;point&gt; : coordenadas do ponto de chegada (pair!).

qcurv desenha um Bezier quadrático suave da posição atual da caneta até o ponto especificado.

Você não precisa fornecer o ponto de controle entre o ponto de partida e o ponto final, qcurv cria esses pontos de controle como um reflexo do último ponto de controle dado no bloco de shape, portanto, você deve ter um comando que use um ponto de controle antes de usar o qcurv.

Red \[needs: view]

myshape\_1: [

       move 30x60 ;ponto de partida da qcurve

       qcurve 50x30 70x60 ;ponto de controle; ponto de chegada da qcurve

       qcurv 110x60 ; ponto de chegada da qcurv

]

view compose/deep/only [

       base 300x240 draw [

               scale 2 2 ; só aumenta a escala para visualisar melhor

               pen yellow

               shape (myshape\_1)

               ]

]

![](http://helpin.red/lib/NewItem143.png)

Pelo menos até abril de 2018, qcurv só funciona com um ponto de chegada como argumento.

⊕ curv

Desenha uma curva Bezier cúbica suave a partir de uma sequência de pontos.

Assim como o qcurv, o curv cria pontos de controle refletidos em relação ao último ponto de controle no bloco de forma. Mas como os Béziers cúbicos requerem 2 pontos de controle, você deve fornecer o segundo para cada segmento. Este segundo ponto de controle será refletido como o primeiro ponto de controle do próximo segmento.

Da [Documentação oficial do Red](https://doc.red-lang.org/en/draw.html) (com eventuais pequenas mudanças):

Sintaxe

curv &lt;point&gt; &lt;point&gt; ... (absolute)  
'curv &lt;point&gt; &lt;point&gt; ... (relative)

&lt;point&gt; : coordinates of a point (pair!).

Descrição

Desenha uma curva Bezier cúbica suave a partir de uma sequência de pontos, a partir da posição atual da caneta. Pelo menos 2 pontos são necessários para produzir uma curva (o primeiro ponto é o ponto de partida implícito).

"O primeiro ponto de controle é considerado o reflexo do segundo ponto de controle no comando anterior em relação ao ponto atual. (Se não houver um comando de curva anterior, o primeiro ponto de controle será o ponto atual.)"

Então, curv desenha uma Bezier usando &lt;posição corrente como ponto de partida &gt;&lt; ponto de controle 1 criado automaticamente&gt;&lt;ponto de controle 2&gt; &lt;ponto de chegada&gt;.

Assim, os argumentos que você efetivamente passa para curv são só:  &lt;ponto de controle 2&gt; &lt;ponto de chegada&gt;\[...]

Red \[needs: view]

myshape\_1: [

       move 30x60 ;ponto de partida da qcurve

       qcurve 50x30 70x60 ;ponto de controle; ponto de chegada

       curv 100x40 110x60 ; segundo ponto de controle da curv e ponto de chegada

]

view compose/deep/only [

       base 300x240 draw [

               scale 2 2 ; aumentando só para visualização

               pen yellow

               shape (myshape\_1)

               ]

]

![](http://helpin.red/lib/NewItem144.png)

curv pode usar muitos pontos de controle e pontos consecutivos:

Red \[needs: view]

       ;segundo ponto de controle    ponto

myshape\_1: [

       move 10x40

       qcurve 30x10 50x40

       curv  70x10 90x40 110x10 130x40 150x10 170x40

       move 10x40

]

view compose/deep/only \[base 200x80 draw \[ pen yellow shape (myshape\_1)]

]

![](http://helpin.red/lib/NewItem146.png)
