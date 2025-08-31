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

## December 19, 2015

[]()

### [Answers to community questions](https://www.red-lang.org/2015/12/answers-to-community-questions.html)

Features, future directions

**Will Red get lisp like macros?**

The short answer is: yes, but.... We first need to define how we want the API for macros to look like and how to prevent users from shooting themselves in the foot too easily using them. Also, macros are challenging for a visual debugger, we also need first to have a clear vision of how an IDE would handle that (I have not yet looked into how top Lisp IDE managed that, though I hope they have solved it elegantly).

About the ETA, we had a strong need for macros in our Android bridge, though that need might be gone now that Red's startup time has been vastly improved earlier this year. Answer to that should come in a few weeks, once we merge the existing Android backend with our new GUI engine.

**When will Red get optional types?**

It already has, along with multi-typing: you can specify one or more allowed types for function arguments, return value and local words. Only arguments type-checking is implemented for now, the rest will come on the path to 1.0. The most interesting part of optional typing is how much the compiler will be able to leverage it to generate much faster code when everything is mono-typed. Though, we will find that out after 1.0, once we will work on the self-hosted compiler and toolchain. As the current toolchain has a limited lifetime, we try to avoid any non-mandatory feature before 1.0.

**Will Red have built-in support for some type of concurrency and/or parallel processing? What kind of model is it going to follow?**

Certainly. Increase in computation power is now horizontal, with multiple cores, multiple processors and distributed architectures, so, strong concurrency support is a key part of a modern general-purpose language.

For now, the model we aim at is the [Actor model](https://en.wikipedia.org/wiki/Actor_model). It is a good fit for Red and would provide a clean way to handle concurrent and parallel tasks across multiple cores and processors. Though, a few years has passed since that plan was made, so we will need to revisit it when the work on 0.9.0 will start, and define what is the best option for Red then. One thing is sure, we do not want multithreading nor callback hell in Red. ;-)

**Do you plan to implement any kind of app/web server in Red, similar to Cheyenne available for Rebol?**

As [Cheyenne](http://cheyenne-server.org/)'s author, I have strong plans for a new web application server with much better scalability than what you could achieve using Rebol. Red 1.0 should come with pretty strong server-side programming abilities out of the box, then on top of that, we'll provide a modern framework for webapp creations (think [GWT](http://www.gwtproject.org/) or [Opalang](http://opalang.org/)-like approach).

In addition to that, we'll have a Cheyenne [RSP](http://cheyenne-server.org/docs/rsp-api.html) compatibility layer for running old Cheyenne scripts aiming at at drop-in replacement for existing webapps.

**Will Red support multiselect/switch soon?**

As soon as possible, maybe for the upcoming 0.6.0 release.

**Will we get promises/futures in Red?**

Possibly. We will experiment with that in one of the 0.7.x releases. We will have to see how such abstraction could integrate in our future concurrency model.

**Will Red get direct access to Android's (and IOS later) camera, location, gyroscope, etc features?**

Absolutely, our GUI engine already features a camera widget (in our Windows backend). The work on Android backend in 0.6.x version will bring wrappers to all the common hardware features.

**Red is going to get modules support in future, what about Red/System?**

As Red/System is an embedded dialect of Red, Red's upcoming modules system will allow inclusion of Red/System parts, so a separate modules system for it is not necessary for now.

**Will function! be first-class datatype in Red/System v2?**

Strictly speaking no, as you won't be allowed to create new functions from Red/System at run-time (but you will be able to create new Red/System functions from Red dynamically). The other first-class features will be possible (to a greater extent than today): passing function! pointer as arguments, returning a function! value from a function or assigning a function! pointer to a variable.

**Will Red have the equivalent of Go lang's net package?**

Red will feature a complete networking layer in 0.7.0, including async IO support, through a nice high-level API (similar to Rebol's one). So DNS, TCP, UDP and many more common protocols will be built-in, fortunately, relying on a very lightweight API, unlike Go's net package. ;-)

**What about a package manager (in future)?**

We have a modules system planned for 0.8.0. Design details are not yet defined, though we'll strive to integrate the best ideas from other existing package managers around.

**Is there going to be inbuilt unit testing, something like http://golang.org/pkg/testing/?**

We'll have a built-in unit testing support, probably starting with a lightweight one integrated into our upcoming modules system.

**Is there a chance Red gets self-hosted sooner than initially planned, removing the R2 dependency?**

Self-hosting Red means rewriting the toolchain (compilers, linker and packagers) in Red (currently written in Rebol2). Technically, 0.6.0 should have all the needed features for starting such rewrite, unfortunately, we currently don't have the resources to start such big task while continuing the work towards 1.0. The self-hosting work would not be a port of the current toolchain, it would use a very different architecture (because of JIT-compilation requirement and extra features of Red compared to Rebol). We aim at a programmable modular toolchain model, not very far from LLVM (just simpler and magnitudes smaller).

To be accurate, fully removing Rebol2 dependency is a two steps process:

1. Removing the need for Rebol/SDK to build the Red binary, making it easy for anyone to rebuild Red binary from sources.
2. Rewriting the toolchain in Red.

Developers, community, documentation

**How do you regard the development of Red 2.0 to proceed in terms of speed/progress? Will it be faster or equal to current road to Red 1.0?**

Red 2.0 is mostly about rewriting the toolchain in Red, which represents only 25% of the current Red codebase (the other 75% part is the runtime library). Moreover, the modular architecture and public API  of the new toolchain will make it much easier to write and integrate contributions from third-parties, so we'll gear all our efforts towards involving as many skilled contributors as possible. If you want Red 2.0 to come quicker, helping Red's user base grow up by contributing, writing apps, docs and tutorials is the best thing you can do right now. ;-)

**What do you think is the "killer app" Red should provide, in order to attract more of developers/newcomers?**

Definitely an innovative IDE. ;-) Beyond that, I believe that a successful Android app written in Red could do a lot to spread Red usage widely. If you have a great idea for such app, you'll soon be able to code it in Red 0.6.1, with full Android support.

