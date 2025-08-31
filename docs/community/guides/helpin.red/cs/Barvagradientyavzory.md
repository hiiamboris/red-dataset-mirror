Original URL: <http://helpin.red/cs/Barvagradientyavzory.html>

# Barva, gradienty a vzory

* * *

* * *

Barevné a jiné vlastnosti čáry se zadávají prostřednictvím příkazů pen a pen-fill.

DRAW  pen &lt; color, (linear, radial, diamond) gradient, pattern, bitmap &gt;

Příkaz určuje barevné provedení čáry.

DRAW  fill-pen &lt; color, (linear, radial, diamond) gradient, pattern, bitmap &gt;

Příkaz definuje výplňový režim pro uzavřené tvary.

DRAW  pen &lt;color&gt;

Red \[needs: view]

view [

       base draw [

               pen yellow                      ; color as word!

               triangle 10x10 50x50 50x10

               pen 255.10.10                   ; color as tuple!

               circle 40x40 20

       ] ]

![](http://helpin.red/lib/NewItem79.png)

DRAW  fill-pen &lt;color&gt;

Red \[needs: view]

view [

       base draw [

               fill-pen yellow              ; color as word!

               triangle 10x10 50x50 50x10

               fill-pen 255.10.10           ; color as tuple!

               circle 40x40 20

       ] ]

![](http://helpin.red/lib/NewItem87.png)

Vypnutí režimu pen a fill-pen:

Red \[needs: view]

view [

       base draw [

               pen off

               fill-pen yellow ; color as word!

               triangle 10x10 50x50 50x10

               fill-pen off

               circle 40x40 20

       ] ]

![](http://helpin.red/lib/NewItem91.png)

DRAW  linear - lineární barevný gradient

Převzato z [dokumentace Redu](http://helpin.red/-lang.org/cs/draw.html#_linear_gradient_pen)

&lt;pen/fill-pen&gt; linear &lt;color1&gt;&lt;offset&gt; ... &lt;colorN&gt;&lt;offset&gt;&lt;start&gt;&lt;end&gt;&lt;spread&gt;

&lt;color1/N&gt;  : seznam barev gradientu (tuple! word!).  
&lt;offset&gt;          : (optional) odsazení barvy gradientu (float!).  
&lt;start&gt;          : (optional) počáteční bod (pair!).  
&lt;end&gt;          : (optional unless &lt;start&gt;) koncový bod (pair!).  
&lt;spread&gt;          : (optional) způsob šíření (word!).

Nastaví  barevný gradient pro kreslení. Pro metodu spread jsou akceptované následující hodnoty:  pad, repeat, reflect (aktuálně je pad totéž jako repeat pro Windows).

Je-li použita metoda spread, definují koncové body směr gradientu. Nejsou-li body zadány, rozvíjí se gradient v horizontálním směru uvnitř kresleného obrazce.

Pen

Red \[needs: view]

view [

       base draw [

               pen linear blue green red 0x0 80x80

               line-width 5

               line 0x0 80x80

       ]

               base draw [

               pen linear blue green 0x0 40x40 pad      ; totéž jako repeat

               line-width 5

               line 0x0 80x80

       ]

               base draw [

               pen linear blue green 0x0 40x40 reflect  ; zrcadlit

               line-width 5

               line 0x0 80x80

       ] ]

![](http://helpin.red/lib/NewItem86.png)

Fill-pen

Red \[needs: view]

view [

       base draw [

               fill-pen linear blue green red 18x18 62x62

               circle 40x40 30

       ] ]

![](http://helpin.red/lib/NewItem88.png)

DRAW  radial - radiální barevný gradient

Převzato z [dokumentace Redu](http://helpin.red/-lang.org/cs/draw.html#_radial_gradient_pen)

&lt;pen/fill-pen&gt; radial &lt;color1&gt; &lt;offset&gt; ... &lt;colorN&gt; &lt;offset&gt; &lt;center&gt; &lt;radius&gt; &lt;focal&gt; &lt;spread&gt;

&lt;color1/N&gt; : seznam barev gradient (tuple! word!).  
&lt;offset&gt;   : (optional) odsazení barvy gradientu (float!).  
&lt;center&gt;   : (optional) střed kružnice gradientu (pair!).  
&lt;radius&gt;   : (optional unless &lt;center&gt;) poloměr kružnice (integer! float!).  
&lt;focal&gt;    : (optional) ohnisko (pair!).  
&lt;spread&gt;   : (optional) způsob šířdní (word!).

Nastaví radiální gradient pro kreslící operace. Pro metodu "spread" jsou akceptovány následující hodnoty: pad, repeat, reflect (aktuálně je pad totéž jako repeat ve Windows).

Radiální gradient bude vykreslován od ohniska k okraji kružnice, definované středem a poloměrem. Počáteční barva se vykreslí v ohnisku, koncová na okraji kruhu.

Pen

Red \[needs: view]

view [

       base draw [

               pen radial blue green red 40x40 40  ; colors center radius

               line-width 20

               line 10x30 70x30

       ] ]

![](http://helpin.red/lib/NewItem89.png)

Fill-pen

Red \[needs: view]

view [

       base draw [

               fill-pen radial blue green red 40x40 40  ; colors center radius

               triangle 20x70 60x70 40x20

       ] ]

![](http://helpin.red/lib/NewItem90.png)

DRAW  diamond - kárový barevný gradient

Převzato z [dokumentace Redu](http://helpin.red/-lang.org/cs/draw.html#_radial_gradient_pen)

&lt;pen/fill-pen&gt; diamond &lt;color1&gt; &lt;offset&gt; ... &lt;colorN&gt; &lt;offset&gt; &lt;upper&gt; &lt;lower&gt; &lt;focal&gt; &lt;spread&gt;

&lt;color1/N&gt; : seznam barev gradientu (tuple! word!).  
&lt;offset&gt; : (optional) odsazení barvy gradientu (float!).  
&lt;upper&gt; : (optional) horní roh čtyřúhelníku. (pair!).  
&lt;lower&gt; : (optional unless &lt;upper&gt;) dolní roh čtyčúhelníku (pair!).  
&lt;focal&gt; : (optional) ohnisko (pair!).  
&lt;spread&gt; : (optional) způsob šíření (word!).

Nastaví gradient ve tvaru kár. Pro metodu "spread" jsou akceptovány následující hodnoty: pad, repeat, reflect (aktuálně je pad totéž jako repeat ve Windows).

Kárový gradient se vykreslí ve směru od ohniska k okraji kára, definovaného horním a dolním rohem. Počáteční barva se vykreslí v ohnisku, koncová barva na okraji kára.

Red \[needs: view]

view [

       base draw [

               fill-pen diamond  blue green red    ; gradient s ohniskem ve středu

               circle 40x40 35

       ]

       base draw [

               fill-pen diamond  blue green red 10x10 50x50  ;souřadnice gradientu "box"

               circle 40x40 35

       ]

       base draw [

               fill-pen diamond  blue green red 10x10 50x50 30x48  ; přidané ohnisko

               circle 40x40 35

       ]

       base draw [

               pen diamond  blue green red 10x10 50x50 30x48

               ; a line over the last gradient:

               line-width 10

               line 10x10 70x70

       ] ]

![](http://helpin.red/lib/NewItem92.png)

DRAW  pattern  - výplň vzorkem

Převzato z [dokumentace Redu](http://helpin.red/-lang.org/cs/draw.html#_radial_gradient_pen)

&lt;pen/fill-pen&gt; pattern &lt;size&gt; &lt;start&gt; &lt;end&gt; &lt;mode&gt; \[&lt;commands&gt;]

&lt;size&gt; : velikost vnitřního zobrazení (pair!)  
&lt;start&gt; : (optional) horní roh vnitřního zobrazení (pair!).  
&lt;end&gt; : (optional) dolní roh vnitřního zobrazení (pair!).  
&lt;mode&gt; : (optional) uspořádání (word!).  
&lt;commands&gt; : blok příkazů Draw pro určení vzorku.

Nastaví tvar uživatele jako vzorek pro plnící operace.  Pro režim "mode" jsou akceptovány tyto hodnoty:  tile (default), flip-x, flip-y, flip-xy, clamp.

Výchozím bodem je 0x0 a koncovým bodem je &lt;size&gt; (velikost).

Red \[needs: view]

view [

            ; nejprve kreslíme vyplněný obdélník:

       base draw [

               fill-pen pattern 10x10 [

                       circle 5x5 4

                       line 3x3 7x7

               ] box 0x0 79x79

            ]

            ; potom vyplněnou diagonálu:

       base draw [

               pen pattern 10x10 [

                       circle 5x5 4

                       line 3x3 7x7

               ]

               line-width 15

               line 0x0 79x79

            ] ]

![](http://helpin.red/lib/NewItem96.png)

DRAW  bitmap - výplň obrázkem

Převzato z [dokumentace Redu](http://helpin.red/-lang.org/cs/draw.html#_radial_gradient_pen)

&lt;pen/fill-pen&gt; bitmap &lt;image&gt; &lt;start&gt; &lt;end&gt; &lt;mode&gt;

&lt;image&gt; : obrázek pro dlaždice (image!).  
&lt;start&gt; : (optional) horní roh vyplňovaného obdélníku (pair!).  
&lt;end&gt; : (optional) dolní roh vyplňovaného obdélníku (pair!).  
&lt;mode&gt; : (optional) uspořádání (word!).

Nastaví obrázek jako vzorek pro výplňové operace. V režimu mode jsou akceptovány následující hodnoty: tile (default), flip-x, flip-y, flip-xy, clamp (připnout).

Výchozím bodem vyplňovaného obdélníku (box) je 0x0 a koncovým bodem je velikost obrázku - oboje typu pair!.

      Výplňovým obrázkem pro následující příklad je: ![](http://helpin.red/lib/asprite.png) formátu bmp, png (size 35x35).

Red \[needs: view]

myimage: load %asprite.bmp               ; musí být v dosahu funkce load  

view [

       base draw [

               fill-pen bitmap myimage tile    ; default

               box 0x0 79x79

       ]

       base draw [

               fill-pen bitmap myimage flip-x  ; zrcadlově měnit podél osy x

               box 0x0 79x79

       ]

       base draw [

               fill-pen bitmap myimage flip-y  ; zrcadlově měnit podél osy y

               box 0x0 79x79

       ]

       base draw [

               fill-pen bitmap myimage flip-xy ; zrcadlově měnit podél os x i y

               box 0x0 79x79

       ]

       base draw [

               fill-pen bitmap myimage clamp   ; připnout jako na nástěnku

               box 0x0 79x79

       ]

       base draw [

               pen bitmap myimage              ; vložit do diagonály

               line-width 15

               line 0x0 80x80

       ] ]

![](http://helpin.red/lib/NewItem94.png)
