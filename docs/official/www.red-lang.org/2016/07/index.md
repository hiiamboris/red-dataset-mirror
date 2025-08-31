![Red](https://static.red-lang.org/red-logo.svg)

# [Red Programming Language](https://www.red-lang.org/)

## Pages

- [Home](http://www.red-lang.org/)
- [About](http://www.red-lang.org/p/about.html)
- [Getting Started](http://www.red-lang.org/p/getting-started.html)
- [Download](http://www.red-lang.org/p/download.html)
- [Documentation](http://www.red-lang.org/p/documentation.html)
- [Contributions](http://www.red-lang.org/p/contributions.html)
- [Roadmap](http://www.red-lang.org/p/roadmap_2.html)
- [Privacy Policy](https://www.red-lang.org/p/privacy-policy.html)

## July 18, 2016

[]()

### [Eve-style clock demo in Red, livecoded!](https://www.red-lang.org/2016/07/eve-style-clock-demo-in-red-livecoded.html)

Like many others, we are fans of [Chris Granger](http://chris-granger.com/)'s work on Lighttable and more recently on [Eve](http://eve-lang.com/). The Eve project shares some similar goals with Red, though taking a different road by giving a new try at visual programming, while Red still tries to push further the limits of textual representation. A few days ago, the Eve team [tweeted](https://twitter.com/ibdknox/status/751169352632668160) a nice small clock demo using their framework. Here is our own version of that demo using Red and our native reactive GUI (Eve relies on a web engine):

[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhBTVepHxzZ6V67hj9r1gBmDbaEZlI4eNeaKmN_zRhz2SWHxHchlxprCanC7-XP64VlS-TTdNiCLZQ02d_l_kwm39FvBE4GES2530uuvmhMlbDQFO-vrTqvLGCVar-OP0V475P0SheOnSFG/s1600/blue-clock2.gif)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhBTVepHxzZ6V67hj9r1gBmDbaEZlI4eNeaKmN_zRhz2SWHxHchlxprCanC7-XP64VlS-TTdNiCLZQ02d_l_kwm39FvBE4GES2530uuvmhMlbDQFO-vrTqvLGCVar-OP0V475P0SheOnSFG/s1600/blue-clock2.gif)

The Eve demo has a "compile and run" button, which we thought was not necessary in our case, as we can easily build a *livecoding* editor in few lines. ;-)

Here is the full source of our [demo](https://github.com/red/code/blob/master/Showcase/eve-clock.red). Use our latest Windows [build](http://static.red-lang.org/dl/auto/win/red-latest.exe) to run it from the GUI console:

```
    clock-demo: {
    base 200x200 transparent rate 1 now draw [
        scale 2 2
        fill-pen #0B79CE pen off
        circle 50x50 45
        line-width 2
        hour: rotate 0 50x50 [pen #023963 line 50x50 50x20]
        min:  rotate 0 50x50 [pen #023963 line 50x50 50x10]
        sec:  rotate 0 50x50 [pen #CE0B46 line 50x50 50x10]
    ] on-time [
        time: now/time
        hour/2: 30 * time/hour
        min/2:  6  * time/minute
        sec/2:  6  * time/second
    ]
    }

    system/view/silent?: yes

    view [
        title "Eve clock demo"
        backdrop #2C3339
        across

        source: area #13181E 410x300 no-border clock-demo font [
            name: "Consolas"
            size: 9
            color: hex-to-rgb #9EBACB
        ]

        panel 200x300 #2C3339 react [
            attempt/safer [face/pane: layout/tight/only load source/text]
        ]
    ]
```

As you can see the clock demo code is held in a string, which will be used to feed an area widget that we use as a code editor. Each change in the area triggers a reaction which will try to interpret the code as VID dialect using thelayout function and feed the panel's content with it. We could have used a simple on-change handler here, but react is so simple and versatile, that we can forget about events in many cases.

Yes, livecoding (using native widgets!) in Red can be *that* simple. As you can see, there's no built-in "livecode" widget or feature, it's an emergent behavior resulting from the combination of existing Red features, [homoiconicity](https://en.wikipedia.org/wiki/Homoiconicity) being the most fundamental.

As a sidenote, the code above could be improved to avoid some light flickering.

If you want to see more Red feats and get more info about Red, check out:

- our [native spreadsheet in 17 LOC](http://www.red-lang.org/2016/07/native-reactive-spreadsheet-in-17-loc.html)
- our [reactive framework](http://www.red-lang.org/2016/06/061-reactive-programming.html) (not limited to GUI domain)
- our very flexible [native GUI system](http://www.red-lang.org/2016/03/060-red-gui-system.html)
- our built-in powerful [PEG parser DSL](http://www.red-lang.org/2013/11/041-introducing-parse.html)
- our built-in [system programming DSL](http://static.red-lang.org/red-system-specs-light.html)

Red is only at Alpha 0.6.1, and there is significant work still to do. Though, you can already imagine the sheer power that will be into your hands by the time Red reaches 1.0. ;-)

Cheers!

Posted by [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055 "author profile") at [2:59 PM](https://www.red-lang.org/2016/07/eve-style-clock-demo-in-red-livecoded.html "permanent link") [19 comments:](https://www.red-lang.org/2016/07/eve-style-clock-demo-in-red-livecoded.html#comment-form) [![](https://resources.blogblog.com/img/icon18_edit_allbkg.gif)](https://www.blogger.com/post-edit.g?blogID=5936111837781935054&postID=8305993111013830439&from=pencil "Edit Post")

Labels: [demos](https://www.red-lang.org/search/label/demos), [GUI](https://www.red-lang.org/search/label/GUI), [livecoding](https://www.red-lang.org/search/label/livecoding), [reactive](https://www.red-lang.org/search/label/reactive)

## July 7, 2016

[]()

### [Native reactive spreadsheet in 17 LOC](https://www.red-lang.org/2016/07/native-reactive-spreadsheet-in-17-loc.html)

After the release of our [reactive framework](http://www.red-lang.org/2016/06/061-reactive-programming.html) a few days ago, we though it would be a good idea to implement the, often mentioned, *spreadsheet model* as a small demo, just to see how much it would take to do it in Red, with its current feature-set. Well, despite not having a grid component, it turns out that 17 LOC (*of packed, but still readable code; down to [14 LOC](https://gist.github.com/dockimbel/091cc787b366a3d88972b8cb9e2878b2) and 1053 bytes if minified*) is enough to make a spreadsheet-like demo with native widgets and realtime updating of dependent cells as-you-type! ;-)

```
Red [] L: charset "ABCDEFGHI" D: union N: charset "123456789" charset "0" 
repeat y 9 [repeat x 9 [col: either x = 1 [#"^(2028)"][#"A" + (x - 2)]
  append p: [] set ref: (to word! rejoin [col y - 1]) make face! [size: 90x24
    type:    pick [text field] header?: (y = 1) or (x = 1)
    offset:  -20x10 + as-pair ((x - 1) * size/x + 2) ((y - 1) * size/y + 1)
    text:    form case [y = 1 [col] x = 1 [y - 1] 'else [copy ""]]
    para:    make para! [align: pick [center right] header?]
    extra:   object [name: form ref formula: old: none]
    actors:  context [on-create: on-unfocus: function [f e][f/color: none
      if rel: f/extra/old [react/unlink rel 'all]
      if #"=" = first f/extra/formula: copy text: copy f/text [parse remove text
          [any [p: L N not ["/" skip not N] insert p " " insert "/data "
          | L skip | p: some D opt [dot some D] insert p " " insert " " | skip]]
        f/text: rejoin [f/extra/name "/data: any [math/safe [" text {] "#UND"]}]
       if f/data [any [react f/extra/old: f/data do f/data]]]]
      on-focus: func [f e][f/text: any [f/extra/formula f/text] f/color: yello]
]]]] view make face! [type: 'window text: "PicoSheet" size: 840x250 pane: p]
```

You can copy/paste the above code into the Red console for Windows, using the latest [toolchain build](http://static.red-lang.org/dl/auto/win/red-latest.exe) (950 KB), or, better, using this [prebuilt console](http://static.red-lang.org/dl/win/gui-console.exe) version (247 KB, requires Windows 7+). Yeah, we still count in KB. ;-)

Features:

- 100% native widgets using our built-in [GUI engine](http://doc.red-lang.org/gui/Overview.html) (no third-party libraries, Windows only for now, OSX and GTK are coming).
- Support for arbitrary Excel-style formulas (=A1+2\*C3).
- Support for arbitrary Red code in formulas.
- Realtime updating of dependent cells as you type.
- While editing a formula, dependent cells will display #UND (for "undefined").
- If a formula is syntactically incorrect, #UND is displayed in the cell.
- Code is *packed* to reduce the LOC number, but limited to 82 characters per line (could fit on 77 if indentation is removed).
- It takes about 6 LOC to build the spreadsheet and 3 LOC to compile the formulas to Red expressions.
- One expression per line (expressions can have nested expressions), Red's header not counting as an expression for the purpose of this demo, nor the last expression at line 16 for setting the yellow color on focus, it is just there to make the animated captures easier to follow.
- Not using our [VID](https://doc.red-lang.org/en/vid.html) dialect for GUI, such version is left as an exercise to the reader. ;-)

Here is a capture of how it works:

[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEh0QwPujU8X7WeE-xWGAmxVS10Jc06RkrAYsqNuwNVNXW3C7zTjEDnf8O-lm9gdgGQ_0rRxPkZToQGmsiLi_e32mMMN9QKOZeEJ56FeaJjGa-OkbeFMGhpmZ6VAnT2FKLBhuB_ZSppHIzmD/s1600/picosheets2.gif)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEh0QwPujU8X7WeE-xWGAmxVS10Jc06RkrAYsqNuwNVNXW3C7zTjEDnf8O-lm9gdgGQ_0rRxPkZToQGmsiLi_e32mMMN9QKOZeEJ56FeaJjGa-OkbeFMGhpmZ6VAnT2FKLBhuB_ZSppHIzmD/s1600/picosheets2.gif)

*If you want to play with the same dataset, use [this script](https://gist.github.com/dockimbel/08e40961e5f7836d29591dd06d1a56f9).*

This other session shows how to leverage the [rich datatypes](http://rebol.com/docs/core23/rebolcore-16.html) of Red, to play with, in the spreadsheet. It also shows that you can access the [face](https://doc.red-lang.org/en/view.html#_face_object) objects properties from within the cells and modify them directly:

[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgMMXtSPw1lOMHYmreQA7mwgrECvuwF9qQgPeGlkRcPi1mzygAyQcQeSY7It0Nrt8WZYUmRivOJxv2Ls7yV3fA2trhPxioBWCF3t2ZN-cz1qFWRnKBym6wsWVW3pgBRcyUvlerm_BgPFU4N/s1600/picosheets3.gif)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgMMXtSPw1lOMHYmreQA7mwgrECvuwF9qQgPeGlkRcPi1mzygAyQcQeSY7It0Nrt8WZYUmRivOJxv2Ls7yV3fA2trhPxioBWCF3t2ZN-cz1qFWRnKBym6wsWVW3pgBRcyUvlerm_BgPFU4N/s1600/picosheets3.gif)

*If you want to play with the same dataset, use [this script](https://gist.github.com/dockimbel/9ff2fd10e6310d1c4baf2336c6928cf0).*

Those captures were done on Windows, which is currently the most advanced GUI backend we have, our OSX and GTK backends are still a work in progress.

This demo was inspired by [a similar one](http://wiki.tcl.tk/41294) written in Tcl/tk which weights 30 LOC only, but takes advantage of a built-in grid component, and a C-like expressions parsing/evaluating library called [expr](http://www.tcl.tk/man/tcl/TclCmd/expr.htm). Though, it is still impressive to see what Tcl/tk can achieve. But the real king there, is the JS [220 bytes](http://xem.github.io/sheet/) demo, even if it is more a testimony to the DOM capabilities (with a 100MB+ runtime behind) than JS [expressivness](http://redmonk.com/dberkholz/2013/03/25/programming-languages-ranked-by-expressiveness/). Nevertheless, Red's demo is the smallest one we could find in the native GUI category. Even the executable footprint is minimal. Once compiled (just insert Needs: View in the header in such case), it weights [655 KB](http://static.red-lang.org/dl/win/picosheet.exe), which can be further [compressed](http://upx.sourceforge.net/) down to just [221 KB](http://static.red-lang.org/dl/win/picosheet-packed.exe), and as usual, *zero dependency*.

The above source code is very packed to fit in as less lines as possible, though it is still readable, as it is really hard to obfuscate Red code, even when you want to (mandatory spaces between tokens prevent from reaching C-like [extremes](http://www.ioccc.org/years.html#2015)). Therefore, you will hardly win a [codegolf](https://en.wikipedia.org/wiki/Code_golf) competition where each byte counts...unless you leverage Red's DSL abilities and write one optimized towards such goal.

How does it work?

It relies on our [Red/View](https://doc.red-lang.org/en/view.html) GUI engine, the [reactive](http://www.red-lang.org/2016/06/061-reactive-programming.html) [framework](https://doc.red-lang.org/en/reactivity.html), the [Parse DSL](http://www.red-lang.org/2013/11/041-introducing-parse.html) and the core Red language, which is, for those hearing about it for the first time, a [Rebol](http://rebol.com/) language descendent, with one of the [highest expressiveness](http://redmonk.com/dberkholz/2013/03/25/programming-languages-ranked-by-expressiveness/) among programming languages.

For the ones interested in the details of the above code, you can find a more readable version [here](https://gist.github.com/dockimbel/b0a413342dc39568696207412a2ef5e7) and what follows is a detailed explanation. This is actually much simpler than it looks, here we go:

Line 1

```
 L: charset "ABCDEFGHI" D: union N: charset "123456789" charset "0" 
```

Skipping the Red \[] header, it starts by defining a few [bitsets](http://www.rebol.com/r3/docs/datatypes/bitset.html), which will be used for the parsing operations. We create the D [charset](http://www.rebol.com/docs/words/wcharset.html) by combining N and "0", which save space.

Line 2

```
 repeat y 9 [repeat x 9 [col: either x = 1 [#"^(2028)"][#"A" + (x - 2)] 
```

A double loop is used to produce all the widgets needed. col is set to a space character if the column is a header, or to a letter starting from A to G. It will be used to create the cell names and the first row labels.

Line 3

```
 append p: [] set ref: (to word! rejoin [col y - 1]) make face! [size: 90x24 
```

Here we start building the faces which will be accumulated in p block. p: \[] is a static allocation that conveniently avoids using a separate line to define p. The set ref: (to word! rejoin \[col y - 1]) part is transparent, and let the face produced by make face! be appended to the p list. That transparent expression creates the cell name (in form of a capital letter denoting the column, and a number for the row), which is converted to a word, that gets set to the newly created face. Those words are necessary for supporting the spreadsheet formulas. Last, the opening block for the face definition leaves an option to append a nested expression, size definition being the shortest of all the other property definitions, is a good fit for that.

Line 4

```
 type:    pick [text field] header?: (y = 1) or (x = 1)
```

The face type can be a text for the first row/column and a field otherwise. The header? word will be useful further in the code, to indicate if the cell is a just label or a field. If you wonder why the use of or instead of the idiomatic any, it is to avoid an expensive conversion to logic!, as required by pick in such use-case.

Line 5

```
 offset:  -20x10 + as-pair ((x - 1) * size/x + 2) ((y - 1) * size/y + 1) 
```

The face position is calculated using the x and y values to set up a grid, which is sligtly moved to the left for (subjective) minor look improvement.

Line 6

```
 text:    form case [y = 1 [col] x = 1 [y - 1] 'else [copy ""]] 
```

The face content is set to col which contains column's label, or row number, or otherwise an empty string for input cells.

Line 7

```
 para:    make para! [align: pick [center right] header?] 
```

The face para object is just used there to center the header labels while keeping the cell content right-aligned.

Line 8

```
 extra:   object [name: form ref formula: old: none] 
```

The extra field is populated with an object which holds the state of the cell, namely:

- name: name of the cell, in string format for easier usage in the formulas compiler.
- formula: keeps a reference to the last entered formula, in text format, as typed by the user.
- old: keeps a reference of the last reaction set by the cell's formula (or none).

Line 9

```
 actors:  context [on-create: on-unfocus: function [f e][f/color: none 
```

The cell definition is almost done, just remain the event handlers, which we start defining from this line. on-create is called when the cell is created, ensuring that the preset content will be properly processed (in case of a formula) before showing it for the first time. on-unfocus is the main way to trigger the user's input processing. on-enter was not used, as the tabbing support is not working currently, so pressing Enter key will keep the focus on the same cell, causing unwanted side-effects which would take several lines to workaround. Once proper tabbing will be there, we could add it too. Last, as the function's body block is opening, we can squeeze in a short expression, which just resets the background color of the cell to its default.

Line 10

```
 if rel: f/extra/old [react/unlink rel 'all] 
```

We start with the hot stuff now. If a previous formula did produce a reaction, we first destroy it.

Line 11

```
 if #"=" = first f/extra/formula: copy text: copy f/text [parse remove text 
```

If a formula is detected, we copy first the content in text, which will be used for the transformation to a Red expression. As series are owned by deep reactors (a face! object is one), the copy will ensure that no object events are produced during the transformation steps. A second copy creates another instance of the input string to be referenced by extra/formula. In case it is not a formula (all that is done before the test succeeds, it will have no effect on the cell content (just wasting some memory, but that's not what we optimize for, in this exercise). Last, we start the transformation of the input text if it's a formula, using a Parse rule, applied to text with the leading equal sign removed.

Line 12

```
 [any [p: L N not ["/" skip not N] insert p " " insert "/data " 
```

The rule starts with a loop, the goal is to spot all the cell names and insert a space before it and /data just after it ("A1" becomes " A1/data "). The not \["/" skip not N] rule is there to avoid transforming cell names followed by a face property (e.g. A1/color). It works by ensuring that the second character after the slash is not a number, allowing to still transform inputs like A1/B2 (A1 divided by B2).

Line 13

```
 | L skip | p: some D opt [dot some D] insert p " " insert " " | skip]] 
```

If the input is not a cell name, we search for numbers (some D) including number with decimals (opt \[dot some D]), so we can insert a space before and after (e.g "1+2" become " 1 + 2 "), in order to enforce Red's syntactic rules (as we will LOAD that string later). The | L skip part is there to avoid injecting spaces to numbers with leading signs ("-123" would not be touched). The final skip rule just skips every other character we are not interested in.

Line 14

```
 f/text: rejoin [f/extra/name "/data: any [math/safe [" text {] "#UND"]}] 
```

The transformation is almost done, the last step is decorating properly the text to generate the Red expression we are aiming for. First we enclose the resulting expression from last step in a math/safe \[...] block. The math function just ensures that math precedence rules are enforced, while /safe option evaluates the code using attempt internally, so any error will be returned as a none value (and in such case, the "#UND" string is used). The result of that evaluation is set the the current cell. So for an input formula like: "=A1+B1" in C1 cell, we get as result of the transformation process:  
 "C1/data: any \[math/safe \[ A1/data + B1/data ] "#UND"]", which is a LOADable expression in string format. But LOAD is not used in the demo code? Well, it is, thanks to a new feature in 0.6.1 release: by default the /text property of a field is synchronized in realtime with its /data property, using a LOAD call. If it fails, /data is set to none value. Conversely, setting /data will change /text value at once using a FORM call. Well, that's what the resulting expression is meant to leverage. ;-)

Line 15

```
 if f/data [any [react f/extra/old: f/data do f/data]]]] 
```

Now take a deep breath as we reach the crux of the matter. The previous line set f/text, which, at once created a LOADed version of that string, referred by f/data. If the LOADing failed, f/data would be set to none and then we just exit the event handler. Otherwise, we have something we can use as the input to REACT for trying to set up a new reactive relation for that cell. That's where the "/data" injection for the cell names in previous steps, becomes useful. Those path! values are statically analyzed by REACT to determine the reactive sources. Though, if no reactive source has been found in the expression (e.g. "=1+2" which would give \[C1/data: any \[math/safe \[ 1 + 2 ]]] in f/data), REACT returns none and we then can simply evaluate the expression, which would assign the result to the current cell /data (hence to /text, making it visible to the user). If REACT succeeded, we have set a new reactive relation for that cell, and by default, the reaction is run once on creation, ensuring that our cell gets the correct visual value (by indirectly setting /data, as usual now). Moreover, we save in extra/old a reference to the expression we used for creating the reactive relation, as we'll need to destroy if the user inputs a new formula. If you're still following, at this point, congrats, you can consider yourself a master of both View and the reactive framework. ;-)

Line 16

```
 on-focus: func [f e][f/text: any [f/extra/formula f/text] f/color: yello] 
```

The second event handler is used to restore the saved formula (if any) in the cell, when the user gives it the focus. We also then set the background color to yellow, which is...well, like yellow color, but a bit less yellow...hence the truncated name for an otherwise anonymous color. (Carl, if you're reading this, I hope you appreciate my tap-dancing around your, sometimes, *creative* naming schemes. ;-))

Line 17

```
 ]]]] view make face! [type: 'window text: "PicoSheet" size: 840x250 pane: p] 
```

This last line is just creating a window, assigning the list of previously created labels and fields to the /pane property (face's children), then displaying it while entering an event loop using view call. That's all folks!

Last thoughts

We hope this demo and explanations were both entertaining and informative. Spreadsheet applications are not your common app, they are *special*. They are a unique combination of incredibly useful and powerful features, while at the same time being usable by pretty much anyone with basic computer skills. Many consider them as the culmination of our industrial software world, Microsoft's CEO itself [declared](http://uk.businessinsider.com/satya-nadella-excel-is-microsofts-best-consumer-product-2016-6) a few days ago, that Excel was the best product his company ever made.

As Red allows you to create such software in a convenient and straightforward way, using native technologies, we hope this will inspire some of you to invest more time learning Red and to create some amazing software with it!

Beyond the simple fun provided by this demo, it also shows the potential of Red in the native GUI apps domain (we're just at 0.6.1, we have many more features planned and platforms to support). In the big struggle between native vs web solutions, you can expect Red to become, someday, an option to account for.

In the meantime... have fun with Red, as much as we do! ;-)

Posted by [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055 "author profile") at [8:09 PM](https://www.red-lang.org/2016/07/native-reactive-spreadsheet-in-17-loc.html "permanent link") [16 comments:](https://www.red-lang.org/2016/07/native-reactive-spreadsheet-in-17-loc.html#comment-form) [![](https://resources.blogblog.com/img/icon18_edit_allbkg.gif)](https://www.blogger.com/post-edit.g?blogID=5936111837781935054&postID=6061623805610018489&from=pencil "Edit Post")

Labels: [demos](https://www.red-lang.org/search/label/demos), [GUI](https://www.red-lang.org/search/label/GUI), [parse](https://www.red-lang.org/search/label/parse), [reactive](https://www.red-lang.org/search/label/reactive), [View](https://www.red-lang.org/search/label/View)

[Newer Posts](https://www.red-lang.org/search?updated-max=2018-01-09T03%3A13%3A00%2B01%3A00&max-results=7&reverse-paginate=true "Newer Posts") [Older Posts](https://www.red-lang.org/search?updated-max=2016-07-07T20%3A09%3A00%2B02%3A00&max-results=7 "Older Posts") [Home](https://www.red-lang.org/)

Subscribe to: [Posts (Atom)](https://www.red-lang.org/feeds/posts/default)

[Star](https://github.com/red/red)   [Follow @red\_lang](https://twitter.com/red_lang)

    

Follow [@red\_lang](https://twitter.com/red_lang) on Twitter or on [/r/redlang](https://www.reddit.com/r/redlang/) subreddit.

Chat with us in our [Gitter](https://gitter.im/red/red) room.

## Search This Blog

## Total Pageviews

[Loading...](http://github.com/red/red/commits/master.atom)

## Blog Archive

- [►](javascript:void%280%29)  [2025](https://www.red-lang.org/2025/) (2)
  
  - [►](javascript:void%280%29)  [April](https://www.red-lang.org/2025/04/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [March](https://www.red-lang.org/2025/03/) (1)

<!--THE END-->

- [►](javascript:void%280%29)  [2024](https://www.red-lang.org/2024/) (4)
  
  - [►](javascript:void%280%29)  [June](https://www.red-lang.org/2024/06/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [May](https://www.red-lang.org/2024/05/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [February](https://www.red-lang.org/2024/02/) (2)

<!--THE END-->

- [►](javascript:void%280%29)  [2023](https://www.red-lang.org/2023/) (3)
  
  - [►](javascript:void%280%29)  [November](https://www.red-lang.org/2023/11/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [August](https://www.red-lang.org/2023/08/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [June](https://www.red-lang.org/2023/06/) (1)

<!--THE END-->

- [►](javascript:void%280%29)  [2022](https://www.red-lang.org/2022/) (2)
  
  - [►](javascript:void%280%29)  [July](https://www.red-lang.org/2022/07/) (2)

<!--THE END-->

- [►](javascript:void%280%29)  [2021](https://www.red-lang.org/2021/) (2)
  
  - [►](javascript:void%280%29)  [December](https://www.red-lang.org/2021/12/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [August](https://www.red-lang.org/2021/08/) (1)

<!--THE END-->

- [►](javascript:void%280%29)  [2020](https://www.red-lang.org/2020/) (4)
  
  - [►](javascript:void%280%29)  [August](https://www.red-lang.org/2020/08/) (2)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [March](https://www.red-lang.org/2020/03/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [January](https://www.red-lang.org/2020/01/) (1)

<!--THE END-->

- [►](javascript:void%280%29)  [2019](https://www.red-lang.org/2019/) (10)
  
  - [►](javascript:void%280%29)  [December](https://www.red-lang.org/2019/12/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [November](https://www.red-lang.org/2019/11/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [October](https://www.red-lang.org/2019/10/) (2)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [September](https://www.red-lang.org/2019/09/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [July](https://www.red-lang.org/2019/07/) (2)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [June](https://www.red-lang.org/2019/06/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [February](https://www.red-lang.org/2019/02/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [January](https://www.red-lang.org/2019/01/) (1)

<!--THE END-->

- [►](javascript:void%280%29)  [2018](https://www.red-lang.org/2018/) (20)
  
  - [►](javascript:void%280%29)  [December](https://www.red-lang.org/2018/12/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [November](https://www.red-lang.org/2018/11/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [October](https://www.red-lang.org/2018/10/) (3)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [September](https://www.red-lang.org/2018/09/) (3)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [June](https://www.red-lang.org/2018/06/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [May](https://www.red-lang.org/2018/05/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [April](https://www.red-lang.org/2018/04/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [March](https://www.red-lang.org/2018/03/) (4)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [January](https://www.red-lang.org/2018/01/) (5)

<!--THE END-->

- [►](javascript:void%280%29)  [2017](https://www.red-lang.org/2017/) (3)
  
  - [►](javascript:void%280%29)  [December](https://www.red-lang.org/2017/12/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [July](https://www.red-lang.org/2017/07/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [March](https://www.red-lang.org/2017/03/) (1)

<!--THE END-->

- [▼](javascript:void%280%29)  [2016](https://www.red-lang.org/2016/) (6)
  
  - [►](javascript:void%280%29)  [December](https://www.red-lang.org/2016/12/) (2)
  
  <!--THE END-->
  
  - [▼](javascript:void%280%29)  [July](https://www.red-lang.org/2016/07/) (2)
    
    - [Eve-style clock demo in Red, livecoded!](https://www.red-lang.org/2016/07/eve-style-clock-demo-in-red-livecoded.html)
    - [Native reactive spreadsheet in 17 LOC](https://www.red-lang.org/2016/07/native-reactive-spreadsheet-in-17-loc.html)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [June](https://www.red-lang.org/2016/06/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [March](https://www.red-lang.org/2016/03/) (1)

<!--THE END-->

- [►](javascript:void%280%29)  [2015](https://www.red-lang.org/2015/) (6)
  
  - [►](javascript:void%280%29)  [December](https://www.red-lang.org/2015/12/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [June](https://www.red-lang.org/2015/06/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [April](https://www.red-lang.org/2015/04/) (2)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [March](https://www.red-lang.org/2015/03/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [January](https://www.red-lang.org/2015/01/) (1)

<!--THE END-->

- [►](javascript:void%280%29)  [2014](https://www.red-lang.org/2014/) (6)
  
  - [►](javascript:void%280%29)  [December](https://www.red-lang.org/2014/12/) (2)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [August](https://www.red-lang.org/2014/08/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [April](https://www.red-lang.org/2014/04/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [February](https://www.red-lang.org/2014/02/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [January](https://www.red-lang.org/2014/01/) (1)

<!--THE END-->

- [►](javascript:void%280%29)  [2013](https://www.red-lang.org/2013/) (5)
  
  - [►](javascript:void%280%29)  [November](https://www.red-lang.org/2013/11/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [September](https://www.red-lang.org/2013/09/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [August](https://www.red-lang.org/2013/08/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [March](https://www.red-lang.org/2013/03/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [January](https://www.red-lang.org/2013/01/) (1)

<!--THE END-->

- [►](javascript:void%280%29)  [2012](https://www.red-lang.org/2012/) (8)
  
  - [►](javascript:void%280%29)  [December](https://www.red-lang.org/2012/12/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [October](https://www.red-lang.org/2012/10/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [September](https://www.red-lang.org/2012/09/) (2)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [August](https://www.red-lang.org/2012/08/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [March](https://www.red-lang.org/2012/03/) (2)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [February](https://www.red-lang.org/2012/02/) (1)

<!--THE END-->

- [►](javascript:void%280%29)  [2011](https://www.red-lang.org/2011/) (15)
  
  - [►](javascript:void%280%29)  [December](https://www.red-lang.org/2011/12/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [September](https://www.red-lang.org/2011/09/) (2)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [August](https://www.red-lang.org/2011/08/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [July](https://www.red-lang.org/2011/07/) (2)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [May](https://www.red-lang.org/2011/05/) (3)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [April](https://www.red-lang.org/2011/04/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [March](https://www.red-lang.org/2011/03/) (4)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [February](https://www.red-lang.org/2011/02/) (1)

## Tags cloud

[2D](https://www.red-lang.org/search/label/2D) (1) [alias](https://www.red-lang.org/search/label/alias) (1) [alpha](https://www.red-lang.org/search/label/alpha) (1) [Android](https://www.red-lang.org/search/label/Android) (3) [announce](https://www.red-lang.org/search/label/announce) (7) [apply](https://www.red-lang.org/search/label/apply) (1) [ARM](https://www.red-lang.org/search/label/ARM) (4) [armhf](https://www.red-lang.org/search/label/armhf) (1) [arrays](https://www.red-lang.org/search/label/arrays) (2) [AST](https://www.red-lang.org/search/label/AST) (1) [beta](https://www.red-lang.org/search/label/beta) (1) [binaries](https://www.red-lang.org/search/label/binaries) (1) [binary form](https://www.red-lang.org/search/label/binary%20form) (1) [bitset](https://www.red-lang.org/search/label/bitset) (1) [blog](https://www.red-lang.org/search/label/blog) (1) [booleans](https://www.red-lang.org/search/label/booleans) (1) [bridge](https://www.red-lang.org/search/label/bridge) (2) [bugfixes](https://www.red-lang.org/search/label/bugfixes) (4) [callback](https://www.red-lang.org/search/label/callback) (2) [casing](https://www.red-lang.org/search/label/casing) (1) [changelog](https://www.red-lang.org/search/label/changelog) (1) [China](https://www.red-lang.org/search/label/China) (2) [codecs](https://www.red-lang.org/search/label/codecs) (1) [collation](https://www.red-lang.org/search/label/collation) (1) [community](https://www.red-lang.org/search/label/community) (1) [compilation](https://www.red-lang.org/search/label/compilation) (6) [compiler](https://www.red-lang.org/search/label/compiler) (2) [conference](https://www.red-lang.org/search/label/conference) (2) [console](https://www.red-lang.org/search/label/console) (8) [context](https://www.red-lang.org/search/label/context) (2) [contribution](https://www.red-lang.org/search/label/contribution) (1) [CSDN](https://www.red-lang.org/search/label/CSDN) (1) [date](https://www.red-lang.org/search/label/date) (1) [Debian](https://www.red-lang.org/search/label/Debian) (1) [demos](https://www.red-lang.org/search/label/demos) (3) [development](https://www.red-lang.org/search/label/development) (1) [dialect](https://www.red-lang.org/search/label/dialect) (1) [dll](https://www.red-lang.org/search/label/dll) (1) [donations](https://www.red-lang.org/search/label/donations) (1) [download](https://www.red-lang.org/search/label/download) (1) [Draw](https://www.red-lang.org/search/label/Draw) (1) [DSL](https://www.red-lang.org/search/label/DSL) (1) [dynamic calls](https://www.red-lang.org/search/label/dynamic%20calls) (1) [ELF](https://www.red-lang.org/search/label/ELF) (1) [encap](https://www.red-lang.org/search/label/encap) (1) [enum](https://www.red-lang.org/search/label/enum) (1) [exceptions](https://www.red-lang.org/search/label/exceptions) (3) [explorable explanations.](https://www.red-lang.org/search/label/explorable%20explanations.) (1) [features](https://www.red-lang.org/search/label/features) (2) [floating point](https://www.red-lang.org/search/label/floating%20point) (3) [floats](https://www.red-lang.org/search/label/floats) (2) [FPU](https://www.red-lang.org/search/label/FPU) (4) [freebsd](https://www.red-lang.org/search/label/freebsd) (1) [functions](https://www.red-lang.org/search/label/functions) (1) [GC](https://www.red-lang.org/search/label/GC) (1) [gpio](https://www.red-lang.org/search/label/gpio) (1) [GTK+](https://www.red-lang.org/search/label/GTK%2B) (1) [GUI](https://www.red-lang.org/search/label/GUI) (9) [hash](https://www.red-lang.org/search/label/hash) (1) [HOF](https://www.red-lang.org/search/label/HOF) (1) [I/O](https://www.red-lang.org/search/label/I%2FO) (1) [IA-32](https://www.red-lang.org/search/label/IA-32) (2) [IEEE-754](https://www.red-lang.org/search/label/IEEE-754) (1) [implementation](https://www.red-lang.org/search/label/implementation) (2) [interpreter](https://www.red-lang.org/search/label/interpreter) (1) [iOS](https://www.red-lang.org/search/label/iOS) (1) [IW](https://www.red-lang.org/search/label/IW) (1) [java](https://www.red-lang.org/search/label/java) (2) [jni](https://www.red-lang.org/search/label/jni) (1) [lexer](https://www.red-lang.org/search/label/lexer) (2) [libc](https://www.red-lang.org/search/label/libc) (1) [libRed](https://www.red-lang.org/search/label/libRed) (2) [libRedRT](https://www.red-lang.org/search/label/libRedRT) (1) [linker](https://www.red-lang.org/search/label/linker) (1) [linux](https://www.red-lang.org/search/label/linux) (2) [literal arrays](https://www.red-lang.org/search/label/literal%20arrays) (2) [livecoding](https://www.red-lang.org/search/label/livecoding) (1) [load](https://www.red-lang.org/search/label/load) (2) [loader](https://www.red-lang.org/search/label/loader) (1) [macOS](https://www.red-lang.org/search/label/macOS) (1) [MacOSX](https://www.red-lang.org/search/label/MacOSX) (2) [macros](https://www.red-lang.org/search/label/macros) (2) [major](https://www.red-lang.org/search/label/major) (1) [map](https://www.red-lang.org/search/label/map) (2) [math](https://www.red-lang.org/search/label/math) (2) [meeting](https://www.red-lang.org/search/label/meeting) (1) [memory](https://www.red-lang.org/search/label/memory) (1) [migration](https://www.red-lang.org/search/label/migration) (1) [monitors](https://www.red-lang.org/search/label/monitors) (1) [namespaces](https://www.red-lang.org/search/label/namespaces) (1) [native](https://www.red-lang.org/search/label/native) (1) [navigation](https://www.red-lang.org/search/label/navigation) (1) [objective-c](https://www.red-lang.org/search/label/objective-c) (1) [objects](https://www.red-lang.org/search/label/objects) (3) [ownership](https://www.red-lang.org/search/label/ownership) (1) [pair](https://www.red-lang.org/search/label/pair) (1) [pairs](https://www.red-lang.org/search/label/pairs) (1) [parse](https://www.red-lang.org/search/label/parse) (5) [path notation](https://www.red-lang.org/search/label/path%20notation) (1) [paths](https://www.red-lang.org/search/label/paths) (1) [percent](https://www.red-lang.org/search/label/percent) (1) [pointers](https://www.red-lang.org/search/label/pointers) (2) [points](https://www.red-lang.org/search/label/points) (1) [port](https://www.red-lang.org/search/label/port) (2) [preprocessor](https://www.red-lang.org/search/label/preprocessor) (2) [presentation](https://www.red-lang.org/search/label/presentation) (2) [QEMU](https://www.red-lang.org/search/label/QEMU) (1) [questions](https://www.red-lang.org/search/label/questions) (1) [RaspberryPi](https://www.red-lang.org/search/label/RaspberryPi) (3) [react](https://www.red-lang.org/search/label/react) (1) [reactive](https://www.red-lang.org/search/label/reactive) (5) [Red](https://www.red-lang.org/search/label/Red) (2) [red/system](https://www.red-lang.org/search/label/red%2Fsystem) (4) [redbin](https://www.red-lang.org/search/label/redbin) (1) [release](https://www.red-lang.org/search/label/release) (13) [REPL](https://www.red-lang.org/search/label/REPL) (2) [routine](https://www.red-lang.org/search/label/routine) (1) [rules engine](https://www.red-lang.org/search/label/rules%20engine) (1) [runtime errors](https://www.red-lang.org/search/label/runtime%20errors) (3) [screen](https://www.red-lang.org/search/label/screen) (1) [sets](https://www.red-lang.org/search/label/sets) (1) [SFD](https://www.red-lang.org/search/label/SFD) (1) [shared libraries](https://www.red-lang.org/search/label/shared%20libraries) (2) [sorting](https://www.red-lang.org/search/label/sorting) (1) [sources](https://www.red-lang.org/search/label/sources) (1) [specs](https://www.red-lang.org/search/label/specs) (2) [stack](https://www.red-lang.org/search/label/stack) (1) [startups](https://www.red-lang.org/search/label/startups) (1) [stats](https://www.red-lang.org/search/label/stats) (1) [strings](https://www.red-lang.org/search/label/strings) (1) [subpixel](https://www.red-lang.org/search/label/subpixel) (1) [sum up](https://www.red-lang.org/search/label/sum%20up) (1) [SVG](https://www.red-lang.org/search/label/SVG) (1) [syntax](https://www.red-lang.org/search/label/syntax) (1) [tabbing](https://www.red-lang.org/search/label/tabbing) (1) [tests](https://www.red-lang.org/search/label/tests) (4) [time](https://www.red-lang.org/search/label/time) (1) [toolchain](https://www.red-lang.org/search/label/toolchain) (1) [tuple](https://www.red-lang.org/search/label/tuple) (1) [tutorial](https://www.red-lang.org/search/label/tutorial) (1) [type-checking](https://www.red-lang.org/search/label/type-checking) (1) [typeset](https://www.red-lang.org/search/label/typeset) (1) [Unicode](https://www.red-lang.org/search/label/Unicode) (4) [update](https://www.red-lang.org/search/label/update) (1) [user group](https://www.red-lang.org/search/label/user%20group) (1) [vector](https://www.red-lang.org/search/label/vector) (2) [VFP](https://www.red-lang.org/search/label/VFP) (2) [VID](https://www.red-lang.org/search/label/VID) (2) [View](https://www.red-lang.org/search/label/View) (3) [widgets](https://www.red-lang.org/search/label/widgets) (1) [x87](https://www.red-lang.org/search/label/x87) (1)

Copyright 2011-2020 Nenad Rakocevic &amp; Red Foundation. Powered by [Blogger](https://www.blogger.com).

[![Fork me on GitHub](https://camo.githubusercontent.com/82b228a3648bf44fc1163ef44c62fcc60081495e/68747470733a2f2f73332e616d617a6f6e6177732e636f6d2f6769746875622f726962626f6e732f666f726b6d655f6c6566745f7265645f6161303030302e706e67)](https://github.com/red/red)
