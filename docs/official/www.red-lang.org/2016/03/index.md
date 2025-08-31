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

## March 25, 2016

[]()

### [0.6.0: Red GUI system](https://www.red-lang.org/2016/03/060-red-gui-system.html)

Five years ago, when I started writing the first lines of code of what would become later the Red/System compiler, I had a pretty good picture already of what I wanted to achieve with Red, and all the ideal features that should be included, just not sure how much time and efforts it would require to have them. Two years and half ago, *baby* Red [printed](http://www.red-lang.org/2012/09/red-is-born.html) its first output. And today, we celebrate a major step forward with the addition of a brand new GUI system *entirely written in Red itself!* What a journey!

[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiAi-BvWVGyYbfqkRLjI6CAor129-PhLO_e7Wa276Ssins_JdRLepWwVRA5KiCL5GiEBHWQOS39dLcfVIl7BV4vECHE-wAh0snyOMdv1tXmR6-uPcPHSyInS2iWEdWD9yhubvP6yaYLPmU5/s1600/world-of-view-dark-mini.png)](http://static.red-lang.org/images/world-of-view.png)

Here it is, the long awaited 0.6.0 release with its massive **1540 commits**! The major new features are:

- View engine, with Windows backend (from XP to 10)
- VID dialect
- Draw dialect
- Reactive GUI programming
- GUI console
- Simple I/O support for files and HTTP(S) queries.
- Codecs system with following codecs available: BMP, GIF, JPEG, PNG
- Objects ownership system

All those additions made our Red executable grow from 767 KB to 910 KB (Windows platform), sorry for the *extra 143 KB*, we will try to \[red]uce that in the future. ;-)

Let's start with the elephant in the room first, the GUI system. Here is an [architecture overview](https://github.com/red/docs/blob/master/en/gui.adoc):

[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEh3wLJBu-aZu-AYrkcZQqqWfw4iyuKdWDMXUer-ytIWofrW2GiBCu1xyf-Ke8JXXhoyxXG3jYXyKsQpXOc-b_ZHZTpAmT1DArtQbQui9rXKblCk83rJ_pbAP4ZEIvS_5_lLcnc1x1zyWMqB/s320/view-arch-mini.png)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEh3wLJBu-aZu-AYrkcZQqqWfw4iyuKdWDMXUer-ytIWofrW2GiBCu1xyf-Ke8JXXhoyxXG3jYXyKsQpXOc-b_ZHZTpAmT1DArtQbQui9rXKblCk83rJ_pbAP4ZEIvS_5_lLcnc1x1zyWMqB/s1600/view-arch-mini.png)

Only the Windows backend is fully usable for now, Android and OS X are work-in-progress, Linux (using GTK) will follow soon, iOS will come later this year. Also, we have other targets in mind, like JS/HTML which are not scheduled yet, but could come this year too.

Red/View

