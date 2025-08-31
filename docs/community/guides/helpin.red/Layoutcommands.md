Original URL: <http://helpin.red/Layoutcommands.html>

# Layout commands

* * *

* * *

VID DLS across

Red \[needs: view] ; "needs: view" is needed if the script is going to be compiled

view [

       across

       area 20x20 red

       area 20x20 blue

       area 20x20 green

]

![](http://helpin.red/lib/NewItem11.png)

VID DLS below

Red \[needs: view]

view [

       below

       area 20x20 red

       area 20x20 blue

       area 20x20 green

]

### ![](http://helpin.red/lib/NewItem12.png)

VID DLS return

##### return while in across mode:

![](http://helpin.red/lib/return%20accross.png)

Red \[needs: view]; "needs: view" is needed if the script is going to be compiled

view [

       across

       area 20x20 red

       area 20x20 blue

       return

       area 20x20 green

       area 20x20 gray

       area 20x20 yellow

]

![](http://helpin.red/lib/NewItem14.png)

##### return while in below mode:

![](http://helpin.red/lib/return%20below.png)

Red \[needs: view]

view [

       below

       area 20x20 red

       area 20x20 blue

       return

       area 20x20 green

       area 20x20 gray

       area 20x20 yellow

]

![](http://helpin.red/lib/NewItem15.png)

VID DLS space

Sets the new spacing offset which will be used for placement of following faces.

Red \[needs: view]

view [

       across

       space 50x10

       area 20x20 red

       area 20x20 blue

       return

       area 20x20 green

       area 20x20 gray

       area 20x20 yellow

]

![](http://helpin.red/lib/NewItem16.png)

VID DLS origin

Sets the offset of the first face from the upper left corner of the window's panel.

Red \[needs: view]

view [

       across

       origin 70x20

       area 20x20 red

       area 20x20 blue

       return

       area 20x20 green

       area 20x20 gray

       area 20x20 yellow

]

![](http://helpin.red/lib/NewItem17.png)

VID DLS at

Places the next face at an absolute position. This positioning mode only affects the next following face, and does not change the layout flow position. So, the following faces, after the next one, will be placed again in the continuity of the previous ones in the layout flow.

Red \[needs: view]

view [

       across

       area 20x20 red

       area 20x20 blue

       return

       area 20x20 green

       at 2x5

       area 20x20 gray

       area 20x20 yellow

]

![](http://helpin.red/lib/NewItem18.png)

VID DLS pad

Modifies the layout current position by a relative offset. All the following faces on the same row (or column) are affected.

Red \[needs: view]

view [

       across

       area 20x20 red

       area 20x20 blue

       return

       area 20x20 green

       pad 10x10

       area 20x20 gray

       area 20x20 yellow

]

![](http://helpin.red/lib/NewItem19.png)

native! do

This is the same do from the [Running code](http://helpin.red/Runningcode.html) chapter. In this case, it is used to run regular code inside your view.

You can do this:

Red \[needs: 'view]  
a: 33 + 12  
print a                ;prints on console  
view [  
       text "hello"  
]

But this will give you an error:

Red \[needs: 'view]  
view [  
       text "hello"  
       a: 33 + 12                ;ERROR!!!  
       print a  
]

Inside the view, you must code:

Red \[needs: 'view]  
view [  
       text "hello"  
       do \[a: 33 + 12 print a]        ;OK!  
]

[&lt; Previous topic](http://helpin.red/Containersettings.html)                                                                                          [Next topic &gt;](http://helpin.red/Faces.html)
