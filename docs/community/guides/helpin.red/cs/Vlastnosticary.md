Original URL: <http://helpin.red/cs/Vlastnosticary.html>

# Vlastnosti čáry

* * *

* * *

Kromě geometrické konfigurace lze pro čáru (line) určit její tlouštku (line-width), způsob spojení (line-join), způsob jejího ukončení (line-cap) a její vyhlazení (anti-alias).

Její barevné a jiné vlastnosti se zadávají prostřednictvím nástroje pen a pen-fill - viz další [kapitola](http://helpin.red/Barvagradientyavzory.html).

DRAW  line-width

Nastaví novou tlouštku (width) čar.

Red \[needs: view]

view [base draw [

               line-width 1  line 10x10 70x10

               line-width 5  line 10x30 70x30

               line-width 20 line 10x60 70x60

       ] ]

![](http://helpin.red/lib/NewItem80.png)

DRAW  line-join

Nastaví způsob spojování čar při kreslení. Přípustné jsou hodnoty:  miter (implicitní), round, bevel nebo miter-bevel.

Red \[needs: view]

view [base draw [

           line-width 15

           line-join  miter

           line 60x10 30x60 60x60

       ]

       base draw [

           line-width 15

           line-join round

           line 60x10 30x60 60x60

       ]

       base draw [

           line-width 15

           line-join bevel

           line 60x10 30x60 60x60

       ] ]

![](http://helpin.red/lib/NewItem83.png)

miter-bevel usekne špičku tvaru miter na tvar bevel, přesáhne-li její [délka](https://msdn.microsoft.com/en-us/library/windows/desktop/ms534148%28v=vs.85%29.aspx) stanovenou mez - obvykle desetinásobek tlouštky čar.

DRAW  line-cap

Definuje tvar ukončení čáry. Lze použít flat (default),  square nebo  round.

Red \[needs: view]

view [

       base draw [

               line-width 15

               line-cap flat  ;default

               line 10x20 70x20

               line-cap square

               line 10x40 70x40

               line-cap round

               line 10x60 70x60

       ]        

       base draw [

               line-width 15

               line-cap flat  ;default

               line 60x10 30x60 60x60

       ]

       base draw [

               line-width 15

               line-cap square

               line 60x10 30x60 60x60

       ]

       base draw [

               line-width 15

               line-cap round

               line 60x10 30x60 60x60

       ]

]

![](http://helpin.red/lib/NewItem84.png)

DRAW   anti-alias

Vyhlazení zubatych obrysů (anti-alias) dává pohlednější vykreslení ale degraduje výkon. Lze jej nastavit na  on (default) nebo off.

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

               anti-alias on  ; toto je počáteční nastavení

               text 10x5 "With"

               text 10x15 "anti-alias"

               circle 40x50 20

               ellipse 10x60 60x15

       ] ]

![](http://helpin.red/lib/NewItem85.png)

DRAW  pen &lt; color, (linear, radial, diamond) gradient, pattern, bitmap &gt;

Příkaz určuje barevné provedení čáry.

DRAW  fill-pen &lt; color, (linear, radial, diamond) gradient, pattern, bitmap &gt;

Příkaz definuje výplňový režim pro uzavřené tvary.
