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

## June 12, 2015

[]()

### 0.5.4: New datatypes, exceptions and set operations

This new version turned out to be a major release, given the vast number of new features which made their way into it. Hope it was worth the waiting. ;-)

In preparation for the GUI support and the DSL that will come with it, a new range of datatypes has been implemented.

Pair! datatype

A pair is a couple of integer! values used to represent mainly dimensions and coordinates. Its literal representation separates the two integers by an \`x\` character.

```
    1x2
    -56x1234
    -3x-8
```

Pair! is a scalar datatype that supports math and bitwise operations.

```
    1x2 + 2x3
    == 3x5

    3x4 * 2x3
    == 6x12

    10x10 * 2
    == 20x20

    60x10 % 4
    == 0x2
```

To access pair elements, path syntax provides a handy way. The left value is referenced by \`x\` or just 1, the right value is referenced by \`y\` or just 2.

```
    a: 5x6
    a/x
    == 5
    a/y
    == 6

    b: a + 10x1
    b/1
    == 15
    b/2
    == 7
```

It also works for modifying pair elements.

```
    a: 5x6
    a/x: 0
    a/2: -1
    a
    == 0x-1
```

A pair! can be constructed using different approaches, depending on how pair elements are provided (as separate values or as a block).

```
    as-pair 3 4
    == 3x4

    make pair! [4 5]
    == 4x5

    make pair! 10
    == 10x10
```

The following notable actions are supported on pairs: **random,** **absolute, add, divide, multiply, negate, remainder, subtract, and, or, xor, pick, reverse**.

Pair! will be extended in the future to handle float values, in addition to integers.

Percent! datatype

Percent! provides an elegant way to represent numbers as fractions of 100 using a natural syntax:

```
    20%
    -45.285%
    0.1%
    100%
```

As it is implemented using a 64-bit float internally, it supports all the same math actions and operations as float! values, namely: **random, absolute, add, divide, multiply, negate, power, remainder, round, subtract**.

```
    20 * 80%
    == 16
    33,33% * 250
    == 83.325
```

Tuple! datatype

The tuple! datatype is a finite list of 3 up to 12 bytes. It offers a versatile way to represent different kind of values like:

Version numbers:

```
    0.5.4
    1.0.0
    2.10.120
```

RGB colors:

```
    red
    == 255.0.0
    blue
    == 0.0.255
    orange
    == 255.150.10
```

or IPv4 addresses:

```
    127.0.0.1
    192.168.1.1
    255.255.0.0
```

Once a tuple! value is created, its size cannot be changed anymore (it is not a series!), but its elements can still be modified, using, for example, path syntax.

```
    ip: 192.168.0.0
    ip/1
    == 192
    ip/4: 1
    ip
    == 192.168.0.1
```

The following actions are supported by tuple! values: **random, add, divide, multiply, remainder, subtract, and, or, xor, length?, pick, poke, reverse**.

```
    1.2.3 + 100.10.1
    == 101.12.4

    255.0.0 or 0.128.0
    == 255.128.0

    192.168.2.1 and 255.255.0.0
    == 192.168.0.0

    green + blue = cyan
    == true

    red + green = yellow
    == true
```

Math operations are allowed with some other scalar datatypes, like **integer!**, **float!** and **percent!**.

```
    1.2.3 * 2
    == 2.4.6

    red * 33%
    == 84.0.0

    blue / 2
    == 0.0.127
```

Tip: in order to get the list of all predefined color names from console, just use:

```
    red>> help tuple!
```

We are considering for a future release, the option of extending the tuples with 3 or 4 elements to 16-bit values, as the internal storage space allow us to do so. This would make possible to support color values with up to 16-bit per component and version numbers with high build values.

Map! datatype

This datatype provides a dictionary-like data structure, to make it easy to store key/value pairs while providing very fast lookups. Internally, keys are stored in an hashtable, using our existing MurmurHash3 implementation.

The map! datatype has its own literal format:

```
    #(a: 3 b: "hello" c: 10)
    == #(
        a: 3
        b: "hello"
        c: 10
    )
```

Keys can be any value among the following datatypes: **any-word!, any-string!, integer!, float!, char!**.

Reading and setting keys and values in maps can be done using the familiar path syntax.

```
    m: #(a: 3 b: "hello" c: 10)
    m/a
    == 3
    m/b: 14
    m
    == #(
        a: 3
        b: 14
        c: 10
    )
```

In addition to that, some actions can be used when keys are not words, or when paths are not the best fit.

```
    select m 'a
    == 3
    put m 'a 42
    put m "Monday" "pizza"
    m
    == #(
        a: 42
        b: 14
        c: 10
        "Monday" "pizza"
    )
