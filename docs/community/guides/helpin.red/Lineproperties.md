Original URL: <http://helpin.red/Lineproperties.html>

# Line properties

* * *

* * *

DRAW  line-width

Red \[needs: view]

view [

       base draw [

               line-width 1

               line 10x10 70x10

               line-width 5

               line 10x30 70x30

               line-width 20

               line 10x60 70x60

       ]        

]

![](http://helpin.red/lib/NewItem80.png)

DRAW  line-join

May be miter, round , bevel or miter-bevel\*. miter is default

Red \[needs: view]

view [

       base draw [

               line-width 15

               line-join miter

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

       ]

]

![](http://helpin.red/lib/NewItem83.png)

\* I could not make the miter-bevel option work.

DRAW  line-cap

Defines the line ending's cap mode. May be flat (default) square or round.

Red \[needs: view]

view [

       base draw [

               line-width 15

               line-cap flat ;default

               line 10x20 70x20

               line-cap square

               line 10x40 70x40

               line-cap round

               line 10x60 70x60

       ]        

       base draw [

               line-width 15

               line-cap flat ;default

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

[&lt; Previous topic](http://helpin.red/Draw.html)                                                                                          [Next topic &gt;](http://helpin.red/Colorgradientsandpatterns.html)
