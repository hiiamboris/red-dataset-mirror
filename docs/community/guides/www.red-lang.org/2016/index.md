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

## December 17, 2016

[]()

### [Incursion into "explorable explanations" lands](https://www.red-lang.org/2016/12/incursion-into-explorable-explanations.html)

A few days ago, [Nicky Case](https://twitter.com/ncasenmare) released an amazing piece of work in form of an [interactive guide to alternative voting systems](http://ncase.me/ballot/). This work follows the track of Brett Victor's famous research on [explorable explanations](http://worrydream.com/ExplorableExplanations/) and immediately caught our eyes because it is a very good match for the capabilities of our [reactive](http://www.red-lang.org/2016/06/061-reactive-programming.html) native [GUI system](http://www.red-lang.org/2016/03/060-red-gui-system.html). We decided to replicate some of Nicky's interactive explanations in Red and see how it goes. The results are pretty amazing, as it was not only relatively easy to design and code (about 8 hours in total and ~280 LOC) but also great fun! Here is the result:

[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEirW5h1gOh7tKdw6NcU2NYLqtpf8S1JnbGN3xUghwWeZbQB0ppDuSmYTRhcpOPNDcs0is7Kg_aEd0UuFU__j6GUlbU7tjP6jLcV-vK5dSvNgJHVxo3bZsHb5CA0lj-l6ag1OvfoMH2kkIWy/s1600/ballots.gif)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEirW5h1gOh7tKdw6NcU2NYLqtpf8S1JnbGN3xUghwWeZbQB0ppDuSmYTRhcpOPNDcs0is7Kg_aEd0UuFU__j6GUlbU7tjP6jLcV-vK5dSvNgJHVxo3bZsHb5CA0lj-l6ag1OvfoMH2kkIWy/s1600/ballots.gif)

You can, of course, try it yourself by using the latest build from the master (or macGUI) branch or, preferably, one of the prebuilt consoles:

