Original URL: <http://helpin.red/Createviewsprogammatically.html>

# Create views progammatically

* * *

## GUI - Create views programmatically

* * *

## VID is the graphical dialect of Red. All the GUI commands (base, across, style, etc) are VID code.

## FACE TREE - the object! of a graphical view.  view and show.can only display this object!

## LAYOUT transforms any block containing VID code into a face tree.

## VIEW transforms (if needed) a block of VID code into a face tree and display it as a GUI.

## SHOW displays a face tree. It can display a layout (or even a view), but it cannot display a GUI out of a block of VID code. Inside a VID block, it updates a face, however, on Red, unlike Rebol, that update is automatic unless you change settings on  system/view/auto-sync?, as explained [here](http://helpin.red/Advancedtopics.html#autosync).

## So, the argument for view is just a block of VID code and you can change it:

Red\[needs: view]

board: \[]

append board \[below button "Quit" \[quit] field ]

view board

![](http://helpin.red/lib/NewItem218.png)

## Using external variables as facets for a view

## The built-in function compose evaluates things inside parentheses and you may "pass" parameters to view using it:

Red \[needs: view]

txt: "My text"

size: 150

view compose \[ button (txt) (size)]

## ![](http://helpin.red/lib/NewItem219.png)

## Changing a GUI from the GUI itself

## If the GUI is created from a block with compose and then rendered by view, any change in the values in the block is reflected on the GUI "on the fly":

Red\[needs: view]

board: compose [

       a: box blue 50x50

       button "Move blue box" \[a/offset: (a/offset: a/offset + 5x0)]

]   ; every click increases position of blue box

view board

## ![](http://helpin.red/lib/NewItem224.png)  few clicks →  ![](http://helpin.red/lib/NewItem225.png)

## Hiding/showing faces

## Faces have the  attribute visible? that can be changed from true (default) to false to hide a face. In the following script, click the button to toggle on and off the visibility of the field:

Red \[needs: view]

view [

   f: field

   button "Hide field" \[f/visible?: not f/visible?]  

]

![](http://helpin.red/lib/NewItem220.png) click → ![](http://helpin.red/lib/NewItem221.png)

## An elegant example (by Toomas Vooglaid):

Red\[needs: view]

view [

  f: field

  button "Hide field" [

     face/text: pick [

        "Hide field" "Show field"

     ] f/visible?: not f/visible?

  ]

]

## ![](http://helpin.red/lib/NewItem257.png)  ←click →  ![](http://helpin.red/lib/NewItem258.png)

[&lt; Previous topic](http://helpin.red/Richtext.html)                                                                                          [Next topic &gt;](http://helpin.red/Parse.html)