First let me mention that View, VID and Draw were invented by [Carl Sassenrath](https://en.wikipedia.org/wiki/Carl_Sassenrath) (of Amiga fame) in the [Rebol](http://www.rebol.com/) language, a long time ago. Red's version retains all the best features and pushes the boundaries of simplicity even further. The main features of our View engine are:

- A **live updating** mode that reduces the need to a **single** **view** function in most cases.
- Full **abstraction** over rendering backends.
- Two-way **binding** using *live* *objects*.
- Event bubbling/capturing stages.
- **Built-in** drag'n drop support for most face types.
- **Gestures** support (experimental).
- **Native** widgets support.
- Full **integration** with the OS features.
- **Flexible** backend support that can be mapped to virtually any kind of UI library.

The current list of supported widgets is: **base, text, button, check, radio, field, area, text-list, drop-list, drop-down, progress, slider, camera, panel, tab-panel, group-box**.

Next releases will bring more widgets, like: table, tree, divider, date/time picker, web-view and many others!

For more info about View, see the [View reference document.](https://github.com/red/docs/blob/master/en/view.adoc)

Main differences between Red/View and Rebol/View are:

- Red relies on native widgets, Rebol has custom ones only, built over a 2D vector library.
- Red faces are synchronized with their widgets on display in realtime by default, Rebol faces require manual calls to many functions for keeping faces and widget updated.
- Red introduces reactive GUI programming.

Red/View will update both face and graphic objects in realtime as their properties are changed. This is the default behavior, but it can be switched off, when full control over screen updates is desirable. This is achieved by:

```
    system/view/auto-sync?: off
```

When automatic syncing is turned off, you need to use **show** function on faces to get the graphic objects updated on screen.

VID dialect

VID stands for Visual Interface Dialect. It is a dialect of Red which drastically simplifies GUI construction. VID code is dynamically compiled to a tree of faces, feeding the View engine. You can then manipulate the face objects at runtime to achieve dynamic behaviors. VID offers:

- Declarative programming.
- Automatic layout system.
- Cascading styles.
- Default values for...everything.

For more info about VID, see the [specification](https://github.com/red/docs/blob/master/en/vid.adoc).

In case you are reading about Red or Rebol for the first time, here are a few code demos to show how simple, yet efficient, is our approach to GUI programming:

A GUI Hello word

```
    view [text "Hello World"]
```

Greet the name you type in the field

```
    view [name: field button "Hi" [print ["Hi" name/text]]]
```

A simple reactive relations demo, drag the logo around to see the effect

```
   view [
        size 300x300
        img: image loose http://static.red-lang.org/red-logo.png
        return
        shade: slider 0%
        return
        text bold font-size 14 center "000x000" 
            react [face/text: form img/offset]
            react [face/font/color: white * shade/data]
    ]
 
```

Simple form editing/validating/saving with styles definitions

```
   digit: charset "0123456789"
    view [
        style label: text bold right 40
        style err-msg: text font-color red hidden
    
        group-box "Person" 2 [
            origin 20x20
            label "Name" name: field 150
            label "Age"  age:  field 40
            label "City" city: field 150
            err-msg "Age needs to be a number!" react later [
                face/visible?: not parse age/text [any digit]
            ]
        ]
        button "Save" [save %person.txt reduce [name/text age/text city/text]]
    ]
    set [name age city] load %person.txt
    ?? name ?? age ?? city
```

You can run all those examples by copy/pasting them one-by-one into the Red console for Windows. To get the console, just [download](http://www.red-lang.org/p/download.html) it and double-click the Red binary, wait ~20 seconds for the console to be compiled for your OS (yes**, that little file contains the full Red toolchain, runtime library and console source code**), paste the code and have fun. ;-)

Draw dialect

Draw is a 2D vector-drawing dialect which can be used directly, to render on an image, in faces for local rendering, or specified through VID. It is still a work in progress as not all features are there yet. We aim at full Rebol/Draw coverage and full [SVG](https://en.wikipedia.org/wiki/Scalable_Vector_Graphics) compatibility in the not-too-distant future.

A simple example of Draw usage:

```
    shield: [
        fill-pen red   circle 50x50 50
        pen gray
        fill-pen white circle 50x50 40
        fill-pen red   circle 50x50 30
        fill-pen blue  circle 50x50 20
        
        pen blue fill-pen white
        polygon 32x44 45x44 50x30 55x44 68x44 57x53 60x66 50x58 39x66 43x53
    ]
    
    ;-- Draw in a draggable face, in realtime.
    view [
        size 300x300
        img: box 101x101 draw shield loose
        at 200x200 base white bold react [
            [img/offset]
            over?: overlap? face img
            face/color: get pick [red white] over?
            face/text: pick ["Hit!" ""] over?
        ]
        button "Hulk-ize!" [replace/all shield 'red 'green]
        button "Restore"   [replace/all shield 'green 'red]
    ]
```

Copy/paste the above code example in a Red console on Windows, and become an Avenger too! ;-)

For more info about Draw, see the [specification](https://doc.red-lang.org/en/draw.html).

Main differences between Red/Draw and Rebol/Draw:

- Red does not yet cover all the commands of Rebol/Draw yet.
- Red's version allows commands to be grouped in blocks, ease-ing insertion/removal at run-time.
- Red's version allows commands to be prefixed with a set-word, allowing to save local position in Draw blocks in a word.

Reactive GUI programming

This is a deep topic which should be part of a future separate blog article. So, I will just copy/paste here the little information already in the VID documentation:

Reactions (or reactors, not sure yet which terms is the most accurate) are created using the **react** keyword, directly from Red code or from VID dialect. The syntax is:

```
    react [<body>]
    
    <body> : regular Red code (block!).
```

This creates a new reactor from the body block. When react is used in VID, as a face option, the body can refer to the current face using face word. When react is used globally, target faces need to be accessed using a name.

Reactors are part of the reactive programming support in View, whose documentation is pending. In a nutshell, the body block can describe one or more relations between faces properties using paths. Set-path setting a face property are processed as target of the reactor (the face to update), while path accessing a face property are processed as source of the reactor (a change on a source triggers a refresh of the reactor's code).

Basically, it is about statically-defined relations between faces properties, without caring when or how the reactive expressions will be evaluated. It will happen automatically, when needed. Here are a couple of examples you can copy/paste in the Red console on Windows:

Make a circle size change according to slider's position:

```
    view [
        sld: slider return
        base 200x200 
            draw  [circle 100x100 5]
            react [face/draw/3: to integer! 100 * sld/data]
    ]
```

[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgpcyMbmlzTEWW-7V8ObooNHk7nIb5tXRqoDbcxddsmw4A8dGMNNEVimHANqODjpKHjtz4qdMnxu1ZJ7s1jre5kcMMpiwhOby52m_LV2ak90zh0P8oTWUsL3dFxHO7WYtvbB4Y1FocR0xlF/s1600/react1.gif)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgpcyMbmlzTEWW-7V8ObooNHk7nIb5tXRqoDbcxddsmw4A8dGMNNEVimHANqODjpKHjtz4qdMnxu1ZJ7s1jre5kcMMpiwhOby52m_LV2ak90zh0P8oTWUsL3dFxHO7WYtvbB4Y1FocR0xlF/s1600/react1.gif)

Change the color of a box and a text using 3 sliders:

```
    to-color: function [r g b][
        color: 0.0.0
        if r [color/1: to integer! 256 * r]
        if g [color/2: to integer! 256 * g]
        if b [color/3: to integer! 256 * b]
        color
    ]

    to-text: function [val][form to integer! 0.5 + 255 * any [val 0]]

    view [
      style txt: text 40 right
      style value: text "0" 30 right bold
    
      across
      txt "Red:"   R: slider 256 value react [face/text: to-text R/data] return
      txt "Green:" G: slider 256 value react [face/text: to-text G/data] return
      txt "Blue:"  B: slider 256 value react [face/text: to-text B/data]
    
      pad 0x-65 box: base react [face/color: to-color R/data G/data B/data]
      return
    
      pad 0x20 text "The quick brown fox jumps over the lazy dog." font-size 14
        react [face/font/color: box/color]
    ]

```

[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiFlJsRmCjzCEMnm98AJBveLVHzhD1ysk_mninrwtFVkaaMXqCWx2OtA_VI5gxZefjxNa8mJmGkffC2hpHVvB2su9cDR2klKJmAq4A0snEpb_8BLJN4B3DV88YnB5yFQjpcX2N-SueNq1PC/s1600/react2.gif)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiFlJsRmCjzCEMnm98AJBveLVHzhD1ysk_mninrwtFVkaaMXqCWx2OtA_VI5gxZefjxNa8mJmGkffC2hpHVvB2su9cDR2klKJmAq4A0snEpb_8BLJN4B3DV88YnB5yFQjpcX2N-SueNq1PC/s1600/react2.gif)

GUI console

We have a GUI console now, in addition to the existing CLI one!

The GUI console is now the default on Windows platform, and is fully Unicode-aware. The system shell (DOS) console is still available using --cli option:

```
    red --cli
```

The GUI console is still in its infancy and will be enhanced a lot in future releases. Anyway, so far, it already supports:

- history of commands
- completion on words and object paths
- multi-line editing for blocks, parens, strings, maps and binaries.
- navigation using HOME and END keys
- select/copy/paste using the mouse and keyboard shortcuts
- auto-scrolling when selecting with the mouse out of the boundaries
- very fast text rendering
- automatic vertical scroll bar
- customizable prompt

Try this cool one-liner for making the prompt more active:

```
    system/console/prompt: does [append to-local-file system/options/path "> "]
```

This is how the GUI console looks like:

[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhi2dM08HDLEc_baapmYZWCmvq2xUxD4xJGSswa40i8O6e8x-gksA6XdjMTkgS4z450wLjCUI3hlB2lJkdZf5cnzUtmzPITeQWo33XkJEgUz0jH47QP7a5xuK-Yz6-t5zwHvXtoeHAgQW1p/s320/gui-console.png)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhi2dM08HDLEc_baapmYZWCmvq2xUxD4xJGSswa40i8O6e8x-gksA6XdjMTkgS4z450wLjCUI3hlB2lJkdZf5cnzUtmzPITeQWo33XkJEgUz0jH47QP7a5xuK-Yz6-t5zwHvXtoeHAgQW1p/s1600/gui-console.png)

Simple I/O support

In order to have really some fun with the GUI, we have added some minimal support for blocking IO basic actions covering files and HTTP(S) requests. **read** and **write** action are available now. Their **/binary, /lines** and **/info** refinement are working. **do**, **load, save** have also been extended to work with files and urls.

When not using **/binary**, **read** and **write** are expecting UTF-8 encoded data. Support for ISO8859-1 and other common encoding formats will be available in next release.

The full IO will come in 0.7.0 with ports, full networking, async support and many more features.

Codecs

Codec system support has made his entrance in this release. It is a very thin layer of encoders/decoders for binary data, integrated with **load, save** and actions which rely on **/as** refinement. **load** and **save** will auto-detect the required encoding format and try to apply the right encoder or decoder on the data.

Currently only image format codecs are provided: BMP, PNG, GIF, JPEG. Any kind of encoding (related to IO) is a good candidate for becoming a codec, so expect a lot of them available in the future (both built-in Red runtime and optionaly installable).

For example, downloading a PNG image in memory, and using it is as simple as:

```
    logo: load http://static.red-lang.org/red-logo.png
     
    big: make font! [name: "Comic" size: 20 color: black]
    draw logo [font big text 10x30 "Red"]
    view [image logo]
```

Saving a downloaded file locally:

```
    write/binary %logo.png read/binary http://static.red-lang.org/red-logo.png
```

Saving images is not fully functional yet, PNG should be safe though.

Objects ownership system

Red's objects ownership system is an extension of object's event support introduced in previous releases. Now, an object can *own* series it references, even nested ones. When an *owned* series is changed, the owner object is notified and its **on-deep-change\*** function will be called if available, allowing the object to react appropriately to any change.

The prototype for **on-deep-change\*** is:

```
    on-deep-change*: func [owner word target action new index part][...]
```

The arguments are:

- owner: object receiving the event (object!)
- word: object's word referring to the changed series or nested series (word!)
- target: the changed series (any-series!)
- action: name of the action applied (word!)
- new: new value added to the series (any-type!)
- index: position at which the series is modified (integer!)
- part: number of elements changes in the series (integer!)

Action name can be any of: random, clear, cleared, poke, remove, removed, reverse, sort, insert, take, taken, swap, trim. For actions "destroying" values, two events are generated, one before the "destruction", one after (hence the presence of cleared, removed, taken words).

When modifications affect several non-contiguous or all elements, index will be set to -1.  
When modifications affect an undetermined number of elements, part will be set to -1.

Ownership is set automatically on object creation if **on-deep-change\*** is defined, all referenced series (including nested ones), will then become *owned* by the object. **modify** action has been also implemented to allow setting/clearing ownership post-creation-time.

As for on-change, on-deep-change* is kept hidden when using **mold** on object. It is only revealed by **mold/all**.

Here is a simple usage example of object ownership. The code below will create a numbers object containing an empty list. You can append only integers to that list, if you fail to do so, a message will be displayed and the invalid element removed from the list. Moreover, the list is always sorted, wherever you insert or poke a new value:

```
    numbers: object [
        list: []
    
        on-deep-change*: function [owner word target action new index part][
            if all [word = 'list find [poke insert] action][
                forall target [
                    unless integer? target/1 [
                        print ["Error: Item" mold target/1 "is invalid!"]
                        remove target
                        target: back target
                    ]
                ]
                sort list
            ]
        ]
    ]
    
    red>> append numbers/list 3
    == [3]
    red>> insert numbers/list 7
    == [3 7]
    red>> append numbers/list 1
    == [1 3 7]
    red>> insert next numbers/list 8
    == [1 3 7 8]
    red>> append numbers/list 4
    == [1 3 4 7 8]
    red>> append numbers/list "hello"
    Error: Item "hello" is invalid!
    == [1 3 4 7 8]
    red>> numbers
    == make object! [
        list: [1 3 4 7 8]
    ]
```

Object ownership is deeply used in Red/View, in order to achieve the binding between face objects and the widgets on screen, and the automatic "show-less" synchronization. 

The work on this is not yet completed, more object events will be provided in future releases and the ownership support extended to enable objects to *own* more datatypes. More documentation will be provided once the work on that will be finished. In the future, its use will be extending to other frameworks and interfaces. Such "reactive objects" will be called "live objects" in Red's jargon.

Red/System changes

- Full stack traces in debug mode on runtime errors.
- New compilation directive: [#u16](http://static.red-lang.org/red-system-specs.html#section-16.10) (literal UTF-16LE strings support).
- Added **log-b** native function for getting the binary logarithm of an integer.
- Added **equal-string?** runtime function for testing c-string! equality.
- Several improvements to some compiler errors reporting accuracy.
- Improved function! type support.
- New compilation option: debug-safe? (for safer stack traces)
- New --catch command-line option for console to open on script errors.
- Improved compilation speed of variables assignment.
- Fixes for broken exceptions support on ARM backend.

Additions to the Red runtime library

**New functions**

- show, view, unview, draw, layout, react, size-text, to-image, do-events, dump-face, within?, overlap?, remove-reactor, set-flag, find-flag?, center-face, insert-event-func, remove-event-func.
- event?, image?, binary?.
- debase, wait.
- request-file, request-dir.
- read, write, exists?, to-local-file, to-red-file, dirize, clean-path, split-path.
- what-dir, change-dir, list-dir.
- also, alter, extract, collect, split, checksum, modify, unset.
- as-color, as-rgba, as-ipv4.
- cd, ls, ll, pwd, dir. (console-only)

Use **help** in the console to get more information about each function.

**New datatypes**

- binary!
- event! (Windows only for now)
- image! (Windows only for now)

Binary! datatype supports all the series actions. Literal base 2, 16 and 64 encodings are available:

```
    red>> 2#{11110000}
    == #{F0}
    red>> to string! 64#{SGVsbG8gV29ybGQh}
    == "Hello World!"
```

Event! and image! are a work-in-progress, though image! is already very capable (documentation will be added soon).

**Other changes**

o **set** and **get** native improvements:

If A and B are object values, **set** A B will now set the values in A from B, for the fields they have in common (regardless of the fields definition order in the objects).

Added **/only** and **/some** refinements:

- /only: set argument block or object as a single value
- /some: \`none\` values in the argument block or object are not set

o Icons and other "resources" are now supported for inclusion in Windows executables. They can be set from Red's main script header, these are the currently supported options:

- Icon: file! or block! of files
- Title: string!
- Author: string!
- Version: tuple!
- Rights: string!
- Company: string!
- Notes: string!
- Comments: string!
- Trademarks:  string!

If no Icon option is specified, a default Red icon will be provided.

o **index?** action is now allowed on words. It will return the word's index inside a context or **none** if the word is unbound. This is a shortcut for the following idiom:  
    index? find words-of &lt;object&gt; &lt;word&gt;  
   
o Remaining list of changes:

- Implemented type-checking for infix operators in the interpreter.
- Implemented native! functions type-checking support when called by compiled code.
- Added system/state/trace? for enabling/disabling call stack traces on errors.
- system/options/args gets the command-line string.
- Added DO/ARGS support.
- Error report for catchable infinite block rules recursions in Parse.
- Added limits to Parse stack to avoid eating up all the memory.
- Auto-conversion of float values in routines.
- Big series (&gt; 2MB) support enabled.
- Lexer support for base2 and base64 encoding.
- DO and LOAD work on file! and url! values now.
- Added support for cycles detection for MOLD/FORM and comparisons.
- Support for set operations on hash!.
- SORT works on paren! now.
- string! to issue! conversion support.
- file! to string! conversion support.
- Allowed float! values as arguments to AS-PAIR and MAKE pair!.
- Added percent! support in vector! series.
- Added matching typesets support to Parse.
- Added PUT support to object! and any-series!.
- Added support for make bitset! &lt;binary&gt;
- Setting a tuple component to none now eliminates the component.
- Support for HOME and END key in console.
- Multiline editing support for paren! and map! in console.
- Added proper error handling for malformed paths evaluation attemps.
- Scripts using routines will now output a proper error when run from interpreter.
- Better error handling when decoding UTF-8 string.
- Allow PROBE to have an unset! value as argument.
- Support X in addition to x for pair! literal syntax.
- Prevent empty conditions in conditional iterators from entering an infinite loop.
- Improved formatting of error messages arguments.
- Several output improvements to HELP.
- Allow DIR? to take an url!.
- Allow system/console/prompt to be an active value (e.g.: a function).

Ticket processing

We have closed 260+ tickets since last release (0.5.4), among which [54](https://github.com/red/red/issues?q=milestone%3A0.6.0%20is%3Aclosed) concern issues in previous releases. We have currently ~92.5% closed tickets overall, which is a bit lower than the usual 95%+, mostly due to the huge amount of new code and feature in this release. So, we will aim at getting back to a lower number of opened tickets for the next release.

I would like to make a big thank to all the contributors who reported issues, tested fixes and sent pull requests. It has been, more than ever given the number of newly implemented features, a huge help in making Red better. I would like to especially thank namely a few people for their outstanding contributions:

- **WiseGenius**: for helping us solve the [epic](https://github.com/red/red/issues/1284) crush library generation bug, improvement suggestions and huge work on testing/reporting GUI issues!

<!--THE END-->

- **nc-x**: for help in testing the GUI, making many useful issue reports and improvement suggestions.

<!--THE END-->

- The "Czech group" (**Pekr, Oldes, Rebolek**): for their constant support and for taking care of the Red community when I'm not available. ;-)

<!--THE END-->

- **PeterWAWood**: for bringing us the ~30'000 unit tests, testing framework and constant help and support, since day one!

<!--THE END-->

- **Micha**: for issues reporting and kindly providing us an online Mac OSX server for our build farm.

What's next?

Our focus for next releases (0.6.x) will be:

- Drastically speed up compilation time by pre-compiling the runtime library.
- Simple garbage collector integration.
- Improvement of our Windows GUI backend.
- First usable versions of MacOSX and Android GUI backends.
- Integration of our Android APK building toolchain in master branch.
- Improvements for reactive GUI programming support.
- Custom widgets creation framework.
- Animation and timers support.
- More documentations and tutorials for beginners.
- More code demos.

See the detail for next releases on our public [Trello board](https://trello.com/c/11bblhBn/133-0-6-1-android-gui-support) and come to our [chat room](https://gitter.im/red/red) to ask any question.

In the meantime, enjoy the new Red, I hope to see many impressive GUI demos and apps in the next weeks. ;-)

Posted by [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055 "author profile") at [11:33 PM](https://www.red-lang.org/2016/03/060-red-gui-system.html "permanent link") [38 comments:](https://www.red-lang.org/2016/03/060-red-gui-system.html#comment-form) [![](https://resources.blogblog.com/img/icon18_edit_allbkg.gif)](https://www.blogger.com/post-edit.g?blogID=5936111837781935054&postID=8382332297851984581&from=pencil "Edit Post")

Labels: [2D](https://www.red-lang.org/search/label/2D), [codecs](https://www.red-lang.org/search/label/codecs), [console](https://www.red-lang.org/search/label/console), [Draw](https://www.red-lang.org/search/label/Draw), [GUI](https://www.red-lang.org/search/label/GUI), [I/O](https://www.red-lang.org/search/label/I%2FO), [native](https://www.red-lang.org/search/label/native), [ownership](https://www.red-lang.org/search/label/ownership), [react](https://www.red-lang.org/search/label/react), [reactive](https://www.red-lang.org/search/label/reactive), [SVG](https://www.red-lang.org/search/label/SVG), [VID](https://www.red-lang.org/search/label/VID), [View](https://www.red-lang.org/search/label/View), [widgets](https://www.red-lang.org/search/label/widgets)

[Newer Posts](https://www.red-lang.org/search?updated-max=2017-12-25T17%3A05%3A00%2B01%3A00&max-results=7&reverse-paginate=true "Newer Posts") [Older Posts](https://www.red-lang.org/search?updated-max=2016-03-25T23%3A33%3A00%2B01%3A00&max-results=7 "Older Posts") [Home](https://www.red-lang.org/)

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
  
  - [►](javascript:void%280%29)  [July](https://www.red-lang.org/2016/07/) (2)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [June](https://www.red-lang.org/2016/06/) (1)
  
  <!--THE END-->
  
  - [▼](javascript:void%280%29)  [March](https://www.red-lang.org/2016/03/) (1)
    
    - [0.6.0: Red GUI system](https://www.red-lang.org/2016/03/060-red-gui-system.html)

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
