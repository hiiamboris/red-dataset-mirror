Original URL: <http://helpin.red/2Dtransforms.html>

# 2D transforms

* * *

* * *

DRAW  rotate

Example of a rotation of 30º centered at 0x0:

![](http://helpin.red/lib/NewItem148.png)

From [Red's official documentation](https://doc.red-lang.org/en/draw.html) (with eventual minor changes):

Syntax

rotate &lt;angle&gt; &lt;center&gt; \[&lt;commands&gt;]  
rotate 'pen &lt;angle&gt; rotate 'fill-pen &lt;angle&gt;

&lt;angle&gt; : the angle in degrees (integer! float!).  
&lt;center&gt; : (optional) center of rotation (pair!).  
&lt;commands&gt; : (optional) Draw dialect commands.

Description

Sets the clockwise rotation about a given point, in degrees. If optional center is not supplied, the rotate is about the origin of the current user coordinate system. Negative numbers can be used for counter-clockwise rotation. When a block is provided as last argument, the rotation will be applied only to the commands in that block.

When the 'pen or 'fill-pen lit-words are used, the rotation is applied respectively to the current pen or current fill-pen.

Red \[needs: view]

view [

       base draw [

           pen red

               box 20x20 50x40 ; horizontal rectangle

               rotate 30 40x40 ; rotate 30 degrees centered at 40x40

               pen yellow

               box 20x20 50x40 ; same command, different box

               ]

]

![](http://helpin.red/lib/NewItem97.png)

DRAW  scale

Example of a 1.2 scale increase in both x and y axis:

![](http://helpin.red/lib/NewItem149.png)

From [Red's official documentation](https://doc.red-lang.org/en/draw.html) (with eventual minor changes):

Syntax

scale &lt;scale-x&gt; &lt;scale-y&gt; \[&lt;commands&gt;]  
scale 'pen &lt;scale-x&gt; &lt;scale-y&gt;  
scale 'fill-pen &lt;scale-x&gt; &lt;scale-y&gt;

&lt;scale-x&gt; : the scale amount in X (number!).  
&lt;scale-y&gt; : the scale amount in Y (number!).  
&lt;commands&gt; : (optional) Draw dialect commands.

Description

Sets the scale amounts. The values given are multipliers; use values greater than one to increase the scale; use values less than one to decrease it. When a block is provided as last argument, the scaling will be applied only to the commands in that block.

When the 'pen or 'fill-pen lit-words are used, the scaling is applied respectively to the current pen or current fill-pen.

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

Example of a translation in the x and y axis:

![](http://helpin.red/lib/NewItem150.png)

Translates the entire coordinate system.

From [Red's official documentation](https://doc.red-lang.org/en/draw.html) (with eventual minor changes):

Syntax

translate &lt;offset&gt; \[&lt;commands&gt;]  
translate 'pen &lt;offset&gt;  
translate 'fill-pen &lt;offset&gt;

&lt;offset&gt; : the translation amounts (pair!).  
&lt;commands&gt; : (optional) Draw dialect commands.

Description

Sets the origin for drawing commands. Multiple translate commands will have a cumulative effect. When a block is provided as last argument, the translation will be applied only to the commands in that block.

When the 'pen or 'fill-pen lit-words are used, the translation is applied respectively to the current pen or current fill-pen.

Red \[needs: view]

view [

       base draw [

           pen red

               box 20x20 50x40 ; horizontal rectangle

               translate 25x25

               pen yellow

               box 20x20 50x40 ; same command, different rectangle

               ]

]

![](http://helpin.red/lib/NewItem99.png)

DRAW  skew

A skewed coordinate system is when the axis are not orthogonal.

![](http://helpin.red/lib/NewItem155.png)

The skew command tilts the x axis and/or the y axis by a given number of degrees.

From [Red's official documentation](https://doc.red-lang.org/en/draw.html) (with eventual minor changes):

Syntax

skew &lt;skew-x&gt; &lt;skew-y&gt; \[&lt;commands&gt;] skew 'pen &lt;skew-x&gt; &lt;skew-y&gt;  
skew 'fill-pen &lt;skew-x&gt; &lt;skew-y&gt;

&lt;skew-x&gt; : skew along the x-axis in degrees (integer! float!).  
&lt;skew-y&gt; : (optional) skew along the y-axis in degrees (integer! float!).  
&lt;commands&gt; : (optional) Draw dialect commands.

Description

Sets a coordinate system skewed from the original by the given number of degrees. If &lt;skew-y&gt; is not provided, it is assumed to be zero. When a block is provided as last argument, the skewing will be applied only to the commands in that block.

When the 'pen or 'fill-pen lit-words are used, the skewing is applied respectively to the current pen or current fill-pen.

Red \[needs: view]

view [

       base draw [

               pen yellow                ; Just draw two arrows

           line 30x30 30x60 25x55

               line 30x60 35x55

               line 30x30 60x30 55x35

               line 60x30 55x25

               pen black                ; Just draw a grid

               box 0x0 80x80

               line 0x20 80x20 0x20 0x40 80x40 80x60 0x60

               line 20x0 20x80 20x0 40x0 40x80 60x80 60x0

               text 45x5 "X"        

               text 10x40 "Y"

       ]

       base draw [

               skew 20 0 ;skew X axis 20 degrees

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

               skew 0 20 ; skew Y axis 20 degrees

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

               skew 20 20 ; skew both axis 20 degrees

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

Performs translation, rotation and scaling on a single command. The transform below uses 0x0 as anchor point (reference point), rotates 20º, scales to 1.5 in both axis and translates 20 units both in the x and y axis:

Red \[needs: view]

view [

       base 120x120 draw [

           pen red

               box 20x20 50x40 ; horizontal rectangle

               transform 0x0 20 1.5 1.5 20x20

               pen yellow

               box 20x20 50x40 ; same command, different rectangle

               ]

]

![](http://helpin.red/lib/NewItem156.png)

If a block is provided as last argument, these transformations are applied only to the commands in that block.

Red \[needs: view]

view [

       base 120x120 draw [

           pen red

               box 20x20 50x40 ; first rectangle, red

               transform 0x0 20 1.5 1.5 20x20 [

                       pen yellow

                       box 20x20 50x40 ; second rectangle, yellow

               ]

               pen blue

               box 25x25 55x45 ; third rectangle, blue

               ]

]

![](http://helpin.red/lib/NewItem158.png)

From [Red's official documentation](https://doc.red-lang.org/en/draw.html) (with eventual minor changes):

Syntax

transform &lt;center&gt; &lt;angle&gt; &lt;scale-x&gt; &lt;scale-y&gt; &lt;translation&gt; \[&lt;commands&gt;]  
transform 'pen &lt;center&gt; &lt;angle&gt; &lt;scale-x&gt; &lt;scale-y&gt; &lt;translation&gt;  
transform 'fill-pen &lt;center&gt; &lt;angle&gt; &lt;scale-x&gt; &lt;scale-y&gt; &lt;translation&gt;

&lt;center&gt; : (optional) center of rotation (pair!).  
&lt;angle&gt; : the rotation angle in degrees (integer! float!).  
&lt;scale-x&gt; : the scale amount in X (number!).  
&lt;scale-y&gt; : the scale amount in Y (number!).  
&lt;translation&gt; : the translation amounts (pair!).  
&lt;commands&gt; : (optional) Draw dialect commands.

Description

Sets a transformation such as translation, scaling, and rotation. When a block is provided as last argument, the transformation will be applied only to the commands in that block.

When the 'pen or 'fill-pen lit-words are used, the transformation is applied respectively to the current pen or current fill-pen.

DRAW  clip

Limits the drawing area to a rectangle.

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

If a block is provided as last argument, the clipping is applied only to the commands in that block, i.e. after the block, the whole area becomes canvas again.

From [Red's official documentation](https://doc.red-lang.org/en/draw.html) (with eventual minor changes):

Syntax

clip &lt;start&gt; &lt;end&gt; &lt;mode&gt; \[&lt;commands&gt;]  
clip \[&lt;shape&gt;] &lt;mode&gt; \[&lt;commands&gt;]

&lt;start&gt; : top-left corner point of clipping area (pair!)  
&lt;end&gt; : bottom-right corner point of clipping area (pair!)  
&lt;mode&gt; : (optional) merging mode between clipped regions (word!)  
&lt;commands&gt; : (optional) Draw dialect commands.  
&lt;shape&gt; : Shape dialect commands.

Description

Defines a clipping rectangular region defined with two points (start and end) or an arbitrarily shaped region defined by a block of Shape sub-dialect commands. Such clipping applies to all subsequent Draw commands. When a block is provided as last argument, the clipping will be applied only to the commands in that block.

Additionally, the combining mode between a new clipping region and the previous one, can be set to one of the following:

- - - - - - replace (default)
          - intersect
          - union
          - xor
          - exclude

About those modes, I could only figure out  replace and exclude. You may try the others.

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

Or using an image:

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

[&lt; Previous topic](http://helpin.red/Colorgradientsandpatterns.html)                                                                                          [Next topic &gt;](http://helpin.red/Shapesub-dialect.html)
