Original URL: <http://helpin.red/pt/Draw.html>

# Draw

* * *

* * *

Draw é usado para criar gráficos 2D. Assim como o Parse e Vid, Draw  é uma DSL, ou seja, um dialeto do Red, uma linguagem dentro da linguagem.

Para usar o draw, você tem que usar também a VID, então todo script que usa draw tem que ter um bloco  view , e dentro deste bloco view , é preciso ter uma face base para desenhar. Os próximos examplos mostram todas os elementos básicos de draw.

Lembrando:

![](http://helpin.red/lib/coordinates1.png)![](http://helpin.red/lib/NewItem147.png)

DRAW  line

Red \[needs: view]

view [

       base draw \[line 60x10 10x60]

]

![](http://helpin.red/lib/NewItem81.png)

Red \[needs: view]

view [

       base draw \[line 60x10 10x60 60x60 60x40]

]

![](http://helpin.red/lib/NewItem82.png)

A importância de  native! compose para DRAW

Suponha que você queira realizar avaliações nos argumentos do DRAW, como:

Red \[needs: view]

view [

       base draw \[line 60x10 (2 * 10x30)]

]

Esta é uma situação muito comum, mas o Red vai te dar um error porque o DRAW não avalia expressões.

Então você precisa usar compose, normalmente com o refinamento /deep , para uma execução bem-sucedida.

Red \[needs: view]

view compose/deep [

       base draw \[line 60x10 (2 * 10x30)]

]

![](http://helpin.red/lib/NewItem115.png)

DRAW  triangle

Red \[needs: view]

view [

       base draw \[triangle 10x10 50x50 50x10]        

]

![](http://helpin.red/lib/NewItem65.png)

DRAW  box

Red \[needs: view]

view [

       base draw \[box  10x10     50x50]

;                   top left        bottom-right

]

![](http://helpin.red/lib/NewItem66.png)

       com cantos arredondados:

Red \[needs: view]

view [

       base draw \[box     10x10        50x50      10]

   ;                 top left   bottom-right    corner-radius

]

![](http://helpin.red/lib/NewItem67.png)

DRAW  polygon

Red \[needs: view]

view [

       base draw \[polygon 10x10 30x10 40x20 30x30 10x50]

       ; it closes the polygon automatically

]

![](http://helpin.red/lib/NewItem68.png)

DRAW  circle

Red \[needs: view]

view [

       base draw \[circle  40x40     30]

                ;      center   radius

]

![](http://helpin.red/lib/NewItem69.png)

modo elipse:

Red \[needs: view]

view [

       base draw \[circle  40x40     30        15 ]

                ;     center  radius-x  radius-y

]

![](http://helpin.red/lib/NewItem70.png)

DRAW   ellipse

A ellipse é desenhada dentro de retângulo imáginário. Os argumentos são o canto superior esquerdo e e o outro extremo deste retângulo.

Red \[needs: view]

view [

       base draw \[ellipse 10x10 20x50]

]

![](http://helpin.red/lib/NewItem71.png)

DRAW   arc

Desenha o arco de um círculo do centro (pair!) e raio (também um pair!). O arco é definido por dois ângulos fornecidos em graus. A palavra opcional closed pode ser usada para desenhar um arco fechado, com duas linhas partindo do centro.

Red \[needs: view]

view [

       base draw \[arc 40x40       20x20            45             180]

             ;     center  radius-x/radius-y   start angle  finish angle

       base draw \[arc 40x40 30x30 0 290]

       base draw \[arc 40x40 20x40 0 270]

       base draw \[arc 40x40 20x20 45 180 closed]

]

![](http://helpin.red/lib/NewItem73.png)

DRAW   curve

Desenha uma curva de Bezier de 3 ou de 4 pontos:

- 3 pontos: 2 pontos extremos, 1 ponto de controle.
- 4 pontos: 2 pontos extremos, 2 pontos de controle.

A opção de 4 pontos permite a criação de curvas mais complexas.

Red \[needs: view]

view [

       ;primeiro mostramos os quatro pontos:

       base draw \[circle 10x60 1 circle 25x15 1 circle 40x15 1 circle 70x60 1]

       ;então desenhamos as curvas:

       ;4 pontos-  ponto de partida; ponto de controle 1; ponto de controle2; ponto de chegada

       base draw \[curve 10x60 25x15 40x15 70x60]

       ; pontos-  ponto de partida; ponto de controle; ponto de chegada

       base draw \[curve 10x60 25x15       70x60]

]

![](http://helpin.red/lib/NewItem74.png)

[]()Curvas Bezier

Curvas Bezieer tem um ponto de partida, um ponto de chegada e um ou dois pontos de controle. Se tiver um ponto de controle é uma curva quadrática, se tiver dois é uma curva cúbica.

Os gifs animados abaixo foram feitos por Phil Tregoning e colocados em domínio público (obrigado) no Wikimedia Commons. Se você não puder ver a animação, olhe na [página da  Wikipedia sobre curvas de Bezier](https://en.wikipedia.org/wiki/B%C3%A9zier_curve) :

Bezier quadrática:

![](http://helpin.red/lib/Bzier_2_big.gif)

Veja também [esta ótima](http://blogs.sitepointstatic.com/examples/tech/svg-curves/quadratic-curve.html) demonstração interativa.

Bezier cúbica:

![](http://helpin.red/lib/Bzier_3_big.gif)

DRAW   spline

Faz uma curva que segue uma sequência de pontos.

Red \[needs: view]

view [

       ;primeiro a nos mostramos quatro pontos:

       base draw \[circle 10x60 1 circle 25x15 1 circle 40x15 1 circle 70x60 1]

       ;depois desenhamos a curva:

       base draw \[spline 10x60 25x15 40x15 70x60]

       base draw \[spline 10x60 25x15 40x15 70x60 closed]

]

![](http://helpin.red/lib/NewItem75.png)

DRAW   image

Coloca uma imagem usando uma posição e largura dadas.

Red \[needs: view]

; O comando image espera uma image! não um file!

; então você precisa primeiro carregar o arquivo

picture: load %smallballoon.jpeg

view [

       base draw \[image picture]

       base draw \[image picture 30x30]

       base draw \[image picture 30x30 70x70]

       base draw \[image picture crop 30x30 60x60]

       base draw \[image picture 5x5 crop 30x30 60x60]

]

![](http://helpin.red/lib/NewItem76.png)

Existe também o comando  color e o comando  border , mas não consegui fazê-los funcionar.

       ;base draw \[image picture 30x30 70x30 30x70 70x70]

       ;base draw \[image picture 30x30 70x70 red]

       ;base draw \[image picture 30x30 70x70 blue border]

DRAW   text

Red \[needs: view]

view [

       base draw \[text 40x40 "hello"]

]

![](http://helpin.red/lib/NewItem77.png)

DRAW   font

?

DRAW   anti-alias

Anti-alias dá uma imagem mais suave, mas exige mais computaçao e, portando, diminui a performance do script. Pode ser  on (default) ou off.

Red \[needs: view]

view [

       base draw [

               anti-alias off

               text 10x5 "No"

               text 10x15 "anti-alias"

               circle 40x50 20

               ellipse 10x60 60x15

       ]

       base draw [

               anti-alias on ; this is the default

               text 10x5 "With"

               text 10x15 "anti-alias"

               circle 40x50 20

               ellipse 10x60 60x15

       ]

]

![](http://helpin.red/lib/NewItem85.png)

DRAW   shape

Veja  [sub-dialeto Shape](http://helpin.red/Sub-dialetoShape.html).
