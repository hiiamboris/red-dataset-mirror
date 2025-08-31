Original URL: <http://helpin.red/cs/Draw.html>

# Draw

* * *

* * *

Obšírnější informaci o DSL Draw lze nalézt v [dokumentaci Redu](https://doc.red-lang.org/cs/draw.html), odkud jsou popisy příkazů převzaty. Součástí DSL Draw je sub-dialekt [Shape](http://helpin.red/Sub-dialektShape.html)[.](http://helpin.red/Sub-dialektShape.html)

Funkce draw se používá ke kreslení rovinných útvarů. Tyto útvary jsou vyjádřeny jako seznamy (block!) direktiv pro funkci draw.

Celkem 30 příkazů dialektu draw lze rozdělit do čtyř skupin:

- Kreslící instrukce:  line, triangle, box, polygon, circle, ellipse, arc, curve, spline, image, text, font
- Vlastnosti čáry: line-width, line-join, line-cap, anti-alias, pen, fill-pen,
- Manipulace s objekty: push, rotate, scale, translate, skew, transform, clip
- Matice: matrix, matrix-order, reset-matrix, invert-matrix - [viz](https://doc.red-lang.org/cs/draw.html#_matrix)

Souřadnicový systém

![](http://helpin.red/lib/coordinates13.png)   ![](http://helpin.red/lib/NewItem147154.png)

Kreslící instrukce

DRAW  line

Nakreslí úsečku mezi dvěma body. Je-li zadáno více bodů, kreslí se další úsečky, napojované na předchozí.

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

    ;             top-left        bottom-right

]

![](http://helpin.red/lib/NewItem66.png)

       se zaobleným rohem:

Red \[needs: view]

view [

       base draw \[box     10x10        50x50      10]

;                      top-left  bottom-right  corner-radius

]

![](http://helpin.red/lib/NewItem67.png)

DRAW  polygon

Red \[needs: view]

view [

       base draw \[polygon 10x10 30x10 40x20 30x30 10x50]

       ; polygon se uzavře automaticky        

]              

![](http://helpin.red/lib/NewItem68.png)

DRAW  circle

Red \[needs: view]

view [

       base draw \[circle  40x40     30]

                ;      center   radius

]

![](http://helpin.red/lib/NewItem69.png)

elipsa příkazem circle:

Red \[needs: view]

view [

       base draw \[circle  40x40     30        15 ]

                ;     center  radius-x  radius-y

]

![](http://helpin.red/lib/NewItem70.png)

DRAW   ellipse

Elipsa se kreslí do pomyslného obdélníku. Zadávají se jeho body top-left a bottom-right.

Red \[needs: view]

view [

       base draw \[ellipse 10x10 20x50]

]

![](http://helpin.red/lib/NewItem71.png)

DRAW   arc

Kreslí kruhový oblouk ze zadaného středu (pair!) a se zadanými poloměry (rovněž pair!). Oblouk je vymezen dvěma úhly ve stupních. První úhel se měří od nuly, druhý úhel od prvního. Lze použít klíčové slovo  closed pro oblouk, uzavřený spojnicemi konců oblouků s jeho středem.

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

Kreslí Bezierovu křivku ze 3 nebo 4 bodů:

- 3 body: 2 koncové, 1 kontrolní - kvadratická Bezierova křivka
- 4 body: 2 koncové, 2 kontrolní - kubická Bezierova. křivka

Red \[needs: view]

view [

       ;nejprve si ukážeme samotné 4 body:

       base draw \[circle 10x60 1 circle 25x15 1 circle 40x15 1 circle 70x60 1]

       ;poté křivku ze 4 bodů: počáteční 1. kontrolní 2. kontrolní koncový:

       base draw \[curve 10x60 25x15 40x15 70x60]

       ;poté křivku ze 3 bodů: počáteční kontrolní koncový:

       base draw \[curve 10x60 25x15       70x60]

]

![](http://helpin.red/lib/NewItem74.png)

DRAW   spline

Red \[needs: view]

view [

       ;first we just show 4 points:

       base draw \[circle 10x60 1 circle 25x15 1 circle 40x15 1 circle 70x60 1]

       ;then the splines:

       base draw \[spline 10x60 25x15 40x15 70x60]

       base draw \[spline 10x60 25x15 40x15 70x60 closed]

]

![](http://helpin.red/lib/NewItem75.png)

DRAW   image

Red \[needs: view]

; image command expects a image! not a file!

; so you must first load the file

picture: load %smallballoon.jpeg

view [

       base draw \[image picture]

       base draw \[image picture 30x30]

       base draw \[image picture 30x30 70x70]

       base draw \[image picture crop 30x30 60x60]

       base draw \[image picture 5x5 crop 30x30 60x60]

]

![](http://helpin.red/lib/NewItem76.png)

There is also a color command (key color to be made transparent) and a border command, but I couldn't make those work yet.

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

Vyběr fontu pro zobrazení textu

native! Funkce compose

Draw neprovádí vyhodnocení výrazů. Následující skript evokuje chybové hlášení:

Red \[needs: view]

view [

       base draw \[line 60x10 (2 * 10x30)]

]

Vyhodnotit výraz nám pomůže funkce compose, nejlépe s upřesněním /deep.

Red \[needs: view]

view compose/deep [

       base draw \[line 60x10 (2 * 10x30)]

]

![](http://helpin.red/lib/NewItem115.png)
