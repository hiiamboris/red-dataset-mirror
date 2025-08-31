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

[Newer Posts](https://www.red-lang.org/search?updated-max=2016-12-17T12%3A07%3A00%2B01%3A00&max-results=7&reverse-paginate=true "Newer Posts") [Older Posts](https://www.red-lang.org/search?updated-max=2015-04-04T13%3A28%3A00%2B02%3A00&max-results=7 "Older Posts") [Home](https://www.red-lang.org/)

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
  
  - [►](javascript:void%280%29)  [December](https://www.red-lang.org/2015/12/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [June](https://www.red-lang.org/2015/06/) (1)
  
  <!--THE END-->
  
  - [▼](javascript:void%280%29)  [April](https://www.red-lang.org/2015/04/) (2)
    
    - [0.5.3: Faster compilation and extended vector! sup...](https://www.red-lang.org/2015/04/053-faster-compilation-and-extended.html)
    - [0.5.2: Case folding and hash! support](https://www.red-lang.org/2015/04/052-case-folding-and-hash-support.html)
  
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