**What about documentation comments (something like rustdoc https://doc.rust-lang.org/book/documentation.html)?**

In Red, like in Rebol, [docstrings](https://en.wikipedia.org/wiki/Docstring) are allowed in functions (and in modules once we have them), so they can be processed more easily than comments (which exist only when the source is in text form). That's one of the tangible advantages of having an homoiconic language. That is also how the **help** command works in the console, it extracts information at runtime from functions and the environment.

That said, if you want heavier documentation embedded inside your code, you can easily define your own format for that and writing a preprocessor for it should be almost trivial using our [Parse](http://www.red-lang.org/2013/11/041-introducing-parse.html) dialect (either in text form or after loading, in block form). You can go as far as implementing a [Literate Programming](https://en.wikipedia.org/wiki/Literate_programming) layer if that suits your taste, like [this one](http://www.colellachiara.com/soft/MD3/emitters/wetan.html) made for Rebol.

That's all for this time, if you want to discuss some parts deeper, you are welcome to join our [chat-room on Gitter](https://gitter.im/red/red), which is way more convenient than Blogger's comment system.

See you soon for the 0.6.0 release, don't miss it! ;-)

Posted by [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055 "author profile") at [11:18 AM](https://www.red-lang.org/2015/12/answers-to-community-questions.html "permanent link") [13 comments:](https://www.red-lang.org/2015/12/answers-to-community-questions.html#comment-form) [![](https://resources.blogblog.com/img/icon18_edit_allbkg.gif)](https://www.blogger.com/post-edit.g?blogID=5936111837781935054&postID=5714086215828312502&from=pencil "Edit Post")

Labels: [community](https://www.red-lang.org/search/label/community), [questions](https://www.red-lang.org/search/label/questions)

## June 12, 2015

[]()

### [0.5.4: New datatypes, exceptions and set operations](https://www.red-lang.org/2015/06/054-new-datatypes-exceptions-and-set.html)

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

Posted by [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055 "author profile") at [6:22 PM](https://www.red-lang.org/2015/06/054-new-datatypes-exceptions-and-set.html "permanent link") [6 comments:](https://www.red-lang.org/2015/06/054-new-datatypes-exceptions-and-set.html#comment-form) [![](https://resources.blogblog.com/img/icon18_edit_allbkg.gif)](https://www.blogger.com/post-edit.g?blogID=5936111837781935054&postID=1710353303821382831&from=pencil "Edit Post")

Labels: [exceptions](https://www.red-lang.org/search/label/exceptions), [map](https://www.red-lang.org/search/label/map), [pair](https://www.red-lang.org/search/label/pair), [percent](https://www.red-lang.org/search/label/percent), [sets](https://www.red-lang.org/search/label/sets), [tuple](https://www.red-lang.org/search/label/tuple)

## April 26, 2015

[]()

### [0.5.3: Faster compilation and extended vector! support](https://www.red-lang.org/2015/04/053-faster-compilation-and-extended.html)

The main point of this minor release is to speed up compilation time by introducing a new way for the compiler to store Red values required for constructing the environment during the runtime library startup.

Introducing Redbin

Red already provides two text-oriented serialization formats, following the base Rebol principles. Here are the available serialization formats now in Red with some pros/cons:

- MOLD format

<!--THE END-->

1. - provides a default readable text format, very close to the source code version
   - cannot properly encode many values

<!--THE END-->

- MOLD/ALL format

<!--THE END-->

1. - can encode series offsets
   - some values with literal forms that rely on words that can be natively encoded (none, true/false, objects, ...)
   - human-readable, but not always nice-looking

<!--THE END-->

- Redbin format

<!--THE END-->

1. - can encode any value accurately
   - supports words binding
   - can encode contexts efficiently
   - supports cycles in blocks
   - can encoded name/value pairs in any context
   - extremely fast loading time
   - very small storage space used when compressed
   - non human-readable

So far, the existing [environment](https://github.com/red/red/tree/master/environment) source code (mostly block values) was converted to pure Red/System construction code which was pretty simple and straightforward to implement, but was generating thousands of extra lines of code, slowing down the native compilation process. The right solution for that was to introduce a new binary serialization format for Red values called Redbin (very inspired by Carl's REBin [proposal](http://www.rebol.com/article/0044.html)).

Redbin's [specification](https://github.com/red/red/wiki/Redbin-specification) focuses on optimizing the loading time of encoded values, by making their stored representation very close to their memory representation, bypassing the parsing and validation stages. Moreover, the Redbin payload is compressed using the [Crush](http://mattmahoney.net/dc/text.html#2794) algorithm (that Qtxie [ported](https://github.com/red/red/blob/master/runtime/crush.reds) to Red/System), which features one of the fastest decompressors around while having a general compression ratio very close to the [deflate](http://en.wikipedia.org/wiki/DEFLATE) algorithm (but compression speed is about an order of magnitude slower). This fits perfectly the needs for our Redbin use-case.

So the gains compared to pre-0.5.3 version are:

- compilation time of empty Red program is **~40% faster**!

<!--THE END-->

- generated executable of empty Red program is about **100KB smaller** (278KB only on Windows now).

<!--THE END-->

- **faster startup time**, as the Redbin decoding process is much faster than the previous Red-stack-oriented construction approach.

Those benefits also extend to user code, your static series will be saved in Redbin format as well.

Redbin format is currently emitted by the compiler and decoded by the Red runtime, but there is no encoder yet in the runtime that would allow user code to emit Redbin format. We will provide that support in a future version, it is not high priority for now. A "compact" version of the encoding format will also be added, so that Redbin can also be a good choice for remote data exchange.

Compilation from Rebol console

For those using Red toolchain from Rebol2 console, a new **rc** function is introduced to avoid reloading the toolchain on each run. Typical session looks like this:

```
    >> do %red.r
    >> rc "-c tests\demo.red"

    -=== Red Compiler 0.5.3 ===-

    Compiling /C/Dev/Red/tests/demo.red ...
    ...compilation time : 416 ms

    Compiling to native code...
    Script: "Red/System PE/COFF format emitter" (none)
    ...compilation time : 12022 ms
    ...linking time     : 646 ms
    ...output file size : 284160 bytes
    ...output file      : C:\Dev\Red\demo.exe
 
    >> call/output "demo.exe" s: make string! 10'000
    == 0
    >> print s

      RedRed              d
      d     d             e
      e     e             R
      R     R   edR    dR d
      d     d  d   R  R  Re
      edRedR   e   d  d   R
      R   e    RedR   e   d
      d    e   d      R   e
      e    R   e   d  d  dR
      R     R   edR    dR d
```

Collation tables

Since 0.5.2, Red provides collation tables for more accurate case folding support. Those tables can now be accessed by users using these paths:

```
    system/locale/collation/upper-to-lower
    system/locale/collation/lower-to-upper
```

Each of these tables is a vector of char! values which can be freely modified and extended by users in order to cope with some specific local rules for case folding. For example, in French language, the uppercase of letter é can be E or É. There is a divide among French people about which one should be used and in some cases, it can just be a typographical constraint. By default, Red will uppercase é as É, but this can be easily changed if required, here is how:

```
    uppercase "éléphant"
    == "ÉLÉPHANT"
    
    table: system/locale/collation/lower-to-upper
    foreach [lower upper] "àAéEèEêEôOûUùUîIçC" [table/:lower: upper]

    uppercase "éléphant"
    == "ELEPHANT"
```

Extended Vector! datatype

**Vector!** datatype now supports more actions and can store more datatypes with different bit-sizes. For integer! and char! values, you can store them as 8, 16 or 32 bits values. For float!, it is 32 or 64 bits. Several syntactic forms are accepted for creating a vector:

```
    make vector! <slots>
    make vector! [<values>]
    make vector! [<type> <bit-size> [<values>]]
    make vector! [<type> <bit-size> <slots> [<values>]]

    <slots>    : number of slots to preallocate (32-bit slots by default)
    <values>   : sequence of values of same datatype
    <type>     : name of accepted datatype: integer! | char! | float!
    <bit-size> : 8 | 16 | 32 for integer! and char!, 32 | 64 for float!
```

The type of the vector elements can be inferred from the provided values, so it can be omitted (unless you need to force a bit-size different from the values default one). If a value with a bit-size greater than the vector elements one, is inserted in the vector, it will be truncated to the bit-size of the vector.

For example, creating a vector that contains 1000 32-bit integer values:

```
    make vector! 1000
```

Or if you want to specify the bit-size of the vector element:

```
    make vector! [char! 16 1000]
    make vector! [float! 64 1000]
```

You can also initialize a vector from a block as below:

```
    make vector! [1.1 2.2 3.3 4.4]
```

Again you can also specify the bit-size of the vector element:

```
    make vector! [integer! 8 [1 2 3 4]]
```

For integer! and char! vectors, you can use all math and bitwise operators now.

```
    x: make vector! [1 2 3 4]
    y: make vector! [2 3 4 5]
    x + y
    == make vector! [3 5 7 9]
```

In case of different bit-sizes, the resulting vector will be using the highest bit-size. If a math operation is producing a result that does not fit the bit-size, the result is currently truncated to the bit-size (using a AND operation). Ability to read and change the bit-size of a vector will be added in future releases.

The following actions are added to vector! datatype: **clear, copy, poke, remove, reverse, take, sort, find, select, add, subtract, multiply, divide, remainder, and, or, xor.**

The vector! implementation is not yet final, some of its actions will get optimized for better performances and, in future, rely on [SIMD](http://en.wikipedia.org/wiki/SIMD) for even faster operations. For multidimensional support, it will be implemented as a new **matrix!** datatype in the near future, inheriting from vector!, so the additional code required will be kept minimal.

Bugfixing

This was a short-term release, but we managed to fix a few [bugs](https://github.com/red/red/issues?q=milestone%3A0.5.3%20is%3Aclosed) anyway.

What's next

Another minor release will follow with many runtime library additions and new toolchain improvements. See the planned features for 0.5.4 on our Trello [board](https://trello.com/c/ycAKXGdR/129-0-5-4-precompiled-runtime).

The 0.6.0 release will also most probably be split in two milestones, one for GUI and another for Android support.

In the meantime, enjoy this new release! :-)

Posted by [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055 "author profile") at [5:05 AM](https://www.red-lang.org/2015/04/053-faster-compilation-and-extended.html "permanent link") [4 comments:](https://www.red-lang.org/2015/04/053-faster-compilation-and-extended.html#comment-form) [![](https://resources.blogblog.com/img/icon18_edit_allbkg.gif)](https://www.blogger.com/post-edit.g?blogID=5936111837781935054&postID=4294845178242856688&from=pencil "Edit Post")

Labels: [collation](https://www.red-lang.org/search/label/collation), [compilation](https://www.red-lang.org/search/label/compilation), [redbin](https://www.red-lang.org/search/label/redbin), [Unicode](https://www.red-lang.org/search/label/Unicode), [vector](https://www.red-lang.org/search/label/vector)

## April 4, 2015

[]()

### [0.5.2: Case folding and hash! support](https://www.red-lang.org/2015/04/052-case-folding-and-hash-support.html)

This is minor release mainly motivated by the need to fix some annoying issues and regressions we have encountered in the last release:

- the **help** function was displaying an error when used with no arguments, preventing newcomers from seeing the general help information

<!--THE END-->

- the console pre-compilation issue with timezones was back.

Some significant new features managed to sneak into this release too, along with some [bugfixes](https://github.com/red/red/issues?q=milestone%3A0.5.2).

Case folding

Red now provides **uppercase** and **lowercase** natives and more generally, better support for Unicode-aware case folding. Red runtime library contains now a general one-to-one mapping table for case folding that should cover most user needs.

```
    red>> uppercase "hello"
    == "HELLO"
    red>> uppercase/part "hello" 1
    == "Hello"
    red>> uppercase "français"
    == "FRANÇAIS"
    red>> uppercase "éléphant"
    == "ÉLÉPHANT"
    red>> lowercase "CameL"
    == "camel"
```

This applies also to words, so now case insensitivity is Unicode-aware in Red:

```
    red>> É: 123
    == 123
    red>> é
    == 123
    red>> "éléphant" = "ÉLÉPHANT"
    == true
    red>> "éléphant" == "ÉLÉPHANT"
    == false
```

For special cases, we will expose, in a future release, the collation table we use internally, so that anyone can provide a customized version that is a better fit for some local special rules or usages. For example, some lower case characters (such as "ß") actually map to two or more upper case code points ("SS" in this case). So in Red, by default, you will get:

```
    red>> lowercase "ß"
    == ß
    red>> uppercase "ß"
    == ß
```

You can read more about our plans for full Unicode support on the [wiki](https://github.com/red/red/wiki/Unicode-Issues-with-Proposed-Resolutions).

Hash datatype

The new **hash!** datatype works exactly the same way as in [Rebol2](http://www.rebol.com/docs/core23/rebolcore-16.html#section-2.5). It provides a block-like interface but with fast lookups for most values (block series can be stored in hash! too, but they will not be hashed, so no faster access). It is a very flexible container for any kind of hashed tables (not only associative arrays) while keeping the handy navigational abilities of blocks. The underlying hashing function is a custom implementation of the [MurmurHash3](https://code.google.com/p/smhasher/wiki/MurmurHash3) algorithm. Some usage examples:

```
    red>> list: make hash! [a 123 "hello" b c 789]
    == make hash! [a 123 "hello" b c 789]
    red>> list/c
    == 789
    red>> find list 'b
    == make hash! [b c 789]
    red>> dict: make hash! [a 123 b 456 c 789]
    == make hash! [a 123 b 456 c 789]
    red>> select dict 'c
    == 789
    red>> dict: make hash! [2 123 4 456 6 2 8 789]
    == make hash! [2 123 4 456 6 2 8 789]
    red>> select/skip dict 2 2
    == 123
```

A map! datatype (strictly associative array) should also be provided in the next release, though, we are still investigating some of its features and use-case scenarios before deciding to release it officially.

Good news also about our Mac build server, a new one was kindly provided by Will (thanks a lot for that).

Our next release should mainly feature the [Redbin](https://github.com/red/red/wiki/Redbin-specification) format support for the Red compiler, providing much faster compilation times and reduced generated binaries.

Enjoy! :-)

Posted by [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055 "author profile") at [1:28 PM](https://www.red-lang.org/2015/04/052-case-folding-and-hash-support.html "permanent link") [14 comments:](https://www.red-lang.org/2015/04/052-case-folding-and-hash-support.html#comment-form) [![](https://resources.blogblog.com/img/icon18_edit_allbkg.gif)](https://www.blogger.com/post-edit.g?blogID=5936111837781935054&postID=628451470321380947&from=pencil "Edit Post")

Labels: [casing](https://www.red-lang.org/search/label/casing), [console](https://www.red-lang.org/search/label/console), [hash](https://www.red-lang.org/search/label/hash), [Unicode](https://www.red-lang.org/search/label/Unicode)

## March 15, 2015

[]()

### [0.5.1: New console and errors support](https://www.red-lang.org/2015/03/051-new-console-and-errors-support.html)

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

Posted by [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055 "author profile") at [8:50 AM](https://www.red-lang.org/2015/03/051-new-console-and-errors-support.html "permanent link") [8 comments:](https://www.red-lang.org/2015/03/051-new-console-and-errors-support.html#comment-form) [![](https://resources.blogblog.com/img/icon18_edit_allbkg.gif)](https://www.blogger.com/post-edit.g?blogID=5936111837781935054&postID=3404862643335603144&from=pencil "Edit Post")

Labels: [console](https://www.red-lang.org/search/label/console), [exceptions](https://www.red-lang.org/search/label/exceptions), [runtime errors](https://www.red-lang.org/search/label/runtime%20errors), [sorting](https://www.red-lang.org/search/label/sorting), [type-checking](https://www.red-lang.org/search/label/type-checking), [typeset](https://www.red-lang.org/search/label/typeset), [vector](https://www.red-lang.org/search/label/vector)

## January 15, 2015

[]()

### [Dream big, work hard and make it happen!](https://www.red-lang.org/2015/01/dream-big-work-hard-and-make-it-happen.html)

Today is a big day for the Red team and all the Red followers.

After four years of hard work on building our dream tool, I announce today the creation of a new company, Fullstack Technologies. The company has raised $500,000 from InnovationWorks and GeekFounders, Chinese VC early-stage investors. This money will help us fuel the launch of Red this year, and spread it everywhere, especially in the mobile market. The mission of Fullstack Technologies is to provide to individual developers and corporations, a simpler and much more productive software creation solution, reducing drastically both costs and development time.

The company has its headquarters in Zhongguancun, Beijing (Chinese's "Silicon Valley"). I am CEO now (once more) and Xie Qingtian (qtxie) is joining the company as tech lead. We plan to recruit more people in the next months.

I want to use this opportunity to express my deepest gratitude to all the people in the community who have helped me, contributed to Red and supported my work with donations since the beginning. I simply could not have made it so far without you.

Also, even if the funding needs are now covered, the Red community still has a major role to play in helping us build the best possible tool and spreading it. Fullstack Technologies intends to work closely with the community, by providing some contracted jobs, bounties and sponsoring for helping spread Red locally.

People who follow closely my work on Red know that I have a strong vision and big ambitions for it, now I have the means to make all that happen! This journey is getting even more exciting. :-)

[![](https://lh3.googleusercontent.com/blogger_img_proxy/AEn0k_s1t8MI53EIEfbJAPVfwrvZC2JJco1akoYpxew_SWiyyKbnOspJKrpbcbMxnT8LTvsmduFW31kS9Wo5m7PmdAfANbq4xSpQ40epEp_l3mYcwiRy=s0-d)](http://static.red-lang.org/images/dream-big.png)

Posted by [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055 "author profile") at [3:15 PM](https://www.red-lang.org/2015/01/dream-big-work-hard-and-make-it-happen.html "permanent link") [30 comments:](https://www.red-lang.org/2015/01/dream-big-work-hard-and-make-it-happen.html#comment-form) [![](https://resources.blogblog.com/img/icon18_edit_allbkg.gif)](https://www.blogger.com/post-edit.g?blogID=5936111837781935054&postID=2837198263847966529&from=pencil "Edit Post")

[Newer Posts](https://www.red-lang.org/search?updated-max=2017-07-17T16%3A05%3A00%2B02%3A00&max-results=7&reverse-paginate=true "Newer Posts") [Older Posts](https://www.red-lang.org/search?updated-max=2015-01-15T15%3A15%3A00%2B01%3A00&max-results=7 "Older Posts") [Home](https://www.red-lang.org/)

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
  
  - [▼](javascript:void%280%29)  [December](https://www.red-lang.org/2015/12/) (1)
    
    - [Answers to community questions](https://www.red-lang.org/2015/12/answers-to-community-questions.html)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [June](https://www.red-lang.org/2015/06/) (1)
    
    - [0.5.4: New datatypes, exceptions and set operations](https://www.red-lang.org/2015/06/054-new-datatypes-exceptions-and-set.html)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [April](https://www.red-lang.org/2015/04/) (2)
    
    - [0.5.3: Faster compilation and extended vector! sup...](https://www.red-lang.org/2015/04/053-faster-compilation-and-extended.html)
    - [0.5.2: Case folding and hash! support](https://www.red-lang.org/2015/04/052-case-folding-and-hash-support.html)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [March](https://www.red-lang.org/2015/03/) (1)
    
    - [0.5.1: New console and errors support](https://www.red-lang.org/2015/03/051-new-console-and-errors-support.html)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [January](https://www.red-lang.org/2015/01/) (1)
    
    - [Dream big, work hard and make it happen!](https://www.red-lang.org/2015/01/dream-big-work-hard-and-make-it-happen.html)

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
