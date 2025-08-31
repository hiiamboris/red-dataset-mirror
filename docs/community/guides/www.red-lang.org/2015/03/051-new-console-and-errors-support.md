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

## March 15, 2015

[]()

### 0.5.1: New console and errors support

This new release brings many new features, improvements and some [bugfixes](https://github.com/red/red/issues?q=milestone%3A0.5.1%20is%3Aclosed) that will make Red more usable, especially for newcomers. The initial intent for this release was just to replace the existing console implementation, but it looked like the right time to finally implement also proper general error handling support.

New console engine

The old console code we were using so far for the Red REPL was never meant to last that long, but as usual in software development, temporary solutions tend to become more permanent than planned. Though, the old console code really needed a replacement, mainly for:

- removing the dependency to libreadline and libhistory, they were creating too many issues on the different Unix platforms, so became troublesome for many newcomers.

<!--THE END-->

- having a finer-grained control over keystrokes on text input, in order to implement convenient features like word completion.

<!--THE END-->

- having a bigger platform-independent part, so that we can add any kind of backends, like GUI ones, without duplicating too much code.

So, the new console code gets rid of third-party libraries and runs only on what the OS provides. The new features are:

- built-in history, accessible from **system/console/history**
- customizable prompt from **system/console/prompt**
- word and object path completion using TAB key
- ESC key support for interrupting a multi-line input

Other notable console-related improvements:

- **about** function now returns also the build timestamp.
- **what** function has now a more readable output.
- Console output speed on Windows is now very fast, thanks to the [patch](https://github.com/red/red/pull/1036) provided by Oldes for buffered output.

The console code is not in its final form yet, it needs to be even more modular and wrapped in a port! abstraction in the future.

Errors support

Red now supports first class errors as the **error!** datatype. They can be user-created or produced by the system. The error definitions are stored in the **system/catalog/errors** object.

```
 red>> help system/catalog/errors
 `system/catalog/errors` is an object! of value:
     throw            object!   [code type break return throw continue]
     note             object!   [code type no-load]
     syntax           object!   [code type invalid missing no-header no-rs-h...
     script           object!   [code type no-value need-value not-defined n...
     math             object!   [code type zero-divide overflow positive]
     access           object!   [code type]
     user             object!   [code type message]
     internal         object!   [code type bad-path not-here no-memory stack...
```

User errors can be created using **make** action followed by an error integer code or a block containing the category and error name:

```
 red>> make error! 402
 *** Math error: attempt to divide by zero
 *** Where: ???

 red>> make error! [math zero-divide]
 *** Math error: attempt to divide by zero
 *** Where: ???
```

These examples are displaying an error message because the error value is the returned value, we still need to implement a full exception handling mechanism using **throw/catch** natives in order to enable raising user errors that can interrupt the code flow. The error throwing sub-system is implemented and used by the Red runtime and interpreter, just not exposed to the user yet.

Errors can be trapped using the **try** native. An **error!** value will be returned if an error was generated and can be tested using the **error?** function.

```
 red>> a: 0 if error? err: try [1 / a][print "divide by zero"]
 divide by zero
 red>> probe err
 make error! [
    code: none
    type: 'math
    id: 'zero-divide
    arg1: none
    arg2: none
    arg3: none
    near: none
    where: '/
    stack: 3121680
 ]
 *** Math error: attempt to divide by zero
 *** Where: /
```

Currently the console will display errors if they are the last value. That behavior will be improved once the exception system for Red will be in place.

Errors when displayed from compiled programs, provide calling stack information to make it easier to locate the source code where the error originated from. For example:

```
    Red []
    
    print mold 3 / 0
```

will produce the following error once compiled and run:

```
    *** Math error: attempt to divide by zero
    *** Where: /
    *** Stack: print mold /
```

SORT action

Sorting data is now supported in Red, in a polymorphic way as in Rebol. The **sort** action is very versatile and useful. Let's start from a basic example:

```
    scores: [2 3 1 9 4 8]
    sort scores
    == [1 2 3 4 8 9]
```

As you can see, **sort** modifies the argument series, you can keep the series unchanged by using **copy** when passing it as argument:

```
    str: "CgBbefacdA"
    sort copy str
    == "aABbCcdefg"
    sort/case copy str
    == "ABCabcdefg"
    str
    == "CgBbefacdA"
```

By default, sorting is not sensitive to character cases, but you can make it sensitive with the **/case** refinement.

You can use **/skip** refinement to specify how many elements to ignore, it's handy when you need to sort records of a fixed size.

```
    name-ages: [
        "Larry" 45
        "Curly" 50
        "Mo" 42
    ]
    sort/skip name-ages 2
    == ["Curly" 50 "Larry" 45 "Mo" 42]
```

The **/compare** refinement can be used to specify how to perform the comparison. (It does not yet support block! as argument)

```
    names: [
        "Larry"
        "Curly"
        "Mo"
    ]
    sort/compare names func [a b] [a > b]
    == ["Mo" "Larry" "Curly"]
```

Combining it with **/skip** refinement, you can do some complex sorting task.

```
    name-ages: [
        "Larry" 45
        "Curly" 50
        "Mo" 42
    ]
    sort/skip/compare copy name-ages 2 2    ;-- sort by 2nd column
    == ["Mo" 42 "Larry" 45 "Curly" 50]
```

The **/all** refinement will force the entire record to be passed to the compare function. This is useful if you need to compare one or more fields of a record while also doing a skip operation. In the following example, sorting is done by the second column, in descending order:

```
    sort/skip/compare/all name-ages 2 func [a b][a/2 > b/2]
    == ["Curly" 50 "Larry" 45 "Mo" 42]
```

Sort uses [Quicksort](http://en.wikipedia.org/wiki/Quicksort) as its default sorting algorithm. Quicksort is very fast, but it is an [unstable sorting](http://en.wikipedia.org/wiki/Sorting_algorithm#Stability)  algorithm. If you need stable sorting, just add **/stable** refinement, it will then use [Merge](http://en.wikipedia.org/wiki/Merge_sort) algorithm instead to perform the sort.

New datatypes

A couple of new datatypes were added in this release, mostly because of internal needs in Red runtime to support the new features.

The **typeset!** datatype has been fully implemented, and is on par with the Rebol3 version. A typeset! value is a set of datatypes stored in a compact array of bits (up to 96 bits). Datatype lookups are very fast in typesets and they are mostly used internally for runtime type-checking support. The following actions are supported on typeset! values: **make, form, mold, and, or, xor, complement, clear, find, insert, append, length?**. Comparison operators are also supported.

A preliminary implementation of the **vector!** datatype is also part of this release. A vector! value is a series of number values of same datatype. The internal implementation uses a more compact memory storage format than a block! would do, while, on the surface, behaving the same way as other series. Only 32-bit integer values can be stored for now in vectors. The following actions are supported by vector! values: **make, form, mold, at, back, head, head?, index?, insert, append, length?, next, pick, skip, tail, tail?**. The implementation will be completed in future releases.

Runtime type checking support

It has finally being implemented, as proper error handling support is now available. So from this release on, function arguments types will be check against the function specification and non-conforming cases will result in an error. Return value type-checking will be added later.

The type-checking might break some existing Red code around that was letting silently pass invalid arguments, so check your code with this new release before upgrading.

The compiler does not do any type checking yet, that will be added at a later stage (though, don't expect too much from it, unless you annotate with types every function exhaustively).

Also notice that the runtime type-checking implementation is making the Red interpreter a little bit faster, thanks to a new optimized way to handle function specification blocks (an optimized spec block is cached after first call, resulting in much faster processing time afterwards).

Red/System improvements

Exceptions handling has been [improved](http://static.red-lang.org/red-system-specs-light.html#section-10.2), introducing the **catch** statement allowing to catch exceptions using an integer filtering value. Here is a simple example in the global context:

```
    Red/System []

    catch 100 [
        print "hello"
        throw 10
        print "<hidden>"
    ]
    print " world"
```

will output

```
    hello world
```

The integer argument for **catch** intercepts only exceptions with a lower value, providing a simple, but efficient filtering system.

In addition to that, uncaught exceptions are now properly reporting a runtime error instead of passing silently. This new enhanced low-level exception system is supporting the new higher-level Red error handling system.

A couple of new compiler directives have been also added in order to strengthen the interfacing with Red layer:

```
    #get <path>
```

The #get directive returns a red-value! pointer on a value referred by a Red object path. This is used internally in the runtime to conveniently access the Red system object content from Red/System code. This directive will be extended in the future to access also words from Red global context.

```
    #in <path> <word>
```

The #in directive returns a red-word! pointer to a Red word bound to the object context referred by path.

What's next?

In addition to many minor pending improvements, we will be working on a minor release that will introduce the Redbin format for accurately serialize Red values in binary form. Redbin format will be used to make the compilation process much faster, as it currently slows down pretty quickly as the Red-level environment code size grows up.

Enjoy this new release! :-)

Posted by [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055 "author profile") at [8:50 AM](https://www.red-lang.org/2015/03/051-new-console-and-errors-support.html "permanent link") [![](https://resources.blogblog.com/img/icon18_edit_allbkg.gif)](https://www.blogger.com/post-edit.g?blogID=5936111837781935054&postID=3404862643335603144&from=pencil "Edit Post")

Labels: [console](https://www.red-lang.org/search/label/console), [exceptions](https://www.red-lang.org/search/label/exceptions), [runtime errors](https://www.red-lang.org/search/label/runtime%20errors), [sorting](https://www.red-lang.org/search/label/sorting), [type-checking](https://www.red-lang.org/search/label/type-checking), [typeset](https://www.red-lang.org/search/label/typeset), [vector](https://www.red-lang.org/search/label/vector)

[]()

#### 8 comments:

1. ![](//www.blogger.com/img/blogger_logo_round_35.png)
   
   [Unknown](https://www.blogger.com/profile/15425728698688677990)[March 15, 2015 at 2:35 PM](https://www.red-lang.org/2015/03/051-new-console-and-errors-support.html?showComment=1426426536094#c1831183251548537088)
   
   Good News!
   
   [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/1831183251548537088)
   
   [Replies]()
   
   1. [Reply]()
2. ![](//resources.blogblog.com/img/blank.gif)
   
   Anonymous[March 15, 2015 at 8:38 PM](https://www.red-lang.org/2015/03/051-new-console-and-errors-support.html?showComment=1426448300732#c5092515367816895877)
   
   You guys rock! Thanks for the vision and the hard work. Now it will be much more fun to play! -gnat
   
   [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/5092515367816895877)
   
   [Replies]()
   
   1. [Reply]()
3. ![](//resources.blogblog.com/img/blank.gif)
   
   [GregP](http://www.digicamsoft.com)[March 16, 2015 at 9:28 AM](https://www.red-lang.org/2015/03/051-new-console-and-errors-support.html?showComment=1426494486099#c1935563701637964474)
   
   0.5.1 sounds like a minor version from 0.5.0 but - Wow! - many things addressed!
   
   [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/1935563701637964474)
   
   [Replies]()
   
   1. [Reply]()
4. ![](//resources.blogblog.com/img/blank.gif)
   
   Anonymous[March 16, 2015 at 4:12 PM](https://www.red-lang.org/2015/03/051-new-console-and-errors-support.html?showComment=1426518751607#c2295732842582021052)
   
   how many versions of red are there?
   
   [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/2295732842582021052)
   
   [Replies]()
   
   1. [Reply]()
5. ![](//resources.blogblog.com/img/blank.gif)
   
   Anonymous[March 16, 2015 at 5:46 PM](https://www.red-lang.org/2015/03/051-new-console-and-errors-support.html?showComment=1426524414495#c5750998069424145951)
   
   The 0.51 download for iOS appears to be 0.50 based on "about" and missing features? Would someone please take a look?  
   red&gt;&gt; about  
   Red 0.5.0
   
   [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/5750998069424145951)
   
   [Replies]()
   
   1. ![](//resources.blogblog.com/img/blank.gif)
      
      Anonymous[March 17, 2015 at 10:05 PM](https://www.red-lang.org/2015/03/051-new-console-and-errors-support.html?showComment=1426626323625#c5514612588170808708)
      
      I tested the red-051 on my Mac (Yosemite - 10.10.2), and no problem detected.  
      red&gt;&gt; about  
      Red 0.5.1 - 17-Mar-2015/21:54:46+1:00
      
      Stéphane
      
      [Delete](https://www.blogger.com/comment/delete/5936111837781935054/5514612588170808708)
      
      [Replies]()
      
      1. [Reply]()
      
      [Reply]()
6. ![](//resources.blogblog.com/img/blank.gif)
   
   Anonymous[March 18, 2015 at 3:01 AM](https://www.red-lang.org/2015/03/051-new-console-and-errors-support.html?showComment=1426644067928#c3829131226120746899)
   
   Did you download from the downloads page ON THIS SITE (I suspect not)? That is what I am doing ....and I just did it again, very carefully. There is a red button at the top which suggests "Download Red 0.5.1 for MacOSX". (and for some strange reason it says it is "0 KB" on this site...but it downloads. Here is a cut and paste from my terminal window:  
   \-rwxr-xr-x@ 1 steve staff 821672 17 Mar 18:44 red-051  
   Steves-MacBook-Air:~ steve$ ./red-051
   
   -=== Red Console alpha version ===-  
   Type HELP for starting information.
   
   red&gt;&gt; about  
   Red 0.5.0  
   red&gt;&gt;
   
   -gnat
   
   [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/3829131226120746899)
   
   [Replies]()
   
   1. [Reply]()
7. ![](//resources.blogblog.com/img/blank.gif)
   
   Anonymous[March 18, 2015 at 3:21 AM](https://www.red-lang.org/2015/03/051-new-console-and-errors-support.html?showComment=1426645265304#c1191744213965671175)
   
   Ok "earl" on stackoverflow just said I should:  
   gnat Try deleting /tmp/red/console and re-run the red-051 binary.  
   Which caused a recompile and fixed the problem. Live and learn. NOW I get to play!!!!
   
   [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/1191744213965671175)
   
   [Replies]()
   
   1. [Reply]()

[Add comment]()

[Load more...]()

[]()

[](https://www.blogger.com/comment/frame/5936111837781935054?po=3404862643335603144&hl=en&saa=85391&origin=https%3A%2F%2Fwww.red-lang.org)

[Newer Post](https://www.red-lang.org/2015/04/052-case-folding-and-hash-support.html "Newer Post") [Older Post](https://www.red-lang.org/2015/01/dream-big-work-hard-and-make-it-happen.html "Older Post") [Home](https://www.red-lang.org/)

Subscribe to: [Post Comments (Atom)](https://www.red-lang.org/feeds/3404862643335603144/comments/default)

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

- [►](javascript:void%280%29)  [2016](https://www.red-lang.org/2016/) (6)
  
  - [►](javascript:void%280%29)  [December](https://www.red-lang.org/2016/12/) (2)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [July](https://www.red-lang.org/2016/07/) (2)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [June](https://www.red-lang.org/2016/06/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [March](https://www.red-lang.org/2016/03/) (1)

<!--THE END-->

- [▼](javascript:void%280%29)  [2015](https://www.red-lang.org/2015/) (6)
  
  - [►](javascript:void%280%29)  [December](https://www.red-lang.org/2015/12/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [June](https://www.red-lang.org/2015/06/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [April](https://www.red-lang.org/2015/04/) (2)
  
  <!--THE END-->
  
  - [▼](javascript:void%280%29)  [March](https://www.red-lang.org/2015/03/) (1)
    
    - [0.5.1: New console and errors support](https://www.red-lang.org/2015/03/051-new-console-and-errors-support.html)
  
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
