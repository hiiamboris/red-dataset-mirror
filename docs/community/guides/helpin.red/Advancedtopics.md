Original URL: <http://helpin.red/Advancedtopics.html>

# Advanced topics

* * *

* * *

VID DLS style

style is used to create your own custom faces.

Red \[Needs: view]

view [

       style myface: base 70x40 cyan \[quit]

       myface "Click to quit"

       myface "Here too"

       panel red 90x110 [

               below

               myface "And here"

               myface "Also here" blue

       ]

]

![](http://helpin.red/lib/NewItem48.png)

### function! view and  function! unview

##### Multiple windows on the screen

view can also be used to show windows with faces ([a face tree](https://doc.red-lang.org/en/view.html#_the_face_tree)) that were created in another part of the code. unview, of course, closes the view. The following code creates two identical but independent (different face trees) windows in different parts of the screen:

Red \[needs: view]

my-view: \[button {click to "unview"} \[unview]]

print "something"  ;do something else

print "biding my time" ;do something else

view/options/no-wait my-view \[offset: 30x100]

view/options/no-wait my-view \[offset: 400x100]

unview allows the refinement /only to act only on a given window:

Red \[needs: view]

v1: view/options/no-wait [

   backdrop blue

   button "unview blue"\[unview/only v1]

   button "unview yellow" \[unview/only v2]

][    ;options:

   offset: 30x100

]

v2: view/options/no-wait [

   backdrop yellow

   button "unview blue"\[unview/only v1]

   button "unview yellow" \[unview/only v2]

][    ;options:

   offset: 400x100  

]

![](http://helpin.red/lib/unview3.png)

Refinements for view:

    /tight           =&gt; Zero offset and origin.

    /options     =&gt;

    /flags          =&gt;

    /no-wait     =&gt; Return immediately - do not wait.

Refinements for unview:

    /all           =&gt; Close all views.

    /only        =&gt; Close a given view.

VID DLS loose

loose is a facet that allows the face to be dragged (moved around) by the mouse.

Red \[needs: view]

view [

       size 150x150

       base blue 50x50 "Drag me" loose

]

![](http://helpin.red/lib/loose2.png)

[]()VID DLS all-over

The on-over event normally happens when the mouse cursor "enters" or "leaves" the face. When you set the all-over  facet, every event that happens when the cursor is on the face, like movements or clicks, generates an on-over event.

In the following example the left square changes colors only when the mouse cursor "enters" or "leaves it" (over or not over), but the square on the right changes colors with every little movement of the cursor over it, or with mouse left button clicks:

Red \[needs: view]

view [

       a: base 40x40 blue

               on-over \[either a/color = red \[a/color: blue]\[a/color: red]]

       b: base 40x40 blue all-over

               on-over \[either b/color = red \[b/color: blue]\[b/color: red]]

]

![](http://helpin.red/lib/NewItem108.png)

VID DLS hidden

Makes the face invisible by default. One possible use is to create a hidden face with a rate, so you may have the timing without the need of showing a face.

Red \[needs: view]

view [

       button "I'm here"

       button "I'm not" hidden

       button "Here too"

]

![](http://helpin.red/lib/NewItem109.png)

VID DLS disabled

Disables the face by default (the face will not process any event until it is enabled).

Red \[needs: view]

view [

       button "I should quit, but I don't" disabled \[quit]

       button "Quit" \[quit]

]

![](http://helpin.red/lib/NewItem110.png)

VID DLS select

Sets the selected facet of the current face. Used mostly for lists to indicate which item is pre-selected.

Red \[needs: view]

view [

       tl: text-list 100x100 data  [

       "Nenad" "Gregg" "Qtxie"        "Rebolek"

       "Speedy G." "Myke" "Toomas"

       "Alan" "Nick" "Peter" "Carl"

       ] select 6

       \[print tl/selected]

]

![](http://helpin.red/lib/NewItem111.png)

VID DLS focus

Gives the focus to the current face when the window is displayed for the first time. Only one face can have the focus. If several focus options are used on different faces, only the last one will get the focus.

Red \[needs: view]

view [

field

field

field focus

field

]

![](http://helpin.red/lib/NewItem112.png)

VID DLS hint

Provides a hint message inside field faces, when the field’s content is empty. That text disappears when any new content is provided (user action or setting the face/text facet).

Red \[needs: view]

view [

field

field hint "hint here"

]

![](http://helpin.red/lib/NewItem113.png)

VID DLS default

Defines a default value for data facet when the conversion of text facet returns none. Currently only works for text and field face types.

Red \[needs: view]

view [

       a: field 100 default "My default"

       b: field 100 "My text default"

       do [

               print a/text

               print a/data        ; "data" was defined by "default" facet

               print b/text

               print b/data        ; this will give you an error, as "data" was not defined yet

       ]

]

![](http://helpin.red/lib/NewItem114.png)

My default  
My default  
My text default  
\*\** Script Error: My has no value  
\*\** Where: print  
\*\** Stack: view layout do-safe

VID DLS []() with

Suppose you want to create a face whose facets' values are evaluated as you create it. You can't use evaluation in your face "arguments", so you set them with with .

This does not work:

Red \[needs: view]

a: 2

b: 3

view [

       base a * 30x40 b * 8.20.33

]

This works:

Red \[needs: view]

a: 2

b: 3

view [

       base with [

               size: a * 30x40  

               color: b * 8.20.33

       ]

]

![](http://helpin.red/lib/NewItem116.png)

VID DLS rate

rate is a facet that has a timer. When the timer "ticks" an on-time event is generated. Notice that the rate argument is an integer! it means "times per second" , so a rate of 20 is faster than a rate of 5. You may provide a time! argument to set a time for rate.

This code makes a text blink:

Red \[needs: view]

view [

       t: text "" rate 2

       on-time \[either t/text = "" \[t/text: "Blink"] \[t/text: ""]]

]

This code makes a crude animation where a blue base crosses the window:

Red \[Needs: 'View]

view[

   size 150x150

   b: base 40x40 blue "I move" rate 20

       on-time \[b/offset: b/offset + 1x1]

]

Slower rates:

For periods longer thant 1 second, use a time! argument for rate:

Red \[Needs: view]

view[

   t: text "" rate 0:0:3

       on-time \[either t/text = "" \[t/text: "Blink" print now/time]\[t/text: "" print now/time]]

]

function! react

react is a facet that links the behavior of one face to the data of another face.

The classic example:

Red \[Needs: view]

view[

   progress 100x20 20% react \[face/data: s/data]

       s: slider 100x20 20%

]

The progress bar face reacts to the sliding of the slide face:

![](http://helpin.red/lib/NewItem49.png)

    /link        =&gt; Link objects together using a reactive relation.

    /unlink      =&gt; Removes an existing reactive relation.

    /later       =&gt; Run the reaction on next change instead of now.

    /with        =&gt; Specifies an optional face object (internal use).

function! layout

layout is used to create custom views without displaying them. You assign your layout to a word, and then, to show or close it, you use view or unview. With layout you can have GUI windows "ready" for specific tasks.

However, it seem it uses the same face tree for both instances, so you cannot create two independent windows like we did above.

The code bellow, for example, will display one window, and only show the other when you close the first.

Red \[needs: view]

my-view: layout \[button {click to "unview"} \[unview]]

print "something"  ;do something else

print "biding my time" ;do something else

view/options my-view \[offset: 30x100]

view/options my-view \[offset: 400x100]

Get the size of screen:

&gt;&gt; print system/view/screens/1/size  
1366x768

Check the [chapter about system](http://helpin.red/Whatisinsystem.html).

Create a full-screen view:

The following script creates a full-screen view:

Red \[needs: view]

view \[size system/view/screens/1/size]

[]()system/view/auto-sync?:

From the [documentation](https://doc.red-lang.org/en/view.html#_realtime_vs_deferred_updating_a_id_realtime_vs_deferred_updating_a):

"The View engine has two different modes for updating the display after changes are done to the face tree:

- - Realtime updating: any change to a face is immediately rendered on screen.
  - Deferred updating: all changes to a face are not propagated on screen, until show is called on the face, or on the parent face."

What this means is that, in the following script, if you uncomment the second line (on is default), clicking on "Hello" will not change it to "Good bye" until you click on "Show".

Red \[needs: view]

{if you uncomment the next line

you will have to click on "Show" after

clicking on "Hello" to turn it into "Good bye"}

;system/view/auto-sync?: off

view [

a: button "Hello" \[a/text: "Good bye"]

button "Show" \[show a]

]

![](http://helpin.red/lib/NewItem197.png)

Debugging View:

[]()You may use system/view/debug?: yes to see on the console what is happening to your view. Try it. Remember to pass the mouse cursor over the view and do some clicking there:

Red \[]

system/view/debug?: yes

view \[button "hello"]

[&lt; Previous topic](http://helpin.red/Eventmousepositionandkeypressed.html)                                                                                          [Next topic &gt;](http://helpin.red/Richtext.html)