- Ballots demo source on [github](https://github.com/red/code/tree/0.6.2/Showcase/ballots) or [zipped archive](http://static.red-lang.org/tmp/ballots.zip) (171KB).
- Windows [prebuilt console](http://static.red-lang.org/tmp/red-console.exe) (273KB).
- macOS [prebuilt console](http://static.red-lang.org/tmp/red-console-osx) (256KB).
- Original web version from Nicky on [github](https://github.com/ncase/ballot/tree/gh-pages/play).

Put the console executable in the source code folder, run it and from the prompt, just type:

```
    red>> do %ballots.red
```

For Linux folks, sorry guys, the GUI support is not yet ready for prime time, though in the meantime, you could use Wine, Red GUI usually runs just fine on it.

Notes for macOS users:

- You need to \`chmod +x\` the binary before running it from the terminal.
- When dragging a face quickly, it can lag behind. The macOS GUI backend is still in a development branch, and still need some work to optimize animation latencies.

Implementation notes

The Red version implements only the "model1" and "ballot1" to "ballot4" interactive explanations. The rest could also be easily done in the same way, though we used up all our spare time for that as we are now focussing on the Red 0.6.2 release.

The colored shapes are images in the web version, but instead we chose to draw them using our 2D [vector DSL](https://doc.red-lang.org/en/draw.html) in the Red version. Overall, the Red version is really small, about 25-45 LOC per screen, 85 LOC for the helper code and 2D shapes. All things considered, it is significantly smaller than the web version:

[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjlURXALQwHMTn4ZJCwQAeE9vgWxy9pPmlqEeBD9mjJMdw-43g6lI2EU_aweg0eklR0hGIau5ogUyqlHOw73odHg5C2Tonf_Mvp2qgN9ch-q-q4xFDgYXoSrqJz2WsxHLr9tIYDQh_HX5v3/s1600/web-red.png)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjlURXALQwHMTn4ZJCwQAeE9vgWxy9pPmlqEeBD9mjJMdw-43g6lI2EU_aweg0eklR0hGIau5ogUyqlHOw73odHg5C2Tonf_Mvp2qgN9ch-q-q4xFDgYXoSrqJz2WsxHLr9tIYDQh_HX5v3/s1600/web-red.png)

This is an interesting result, as the web version uses only plain JS, no third-party framework (with the exception of the almost weightless [minipubsub](https://github.com/daniellmb/MinPubSub)). The counted JS code could maybe be shortened (excluding minification) though it already looks pretty simple to me, containing very few comments, doing mostly calculations and canvas drawing. I doubt it could be reduced significantly (any thoughts from expert JS readers about that?).

Final thoughts

This fun experiment shows that Red has the potential to be a great match for explorable explanations and other similar reactive interface needs. We hope that this demo will inspire the Red community to dig more in that direction and see what gems are lying there. For example, learning Red using such interactive visual approach would be great, don't you think so? ;-)

Posted by [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055 "author profile") at [12:07 PM](https://www.red-lang.org/2016/12/incursion-into-explorable-explanations.html "permanent link") [17 comments:](https://www.red-lang.org/2016/12/incursion-into-explorable-explanations.html#comment-form) [![](https://resources.blogblog.com/img/icon18_edit_allbkg.gif)](https://www.blogger.com/post-edit.g?blogID=5936111837781935054&postID=2142781399364458519&from=pencil "Edit Post")

Labels: [console](https://www.red-lang.org/search/label/console), [explorable explanations.](https://www.red-lang.org/search/label/explorable%20explanations.), [GUI](https://www.red-lang.org/search/label/GUI), [MacOSX](https://www.red-lang.org/search/label/MacOSX), [reactive](https://www.red-lang.org/search/label/reactive)

## December 2, 2016

[]()

### [Entering the World of Macros](https://www.red-lang.org/2016/12/entering-world-of-macros.html)

In Rebol languages family, [macros](https://en.wikipedia.org/wiki/Macro_%28computer_science%29) have been a topic every now and then, and despite [one](http://web.archive.org/web/20120202022657/http://www.rebol.it/power-mezz/mezz/expand-macros.html) implementation offered, they never became mainstream. Rebol language, being [homoiconic](https://en.wikipedia.org/wiki/Homoiconicity), comes already well-equipped for code transformations at run-time with minimal effort. For example, this short script:

```
    code: [print "hello"]
    code: reduce [code]
    insert code [loop 2]
    probe code
    do code
```

when evaluated will output:

```
    [loop 2 [print "hello"]]
    hello
    hello
```

*For a more sophisticated example, see our [GUI live-coding in just a few lines](http://www.red-lang.org/2016/07/eve-style-clock-demo-in-red-livecoded.html).*

Moreover, Rebol being interpreted, the cost of transformations is still paid at run-time.

But with Red, it is a different story. Being compiled, in addition to being interpreted, weighs heavily in favor of a preprocessing facility, in order to leverage compile-time code transformations. It is available now (in the [master](https://github.com/red/red) branch), in the form of a preprocessor with macro capabilities.

Let me restate it for the readers not familiar with macros and source preprocessing:

    *The goal is to shift some data and code transformations from run-time to compile-time.*

This is the key point of the new features in Red, described below.

Design and implementation

The preprocessing (including macro-time) happens between **load** and **compile** phases. It has been designed as a separate phase, with a separate execution context (to the extent allowed by current Red semantics, until we get the module! type implemented). Among other benefits, this enforces [hygiene](https://en.wikipedia.org/wiki/Hygienic_macro) in Red macros. The preprocessor directives syntax relies on the familiar \`#\` prefixed forms (issue! values), meant to visually stand out from regular code, enforcing the idea of a separate layer of processing.

As Red strives to keep the source code accepted by the compiler and interpreter as interchangeable as possible, the preprocessor can also be run by the interpreter, between **load** and **eval** phases, supporting exactly the same features as the compiler version. Actually, they even share the [same implementation](https://github.com/red/red/blob/master/utils/preprocessor.r), a unique file, with a double Rebol/Red header, run by Rebol2 for the toolchain and by Red for the interpreter. Though the preprocessor has to *preprocess itself* and a few core files used by the compiler setup sequence. In order to solve this chicken and egg problem, some directives have been hardcoded in the preprocessor instead of been implemented as macros.

The preprocessing (including macro expansion) is applied to the whole source fed to the compiler (or interpreter) after the **load** phase, so it is applied on a [parse tree](https://en.wikipedia.org/wiki/Parse_tree) (similar to an [AST](https://en.wikipedia.org/wiki/Abstract_syntax_tree)). This means that no information about objects or other contexts built at run-time is available, it is just a big tree of Red values. Further research is planned in future releases to improve that, if possible. An alternative approach relying on interleaving macro expansion with compile/eval phases (late-time expansion) was considered, but not adopted, due to much higher implementation costs and potentially confusing inter-mixed behaviors, making it hard to grasp and be properly used by a majority of users. As we value *simplicity* utmostly, we will stick to the current simpler model for now, to ensure the broadest possible usage.

Simple macros

Documentation about preprocessing directives like #if, #either, #switch, #case, ... is [available](https://doc.red-lang.org/en/preprocessor.html), and should feel familiar to Rebol SDK users, so this article will just focus on the real novel part: macro support.

Macros are basically *functions*, taking source code references as arguments in order to transform that source code. Most of the time, the returned value from the macro is replacing the macro name and argument at the call site in the source code. Though, this default mode can be overriden, and more control can be given to the macro through *pattern-matching* macros, explained later below.

*For sake of brevity, the Red header is omitted from following code examples. You can copy/paste those code snippets in the console, wrapping them in a **do expand \[...]** call or compile them (just add a Red \[] header) using a \`red -c -s &lt;script.red&gt;\` line.*

Simple macros can be defined in a similar way to regular functions, though they need to be preceeded by a #macro directive:

```
    #macro as-KB: func [n][n * 1024]
    print as-KB 64
```

When the macro is expanded by the preprocessor, the above source code will result in:

```
    print 65536
```

This kind of simple macro is called a *named macro* in Red's jargon. Once the preprocessor has finished his work, no macro definition or call, nor any preprocessor directive remains in the source code (compiler directives defined as issue! values, are still there though).

Remember that macros take source code values as arguments, *without evaluating them*, so passing unquoted words or paths is fine:

```
    #macro capitalize: function [value][
        s: uppercase/part form value 1
        either path? value [to-lit-path s][to-lit-word s]
    ]
    print capitalize hello
    print capitalize hello/macro/world
```

will result in:

```
    print 'Hello
    print 'Hello/macro/world
```

As you can see both func and function constructors are accepted for declaring a macro.

One possible use of macros can then be word-aliasing, for example translating words at compile-time (*using French words here*):

```
    #macro si:      func []['if]
    #macro affiche: func []['print]
    #macro vrai:    func []['true]

    si vrai [affiche "Vive Red !"]
```

will result in:

```
    if true [print "Vive Red !"]
```

Now, let's get back to the first example and expand (no pun intended) on it:

```
    #macro make-KB: func [n][n * 1024]
    #macro make-MB: func [n][make-KB make-KB n]
    print make-MB 1
```

will result in:

```
    print 1048576
```

So macros can freely call other macros, the same way functions would. This is possible because macros are running in a special (hidden) context, which can be accessed and extended (indirectly) by the user using the #do directive:

```
    #do [kilo: 1024]
    #macro make-KB: func [n][n * kilo]
```

The #do directive accepts arbitrary code, so local words and functions can be defined there freely, and accessed from macros. This gives a pretty powerful programming layer for the preprocessor, though, it is possible to go even further.

Pattern-matching macros

For Red users, the logical next step once having macros (as defined above), is to be able to combine them with one of the Rebol world's jewels: the [Parse DSL](http://www.red-lang.org/2013/11/041-introducing-parse.html). Well that is what *pattern-matching* macros are. ;-) Instead of matching a word as trigger for the macro, you can replace it with a valid Parse rule (which can call sub-rules defined in #do expressions), defining a pattern that will trigger the macro.

We can now improve our \`make-KB\` macro with a nicer looking form:

```
    #macro [number! 'KB] func [s e][to-integer s/1 * 1024]
    print 64 KB
    print 2.5 KB
```

would result in:

```
    print 65536
    print 2560
```

In that example, the macro gets called each time a number! followed by the word! KB is encountered in the source code. They will then both get replaced by the macro returned value. The arguments of pattern-matching macros are always the same: one reference to the *starting* position (s) of the matched pattern, and one reference to the *ending* position (e).

Here are a few more examples, showing the true power of Red macros:

Variable-arguments macro

```
    #macro ['max some [integer!]] func [s e][
        first maximum-of copy/part next s e
    ]
    print max 4 2 3 8 1
```

would result in:

```
    print 8
```

Loop macro

A simple loop macro, extending the existing loop function:

```
    #macro ['loop [integer! | block!] block!] function [[manual] s e][
        set [spec body] next s
        if integer? spec [return e]    ;-- return position past the pattern
        low: high: none
        step: 1

        unless parse spec [
            word! 
            opt '= set low integer!
            opt [opt 'to set high integer!]
            opt [opt 'step set step integer!]
        ][
            print ["*** LOOP syntax error:" spec]
        ]
        new: reduce either high [
            set-var: to-set-word var: spec/1
            cond: compose [(var) <= (high)]
            repend body [set-var var '+ step]
            [set-var low 'while cond body]
        ][
            ['repeat spec/1 low body]
        ]      
        change/part s new e
    ]

    loop 2 [print "x"]
    loop [i 3][print i]
    loop [i 5 8][print i]
    loop [i = 5 to 10 step 2][print i]
```

would result in:

```
    loop 2 [print "x"]
    repeat i 3 [print i]
    i: 5 while [i <= 8] [print i i: i + 1]
    i: 5 while [i <= 10] [print i i: i + 2]
```

This pattern-matching macro relies on the *manual* mode (\[manual] attribute), where the replacement is done by user code and the returned value needs to be the position in the source code where the expansion process resumes. In this case, loop is also an existing function, so when the argument is an integer, the source is left untouched. With a normal macro, the resuming point would have been the beginning of the pattern, resulting in an infinite loop (again, no pun intended). ;-)

Math expressions folding macro

A powerful way to pre-calculate constant math expressions from your source code could be to use a macro like this one:

```
    #do [
        p:     none
        op:    ['+ | '- | '* | '** | slash]
        paren: [p: paren! :p into expr]
        fun:   [['sine | 'cosine | 'square-root] expr]
        expr:  [[number! | paren] op expr | number! | paren | fun]
    ]

    #macro [expr] func [[manual] s e][
        if all [e = next s number? s/1][return e]  ;-- skip single number
        change/part s do (copy/part s e) e
        s
    ]

    a: 3 + 2 - 8
    print (3 + 4) * 6
    edge: 100 * cosine 60
    hypotenuse: square-root (3 ** 2) + (4 ** 2)
```

would result in:

```
    a: -3
    print 42
    edge: 50.0
    hypotenuse: 5.0
```

HTML validating macro

HTML tags are a first-class datatype in Red so they can be embedded and manipulated by the core language (like string values). The Red lexer will check the syntax but wouldn't it be nice to also have a minimal check the semantics at compile-time? Let's roll a macro for that:

```
    #do [
        error: function [pos [block! paren!] msg [block!]][
            print [
                "*** HTML error:" reduce msg lf
                "*** at:" copy/part pos 4
            ]
            halt
        ]
    ]

    #macro tag! function [[manual] s e][
        stack: []
        tag: s/1

        either slash = tag/1 [
            last?: (name: next tag) = last stack
            all [
                not last?
                find stack name
                error s ["overlapping tag" tag]
            ]
            if any [empty? stack not last?][
                error s ["no opening tag for" tag]
            ]
            take/last stack
        ][
            if slash <> last tag [    
                if pos: find tag " " [tag: copy/part tag pos]

                unless find s head insert copy tag slash [
                    error s ["no closing tag for" tag]
                ]            
                append stack tag
            ]
        ]
        next s
    ]

    data: [<html><br/><b>msg<b></html>]
    msg: "Red rocks!"
    print data
```

The embedded HTML above has an error, the &lt;b&gt; tag is not closed. This macro will catch that error and report it properly during the compilation.

A DSL compiler

Red is already very well-suited for DSL creation, though, the cost of interpreting or compiling DSL has always been paid at run-time so far. With macros, it can be moved to compile-time, when suitable. Here is a simple subset of BASIC language, partially compiled to Red code using a single macro:

```
    #macro do-basic: function [src /local math][
        output: clear []
        lines:  clear []
        value!: [integer! | string! | word!]
        op:     ['+ | '- | '* | slash]
        comp:   ['= | '<> | '< | '> | '<= | '>=]
        line:   [p: integer! (repend lines [p/1 index? tail output])]
        cmd:    [
            token: 'let word! '= value! opt [copy math [op value!]] (
                emit reduce [to-set-word token/2 token/4]
                if math [emit/part math 2]
            )
            | 'if value! comp value! 'then (
                emit/part token 4
                emit/only make block! 1
                parent: output
                output: last parent
            ) cmd (output: parent)
            
            | 'print value! (emit/part token 2)
            | 'goto integer! (
                line: select/skip lines token/2 2
                emit compose [jump: (line)]
            )
        ]
        emit: function [value /only /part n [integer!]][
            if part [value: copy/part value n]            
            either only [append/only output value][append output value]
        ]
        
        unless parse src [some [line cmd]][
            print ["*** BASIC Syntax error at:" mold token]
        ]
        compose/deep [
            (to-set-word 'eval-basic) function [pc [block!]][
                bind pc 'pc
                while [not tail? pc][
                    do/next pc 'pc
                    if jump [
                        pc: at head pc jump
                        jump: none
                    ]
                ]
            ]
            eval-basic [(output)]
        ]
    ]

    do-basic [
        10 LET A = "hi!"
        20 LET N = 3
        30 PRINT A
        40 LET N = N - 1
        50 IF N > 0 THEN GOTO 30
    ]
```

will result in:

```
    eval-basic: function [pc [block!]][
        bind pc 'pc
        while [not tail? pc][
            do/next pc 'pc
            if jump [
                pc: at head pc jump
                jump: none
            ]
        ]
    ]
    eval-basic [
        A: "hi!"
        N: 3
        PRINT A
        N: N - 1
        IF N > 0 [jump: 5]
    ]
```

Note: I tried to keep this example short, so it ends up as a BASIC source code compiler to Red, but fed to a custom interpreter. Fully compiling that DSL to Red code would be possible, but would require more complex constructs, in order to deal with a GOTO able to arbitrarily jump anywhere, and that is beyond the scope of this article.

Final thoughts

The preprocessor and macros bring great new possibilities to the Red compiler, while still being able to run the same code with the interpreter. Though, as the saying goes, with great power comes great responsibility, so keeping in mind some drawbacks would be wise:

- As there is no difference in Red between code and data, both can be transformed by the same macros, which is not always desirable. Some mechanisms for limiting the application scope exist in the preprocessor, though there is no guarantee they can cover all use-cases. Stay alert, especially with pattern-matching macros.

<!--THE END-->

- It is not always easy to reason about and debug macros, unless you have some existing experience. I would suggest not using them until you have a good grasp of Red's toolchain, semantics and fundamental concepts (like homoiconicity).

<!--THE END-->

- As the Red toolchain is currently run by a Rebol2 interpreter, Rebol is running the compile-time macros, so keep that in mind when writing them. If you want them to run equally well on the interpreter, you need to use only the common subset between Rebol2 and Red. Sooner or later we should move compile-time preprocessing to use a Red engine (thanks to libRed), so this concern is temporary.

Last but not least, for those wondering about [syntactic macros](https://en.wikipedia.org/wiki/Macro_%28computer_science%29#Syntactic_macros) (aka readers macros) inclusion in Red, as for AST-macros, they are not strictly necessary, as the Parse DSL already provides us a powerful tool to implement pre-**load**-time processing. Though they could still bring some extra benefits (like embedding the processing logic within the source code), but could also go against the Red-as-data-format principle, or wreak havoc in IDE support (like messing up syntax coloring and step by step debugging). We need more time to go through each concern and see how to deal with them before adding such a feature.

I hope this long article was useful for those of you who had no past experience with macros and entertaining for those who have. Have fun with this brand new toy and let us know what you think about it on [Gitter](https://gitter.im/red/red/lisp). Cheers!

See comments on [/r/programming](https://www.reddit.com/r/programming/comments/5g8wg9/macros_the_red_language_way/).

Posted by [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055 "author profile") at [6:25 PM](https://www.red-lang.org/2016/12/entering-world-of-macros.html "permanent link") [5 comments:](https://www.red-lang.org/2016/12/entering-world-of-macros.html#comment-form) [![](https://resources.blogblog.com/img/icon18_edit_allbkg.gif)](https://www.blogger.com/post-edit.g?blogID=5936111837781935054&postID=5182745918607343155&from=pencil "Edit Post")

Labels: [AST](https://www.red-lang.org/search/label/AST), [macros](https://www.red-lang.org/search/label/macros), [parse](https://www.red-lang.org/search/label/parse), [preprocessor](https://www.red-lang.org/search/label/preprocessor), [toolchain](https://www.red-lang.org/search/label/toolchain)

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

## June 29, 2016

[]()

### [0.6.1: Reactive Programming](https://www.red-lang.org/2016/06/061-reactive-programming.html)

Despite being a minor release, 0.6.1 still weighs a heavy [588 commits](https://github.com/red/red/releases/tag/v0.6.0) with a big number of fixes and many additions, among which the new reactive framework is the most notable.

Last release [introduced](http://www.red-lang.org/2016/03/060-red-gui-system.html), for the first time in the Rebol world, a reactive programming framework, as a part of the GUI engine. While working on improving it, we realized that it could actually be easily generalized beyond GUIs, with just minor changes to its design and implementation.

What is reactive programming?

Let me make a short disclaimer first, this is not [yet-another-FRP](https://en.wikipedia.org/wiki/Functional_reactive_programming) framework relying on event streams. The reactive model we use is known as [object-oriented reactive programming](https://en.wikipedia.org/wiki/Reactive_programming#Object-oriented) (using a "push" model), which is both simple to understand and close to spreadsheet's model (i.e. Excel formulas). That model has often been praised for its simplicity and efficiency. You can now use it directly in Red.

So, in practice, what is it?  *It is a way to link one or more object fields to other fields or global words, by specifying relationships in a block of code (can be a single expression or a complex multi-step computation)*. Each time a source field value changes, the target value is immediatly updated, you don't have to call a function for that, it's pretty much define-and-forget. ;-) Here's a simple example in Red:

```
    red>> a: make reactor! [x: 1 y: 2 total: is [x + y]]
    == make object! [
        x: 1
        y: 2
        total: 3
    ]
    red>> a/x: 5
    == 5
    red>> a/total
    == 7
    red>> a/y: 10
    == 10
    red>> a/total
    == 15
```

In that example, the is infix function is used to create a reactive relation between the total field and the x and y ones using a simple formula. Once set, total is refreshed automatically and asynchronously each time the other fields are changed, regardless how, where or when they are changed! It's the same concept as spreadsheet cells and formulas, just applied to object fields.

This reactive programming style belongs to the [dataflow programming](https://en.wikipedia.org/wiki/Dataflow_programming) paradigm. It doesn't enable you to write code, that you wouldn't otherwise be able to write in an imperative style. Though, it helps reduce the size and complexity of your code, by abstracting away the "how" and helping you focusing more on the "what" (not dissimilar to [FP](https://en.wikipedia.org/wiki/Functional_programming)). The gains of such approach become significant when you chain together many relations, creating graphs of, more or less complex dependencies. [GUI programming](https://doc.red-lang.org/en/gui.html) is where it shines the most, as nodes are visible objects, and reactions produce visible effects.

Here is a comparative example with a reactive GUI vs the non-reactive version:

Let's make a simple native GUI app using [VID](https://doc.red-lang.org/en/vid.html), Red's graphic DSL (we call it *a dialect*). It will just provide 3 sliders, which control the R, G, B components of the box's background color.

[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjqpo23JOGHvMVbHZSGjb-pAh2C5o5VZR1KyzkHsj78RVsqtXT63ijHjYah0j4a48VpyU4oljUT3Fn9-DMKE8TMMvBInImqO18Fe_3xbXqe1flcOXjCUfAt6Gfl7vR1E3YMTleTieyoOHsw/s1600/react3.gif)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjqpo23JOGHvMVbHZSGjb-pAh2C5o5VZR1KyzkHsj78RVsqtXT63ijHjYah0j4a48VpyU4oljUT3Fn9-DMKE8TMMvBInImqO18Fe_3xbXqe1flcOXjCUfAt6Gfl7vR1E3YMTleTieyoOHsw/s1600/react3.gif)

The reactive version:

```
    to-int: function [value [percent!]][to integer! 255 * value]
    
    view [
        below
        r: slider
        g: slider
        b: slider
        base react [
            face/color: as-color to-int r/data to-int g/data to-int b/data
        ]
    ]
```

The non-reactive version:

```
    to-int: function [value [percent!]][to integer! 255 * value]
    
    view [
        below
        slider on-change [box/color/1: to-int face/data]
        slider on-change [box/color/2: to-int face/data]
        slider on-change [box/color/3: to-int face/data]
        box: base black
    ]
```

What can we say about the non-reactive version?

1. Size is pretty much the same, though the non-reactive version has **more expressions** and code looks **denser**.
2. The updating code is **spread over** 3 event handlers.
3. The face word in each handler refers to the widget, so we can remove the slider names (**very minor gain** though).
4. The box face **needs a name** (\`box\`), so it can be referred to, from the event handlers.
5. The box face default color is grey, so it **needs a \`black\` keyword** to force it to the right default color (as the sliders are all at position 0 on start). The reactive version sets the right color on start, no need to care about it.

Even in this simple example, we can see that the **complexity**, and the **cognitive load** are **higher in the non-reactive version**. The more relationships can be modeled using reactions in a GUI app, the higher the gains from using the reactive approach.

Red reactive framework

Red's reactive framework is just ~250 LOC long, and written [purely in Red](https://github.com/red/red/blob/master/environment/reactivity.red) (no Red/System). It relies on object events (equivalent to *observables* in OO languages) and the ownership system (which will be properly documented once completed in one or two releases time). Rebol does not offer any past experience in such domain to guide us, so it should still be considered experimental, and we need to put it to the test in the wild, to study the pros/cons in real-world applications. We are quite excited to see what Red users will create with it.

Full documentation for the reactive framework is [available here](https://doc.red-lang.org/en/reactivity.html). It also explains the important difference between *static* and *dynamic* relations.

In a nutshell, the reactive API provides 4 functions (quite big API by our standards):

- **react** to create or remove reactions.
- **is** infix function for creating reactions which result will be assigned.
- **react?** to check if an object's field is a reactive source.
- **clear-reactions** to remove all existing reactions.

Moreover, **react** is directly supported as a [keyword](https://doc.red-lang.org/en/vid.html) from VID dialect. That's all you need! ;-)

Here is a simple demo linking together a couple dozen balls, following each other. Source code is [available here](https://gist.github.com/dockimbel/2d95c8c85e5bfed71bd1c15294ee77c5).

[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhQ2d8RmBIPq0yNIYMiUQgSgIgWCKo87td9AwUOg6M5nt5AvuwZi3JVJFzCy_rV306ox5Qe7o3n0dDWXe0fTZnORHotl6C0phr1xwU1ubCjPi0oASPngEiANjUcuTu6YlqbfG0RwMl-7Cxm/s320/react4.gif)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhQ2d8RmBIPq0yNIYMiUQgSgIgWCKo87td9AwUOg6M5nt5AvuwZi3JVJFzCy_rV306ox5Qe7o3n0dDWXe0fTZnORHotl6C0phr1xwU1ubCjPi0oASPngEiANjUcuTu6YlqbfG0RwMl-7Cxm/s1600/react4.gif)

Let's now have a look at other features brought by this release.

Time! datatype

A time! datatype is now included in Red, supporting already a broad range of features, like:

- Path accessors: **/hour, /minute, /second.**
- Math operators, including mixing with other scalar types.
- All comparison operators.
- Actions: **negate, remainder, random, pick.**

```
    red>> t: now/time
    == 12:41:52
    red>> t + 0:20:00
    == 13:01:52
    red>> t/second
    == 52.0
    red>> t/hour: t/hour - 5
    == 7
    red>> t
    == 7:41:52
```

GUI changes

Two main additions to our View engine have enabled the writing, or porting, of some nice graphic [demos](https://github.com/red/code) (thanks to Gregg Irwin for the awesome demos!). Here are a few examples:

[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjwtbk99UbK9TaL8FeUXz2KTdTluWD31a78gIqLFagBs5wY7Y7WVbAgrjiORJm1bx_0yYaG_FFo_M7eqVfIpfYLznDo6IzVRC-Rrf6QxCrOfYjDuRvMwd7zeb7gq-DItM8c1l-R-rGbczUN/s320/demo6.gif)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjwtbk99UbK9TaL8FeUXz2KTdTluWD31a78gIqLFagBs5wY7Y7WVbAgrjiORJm1bx_0yYaG_FFo_M7eqVfIpfYLznDo6IzVRC-Rrf6QxCrOfYjDuRvMwd7zeb7gq-DItM8c1l-R-rGbczUN/s1600/demo6.gif)

Bubble demo

[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgi1odE8LdOvozamfZJiBv1_IZTnwZNbdWwDkXb5MEVhNdmIRHE7cSvGGCvRXuqPsorXxXpmeaXfWrlCH9y9cU2NmAXWy0K4Okh81Awns5bj6e7yO3cdq4VNBBj3tBQCCo4NhkzMBkjQw2M/s400/demo8.gif)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgi1odE8LdOvozamfZJiBv1_IZTnwZNbdWwDkXb5MEVhNdmIRHE7cSvGGCvRXuqPsorXxXpmeaXfWrlCH9y9cU2NmAXWy0K4Okh81Awns5bj6e7yO3cdq4VNBBj3tBQCCo4NhkzMBkjQw2M/s1600/demo8.gif)

Gradient Lab

[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEga8XRRt6snAE7fDeZyrNsxfvKJ88pWzNh650FDIB6KikCgePnpdv7TJpT5zPXGkzg-GEb3UiynBlH3TDKXJdYYRE0rFb_0QL0CCP9-54GV1l2SNehs3SZORtSrrx3L7duaukL4MFs4zHqN/s320/demo5.gif)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEga8XRRt6snAE7fDeZyrNsxfvKJ88pWzNh650FDIB6KikCgePnpdv7TJpT5zPXGkzg-GEb3UiynBlH3TDKXJdYYRE0rFb_0QL0CCP9-54GV1l2SNehs3SZORtSrrx3L7duaukL4MFs4zHqN/s1600/demo5.gif)

Particles demo

**View engine changes**

- New **time** event in View, triggered by timers.
- New **rate** facet in face! objects for setting timers.
- **move** action allows to move faces between panes in a non-destructive way.
- Adds support for **event/window** property.
- **data** syncing with **text** for field and text faces.
- Add **default** option for fields (e.g. options: \[default 0]).
- **at, skip, pick, poke, copy** on image! now accept pair! index argument.
- Added **/argb** refinement for image! datatype.
- Added **request-font** dialog.
- Improved **size-text** native.
- GUI console faces are now excluded from the View debug logs.

**Draw dialect changes**

- [**fill-pen**](https://doc.red-lang.org/en/draw.html#_fill_pen) has been extended to support color gradients.
- **pen** accepts \`off\` as argument now, to make the subsequent pen-related operations invisible.
- Allows **box** to accept edges in reverse order.
- Radius of **circle** now accepts a float! value.
- Added key-color support for to **image** command.

**VID dialect changes**

- Added **rate** keyword for setting timers.
- **do** command now support \`self\` to refer to container face (window or panel).
- Added **focus** option to faces for presetting focus.
- Added **select** option support to preselect an item in a list (using an integer index).
- Added **default** option support for field and text faces' default **data** facet value.
- Added support for get-words to pass an handler function as an actor.
- Adding **glass** and **transparent** color definitions.

The [red/code](https://github.com/red/code) repository has also been filled with more demos using the new features, like color gradients and timers.

Other changes

New actions: **change, move**

New natives: **remove-each, new-line, new-line?, set-env, get-env, list-env, context?, enbase, now/time, browse**

New functions: **repend, overlap?, offset?, any-list?, number?, react, is, react?, clear-reactions, dump-reactions, make-dir, request-font, time?**

**Parse improvements**

- Added **change** command.
- **remove** also accepts, now, a position argument.
- Support for parsing binary! series.
- Several [bugs](https://github.com/red/red/issues?utf8=%E2%9C%93&q=is%3Aissue%20milestone%3A0.6.1%20is%3Aclosed%20%20parse) fixed.

Syntax for **change** command:

- CHANGE rule value
- CHANGE ONLY rule value
- CHANGE rule (expression)
- CHANGE ONLY rule (expression)
- CHANGE pos value
- CHANGE ONLY pos value
- CHANGE pos (expression)
- CHANGE ONLY pos (expression)

Example using rule syntax:

```
    a: "12abc34"
    alpha: charset [#"a" - #"z"]
    parse a [some [to alpha change [some alpha] dot]]
    a = "12.34"
```

Example using pos syntax:

```
    a: "12abc34"
    alpha: charset [#"a" - #"z"]
    parse a [some [to alpha b: some alpha change b dot]]
    a = "12.34"
```

**Console improvements**

- Filenames completion using TAB key.
- Font and color settings from new menu bar.
- Ctrl-K will erase to end of line (CLI console).
- Ctrl-D will remove character or exit like Ctrl-C if empty line (CLI console).
- Optimized speed of pasted code in console.

**Other improvements**

- Allows bitsets to be used as search pattern for **find** on any-string! series.
- **/next** refinement support for **do** and **load**.
- **/seek** and **/part** refinements added to **read**.
- Added **any-list!** typeset.
- Added **/with** refinement to pad function.
- Improved **split** function (though not final version).
- Added LF &lt;=&gt; CRLF conversions support to UTF-16 codec.
- **input** can now read from stdin when run from  a child process.
- Added **/same** refinement into **find** and **select** actions.
- Added binary! support for data and HMAC key to **checksum**.
- Reduced emitted code for setting struct members to float literals on IA-32.
- Allows **owned** property to be used by **modify** on objects.
- Compiler now accepts creating global op! values from object's functions.

A big number of tickets have also been processed, [110 bug fixes](https://github.com/red/red/issues?q=is%3Aclosed%20milestone%3A0.6.1) have been provided since 0.6.0 release. We have about 10% of open tickets which is more than usual, though not surprising after the last huge release, but only [22](https://github.com/red/red/issues?q=is%3Aopen%20is%3Aissue%20label%3Atype.bug) are actual bugs. Thanks for all the contributors who reported the issues and helped fix them, Red owes you a lot!

What's next?

On the road to Android support, we need to be able to properly wrap a Red app in a shared library, which is the main focus for the [next release](https://trello.com/c/wJRJhxBz/150-0-6-2-libred). Moreover, being able to build the Red runtime library only once, will greatly reduce compilation time (the runtime library is currently rebuilt on each compilation). As the work on this new feature is already quite advanced, we expect next release to occur during July, even if we always favor quality over arbitrary deadlines. ;-)

In the meantime, enjoy the new release!

Posted by [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055 "author profile") at [11:33 PM](https://www.red-lang.org/2016/06/061-reactive-programming.html "permanent link") [13 comments:](https://www.red-lang.org/2016/06/061-reactive-programming.html#comment-form) [![](https://resources.blogblog.com/img/icon18_edit_allbkg.gif)](https://www.blogger.com/post-edit.g?blogID=5936111837781935054&postID=1765795339927473072&from=pencil "Edit Post")

Labels: [console](https://www.red-lang.org/search/label/console), [demos](https://www.red-lang.org/search/label/demos), [GUI](https://www.red-lang.org/search/label/GUI), [parse](https://www.red-lang.org/search/label/parse), [reactive](https://www.red-lang.org/search/label/reactive), [time](https://www.red-lang.org/search/label/time)

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

[Newer Posts](https://www.red-lang.org/search?updated-max=2018-01-16T15%3A46%3A00%2B01%3A00&max-results=7&reverse-paginate=true "Newer Posts") [Older Posts](https://www.red-lang.org/search?updated-max=2016-03-25T23%3A33%3A00%2B01%3A00&max-results=7 "Older Posts") [Home](https://www.red-lang.org/)

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
  
  - [▼](javascript:void%280%29)  [December](https://www.red-lang.org/2016/12/) (2)
    
    - [Incursion into "explorable explanations" lands](https://www.red-lang.org/2016/12/incursion-into-explorable-explanations.html)
    - [Entering the World of Macros](https://www.red-lang.org/2016/12/entering-world-of-macros.html)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [July](https://www.red-lang.org/2016/07/) (2)
    
    - [Eve-style clock demo in Red, livecoded!](https://www.red-lang.org/2016/07/eve-style-clock-demo-in-red-livecoded.html)
    - [Native reactive spreadsheet in 17 LOC](https://www.red-lang.org/2016/07/native-reactive-spreadsheet-in-17-loc.html)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [June](https://www.red-lang.org/2016/06/) (1)
    
    - [0.6.1: Reactive Programming](https://www.red-lang.org/2016/06/061-reactive-programming.html)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [March](https://www.red-lang.org/2016/03/) (1)
    
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