```

The new **put** action works as a counterpart of **select**, changing the value associated with a key. It will be extended to act on all series in the future.

Read more about map! in the [specification](http://doc.red-lang.org/Map!.html) document.

Exception handling

Red now provides a more complete exception system, allowing to **throw** and **catch** exceptions in a convenient way.

Syntax

```
    throw <value>
    throw/name <value> <name>

    catch [...]
    catch/name [...] <names>

    <value> : any value
    <name>  : a word for naming the exception
    <names> : a name or block of names
```

A **throw** will interrupt the code flow and go back up through the call stack, until a **catch** is reached, then resume execution just after it. By default, exceptions are anonymous, but for finer-grained control, they can be named through the **/name** refinement, targeting one or several specific **catch** statements.

```
    catch  [print "Hello" throw 1 print "John"]
    "Hello"
    == 1
```

**Catch** will catch all thrown exceptions and return the thrown value. If **/name** is used, only the matching named exceptions will be caught, all the others will pass through it.

If an exception is not caught by a **catch** call, it will result in a runtime error.

```
    red>> throw 1
    *** Throw error: no catch for throw: 1
    *** Where: throw
```

In order to improve the ability to handle both errors and thrown exceptions at the same time, **try** has been extended with a new **/all** refinement, allowing it to catch all possible forms of exceptions, including **return, exit, break** and **continue** misuses. It is an ultimate barrier in your code, to handle runtime issues.

Set operations

Set operations are now fully supported:

- **union**: returns the union of two data sets.
- **exclude**: returns the first data set less the second data set.
- **intersect**: returns the intersection of two data sets.
- **difference**: returns all the values which differ from two data sets.

Those operations can be applied on following datatypes: **block!, string!, bitset!, typeset!**. (**Hash!** datatype support will be added in the next release)

In order to produce [sets](https://en.wikipedia.org/wiki/Set_%28abstract_data_type%29) out of block! and string! values, a **unique** operation is provided:

- **unique**: returns the data set with duplicates removed.

```
    union [a b c] [d a hello 123]
    == [a b c d hello 123]

    intersect [2 6 3 4 2] [5 6 9 4 3]
    == [6 3 4]

    unique "hello red world"
    == "helo rdw"
```

A **/case** refinement is provided for performing case-sensitive set operations (default is case-insensitive).

The **/skip** refinement allows to process series arguments in a record-oriented way.

Note: all these operations are implemented using hashtables internally, in order to ensure the best performances.

New natives

**as-pair**

Returns a pair! value made out of two integer arguments.

```
    as-pair <x> <y>

    <x> : integer x value
    <y> : integer y value
```

Example:

```
    as-pair 2 3
    == 2x3
```

**break**

Exits a loop and resume evaluation after it. Can optionally return a value from the loop.

```
    break
    break/return <value>

    <value> : returned value, any type.
```

Example:

```
    loop 3 [print "hi!" break print "hidden"]
    hi!
```

**continue**

Interrupts a loop evaluation flow and resume at next loop iteration.

```
    continue
```

Example:

```
    loop 3 [print "hi!" continue print "hidden"]
    hi!hi!hi!
```

**extend**

Adds pairs of keys and values to an aggregate value. If the key is already defined, it will replace its value. Additions are done in a case-preserving way. Default lookups are case-insensitive, a **/case** refinement can optionally enforce case-sensitivity.

```
    extend <aggregate> <spec>
    extend/case <aggredate> <spec>

    <aggregate> : an object! or a map! value
    <spec>      : a block of key and values pairs
```

*Note: support for object! is not implemented yet.*

Example:

```
    m: #(a: 3)
    extend m [b: 4 "c" 123]
    m
    == #(
        a: 3
        b: 4
        "c" 123
    )
```

New action

A new **put** action has been added in order to provide a modifying counterpart to the **select** action. **Select** offers a way to access series values as if they were associative data structures. **Put** and **select** are natural accessor actions for objects and maps. Default lookups are case-insensitive.

```
    put <aggregate> key value
    put/case <aggregate> key value
```

*Note: PUT support is only implemented for map! values for now, series and objects support will come in a future release.*

Example:

```
    m: #(a: 1)
    put m 'a 2
    m
    == #(
        a: 2
    )
```

New function

**cause-error**

Causes an immediate error throw, with the provided information. Use it to generate standard or custom errors.

```
    cause-error <type> <id> <arguments>

    <type>      : word representing an error class
    <id>        : word representing an error definition
    <arguments> : a block of optional arguments (can be empty)
```

Error classes and definitions can be inspected using:

```
    help system/catalog/errors
```

Example:

```
    red>> cause-error 'math 'zero-divide []
    *** Math error: attempt to divide by zero
    *** Where: do
