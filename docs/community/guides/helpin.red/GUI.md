Original URL: <http://helpin.red/GUI.html>

# GUI

* * *

## GUI - Overview

* * *

[Very good information also in red-by-example.](http://www.red-by-example.org/vid.html) and in the [Red documentation.](https://doc.red-lang.org/en/view.html)

The following chapters will describe each of Red's View Graphic Engine &amp; VID dialect elements (faces, facets, container settings, layout commands and view refinements) in detail, but I find that an overview of how Red creates GUIs makes it a lot simpler to understand how these elements relate to each other.

Notice that you may create GUIs using Red's positioning commands, like at, for each of its graphical elements (faces), but it also has a very clever GUI-creating method based on simple sequences and a few specific commands. This method is considered the default in this chapters.

#### Simple start:

Red creates GUIs by describing them in a view block. This description is very straightforward and in its simplest form would be:

![](http://helpin.red/lib/guibasic0.png)

If you are going to compile your script, you must add "needs: view" in the Red header. If you run your scripts from the GUI console, the View module is already present.

An example code of that:

Red \[needs: view]  ; "needs: view" is needed if the script is going to be compiled

view[

       base

       button

       field

]

And the resulting GUI:

![](http://helpin.red/lib/guibasics2.png)

Red documentation calls things like buttons and fields "faces" (called "widgets" in some other languages). These faces are set on a layout inside a container (window)

![](http://helpin.red/lib/guidescription.png)

There are built-in functions (layout commands) that define how faces are displayed on this layout. These commands should be written before the faces they alter:

![](http://helpin.red/lib/guibasic1.png)

In the following example, below (a layout command) tells Red to arrange the faces below each other, instead of the default across of the first example:

Red \[needs: view]        ; "needs: view" is needed if the script is going to be compiled

view[

       below        ; layout command

       base        ; face (widget)

       button        ; face (widget)

       field        ; face (widget)

]

The resulting GUI:

![](http://helpin.red/lib/guibasics5.png)

There is also the container settings, which describe how the window itself should look like. And both the container settings and the layout commands may allow further detailing, like its size, color etc. Facesnot only allow this detailing (called facets in Red's jargon) but also may allow a block of commands to be performed by the face (called "action facet") in an event, e.g. the click of a button.

 ![](http://helpin.red/lib/guibasics6.png)  ![](http://helpin.red/lib/coordinates1.png)

Exemple code:

Red \[needs: view]

view[

       backdrop blue        ;container setting

       below                        ; layout command

       base 20x20                ; face and facet

       button 50x20 "press me" \[quit]        ; face, facets  and action facet

       field red "field"                ; face and facets

]

And the resulting GUI:

![](http://helpin.red/lib/guibasics8.png)

Red understands what to do with each facet simply by its datatype!. So if it sees a pair! it knows it's the size of the face, if it sees a string! it knows it's the text to be displayed. An odd consequence of that is that...

button 50x20 "press me" \[quit]  
button "press me" \[quit] 50x20  
button \[quit] 50x20 "press me"

... are all the same, i.e. they result in the same GUI.

The view built-in function (command) allows refinements that will change the window itself (not the layout inside it). The refinements are described in blocks coded after the main view block, and should be coded in the same order that they were declared in the view command:

#### ![](http://helpin.red/lib/guibasics9.png)

In the following code, flags tells Red that the window is of the modal type and it's resizable, while the option's refinement block makes the window show on the top left of the screen (50 pixels down, 50 pixels left):

Red \[needs: view]

view/flags/options[

       size 300x100        ;container setting

       below                        ; layout command

       base 20x20                ; face and facet

       button 50x20 "press me" \[quit]        ; face, facets  and actor

       field red "field"                ; face and facets

]\['modal 'resize] \[offset: 50x50] ; flags and options

The resulting GUI:

#### ![](http://helpin.red/lib/guibasics11.png)

[&lt; Previous topic](http://helpin.red/HTTP.html)                                                                                          [Next topic &gt;](http://helpin.red/Containersettings.html)
