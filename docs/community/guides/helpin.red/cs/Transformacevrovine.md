Original URL: <http://helpin.red/cs/Transformacevrovine.html>

# Transformace v rovině

* * *

* * *

Popisy příkazů push, rotate, scale, translate, skew a transform jsou převzaty z [](https://doc.red-lang.org/cs/draw.html#_push)[dokumentace Redu](https://doc.red-lang.org/cs/draw.html#_push)[.](https://doc.red-lang.org/cs/draw.html#_push)

DRAW  push  nutno doplnit

DRAW  rotate

rotate &lt;angle&gt; &lt;center&gt; \[&lt;commands&gt;]  
rotate 'pen &lt;angle&gt; rotate 'fill-pen &lt;angle&gt;

&lt;angle&gt;    : úhel ve stupních (integer! float!).  
&lt;center&gt;   : (optional) střed otáčení (pair!).  
&lt;commands&gt; : (optional) příkazy dialektu Draw.

Nastaví pravotočivou rotaci ve stupních kolem daného bodu. Není-li zadán nepovinný parametr center, provede se rotace kolem počátku aktuálního souřadného systému. Negativní hodnoty lze použít pro levotočivou (counter-clockwise) rotaci. Je-li jako poslední argument zadán blok, aplikuje se rotace pouze na příkazy v bloku.

Při použití literálových slov (lit-words) 'pen nebo 'fill-pen  se rotace aplikuje na aktuální pen nebo fill-pen.

Red \[needs: view]

view [

       base draw [

            pen red

               box 20x20 50x40    ; obdélník neotáčený

               rotate 30 40x40    ; úhel otočení, střed otáčení

               pen yellow

               box 20x20 50x40    ; obdélník otáčený

               ] ]

![](http://helpin.red/lib/NewItem97.png)

DRAW  scale

scale &lt;scale-x&gt; &lt;scale-y&gt; \[&lt;commands&gt;]  
scale 'pen &lt;scale-x&gt; &lt;scale-y&gt;  
scale 'fill-pen &lt;scale-x&gt; &lt;scale-y&gt;

&lt;scale-x&gt;  : měřítko pro osu X (number!).  
&lt;scale-y&gt;  : měřítko pro osu Y (number!).  
&lt;commands&gt; : (optional) příkazy dialektu Draw.

Nastaví velikost zvětšení. Zadané hodnoty jsou násobitelé; hodnoty větší než jedna zvětšují, hodnoty menší než jedna zmenšují. Je-li jako poslední argument zadán blok, aplikuje se změna velikosti pouze na příkazy v bloku.

Při použití literálových slov (lit-words) 'pen nebo 'fill-pen  se změna velikosti aplikuje na aktuální pen nebo fill-pen.

Red \[needs: view]

view [

       base draw [

            pen red

               box 20x20 50x40   ; obdélník nezvětšovaný

               scale 1.3 1.3     ; zvětšení o30% v obou směrech

               pen yellow

               box 20x20 50x40   ; obdélník zvětšovaný

               ] ]

![](http://helpin.red/lib/NewItem98.png)

DRAW  translate

translate &lt;offset&gt; \[&lt;commands&gt;]  
translate 'pen &lt;offset&gt;  
translate 'fill-pen &lt;offset&gt;

&lt;offset&gt; : velikost posunu (pair!).

Nastaví počátek pro následné kreslicí příkazy. Víceré příkazy translate mají kumulativní účinek. Je-li blok zadán jako poslední argument, použijí se posuny pouze u příkazů z tohoto bloku.

Při použití literálových slov (lit-words) 'pen nebo 'fill-pen se posunutí aplikuje na aktuální pen nebo fill-pen.

Red \[needs: view]

view [

       base draw [

            pen red

               box 20x20 50x40     ; neposouvaný obdélník

               translate 25x25

               pen yellow

               box 20x20 50x40     ; posouvaný obdélník

               ] ]

![](http://helpin.red/lib/NewItem99.png)

DRAW  skew - zkosení

Zkosený souřadnicový systém je tehdy, když jeho osy nejsou ortogonální.

![](http://helpin.red/lib/SkewCartesianSystem.png)

Příkaz skew natočí osu x nebo osu y o zadaný počet stupňů.

skew &lt;skew-x&gt; &lt;skew-y&gt; \[&lt;commands&gt;] skew 'pen &lt;skew-x&gt; &lt;skew-y&gt;  
skew 'fill-pen &lt;skew-x&gt; &lt;skew-y&gt;

&lt;skew-x&gt;   : zkosení ve stupních ve směru x (integer! float!).  
&lt;skew-y&gt;   : (optional) totéž ve směru y (integer! float!)  
&lt;commands&gt; : (optional) příkazy dialektu Draw

Nastaví zkosení souřadných os, zadané úhlem pootočení ve stupních. Není-li zadáno &lt;skew-y&gt;, předpokládá se, že je nulové. Je-li blok zadán jako poslední argument, použije se zkosení pouze u příkazů z tohoto bloku.

Při použití literálových slov (lit-words) 'pen nebo 'fill-pen se zkosení aplikuje na aktuální pen nebo fill-pen

Red \[needs: view]

view [

       base draw [

            pen red

               box 20x20 50x40   ; nezkosený obdélník

               skew 30           ; zkosení 30° ve směru osy x

               pen yellow

               box 20x20 50x40   ; zkosený obdélník

               ]

       base draw [

            pen red

               box 20x20 50x40   ; nezkosený obdélník

               skew 30 30        ; zkosení 30° ve směru obou os

               pen yellow

               box 20x20 50x40   ; zkosený obdélník

               ] ]

![](http://helpin.red/lib/NewItem100.png)

DRAW  transform

transform &lt;center&gt; &lt;angle&gt; &lt;scale-x&gt; &lt;scale-y&gt; &lt;translation&gt; \[&lt;commands&gt;]  
transform 'pen &lt;center&gt; &lt;angle&gt; &lt;scale-x&gt; &lt;scale-y&gt; &lt;translation&gt;  
transform 'fill-pen &lt;center&gt; &lt;angle&gt; &lt;scale-x&gt; &lt;scale-y&gt; &lt;translation&gt;

&lt;center&gt;      : (optional) střed rotace (pair!).  
&lt;angle&gt;       : úhel rotace ve stupních (integer! float!).  
&lt;scale-x&gt;     : měřítko pro osu X (number!).  
&lt;scale-y&gt;     : měřítko pro osu Y (number!).  
&lt;translation&gt; : velikosti posunu (pair!).  
&lt;commands&gt;    : (optional) příkazy dialektu Draw.

Zadá transformaci jako je pootočení, změna velikosti (scaling) a posun jedním příkazem. Je-li blok zadán jako poslední argument, použije se transformace pouze u příkazů z tohoto bloku.

Při použití literálových slov (lit-words) 'pen nebo 'fill-pen se transformace aplikuje na aktuální pen nebo fill-pen.

Red \[needs: view]

view [base draw [

        pen red

        box 20x20 50x40            ; netransformovaný obdélník

        transform 25x25 45 1.2 1.2 0x20    ;střed rotace, úhel, měřítka, posuny

     pen yellow                        

        box 20x20 50x40            ; transformovaný obdélník

        ] ]

![](http://helpin.red/lib/transform.png)

DRAW  clip

Určuje pravoúhlý výřez definovaný dvěma body (start, end) nebo libovolně tvarovaný výřez, definovaný blokem příkazů sub-dialektu Shape. Takto určený výřez je platný pro všechny následné příkazy dialektu Draw. Je-li blok zadán jako poslední argument, použije se výřez pouze u příkazů z tohoto boku.

clip &lt;start&gt; &lt;end&gt; &lt;mode&gt; \[&lt;commands&gt;]  
clip \[&lt;shape&gt;] &lt;mode&gt; \[&lt;commands&gt;]

&lt;start&gt;    : horní levý roh výřezu (pair!)  
&lt;end&gt;      : spodní pravý roh výřezu (pair!)  
&lt;mode&gt;     : (optional) způsob sloučení výřezů (word!)  
&lt;commands&gt; : (optional) příkazy dialektu Draw  
&lt;shape&gt;    : příkazy dialektu Shape

Red \[needs: view]

view [base draw [

     clip 10x40 60x70

        pen black

        fill-pen red circle 15x40 30

        fill-pen blue circle 30x40 30

        fill-pen yellow circle 45x40 30

        fill-pen cyan circle 60x40 30

        fill-pen purple circle 75x40 30

       ]

![](http://helpin.red/lib/draw-clip.png)

Spojení nového výřezu se stávajícím může být zadán jako jeden z následujících způsobů:

- - - replace (default)
    - intersect
    - union
    - xor
    - exclude
