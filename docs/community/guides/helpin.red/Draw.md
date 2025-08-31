Original URL: <http://helpin.red/Draw.html>

# Draw

* * *

* * *

[Very good information also in red-by-example.](http://www.red-by-example.org/draw.html) and in the [Red documentation.](https://doc.red-lang.org/en/draw.html)

Draw is used to create 2D graphics. Like PARSE and VID, Draw is a DSL, that is, a dialect of Red, a language within a language.

To use draw, you must also use VID, so every script that uses draw must have a view block, and within the view block, one must have a base face to draw on. The following examples show all the basic shapes of draw.

Remembering:

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

The importance of native! compose for DRAW

Suppose you want to perform evaluations on DRAW arguments, like:

Red \[needs: view]

view [

       base draw \[line 60x10 (2 * 10x30)]

]

This is a very common situation, but Red will give you an error because DRAW does not evaluate expressions.

So you need to use compose, most commonly with the refinement /deep , to achieve that.

Red \[needs: view]

view compose/deep [

       base draw \[line 60x10 (2 * 10x30)]

]

![](http://helpin.red/lib/NewItem115.png)

DRAW is part of the face object!

Open the Red GUI console ant type view/no-wait \[a: base draw \[line 60x10 10x60]] . Then type ? a. You will see a lot of data about the object a, among them you will see:

&gt;&gt; view/no-wait \[a: base draw \[line 60x10 10x60]]

== make object! [

   type: 'window

   offset: 636x360

   size: 130x100

   text: "Red: untitled"

...

&gt;&gt; ? a

A is an object! with the following words and values:

    type             word!         base

&lt;...&gt;

&lt;...&gt;

    draw             block!        length: 3  \[line 60x10 10x60]

    on-change*       function!     \[word old new /local srs same-pane? f saved]

    on-deep-change*  function!     \[owner word target action new index part]

So you may access the draw block using path!:

&gt;&gt; a/draw

== \[line 60x10 10x60]

This is very important for [animation - programmatic drawing](http://helpin.red/ProgrammaticdrawingandAnimation.html).

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

       with a rounded corner:

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

ellipse mode:

Red \[needs: view]

view [

       base draw \[circle  40x40     30        15 ]

                ;     center  radius-x  radius-y

]

![](http://helpin.red/lib/NewItem70.png)

DRAW   ellipse

The ellipse is drawn within an imaginary rectangle. The arguments are the box top-left point and the other corner's point

Red \[needs: view]

view [

       base draw \[ellipse 10x10 20x50]

]

![](http://helpin.red/lib/NewItem71.png)

DRAW   arc

Draws the arc of a circle from the provided center (pair!) and radius (also a pair!) values. The arc is defined by two angles values in degrees. An optional closed keyword can be used to draw a closed arc using two lines coming from the center point.

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

Draws a Bezier curve from 3 or 4 points:

- 3 points: 2 end points, 1 control point.
- 4 points: 2 end points, 2 control points.

The 4 points option allow more complex curves to be created.

Red \[needs: view]

view [

       ;first we just show 4 points:

       base draw \[circle 10x60 1 circle 25x15 1 circle 40x15 1 circle 70x60 1]

       ;then the curves:

       ;4 points-  startpoint controlpoint1 controlpoint2 endpoint:

       base draw \[curve 10x60 25x15 40x15 70x60]

       ;3 points- startpoint controlpoint endpoint:

       base draw \[curve 10x60 25x15       70x60]

]

![](http://helpin.red/lib/NewItem74.png)

[]()Bezier curves

Bezier curves have a start point, an endpoint and one or two control points. If it has one control point its a quadratic Bezier, if it has two control points its a cubic Bezier.

The following animated gifs were made by Phil Tregoning and released to public domain (thank you) at Wikimedia Commons. If you can't see the animation, check the [page on Wikipedia about Bezier curves](https://en.wikipedia.org/wiki/B%C3%A9zier_curve) :

Quadratic Bezier:

![](http://helpin.red/lib/Bzier_2_big.gif)

You should also check out [this great](http://blogs.sitepointstatic.com/examples/tech/svg-curves/quadratic-curve.html) interactive demonstration.

Cubic Bezier:

![](http://helpin.red/lib/Bzier_3_big.gif)

DRAW   spline

Constructs a curve that follows a sequence of points.

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

Paints an image using the provided information for position and width.

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

?

DRAW   anti-alias

Anti-aliasing gives nicer visual rendering, but degrades performance. It can be set on (default) or off.

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

See the  [Shape sub-dialect page](http://helpin.red/Shapesub-dialect.html).

[&lt; Previous topic](http://helpin.red/Parselinks.html)                                                                                          [Next topic &gt;](http://helpin.red/Lineproperties.html)
