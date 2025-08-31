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

## August 20, 2020

[]()

### Red/System: New Features

In the past months, many new features were added to Red/System, the low-level dialect embedded in Red. Here is a sum up if you missed them.

## Subroutines

During the work on the low-level parts of the [new Red lexer](https://www.red-lang.org/2020/08/a-new-fast-and-flexible-lexer.html), the need arised for intra-function factorization abilities to keep the lexer code as [DRY](https://en.wikipedia.org/wiki/Don%27t_repeat_yourself) as possible. Subroutines were introduced to solve that. They act as the [GOSUB](https://www.c64-wiki.com/wiki/GOSUB) directive from Basic language. They are defined as a separate block of code inside a function's body and are called like regular functions (but without any arguments). So they are much lighter and faster than real function calls and require just one slot of stack space to store the return address. 

The declaration syntax is straightforward:

```
    <name>: [<body>]

    <name> : subroutine's name (local variable).
    <body> : subroutine's code (regular R/S code).
```

To define a subroutine, you need to declare a local variable with the subroutine! datatype, then set that variable to a block of code. You can then invoke the subroutine by calling its name from anywhere in the function body (but after the subroutine own definition).

Here is a first example of a fictive function processing I/O events:

```
    process: func [buf [byte-ptr!] event [integer!] return: [integer!]
        /local log do-error [subroutine!]
    ][
        log: [print-line [">>" tab e "<<"]]
        do-error: [print-line ["** Error:" e] return 1]
    
        switch event [
            EVT_OPEN  [e: "OPEN"  log unless connect buf [do-error]]
            EVT_READ  [e: "READ"  log unless receive buf [do-error]]
            EVT_WRITE [e: "WRITE" log unless send buf    [do-error]]
            EVT_CLOSE [e: "CLOSE" log unless close buf   [do-error]]
            default   [e: "<unknown>" do-error]
        ]
        0
    ]
```

This second example is more complete. It shows how subroutines can be combined and how values can be returned from a subroutine:

```
    #enum modes! [
    	CONV_UPPER
    	CONV_LOWER
    	CONV_INVERT
    ]

    convert: func [mode [modes!] text [c-string!] return: [c-string!]
        /local
            lower? upper? alpha? do-conv [subroutine!]
            delta [integer!]
            s     [c-string!]
            c     [byte!]
    ][
        lower?:  [all [#"a" <= c c <= #"z"]]
        upper?:  [all [#"A" <= c c <= #"Z"]]
        alpha?:  [any [lower? upper?]]
        do-conv: [s/1: s/1 + delta]
        delta:   0
        s:       text

        while [s/1 <> null-byte][
            c: s/1
            if alpha? [
                switch mode [
                    CONV_UPPER  [if lower? [delta: -32 do-conv]]
                    CONV_LOWER  [if upper? [delta: 32 do-conv]]
                    CONV_INVERT [delta: either upper? [32][-32] do-conv]
                    default     [assert false]
                ]
            ]
            s: s + 1
        ]
        text
    ]
    
    probe convert CONV_UPPER "Hello World!"
    probe convert CONV_LOWER "There ARE 123 Dogs."
    probe convert CONV_INVERT "This SHOULD be INVERTED!"
```

will output:

```
    HELLO WORLD!
    there are 123 dogs.
    tHIS should BE inverted!
```

Support for getting a subroutine address and dispatching dynamically on it is planned to be added in the future (something akin [computed GOTO](https://en.wikipedia.org/wiki/Goto#Computed_GOTO_and_Assigned_GOTO)). More examples of subroutines can be found in the new lexer code, like in the [load-date](https://github.com/red/red/blob/master/runtime/lexer.reds#L1689) function.

## New system intrinsics

Several new extensions to the [system](https://static.red-lang.org/red-system-specs.html#section-13) path have been added.

### Lock-free atomic intrinsics

A simple low-level OS threads [wrapper API](https://github.com/red/red/blob/master/runtime/threads.reds) has been added internally to the Red runtime as preliminary work on supporting parts of IO concurrency and parallel processing in the future. In order to complement it, a set of atomic intrinsics were added to enable the implementation of [lock-free](https://preshing.com/20120612/an-introduction-to-lock-free-programming/) and wait-free [algorithms](https://en.wikipedia.org/wiki/Non-blocking_algorithm) in a multithreaded execution context.

The new atomic intrinsics are all documented [here](https://static.red-lang.org/red-system-specs.html#section-13.24). Here is a quick overview:

- **system/atomic/fence**: generates a read/write data memory barrier.
- **system/atomic/load**: thread-safe atomic read from a given memory location.
- **system/atomic/store**: thread-safe atomic write to a given memory location.
- **system/atomic/cas**: thread-safe atomic compare&amp;swap to a given memory location.
- **system/atomic/&lt;math-op&gt;**: thread-safe atomic math or bitwise operation to a given memory location (add, sub, or, xor, and).

Other new intrinsics

- **system/stack/allocate/zero**: allocates a storage space on stack and zero-fill it.
- **system/stack/push-all**: saves all registers to stack.
- **system/stack/pop-all**: restores all registers from stack.
- **system/fpu/status**: retrieves the FPU exception bits status as a 32-bit integer.

## Improved literal arrays

The main change is the removal of the hidden size inside the /0 index slot. The size of a literal array can now only be retrieved using the **size?** keyword, which is resolved at compile time (rather than run-time for /0 index access).

A notable addition is the support for [binary arrays](file:///C:/Dev/Red/docs/red-system/red-system-specs-light.html#section-4.8.7). Those arrays can be used to store byte-oriented tables or embed arbitray binary data into the source code. For example:

```
    table: #{0042FA0100CAFE00AA}
    probe size? table                      ;-- outputs 9
    probe table/2                          ;-- outputs "B"
    probe as integer! table/2              ;-- outputs 66
```

The new Red lexer code uses them [extensively](https://github.com/red/red/blob/master/runtime/lexer.reds#L102).

## Variables and arguments grouping

It is now possible to group the type declaration for local variables and function arguments. For example:

```
    foo: func [
        src dst    [byte-ptr!]
        mode delta [integer!]
        return:    [integer!]
        /local
            p q buf  [byte-ptr!]
            s1 s2 s3 [c-string!]
    ]
 
```

Note that the compiler supports those features through code expansion at compile time, so that error reports could show each argument or variable having its own type declaration.

## Integer division handling

Integer division handling at low-level has notorious shortcomings with different handling for each edge case depending on the hardware platform. Intel IA-32 architecture tends to handle those cases in  a slightly safer way, while ARM architecture produces erroneous results silently typically for the following two cases:

- division by zero
- division overflow (-2147483648 / -1)

IA-32 CPU will generate an exception, while ARM ones will return invalid results (respectively 0 and -2147483648). This makes it difficult to produce code that will behave the same on both architectures when integer divisions are used. In order to reduce this gap, R/S compiler will now generate extra code to detect those cases for ARM targets and raise a runtime exception. Such extra checkings for ARM are produced only in debug compilation mode. In release mode, priority is given to performance, no runtime exception will occur in such cases on ARM (as the overhead is significant). So, be sure to check your code on ARM platform thoroughly in debug mode before releasing it. This is not a perfect solution, but at least, it makes it possible to detect those cases through testing in debug mode.

## Others

Here is a list of other changes and fixes in no particular order:

- Cross-referenced aliased fields in structs defined in same context are now allowed. Example:
  
  ```
      a!: alias struct! [next [b!] prev [b!]]
      b!: alias struct! [a [a!] c [integer!]]
  ```
- -0.0 special float literal is now supported.
- +1.#INF is also now supported as valid literal in addition to 1.#INF for positive infinite.
- Context-aware get-words resolution.
- New **#inline** [directive](https://static.red-lang.org/red-system-specs.html#section-16.11) to inline assembled binary code.
- Dropped support for % and // operators on float types, as they were relying on FPU's relative support, the results were not reliable across platforms. Use **fmod** function instead from now on.
- Added **--show-func-map** compilation option: when used, it will output a map of R/S function addresses/names, to ease low-level debugging.
- FIX: issue #4102: ASSERT false doesn't work.
- FIX: issue #4038: cast integer to float32 in math expression gives wrong result.
- FIX: byte! to integer! conversion not happening in some cases. Example: i: as-integer (p/1 - #"0")
- FIX: compiler state not fully cleaned up after premature termination. This affects multiple compilation jobs done in the same Rebol2 session, resulting in weird compilation errors.
- FIX: issue #4414: round-trip pointer casting returns an incorrect result in some cases.
- FIX: literal arrays containing true/false words could corrupt the array. Example: a: \["hello" true "world" false]
- FIX: improved error report on bad **declare** argument.

Posted by [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055 "author profile") at [12:54 PM](https://www.red-lang.org/2020/08/redsystem-new-features.html "permanent link") [![](https://resources.blogblog.com/img/icon18_edit_allbkg.gif)](https://www.blogger.com/post-edit.g?blogID=5936111837781935054&postID=8652286535750268339&from=pencil "Edit Post")

Labels: [arrays](https://www.red-lang.org/search/label/arrays), [bugfixes](https://www.red-lang.org/search/label/bugfixes), [compilation](https://www.red-lang.org/search/label/compilation), [exceptions](https://www.red-lang.org/search/label/exceptions), [features](https://www.red-lang.org/search/label/features), [floating point](https://www.red-lang.org/search/label/floating%20point), [FPU](https://www.red-lang.org/search/label/FPU), [IA-32](https://www.red-lang.org/search/label/IA-32), [literal arrays](https://www.red-lang.org/search/label/literal%20arrays), [math](https://www.red-lang.org/search/label/math), [pointers](https://www.red-lang.org/search/label/pointers), [red/system](https://www.red-lang.org/search/label/red%2Fsystem), [runtime errors](https://www.red-lang.org/search/label/runtime%20errors), [VFP](https://www.red-lang.org/search/label/VFP)

[]()

#### 7 comments:

1. ![](//www.blogger.com/img/blogger_logo_round_35.png)
   
   [Giuseppe Chillemi](https://www.blogger.com/profile/09888870416599008229)[August 20, 2020 at 6:31 PM](https://www.red-lang.org/2020/08/redsystem-new-features.html?showComment=1597941118481#c6353973120696530187)
   
   I want to be the first to congratulate for such great work. It's a source of inspiration to have the knowledge to use everything inside.
   
   [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/6353973120696530187)
   
   [Replies]()
   
   1. [Reply]()
2. ![](//www.blogger.com/img/blogger_logo_round_35.png)
   
   [-pekr-](https://www.blogger.com/profile/07020449092496153923)[August 21, 2020 at 7:08 AM](https://www.red-lang.org/2020/08/redsystem-new-features.html?showComment=1597986500006#c8539035383853269975)
   
   Thanks for improving Red/System, this is so cool! What I like most is the new lock-free atomic intrinsics for future concurrency and parallel processing developments. So refreshing! :-)
   
   [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/8539035383853269975)
   
   [Replies]()
   
   1. [Reply]()
3. ![](//blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhm2fJujS5ibxT9ijvuTc2z92wrALQ0taviG-2vkkJ-gI54c4yngmgZETAqNiM_XXr9tCDU50RMA-dQ6Qb_pZ20BTG51BfRq1ViSz8Ae0Ca1eWn3ljahQqYjvcI6VPAPDUGST8/s45-c/Cormac-McCarthys-typewrit-001.jpg)
   
   [jasonic](https://www.blogger.com/profile/05180253006807942199)[August 31, 2020 at 2:35 AM](https://www.red-lang.org/2020/08/redsystem-new-features.html?showComment=1598834107474#c7247592542051413249)
   
   Impressive creative solid work  
   Keep on keeping on !
   
   [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/7247592542051413249)
   
   [Replies]()
   
   1. [Reply]()
4. ![](//resources.blogblog.com/img/blank.gif)
   
   Anonymous[February 1, 2021 at 6:10 PM](https://www.red-lang.org/2020/08/redsystem-new-features.html?showComment=1612199410095#c8702683835741204072)
   
   Expecting much better performance now onwards with these changes...
   
   [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/8702683835741204072)
   
   [Replies]()
   
   1. [Reply]()
5. ![](//www.blogger.com/img/blogger_logo_round_35.png)
   
   [Inetw3](https://www.blogger.com/profile/04156328452325428764)[March 3, 2021 at 3:37 AM](https://www.red-lang.org/2020/08/redsystem-new-features.html?showComment=1614739044339#c5833848464164141290)
   
   Hello RED team. The last post here was April 20 and on Twitter Red-lang, Oct 20, of last year. Never feel like the teams posts must be somewhat ground breaking or totally exciting to the general reader/supporter. We and new interested parties must see you are still supporting your own vision or like a slow loading web page they'll be forced to move on. Even the dogs get scraps from there masters table when there really hungered.
   
   [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/5833848464164141290)
   
   [Replies]()
   
   1. [Reply]()
6. ![](//blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgAwscySCJ8TzMkUKef4sa05w_LzGJ311_CLrGA_WW5X2rV6VRtV-B_j5zFC6BmAfB0u9aHlo7lZ_ZXDgS3FujIBFqN2EcH9Lm6x1nopl_4CVOeejXTPmVi9-DGx_mstq8/s45-c/*)
   
   [Brian Dickens](https://www.blogger.com/profile/01873914328480997979)[January 3, 2022 at 12:10 PM](https://www.red-lang.org/2020/08/redsystem-new-features.html?showComment=1641208222260#c3270224228110340211)
   
   Honestly one of the things that bugs me the most about this post is ragging on Zortech. You guys really, really don't know what you're talking about and never have. History won't be kind when they look back at this story.
   
   [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/3270224228110340211)
   
   [Replies]()
   
   1. [Reply]()
7. ![](//blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgAwscySCJ8TzMkUKef4sa05w_LzGJ311_CLrGA_WW5X2rV6VRtV-B_j5zFC6BmAfB0u9aHlo7lZ_ZXDgS3FujIBFqN2EcH9Lm6x1nopl_4CVOeejXTPmVi9-DGx_mstq8/s45-c/*)
   
   [Brian Dickens](https://www.blogger.com/profile/01873914328480997979)[January 3, 2022 at 12:22 PM](https://www.red-lang.org/2020/08/redsystem-new-features.html?showComment=1641208951363#c4662025657374561894)
   
   Soundbite again, for emphasis: "Stop blaming the fact that Twitter scales on that you can't code. You sound like Carl."
   
   [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/4662025657374561894)
   
   [Replies]()
   
   1. [Reply]()

[Add comment]()

[Load more...]()

[]()

[](https://www.blogger.com/comment/frame/5936111837781935054?po=8652286535750268339&hl=en&saa=85391&origin=https%3A%2F%2Fwww.red-lang.org)

[Newer Post](https://www.red-lang.org/2021/08/long-time-no-blog.html "Newer Post") [Older Post](https://www.red-lang.org/2020/08/a-new-fast-and-flexible-lexer.html "Older Post") [Home](https://www.red-lang.org/)

Subscribe to: [Post Comments (Atom)](https://www.red-lang.org/feeds/8652286535750268339/comments/default)

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

- [▼](javascript:void%280%29)  [2020](https://www.red-lang.org/2020/) (4)
  
  - [▼](javascript:void%280%29)  [August](https://www.red-lang.org/2020/08/) (2)
    
    - [Red/System: New Features](https://www.red-lang.org/2020/08/redsystem-new-features.html)
    - [A New Fast and Flexible Lexer](https://www.red-lang.org/2020/08/a-new-fast-and-flexible-lexer.html)
  
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
