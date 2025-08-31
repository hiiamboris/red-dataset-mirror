Original URL: <http://helpin.red/pt/Corgradientesandpadroes.html>

# Cor, gradientes and padrões

* * *

* * *

DRAW  pen &lt;cor&gt;

Red \[needs: view]

view [

       base draw [

               pen yellow ; cor como nome

               triangle 10x10 50x50 50x10

               pen 255.10.10 ; cor como tuple!

               circle 40x40 20

       ]        

]

![](http://helpin.red/lib/NewItem79.png)

DRAW  fill-pen &lt;color&gt;

Red \[needs: view]

view [

       base draw [

               fill-pen yellow ; cor como nome

               triangle 10x10 50x50 50x10

               fill-pen 255.10.10 ; cor como tuple!

               circle 40x40 20

       ]        

]

![](http://helpin.red/lib/NewItem87.png)

Desligando o pen e o fill-pen:

Red \[needs: view]

view [

       base draw [

               pen off

               fill-pen yellow

               triangle 10x10 50x50 50x10

               fill-pen off

               circle 40x40 20

       ]        

]

![](http://helpin.red/lib/NewItem91.png)

DRAW  linear - gradiente linear de cor

From [Red's official documentation](https://doc.red-lang.org/en/draw.html) (with eventual minor changes):

Syntax

&lt;pen/fill-pen&gt; linear &lt;color1&gt; &lt;offset&gt; ... &lt;colorN&gt; &lt;offset&gt; &lt;start&gt; &lt;end&gt; &lt;spread&gt;

&lt;color1/N&gt;        : list of colors for the gradient (tuple! word!).  
&lt;offset&gt;                : (optional) offset of gradient color (float!).  
&lt;start&gt;                : (optional) starting point (pair!).  
&lt;end&gt;                : (optional unless &lt;start&gt;) ending point (pair!).  
&lt;spread&gt;                : (optional) spread method (word!).

Description

Sets a linear gradient to be used for drawing operations. The following values are accepted for the spread method: pad, repeat, reflect (currently pad is same as repeat for Windows platform).

When used, the start/end points define a line where the gradient paints along. If they are not used, the gradient will be paint along a horizontal line inside the shape currently drawing.

Pen

Red \[needs: view]

view [

       base draw [

               pen linear blue green red 0x0 80x80

               line-width 5

               line 0x0 80x80

       ]

               base draw [

               pen linear blue green 0x0 40x40 pad

               line-width 5

               line 0x0 80x80

       ]

               base draw [

               pen linear blue green 0x0 40x40 reflect

               line-width 5

               line 0x0 80x80

       ]

]

![](http://helpin.red/lib/NewItem86.png)

Fill-pen

Red \[needs: view]

view [

       base draw [

               fill-pen linear blue green red 18x18 62x62

               circle 40x40 30

       ]

]

![](http://helpin.red/lib/NewItem88.png)

DRAW  radial - gradiente radial de cor

From [Red's official documentation](https://doc.red-lang.org/en/draw.html) (with eventual minor changes):

Syntax

&lt;pen/fill-pen&gt; radial &lt;color1&gt; &lt;offset&gt; ... &lt;colorN&gt; &lt;offset&gt; &lt;center&gt; &lt;radius&gt; &lt;focal&gt; &lt;spread&gt;

&lt;color1/N&gt; : list of colors for the gradient (tuple! word!).  
&lt;offset&gt; : (optional) offset of gradient color (float!).  
&lt;center&gt; : (optional) center point (pair!).  
&lt;radius&gt; : (optional unless &lt;center&gt;) radius of the circle to paint along (integer! float!).  
&lt;focal&gt; : (optional) focal point (pair!).  
&lt;spread&gt; : (optional) spread method (word!).

Description

Sets a radial gradient to be used for drawing operations. The following values are accepted for the spread method: pad, repeat, reflect (currently pad is same as repeat for Windows platform).

The radial gradient will be painted from focal point to the edge of a circle defined by center point and radius. The start color will be painted in focal point and the end color will be painted in the edge of the circle.

Pen

Red \[needs: view]

view [

       base draw [

               pen radial blue green red 40x40 40 ; colors center radius

               line-width 20

               line 10x30 70x30

       ]

]

![](http://helpin.red/lib/NewItem89.png)

Fill-pen

Red \[needs: view]

view [

       base draw [

               fill-pen radial blue green red 40x40 40 ; colors center radius

               triangle 20x70 60x70 40x20

       ]

]

![](http://helpin.red/lib/NewItem90.png)

DRAW  diamond - gradiente de cor em forma de diamante

From [Red's official documentation](https://doc.red-lang.org/en/draw.html) (with eventual minor changes):

Syntax

&lt;pen/fill-pen&gt; diamond &lt;color1&gt; &lt;offset&gt; ... &lt;colorN&gt; &lt;offset&gt; &lt;upper&gt; &lt;lower&gt; &lt;focal&gt; &lt;spread&gt;

&lt;color1/N&gt; : list of colors for the gradient (tuple! word!).  
&lt;offset&gt; : (optional) offset of gradient color (float!).  
&lt;upper&gt; : (optional) upper corner of a rectangle. (pair!).  
&lt;lower&gt; : (optional unless &lt;upper&gt;) lower corner of a rectangle (pair!).  
&lt;focal&gt; : (optional) focal point (pair!).  
&lt;spread&gt; : (optional) spread method (word!).

Description

Sets a diamond-shaped gradient to be used for drawing operations. The following values are accepted for the spread method: pad, repeat, reflect (currently pad is same as repeat for Windows platform).

The diamond gradient will be painted from focal point to the edge of a rectangle defined by upper and lower. The start color will be painted in focal point and the end color will be painted in the edge of the diamond.

Red \[needs: view]

view [

       base draw [

               fill-pen diamond  blue green red ; just centers the gradient

               circle 40x40 35

       ]

       base draw [

               fill-pen diamond  blue green red 10x10 50x50 ;added coordinates of the gradient "box"

               circle 40x40 35

       ]

       base draw [

               fill-pen diamond  blue green red 10x10 50x50 30x48; added a point of focus

               circle 40x40 35

       ]

       base draw [

               pen diamond  blue green red 10x10 50x50 30x48

               ; a line over the last gradient:

               line-width 10

               line 10x10 70x70

       ]

]

![](http://helpin.red/lib/NewItem92.png)

DRAW  bitmap - preenchimento bitmap

From [Red's official documentation](https://doc.red-lang.org/en/draw.html) (with eventual minor changes):

Syntax

&lt;pen/fill-pen&gt; bitmap &lt;image&gt; &lt;start&gt; &lt;end&gt; &lt;mode&gt;

&lt;image&gt; : image used for tiling (image!).  
&lt;start&gt; : (optional) upper corner for crop section within image (pair!).  
&lt;end&gt; : (optional) lower corner for crop section within image (pair!).  
&lt;mode&gt; : (optional) tile mode (word!).

Description

Sets an image as pattern to be used for filling operations. The following values are accepted for the tile mode: tile (default), flip-x, flip-y, flip-xy, clamp.

Starting default point is 0x0 and ending point is image’s size.

O bitmap usado dos exemplos é: ![](http://helpin.red/lib/asprite.png)

Red \[needs: view]

myimage: load %asprite.bmp  ; primeiro carrega o bitmap

view [

       base draw [

               fill-pen bitmap myimage tile ; padrão (default)

               box 0x0 79x79

       ]

       base draw [

               fill-pen bitmap myimage flip-x

               box 0x0 79x79

       ]

       base draw [

               fill-pen bitmap myimage flip-y

               box 0x0 79x79

       ]

       base draw [

               fill-pen bitmap myimage flip-xy

               box 0x0 79x79

       ]

       base draw [

               fill-pen bitmap myimage clamp

               box 0x0 79x79

       ]

               base draw [

               pen bitmap myimage

               line-width 15

               line 0x0 80x80

       ]

]

![](http://helpin.red/lib/NewItem94.png)

DRAW  pattern  - preenchimento com padrão desenhado

From [Red's official documentation](https://doc.red-lang.org/en/draw.html) (with eventual minor changes):

Syntax

&lt;pen-fill-pen&gt; pattern &lt;size&gt; &lt;start&gt; &lt;end&gt; &lt;mode&gt; \[&lt;commands&gt;]

&lt;size&gt; : size of the internal image where &lt;commands&gt; will be drawn (pair!).  
&lt;start&gt; : (optional) upper corner for crop section within internal image (pair!).  
&lt;end&gt; : (optional) lower corner for crop section within internal image (pair!).  
&lt;mode&gt; : (optional) tile mode (word!).  
&lt;commands&gt; : block of Draw commands to define the pattern.

Description

Sets a custom shape as pattern to be used for filling operations. The following values are accepted for the tile mode: tile (default), flip-x, flip-y, flip-xy, clamp.

Starting default point is 0x0 and ending point is &lt;size&gt;.

Red \[needs: view]

view [

       ; first we draw a filled box:

       base draw [

               fill-pen pattern 10x10 [

                       circle 5x5 4

                       line 3x3 7x7

               ]

               box 0x0 79x79

       ]

       ; then we draw a line:

       base draw [

               pen pattern 10x10 [

                       circle 5x5 4

                       line 3x3 7x7

               ]

               line-width 15

               line 0x0 79x79

       ]

]

![](http://helpin.red/lib/NewItem96.png)
