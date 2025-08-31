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

[Newer Posts](https://www.red-lang.org/search?updated-max=2018-01-16T15%3A46%3A00%2B01%3A00&max-results=7&reverse-paginate=true "Newer Posts") [Older Posts](https://www.red-lang.org/search?updated-max=2016-12-02T18%3A25%3A00%2B01%3A00&max-results=7 "Older Posts") [Home](https://www.red-lang.org/)

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
