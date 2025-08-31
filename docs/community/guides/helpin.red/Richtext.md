Original URL: <http://helpin.red/Richtext.html>

# Rich text

* * *

* * *

## [Red wiki on rich-text](https://github.com/red/red/wiki/%5BDOC%5D-Rich-Text-support)

VID DLS rich-text

## rich-text is a face that can display text in italic, bold, color and with different font sizes. I believe there are two ways of passing the parameters to a rich-text:

## First method, using [with](http://helpin.red/Advancedtopics.html#with) :

Red\[needs: view]

view [

   rich-text 150x50 "Little example of rich-text" with [

       data: \[1x6 italic 8x7 bold 16x2 168.168.168 18 19x9 255.0.0 8]

   ]

]

![](http://helpin.red/lib/NewItem227.png)

Explaining first method:

![](http://helpin.red/lib/NewItem228.png)

If you don't want to use tuples for colors, you could change the data line to:

data: reduce \[1x6 'italic 8x7 'bold 16x2 gray 18 19x9 red 8]

## Second method, using function! rtd-layout

rtd-layout returns a rich-text face from a RTD source code. I believe it is simpler, and allows you to use rich-text from external sources, but you should read the [draw chapter](http://helpin.red/Draw.html) first, and remember to use compose/deep in view.  compose evaluates things in parentheses, and it is used to "bring" outside Red code into the  view dialect block, and must have the /deep refinement because the parentheses are nested inside brackets.

Red\[needs: view]

myrtf: rtd-layout \[i "This " /i b "uses " /b red font 14 "rtd-layout" /font]

view compose/deep [

   rich-text 200x50 draw \[text 0x0 (myrtf)]

   rich-text 200x50 draw \[text 20x10 (myrtf)] ;the pair! locates the text

]

![](http://helpin.red/lib/NewItem237.png)

## Please take a look at Toomas Vooglaid's [rich-text examples page](https://github.com/toomasv/learning/tree/master/snippets/rich-text).  With his kind permission, I added a few below. Toomas also has an excellent [gist](https://gist.github.com/toomasv) with a variety of Red examples on many topics.

Red [

 Author: "Toomas Vooglaid"

]

view [rich-text 200x50 "Little example of rich-text" with [

   data: \[1x6 italic 8x10 bold 16x2 168.168.168 19x9 255.0.0 18]]

]

rb: rtd-layout \[i "And " /i b "another " /b red font 14 "example" /font]

view compose/deep \[rich-text 200x50 draw \[text 0x0 (rb)]]

![](http://helpin.red/lib/NewItem189.png)

Red [

       Purpose: {Relatively simple rich-text demo}

       Help: {Enter text. Select some text, choose formatting from contextual menu (alt-click).

               Press "View" to see formatting, "Text" to return to text editing, "Clear" to clear                              formatting.}

]

count-nl: func \[face /local text n x][

       n: 0 x: face/selected/x

       text: copy face/text

       while [all [

               text: find/tail text #"^/"

               x &gt;= index? text

       ]][

               n: n + 1

       ] n

]

view compose [

       src: area wrap with [

               menu: \["Italic" italic "Bold" bold "Underline" underline]

       ]

       on-menu [

               nls: count-nl face

               append rt/data reduce [

                       as-pair face/selected/x - nls face/selected/y - face/selected/x + 1 event/picked

               ]

       ]

       at 16x12 rt: rich-text hidden with [

               data: copy \[]

               size: src/size - 7x3

               line-spacing: 15

       ]

       below

       button "View" [

               if show-rt: face/text = "View" \[rt/text: copy src/text]

               face/text: pick \["Text" "View"] rt/visible?: show-rt

       ]

       button "Clear" \[clear rt/data]

]

![](http://helpin.red/lib/NewItem205.png)

Red [

       Purpose: {Relatively simple rich-text demo}

       Help: {Select some text in first box, choose formatting from context-menu (alt-click).

               "Clear" clears formatting.}

]

count-nl: func \[face /local text n x][

       n: 0 x: face/selected/x

       text: copy face/text

       while [all [

               text: find/tail text #"^/"

               x &gt;= index? text

       ]][

               n: n + 1

       ] n

]

view compose [

       below src: area wrap with [

               menu: \["Italic" italic "Bold" bold "Underline" underline]

       ]

       on-menu [

               nls: count-nl face

               append rt/data reduce [

                       as-pair face/selected/x - nls face/selected/y - face/selected/x + 1 event/picked

               ]

       ]

       on-key \[rt/text: face/text rt/data: rt/data]

       return

       pnl: panel white with [

               size: src/size

               draw: compose \[pen silver box 0x0 (size - 1)]

               pane: layout/only compose [

                       at 7x3 rt: rich-text with [

                               size: src/size - 10x6 data: copy \[]

                       ]

               ]

       ]

       button "Clear" \[clear rt/data]

]

![](http://helpin.red/lib/NewItem204.png)

[&lt; Previous topic](http://helpin.red/Advancedtopics.html)                                                                                          [Next topic &gt;](http://helpin.red/Createviewsprogammatically.html)
