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

## July 17, 2017

[]()

### [0.6.3: macOS GUI backend](https://www.red-lang.org/2017/07/063-macos-gui-backend.html)

This new Red release contains ~830 commits, closes [86 issues](https://github.com/red/red/issues?q=is%3Aclosed%20milestone%3A0.6.3), and brings a large number of  new features. The main one is official support for the macOS GUI, through a new [backend](https://github.com/red/red/tree/master/modules/view/backends/macOS) for the View engine.

For readers not familiar with our GUI system, you can get a quick overview in a [previous article](http://www.red-lang.org/2016/03/060-red-gui-system.html).

In a nutshell, it is a dynamically-built reactive object tree, with:

- pluggable backends (full support for Windows and prototype for GTK and Android)
- full 2D [vector graphics](http://www.red-lang.org/2016/07/eve-style-clock-demo-in-red-livecoded.html) support (a large subset of SVG)
- direct [reactive](http://www.red-lang.org/2016/06/061-reactive-programming.html) [programming](https://doc.red-lang.org/en/reactivity.html) support (not [FRP](https://en.wikipedia.org/wiki/Functional_reactive_programming) style for now)
- a declarative [DSL](https://doc.red-lang.org/en/vid.html) for GUI building and layout management
- a declarative [DSL](https://doc.red-lang.org/en/draw.html) for 2D graphics

The macOS backend supports all the same features as the Windows backend, except the following, yet to be implemented:

- fill-pen pattern, fill-pen bitmap and diamond gradient in Draw.
- matrix transformations on pen and fill-pen in Draw.

The GUI console for macOS will be available in the 0.6.4 branch, so is not part of this release. The View module, though, is compiled in the CLI console by default on macOS, so no show-stopper there.

Here are a few short examples, starting with a GUI Hello World!:

```
    view [text "Hello Mac World!"]
```

[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEi4IT8nIBSQXvFnNPEDZStzfk1YNHTWOCnm7s2Cv2t0s-1R_YMI6LFRDVceCZQ6xCKEC-1fXUtWgsE7XGReF-xrd-UAuC4MxQT9wlaWGtj6spEM2KNqh3Zp5-KNXRNKKU0ylEvnLgJC0ORa/s1600/Clipboard02.png)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEi4IT8nIBSQXvFnNPEDZStzfk1YNHTWOCnm7s2Cv2t0s-1R_YMI6LFRDVceCZQ6xCKEC-1fXUtWgsE7XGReF-xrd-UAuC4MxQT9wlaWGtj6spEM2KNqh3Zp5-KNXRNKKU0ylEvnLgJC0ORa/s1600/Clipboard02.png)

A tiny demo script (hopefully, it should get us an office at [Station F](https://stationf.co/), right? ;-)):

```
    view [
        t: text "French Touch! " on-time [move t/text tail t/text]
        base 21x15 draw [
            pen off
            fill-pen blue  box 0x0  6x14
            fill-pen white box 7x0  14x14
            fill-pen red   box 14x0 20x14
        ] return
        button "Start" [t/rate: 10]
    ]
```

[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEigBWfRuoZdNrtyN23eppZnoaYBBhHiK1MQNjhG0i6K8c8VwP3aOPVnZqGIELSOf8bXguajg77qlxZjliSM6kt1Toln-st1q1XcUXuuNj-MInZR-0BOise3YBEv4c3h57orzpLAp3lP9DTB/s1600/ftouch.gif)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEigBWfRuoZdNrtyN23eppZnoaYBBhHiK1MQNjhG0i6K8c8VwP3aOPVnZqGIELSOf8bXguajg77qlxZjliSM6kt1Toln-st1q1XcUXuuNj-MInZR-0BOise3YBEv4c3h57orzpLAp3lP9DTB/s1600/ftouch.gif)

A small reactive text size measuring tool (one of our test scripts):

```
    view [
        style txt: text right
        txt "Text" f: area 200x80 
            font [name: "Comic Sans MS" size: 15 color: black]
            return

        txt "Size in pixels" text "0x0"
            react [[f/text f/font] face/text: form size-text f]
            return
 
        txt "Font name" drop-list 120
            data  ["Arial" "Consolas" "Comic Sans MS" "Times"]
            react [f/font/name: pick face/data any [face/selected 3]]
            return
  
        txt "Font size" s: field "15" react [f/font/size: s/data]
        button "+" bold 40 [s/data: s/data + 1]
        button "-" bold 40 [s/data: max 1 s/data - 1]
        return
    ]
```

[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhRSqxO1reClbxpwv5mkDaIPnUIm2juFpuDVxs37k7ychd6W_eADjA9o8D6_KXkl0cTktDK0-kL-uC9-BfUaffoOVzyMsqVnUqSopgCvQiyQ9ecrqfdCxXdosXdVDy1IgUuj9wJcbjLbKzA/s1600/font.gif)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhRSqxO1reClbxpwv5mkDaIPnUIm2juFpuDVxs37k7ychd6W_eADjA9o8D6_KXkl0cTktDK0-kL-uC9-BfUaffoOVzyMsqVnUqSopgCvQiyQ9ecrqfdCxXdosXdVDy1IgUuj9wJcbjLbKzA/s1600/font.gif)

Generating macOS bundle apps is made simple by our toolchain, just use the -t macOS target when compiling, for example using our SVG [Tiger demo](https://github.com/red/code/blob/master/Scripts/tiger.red):

```
   $ red -o ~/Desktop/ -t macOS tiger.red
```

This will produce a tiger.app bundle on the Desktop:

[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgBv0vNJzOGhVSPZ0nq9LWJvcE_2i4r72qXO9v1OWO2jwdLvKqpSkT2PDuQJuupZeSS9PCpK4fGn8S-xscwm0ggiI819gIJnp0q1sxNNH6nt8TGQMW8GXxWJbNWEfqlBrBMoSYYpzOBYKsB/s400/tiger.gif)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgBv0vNJzOGhVSPZ0nq9LWJvcE_2i4r72qXO9v1OWO2jwdLvKqpSkT2PDuQJuupZeSS9PCpK4fGn8S-xscwm0ggiI819gIJnp0q1sxNNH6nt8TGQMW8GXxWJbNWEfqlBrBMoSYYpzOBYKsB/s1600/tiger.gif)

Cross-Platform GUI Metrics

In order to cope with different UI guidelines across GUI platforms, this release also introduces an experimental **rule-oriented GUI rewriting engine**, capable of modifying a face tree dynamically according to pre-set rules. It is integrated as a last stage in [VID](https://doc.red-lang.org/en/vid.html) (Visual Interface Dialect) processing. The currently implemented rules are per-platform for now (more general, cross-platform rules are also planned):

Windows rules:

- color-backgrounds: color the background of some colorless faces to match their parent's color
- color-tabpanel-children: Like color-backgrounds, but tab-panel specific
- OK-Cancel: buttons ordering rule, puts Cancel/Delete/Remove buttons last

macOS rules:

- adjust-buttons: use standard button sub-classes when buttons are narrow enough
- capitalize: capitalize widget text according to macOS [guidelines](https://developer.apple.com/library/content/documentation/UserExperience/Conceptual/OSXHIGuidelines/TerminologyWording.html)
- Cancel-OK: buttons ordering rule, puts Ok/Save/Apply buttons last

To give you a quick grasp about why that feature matters and what it is capable of, here is a simple example, which leverages the [buttons ordering](https://github.com/red/red/blob/master/modules/view/backends/macOS/rules.red#L106) and [capitalization](https://github.com/red/red/blob/master/modules/view/backends/macOS/rules.red#L35) rules:

```
    view [
        text "Name" right 50 field return
        text "Age"  right 50 field return
        button "ok" button "cancel"
    ]
```

[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiP5pu-QXkvNmEUpEPIDQ8NXiaKqQk2TGqnzgcoPma_qVSo4hCl_laLXSdpwbzeBucyjkMLdHw9OrikQgLEKen-cw4AkozvuS_OvSXSEwP4Cf5WhU2zKBnk08khSlXt2A3j7NcVRGHjzaAI/s1600/Clipboard03.png)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiP5pu-QXkvNmEUpEPIDQ8NXiaKqQk2TGqnzgcoPma_qVSo4hCl_laLXSdpwbzeBucyjkMLdHw9OrikQgLEKen-cw4AkozvuS_OvSXSEwP4Cf5WhU2zKBnk08khSlXt2A3j7NcVRGHjzaAI/s1600/Clipboard03.png) [![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiR5dLJsmAUu16gbMwgi362nCFxLnNMK9VNg4vB9iy9mpDGfTNVoLw4USAFuxdA56aTYBulDl8u68RD0sBDCb9-QyEPqXY7oRsEQXWO2hsn6KRoG1pns9Sp04cuwLb9llXmQCc4yBb21BAv/s1600/Clipboard05.png)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiR5dLJsmAUu16gbMwgi362nCFxLnNMK9VNg4vB9iy9mpDGfTNVoLw4USAFuxdA56aTYBulDl8u68RD0sBDCb9-QyEPqXY7oRsEQXWO2hsn6KRoG1pns9Sp04cuwLb9llXmQCc4yBb21BAv/s1600/Clipboard05.png)

You can see, side-by-side, the macOS and Windows generated forms. Notice the button text and ordering, yes, they differ from the source code! The GUI rules have ensured that:

- the buttons are ordered according to each platform's guidelines, "Ok" last on macOS, "Cancel" last on Windows.
- the button's labels are properly capitalized on macOS.

This small example just demonstrates the concept, but actually, there is no limit on how much it could alter the UI and how far it could go with the post-processing.

As it is still experimental, if it causes you any trouble, you can easily disable it using:

```
    system/view/VID/GUI-rules/active?: no
```

You can also remove rules selectively, by modifying the content of the following lists:

```
    system/view/VID/GUI-rules/OS/Windows
    == [
        color-backgrounds
        color-tabpanel-children
        OK-Cancel
    ]

    system/view/VID/GUI-rules/OS/macOS
    == [
        adjust-buttons
        capitalize
        Cancel-OK
    ]
```

This allows you total control where needed, but also helps you conform to UI guidelines with no effort, saving everyone time. Not only do you not have to tweak your code for each platform when you write it, when a new platform is added, you won't have to change your code to support it. In a world where getting one detail wrong may keep you out of an app store, or prevent you from being a "certified" app, this is huge. It should also be possible to use the rule engine to write a *guideline linter*, where you could get a report of what rules will be applied to your VID code on each platform. By "report", we don't mean just a text listing, but it could highlight elements in the UI that were processed by rules. Having a system that helps you is great. Having a system that *tells* you how it helped you is even better.

There are tons of possible rules we could implement, if you have ideas for great ones, please let us know by joining us in our online [chat room](https://gitter.im/red/red) on Gitter or, if you prefer, by posting on our [mailing-list](https://groups.google.com/forum/?hl=en#!forum/red-lang).

Other changes in 0.6.3

Core language

The biggest addition to the core language in this release is the **date!** datatype, which supports all Rebol's **date!** datatype features and more. The additions include support for a large range of [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date formats. About 350 [unit tests](https://github.com/red/red/blob/master/tests/source/units/date-test.red) have been written so far. The full documentation is available [here](https://doc.red-lang.org/en/date.html).

Here are a few examples of accepted input formats:

```
    >> 1999-10-5
    == 5-Oct-1999

    >> 5-October-1999
    == 5-Oct-1999

    >> 5/9/2012/6:00
    == 5-Sep-2012/6:00:00

    >> 4/Apr/2000/6:00+8:00
    == 4-Apr-2000/6:00:00+08:00

    >> 2017-07-07T08:22:23Z
    == 7-Jul-2017/8:22:23

    >> 2017-W23-5
    == 9-Jun-2017

    >> 2017-153T105000-4:00
    == 2-Jun-2017/10:50:00-04:00
```

Math and other operations are fully supported:

```
    >> d: now
    == 14-Jul-2017/16:04:07+08:00

    >> d + 10
    == 24-Jul-2017/16:04:07+08:00

    >> d + 100
    == 22-Oct-2017/16:04:07+08:00

    >> d - 24:00
    == 13-Jul-2017/16:04:07+08:00

    >> d - 01/01/2010
    == 2751

    >> d/month: d/month - 5
    >> d
    == 14-Feb-2017/16:04:07+08:00

    >> d/yearday: random 365
    >> d
    == 1-Aug-2017/16:04:07+08:00

    >> sort [1/2/2018 1999-5-3/10:30:28 29-2-1980]
    == [29-Feb-1980 3-May-1999/10:30:28 1-Feb-2018]

    >> random 01/01/2018
    == 15-Dec-1248
```

Red also adds three new accessors:

- **/timezone**: changes the zone and adjusts time accordingly (UTC-invariant)
- **/week**: gets/sets the week of the year, starting on Sunday.
- **/isoweek**: gets/sets the [ISO week](https://en.wikipedia.org/wiki/ISO_week_date) of the year, starting on Monday.

Conversions to/from Unix epoch time are also built-in:

```
    >> to-integer 1/1/1970
    == 0

    >> to-integer now
    == 1500020743

    >> to-date 1000000000
    == 9-Sep-2001/1:46:40
```

Other Core Additions

New functions were added to the existing simple IO API:

- **delete**: deletes a file or an empty folder.
- **size?**: returns the size in bytes of a file.

The **do** native now accepts a URL argument. For example:

```
   do https://raw.githubusercontent.com/red/code/master/Showcase/eve-clock.red
```

Run-time error reports now include a compact *call stack* trace:

```
    foo: does [1 / 0]
    bar: does [foo]

    bar
    *** Math Error: attempt to divide by zero
    *** Where: /
    *** Stack: bar foo
```

A set of new functions for disk-cached remote file access is now available: do-thru, exists-thru?, load-thru, read-thru, path-thru. They work in the same way as their normal counterparts, except that the retrieved file is cached locally, so on their next access, the locally cached copy will be used.

The system object has been extended with:

- **system/options/cache**: points to the cache folder used by the Red toolchain.
- **system/options/thru-cache**: points to the cache folder used by \*-thru functions.
- **system/catalog/accessors**: Path accessors available, per datatype.

The **browse** native can now work on macOS (it opens the default browser on a given URL).

Rudolf Meijer did a [huge job](https://gist.github.com/meijeru/94a9b3a2fb131a4011e24b1e9fde561b), gathering currently implemented rules for math operations on mixed datatypes. This has resulted in [documenting](https://github.com/red/red/blob/master/docs/math-ops-matrix.xlsx) and improving those rules, better defining the resulting datatype for all math operations.

More changes:

- **Now** is now fully operational and can return current date and time.
- **Wait** now accepts a time! value argument
- Improved **make** and **to** url! construction when the spec argument is a block.
- Auto-detect older Intel CPU on Windows platform when building the console.
- **Even?** and **odd?** now support time! values as argument.
- R/S compiler can now output a function address map for verbosity &gt;= 3
- Improved **min** and **max** natives support for pair! and tuple!(now min/max is applied per dimension to pair! and tuple!, and can work with a number! as second argument).
- -t compilation option does not force release mode anymore if target is the same OS.
- Source file name in now displayed on syntax errors at compile-time.

LibRed

LibRed has been improved, thanks to the work of Joa-quim on a libRed [binding](https://github.com/joa-quim/Red.jl) for the [Julia](http://julialang.org/) language, providing Julia with the full power of Red's native [GUI system](http://www.red-lang.org/2016/03/060-red-gui-system.html). Several new functions were added to libRed API:

- **redBinary()**: constructs a binary! value from an external byte array.
- **redImage()**: constructs an image! value from various possible external byte arrays.
- **redGetField()**: gets the value of an object's word.
- **redSetField()**: sets the value of an object's word.

There is more info about them in the [libRed documentation](https://doc.red-lang.org/en/libred.html).

LibRed's robustness has also been vastly improved. LibRed API functions can now catch null pointer arguments, and even invalid pointers passed to the libRed API. In these situations, libRed returns a Red error! value.

View engine

In addition to the macOS backend, a new *test* [backend](https://github.com/red/red/tree/master/modules/view/backends/test) is included in this release. This backend works by *simulating* a GUI backend for testing purposes. It is still experimental but works fine so far. We should be able to write a whole suite of unit tests for the View engine and VID dialect now and run them on a headless Linux server (like our [Travis CI](https://travis-ci.org/red/red)). In the same way, this backend enables Red users to unit test their GUI apps with minimal effort (though more tooling on top of the current backend is welcome).

The working principle is simple: use **view/no-wait** to produce your GUI without starting the event loop, then form your tests using the following model:

- Set the focus on the face where you want to simulate an event (using **set-focus**).
- Trigger an event (using **do-event**).
- Test if the result of the event conforms to your expectations.

Here is an extract from a short [test script](https://github.com/red/red/blob/master/tests/test-backend.red):

```
    view/no-wait [
        hello: button "Hello" [print "ok"]
        name: field
    ]

    set-focus hello
    do-event 'click

    set-focus name
    do-event/with 'key #"4"
    do-event/with 'key #"2"
    do-event/with 'key 'enter

    probe name/text
    probe name/data
```

Using this test backend requires setting some options in the header (see the linked script's header), and compilation in release mode.

Another notable addition is the **foreach-face** function, which powers our GUI rewriting rules engine. It allows easy traversal of a face tree (depth-first), selecting only the faces you need to process. The syntax is:

```
    foreach-face <root> [<actions>]
    foreach-face/with <root> [<actions>][<conditions>]
    
    <root>       : root face of the tree.
    <actions>    : actions to perform on matched faces.
    <conditions> : optional conditions for selecting faces.
```

The first version applies the actions block to all faces, while the second one (/with) will select only faces matching the conditions block (which needs to return a true value to act on the current face). Both the actions and conditions blocks have an implicit **face** word defined, which refers to the current face in the tree. For example:

```
    do %tests/vid.red
    collect [foreach-face/with win [keep face/text][find face/text #"i"]]
```

will return:

```
    == ["China" "in panel" "option 1" "option 2" "option 3" "option 4"]
```

Here is a more sophisticated example using **foreach-face** to dynamically localize labels and adjust buttons size and position accordingly, so that they fit the text nicely:

[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgjh90ReDKzopkapO1vBk0L8AxWiGk83_Yr35hVF-FurbCjej9MguiJQPd_Zy69lTI5YW89zxcigPLBQWO-Nv4b1bG82t5MhtIEUzrXGmiakjf6i14oESuYlKhRtipD6SU7Ty9_mEYjzg0R/s1600/langs.gif)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgjh90ReDKzopkapO1vBk0L8AxWiGk83_Yr35hVF-FurbCjej9MguiJQPd_Zy69lTI5YW89zxcigPLBQWO-Nv4b1bG82t5MhtIEUzrXGmiakjf6i14oESuYlKhRtipD6SU7Ty9_mEYjzg0R/s1600/langs.gif)

```
    langs:  ["English" "French" "中文"]
    labels: [
        ["Name" "Age" "Phone #" "Cancel" "Submit"]
        ["Nom" "Age" "Tél." "Abandon" "Envoyer"]
        ["名字" "年龄" "电话" "取消" "提交"]
    ]
    set-lang: function [f event][
        root: f/parent
        condition: [all [face/text face/type <> 'drop-list]]

        list: collect [foreach-face/with root [keep face/text] condition]
        forall list [append clear list/1 labels/(f/selected)/(index? list)]

        foreach-face/with root [
            pads: any [metrics?/total face 'paddings 'x 0]
            prev: face/size/x
            face/size/x: pads + first size-text face
            face/offset/x: face/offset/x + ((prev - face/size/x) / 2)
        ][face/type = 'button]
    ]
    view [
        style txt: text right 45
        drop-list data langs select 1 on-change :set-lang return
        group-box [
            txt "Name"  field return
            txt "Age"   field return
            txt "Phone" field
        ] return
        pad 15x0 button "Cancel" button "Submit"
    ]
```

You can also detect window resizing events, and use the current window size to resize and position faces dynamically.

It is now also possible to change the mouse cursor shape, using pre-defined values, setting a custom image to **face/options/cursor**, or using the cursor keyword in VID, followed by an image! value or one of the following keywords: arrow, I-beam, hand, cross.

Here is an [example](https://github.com/red/red/blob/master/tests/cursor.red):

[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEinOnU5Wa1k7dhKRYxeacZjUaUVhsoMA0BWBcpOlnivHoTOMPn2hNKPqolYKCAveRMUUgfzvQoBZ92iE-7K5uL_NFRvlrMxfn89vCOPHAUzaz0ZRAf8aTtHbedgikZVg6Ui7A0XOGgHHYUL/s1600/cursor2.gif)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEinOnU5Wa1k7dhKRYxeacZjUaUVhsoMA0BWBcpOlnivHoTOMPn2hNKPqolYKCAveRMUUgfzvQoBZ92iE-7K5uL_NFRvlrMxfn89vCOPHAUzaz0ZRAf8aTtHbedgikZVg6Ui7A0XOGgHHYUL/s1600/cursor2.gif)

Other changes:

- Lit-words are now accepted in **flags** facet blocks.
- New Shape dialect command: **close**.
- Changed default background color to white in tab-panel (Windows).
- Added **system/view/metrics** (used mostly by VID, for more accurate sizing/positioning).
- Added **accelerated?** option in face, when set to true, for faster/smoother face rendering (only base faces). Z-ordering is then only honored between accelerated faces.
- When a button has the focus, pressing enter key will trigger a click event.
- Renamed **enable?** facet to the more correct **enabled?**.
- New function: **set-focus** (sets the focus on a given face, important for GUI testing).
- New **class** option in face/options, allows setting a sub-class of a native control.
- text-list now accepts a data keyword and any-string! values as input. This lets you to feed the list with values from VID. For example:

```
    view [
        text-list data parse
            read https://api.github.com/repos/red/red/events
            [collect [any [thru "message" 3 skip keep to ["\n" | {"}]]]]
    ]
```

[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgwoDIi0_0u-NqkQhUGWd05Qm4xyeT0zFs5UyNDJjzRmpWu7kG6BW3dlev_7LZcgBIiNAVg4t83EV7kcN1AHdclfkkSztezMXimw1uMNFUWL3AIPdGKE8utRa3_FFzJ3OIahFy2QghVT62B/s1600/Clipboard03.png)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgwoDIi0_0u-NqkQhUGWd05Qm4xyeT0zFs5UyNDJjzRmpWu7kG6BW3dlev_7LZcgBIiNAVg4t83EV7kcN1AHdclfkkSztezMXimw1uMNFUWL3AIPdGKE8utRa3_FFzJ3OIahFy2QghVT62B/s1600/Clipboard03.png)

The above script is just a *single expression* using two DSLs. I let you meditate on that. ;-)

VID dialect

VID has received many enhancements too. The most significant are:

- more accurate sizing and positioning of native widgets using OS metrics
- addition of alignment control, extending across/below layout modes.

So, it is now possible to add optional alignment keywords for the two linear layout modes:

- across: **top, middle, bottom**
- below: **left, center, right**

Those keywords can also follow the **return** command, if changing the alignment mode of the next row/column is required. The defaults are **top** and **left**. Here is a short example:

```
    view [
        style chk: check "Option" data yes
        style vline: base 2x60 red
        across top    vline button "Ok" text "Text" field chk return
        across middle vline button "Ok" text "Text" field chk return
        across bottom vline button "Ok" text "Text" field chk
    ]
```

[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhnZNK_dMEES_Je7iUK1qUOX9u6LijJComBQac6BVwO0IM9wIA9Wj4oJgtCbFDKII6z_1A6mgQzbVsVbwvtmK1ILz-oUNmWSFoLdoRnq-ejG9QSFso-wUSETkxRQxljHRtzLuNscMvNeNmc/s1600/Clipboard01.png)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhnZNK_dMEES_Je7iUK1qUOX9u6LijJComBQac6BVwO0IM9wIA9Wj4oJgtCbFDKII6z_1A6mgQzbVsVbwvtmK1ILz-oUNmWSFoLdoRnq-ejG9QSFso-wUSETkxRQxljHRtzLuNscMvNeNmc/s1600/Clipboard01.png)

Other changes:

- New **on-created** event, triggered just after a face has been shown for the first time.
- New **strike** option for faces: sets the strikethrough font style.
- New **init \[&lt;body&gt;]** styling option allows you to define a block of code to run when the style is instantiated.
- **later** option added to react keyword.
- Allows data and at keyword argument to be an arbitrary Red expression (see the above text-list example).
- More robust face options parsing.
- The default actor for h1 to h5 and text widgets is now **on-down**.
- VID now saves the style name for each face in **face/options/style**.

Parse dialect

A new **case** command has been added to [Parse dialect](http://www.red-lang.org/2013/11/041-introducing-parse.html). **Case** temporarily changes the case matching mode, for the next rule only.

Syntax:

```
  case <mode> <rule>

  <mode>: TRUE (case-sensitive matching) or FALSE (case-insensitive) (logic!, word!)
  <rule>: rule on which the local case matching mode is applied to.
```

Red/System dialect

For newcomers, [Red/System](http://static.red-lang.org/red-system-specs-light.html) is Red's built-in system programming dialect, offering a Red-like syntax with C-level semantics (and many improvements over C, like namespaces, exceptions, RTTI,...).

This release brings an important improvement: structures can now be [passed](http://static.red-lang.org/red-system-specs-light.html#section-6.1) and [returned](http://static.red-lang.org/red-system-specs-light.html#section-6.2) by value on internal and external function calls. They can also now be inlined in other structures. This is achieved by putting the **value** keyword after a struct! type declaration:

```
 name [struct! [<fields>] value]
```

Passing structs by value is sadly not formally specified in C language, resulting in incompatible compiler-specific ABIs. Moreover, those ABIs are not documented, or only partially, so gathering all the right information was painful and time consuming. Just to illustrate how bad the situation is, after spending days researching all the various C compilers ABI, I was able to answer a [stackoverflow question](https://stackoverflow.com/a/43581785/2081311) about returning C structs by value, which was left unanswered for 6 years... I might write a synthetic article about those C ABIs someday, from my notes, as I could not find such documentation online. Anyway, the hard work has been done for you. Red/System now implements the most common ABI for each platform:

- Windows: Microsoft Visual C ABI
- Linux: gcc/Clang ABI (with support for ARM-specific ABI)
- macOS: Clang ABI

In addition, more stack-oriented features are now supported:

- [system/stack/allocate](http://static.red-lang.org/red-system-specs-light.html#section-13.7): allocates a buffer on the native stack.
- [system/stack/free](http://static.red-lang.org/red-system-specs-light.html#section-13.8): frees a buffer on a the native stack.
- New [use](http://static.red-lang.org/red-system-specs-light.html#section-7.2.1) keyword: defines a local namespace in a function.

The new use feature allows you to create local variables anywhere in a function body. It is useful for splitting long functions and creating local variables in macros.

The ARM backend has also been enhanced significantly in this new release:

- fixes and improvements to soft integer division routine.
- fixes non-passing unit tests on floats.
- better AAPCS conformity and various bug fixes.
- improved accuracy of overflow detection in multiplication.

Console

ANSI escaping sequences are now supported in the Red CLI console, thanks to Oldes. See this [pull request](https://github.com/red/red/pull/2522) for more info and a screenshot.

Other console changes:

- improved auto-completion, now completes the longest common substring.
- auto-detect older Intel CPU (non-SSE3) on Windows platform when building console.
- **system/console/size** now provides the size of the console in columns and rows

What's Next?

The 0.6.4 version will mostly focus on the GUI console, not only bringing it to macOS, but also extending it greatly. It should be merged into the master branch in the next few days, as the new GUI console is almost finished.

The 0.6.5 version is for Android, and is already being worked on in a separate, private repo. We will merge it with the red/red public repo once it's ready, because we need control on the PR timing and the Android release. It will be a *big* one, unlike what you've seen so far. ;-)

In the meantime, and as usual, enjoy and have fun!

Posted by [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055 "author profile") at [4:05 PM](https://www.red-lang.org/2017/07/063-macos-gui-backend.html "permanent link") [17 comments:](https://www.red-lang.org/2017/07/063-macos-gui-backend.html#comment-form) [![](https://resources.blogblog.com/img/icon18_edit_allbkg.gif)](https://www.blogger.com/post-edit.g?blogID=5936111837781935054&postID=7246500477568685914&from=pencil "Edit Post")

Labels: [date](https://www.red-lang.org/search/label/date), [GUI](https://www.red-lang.org/search/label/GUI), [libRed](https://www.red-lang.org/search/label/libRed), [macOS](https://www.red-lang.org/search/label/macOS), [parse](https://www.red-lang.org/search/label/parse), [rules engine](https://www.red-lang.org/search/label/rules%20engine), [tests](https://www.red-lang.org/search/label/tests), [VID](https://www.red-lang.org/search/label/VID)

[Newer Posts](https://www.red-lang.org/search?updated-max=2018-03-11T18%3A39%3A00%2B01%3A00&max-results=7&reverse-paginate=true "Newer Posts") [Older Posts](https://www.red-lang.org/search?updated-max=2017-07-17T16%3A05%3A00%2B02%3A00&max-results=7 "Older Posts") [Home](https://www.red-lang.org/)

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

- [▼](javascript:void%280%29)  [2017](https://www.red-lang.org/2017/) (3)
  
  - [►](javascript:void%280%29)  [December](https://www.red-lang.org/2017/12/) (1)
  
  <!--THE END-->
  
  - [▼](javascript:void%280%29)  [July](https://www.red-lang.org/2017/07/) (1)
    
    - [0.6.3: macOS GUI backend](https://www.red-lang.org/2017/07/063-macos-gui-backend.html)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [March](https://www.red-lang.org/2017/03/) (1)

<!--THE END-->

- [►](javascript:void%280%29)  [2016](https://www.red-lang.org/2016/) (6)
  
  - [►](javascript:void%280%29)  [December](https://www.red-lang.org/2016/12/) (2)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [July](https://www.red-lang.org/2016/07/) (2)
  
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