```

Red/System additions

New natives were added in order to better support new Red features:

- [break](http://static.red-lang.org/red-system-specs.html#section-9.6)
- [continue](http://static.red-lang.org/red-system-specs.html#section-9.7)
- [loop](http://static.red-lang.org/red-system-specs.html#section-9.3)

Other changes

The global symbol table is now hashed, so lookups are now **very fast** and the startup time of Red runtime greatly improved. On fast modern hardware, there is no noticeable difference, but on low-end or old hardware, it can be very significant.

**Set** and **get** natives have been extended to allow path arguments, to access a word within an associative structure (an object or a map). Moreover, they also feature a **/case** refinement now, allowing to distinguish target words by case (useful for maps).

Collation tables that were visible in **system/locale** are temporarily hidden now, until we figure out a better way to expose that feature to users, without allowing nasty errors caused by race conditions (loading a script that changes the tables unexpectedly, concurrency issues,...)

More changes:

- **exit/return** are now defined as natives instead of volatile keywords.
- **do** can accept error! values.
- **parse** and **load** are now more stable when errors are raised from parsing rules.
- **load** errors handling greatly improved (no console exit on syntax errors anymore).
- **value**? now supports any type, except unset! as argument.
- fixed bugs and little improvement of **help** output.
- minor Redbin speed and generated payload size improvement.
- **prin** output in console fixed.
- fixed Red/System's **#get** directive not working in some cases.
- **system/words** now defined as an object!.
- compiler now supports **system/words/** prefix to access global context words.
- many fixes and improvements on **vector!** datatype, especially on math operations.
- color definitions are now [available](https://github.com/red/red/blob/master/environment/colors.red).
- **vector!** unit tests significantly extended.
- an **op!** used without arguments in the interpreter now reports an error.
- **pick** and **poke** now accept a logic! value as index.
- added missing comparison operators for **vector!**.
- paths evaluation errors in interpreter are now more accurate.
- first memory frame allocation increased from 512KB to 1MB.
- fixed memory corruptions caused by function with refinements in interpreter.
- division by zero now properly caught for floats.
- last but not least, [**44**](https://github.com/red/red/issues?q=is%3Aissue%20milestone%3A0.5.4%20is%3Aclosed) bugs reported on Github's tracker **fixed** in this release!

Also, thanks to PeterWAWood for the huge work on bringing a big number of new unit tests (especially for vector! datatype).

Pre-compiled runtime

This was originally the main feature planned for the release: Compile the runtime library once and cache it on disk to speed-up compilation. Unfortunately, it has been more challenging than we expected, because the Red/System compiler constructs many word values that cannot be properly serialized by Rebol's **mold** action, so cannot be **load**-ed back. Writing ad-hoc serializers and loaders was taking too much time, so this feature was postponed for a future release. We will probably implement [shadow objects](http://www.red-lang.org/2014/12/objects-implementation-notes.html) first, in the Red/System compiler, and reduce the use of non-serializable words before supporting the pre-compiled runtime. It is still a high priority, because it is the first step towards modular compilation.

Moving to Gitter

We moved our chat rooms to [Gitter](https://gitter.im/red/red). It's not perfect, but nicley combines the features of Stackoverflow chat and AltME, where the Rebol and Red community meet. So far, so good. Gitter is still young, but very promising. You just need a Github account, which is a lower entrance barrier than Stackoverflow chat and its required 20 reputation points. Come [there](https://gitter.im/red/red), say Hello, and ask questions about Red. :-)

What's next?

This release marks the beginning of the re-integration of the [android](https://github.com/red/red/tree/android) branch in master. That branch has grown up a lot in the last 12 months, to the point where merging back changes from master has become a long, complex and error-prone process. The pair! and tuple! datatype implementations were pulled from the android branch, and more code will be pulled in the next release in order to close the gap between the two branches.

Finally, the time has come to have official GUI support, and that is what the next release (0.6.0) will bring. Trying to build the GUI engine, the GUI DSL, and the Android back-end at the same time was not the best plan. The development cycle on Android is slow and debugging options limited. So Windows will be the first GUI target, where we can quickly complete the engine and DSL. Then we will merge the Android GUI back-end and toolchain in a 0.6.1 release. Those two releases should come quickly, so don't go on holiday for too long this summer. ;-)

In the meantime, enjoy this new release! :-)

The Red Team.

Posted by [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055 "author profile") at [6:22 PM](https://www.red-lang.org/2015/06/054-new-datatypes-exceptions-and-set.html "permanent link") [![](https://resources.blogblog.com/img/icon18_edit_allbkg.gif)](https://www.blogger.com/post-edit.g?blogID=5936111837781935054&postID=1710353303821382831&from=pencil "Edit Post")

Labels: [exceptions](https://www.red-lang.org/search/label/exceptions), [map](https://www.red-lang.org/search/label/map), [pair](https://www.red-lang.org/search/label/pair), [percent](https://www.red-lang.org/search/label/percent), [sets](https://www.red-lang.org/search/label/sets), [tuple](https://www.red-lang.org/search/label/tuple)

[]()

#### 6 comments:

1. ![](//www.blogger.com/img/blogger_logo_round_35.png)
   
   [-pekr-](https://www.blogger.com/profile/07020449092496153923)[June 12, 2015 at 6:48 PM](https://www.red-lang.org/2015/06/054-new-datatypes-exceptions-and-set.html?showComment=1434127718921#c2690482246293567065)
   
   This release really made my day and makes me smile :-) So many new features! Red gets better and better on almost a daily basis - can't wait to try the first GUI app made in Red!
   
   [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/2690482246293567065)
   
   [Replies]()
   
   1. [Reply]()
2. ![](//resources.blogblog.com/img/blank.gif)
   
   Anonymous[June 12, 2015 at 9:09 PM](https://www.red-lang.org/2015/06/054-new-datatypes-exceptions-and-set.html?showComment=1434136156262#c477825230462446393)
   
   Congratulation for your work.
   
   And I point out a typo in your pair! example:  
   a: 5x6  
   ...  
   a/y  
   \==6 (and not 9)  
   Stéphane Vénéri
   
   [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/477825230462446393)
   
   [Replies]()
   
   1. ![](//blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhea2YYbfPYErJ2kMzpMFdFiDrDBPvhssWA1Qn02TAaWWxu8kEiK5bowqL6NuWMeh7zeXX_EPaDHk4u-PjPHeoJbyjbRSSmdlgN9tqBDEgvMcSriu8O_rgPXus5w61KGd4/s45-c/DSC05563-small2.jpg)
      
      [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055)[June 13, 2015 at 5:15 AM](https://www.red-lang.org/2015/06/054-new-datatypes-exceptions-and-set.html?showComment=1434165320782#c2874435347022879153)
      
      Thank you! Typo fixed. :-)
      
      [Delete](https://www.blogger.com/comment/delete/5936111837781935054/2874435347022879153)
      
      [Replies]()
      
      1. [Reply]()
      
      [Reply]()
3. ![](//www.blogger.com/img/blogger_logo_round_35.png)
   
   [iArnold](https://www.blogger.com/profile/07150237639041884286)[June 13, 2015 at 9:34 AM](https://www.red-lang.org/2015/06/054-new-datatypes-exceptions-and-set.html?showComment=1434180888092#c908526581558706640)
   
   Congratulations on the new release Red Team!!
   
   unique "hello red world"  
   \== "helo wrd"  
   I expected "helo rdw"
   
   [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/908526581558706640)
   
   [Replies]()
   
   1. ![](//www.blogger.com/img/blogger_logo_round_35.png)
      
      [PeterWAWood](https://www.blogger.com/profile/13788805010272508513)[June 13, 2015 at 10:48 AM](https://www.red-lang.org/2015/06/054-new-datatypes-exceptions-and-set.html?showComment=1434185280913#c5456287023843458781)
      
      Unique returns an unordered set. This is the same behaviour as Rebol.
      
      [Delete](https://www.blogger.com/comment/delete/5936111837781935054/5456287023843458781)
      
      [Replies]()
      
      1. [Reply]()
      
      ![](//www.blogger.com/img/blogger_logo_round_35.png)
      
      [PeterWAWood](https://www.blogger.com/profile/13788805010272508513)[June 13, 2015 at 11:25 AM](https://www.red-lang.org/2015/06/054-new-datatypes-exceptions-and-set.html?showComment=1434187535065#c322639743818540080)
      
      Actually unique does return an ordered set but it does not guarantee the order.
      
      [Delete](https://www.blogger.com/comment/delete/5936111837781935054/322639743818540080)
      
      [Replies]()
      
      1. [Reply]()
      
      [Reply]()

[Add comment]()

[Load more...]()

[]()

[](https://www.blogger.com/comment/frame/5936111837781935054?po=1710353303821382831&hl=en&saa=85391&origin=https%3A%2F%2Fwww.red-lang.org)

[Newer Post](https://www.red-lang.org/2015/12/answers-to-community-questions.html "Newer Post") [Older Post](https://www.red-lang.org/2015/04/053-faster-compilation-and-extended.html "Older Post") [Home](https://www.red-lang.org/)

Subscribe to: [Post Comments (Atom)](https://www.red-lang.org/feeds/1710353303821382831/comments/default)

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
  
  - [▼](javascript:void%280%29)  [June](https://www.red-lang.org/2015/06/) (1)
    
    - [0.5.4: New datatypes, exceptions and set operations](https://www.red-lang.org/2015/06/054-new-datatypes-exceptions-and-set.html)
  
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
