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

## November 30, 2013

[]()

### [0.4.1: Introducing Parse](https://www.red-lang.org/2013/11/041-introducing-parse.html)

One of the greatest feature of the [Rebol](http://rebol.com/) language has always been its parsing engine, simply called Parse. It is an amazing piece of design from [Carl Sassenrath](http://en.wikipedia.org/wiki/Carl_Sassenrath), that spared all Rebol users for the last 15 years, from the [pain](http://www.codinghorror.com/blog/2005/02/regex-use-vs-regex-abuse.html) of having to use the famously unmaintainable [regexps](http://en.wikipedia.org/wiki/Regular_expression). Now, Parse is also available to Red users, in an enhanced version!

So, in short, what is Parse? It is an embedded [DSL](http://en.wikipedia.org/wiki/Domain-specific_language) (we call them "dialects" in the Rebol world) for parsing input series using grammar rules. The Parse dialect is an [enhanced member](http://www.rebol.net/wiki/Parse_Project#Theory_of_PARSE) of the [TDPL](http://en.wikipedia.org/wiki/Top-down_parsing_language) family. Parse's common usages are for checking, validating, extracting, modifying input data or even implementing embedded and external DSLs.

The **parse** function call syntax is straightforward:

```
    parse <input> <rules>  

    <input>: any series value (string, file, block, path, ...)
    <rules>: a block! value with valid Parse dialect content
```

Here are a few examples, even if you don't know Red and Parse dialect, you can still "get" most of them, unlike regexps.  *You can copy/paste them directly into the Red console*.

Some simple examples of string or block input validation using grammar rules:

```
    parse "a plane" [["a" | "the"] space "plane"]
    parse "the car" [["a" | "the"] space ["plane" | "car"]]

    parse "123" ["1" "2" ["4" | "3"]]
    parse "abbccc" ["a" 2 "b" 3 "c"]
    parse "aaabbb" [copy letters some "a" (n: length? letters) n "b"]

    parse [a] ['b | 'a | 'c]
    parse [hello nice world] [3 word!]
    parse [a a a b b b] [copy words some 'a (n: length? words) n 'b]
```

How to parse an IPv4 address accurately:

```
    four:     charset "01234"
    half:     charset "012345"
    non-zero: charset "123456789"
    digit:    union non-zero charset "0"

    byte: [
          "25" half
        | "2" four digit
        | "1" digit digit
        | non-zero digit
        | digit
    ]
    ipv4: [byte dot byte dot byte dot byte]

    parse "192.168.10.1" ipv4
    parse "127.0.0.1"    ipv4
    parse "99.1234"      ipv4
    parse "10.12.260.1"  ipv4

    data: {
        ID: 121.34
        Version: 1.2.3-5.6
        Your IP address is: 85.94.114.88.
        NOTE: Your IP Address could be different tomorrow.
    }
    parse data [some [copy value ipv4 | skip]]
    probe value                      ; will ouput: "85.94.114.88"

```

A crude, but practical email address validator:

```
    digit:   charset "0123456789"
    letters: charset [#"a" - #"z" #"A" - #"Z"]
    special: charset "-"
    chars:   union union letters special digit
    word:    [some chars]
    host:    [word]
    domain:  [word some [dot word]]
    email:   [host "@" domain]

    parse "john@doe.com" email
    parse "n00b@lost.island.org" email
    parse "h4x0r-l33t@domain.net" email
```

Validating math expressions in string form (from Rebol/Core [manual](http://www.rebol.com/docs/core23/rebolcore-15.html#section-6)):

```
    expr:    [term ["+" | "-"] expr | term]
    term:    [factor ["*" | "/"] term | factor]
    factor:  [primary "**" factor | primary]
    primary: [some digit | "(" expr ")"]
    digit:   charset "0123456789"
    
    parse "1+2*(3-2)/4" expr        ; will return true
    parse "1-(3/)+2" expr           ; will return false
```

Creating a simple parser for a subset of HTML:

```
    html: {
        <html>
            <head><title>Test</title></head>
            <body><div><u>Hello</u> <b>World</b></div></body>
        </html>
    }

    ws: charset reduce [space tab cr lf]

    parse html tags: [
        collect [any [
            ws
            | "</" thru ">" break
            | "<" copy name to ">" skip keep (load name) opt tags
            | keep to "<"
        ]]
    ]

    ; will produce the following tree of blocks as output of parse:
     [
         html [
             head [
                 title ["Test"]
             ]
             body [
                 div [
                     u ["Hello"]
                     b ["World"]
                 ]
             ]
         ]
     ]
```

The Parse dialect

Parse's core principles are:

- Advance input series by matching grammar rules until top-level rule failure (returning **false**) or input exhaustion (returning **true**). (\*)
- Ordered choices (e.g. in \["a" | "ab"] rule, the second one will never succeed).
- Rules composability (unlimited).
- Limited backtracking: only input and rules positions are backtracked, other changes remain.
- Two modes: string-parsing (for example: external DSL) or block-parsing (for example: embedded DSL).

(\*) If **collect** keyword is used in any rule in its simplest form, a block will be returned by **parse** no matter if the root rule succeeded or not.

The Parse rules can be made from:

- **keyword** : a dialect reserved word (see the tables below).
- **word** : word will be evaluated and its value used as a rule.
- **word:** : set the word to the current input position.
- **:word** : resume input at the position referenced by the word.
- **integer** value : specify an iterated rule with a fixed number or a range of iterations.
- **value** : match the input to a value
- **|** : backtrack and match next alternate rule
- **\[rules]** : a block of sub-rules
- **(expression)** : escape the Parse dialect, evaluate a Red expression and return to the Parse dialect.

The following keywords are currently available in Red's Parse implementation. They can be composed together freely.

Matching

**ahead** *rule* : look-ahead rule, match the rule, but do not advance input. **end**: return success if current input position is at end. **none**: always return success (catch-all rule). **not rule**: invert the result of the sub-rule. **opt rule**: look-ahead rule, optionally match the rule. **quote value**: match next value literally (for dialect escaping needs). **skip**: advance the input by one element (a character or a value). **thru rule**: advance input until rule matches, input is set past the match. **to rule**: advance input until rule matches, input is set at head of the match.

Control flow

**break**: break out of a matching loop, returning success. **if (expr)**: evaluate the Red expression, if false or none, fail and backtrack. **into rule**: switch input to matched series (string or block) and parse it with *rule*. **fail**: force current rule to fail and backtrack. **then**: regardless of failure or success of what follows, skip the next alternate rule. **reject**: break out of a matching loop, returning failure.

Iteration

**any** *rule*: repeat rule zero or more times until failure or if input does not advance. **some rule**: repeat rule one or more times until failure or if input does not advance. **while rule**: repeat rule zero or more times until failure regardless of input advancing.

Extraction

**collect** *\[rule]*: return a block of collected values from the matched rule. **collect set** *word \[rule]*: collect values from the matched rule, in a block and set the *word* to it. **collect into** *word \[rule]*: collect values from the matched rule and insert them in the block referred by *word*. **copy word rule**: set the *word* to a copy of the matched input. **keep rule**: append a copy of the matched input to the collecting block. **keep (expr)**: append the last value from the Red expression to the collecting block. **set word rule**: set the *word* to the first value of the matched input.

Modification

**insert *only*** *value*: insert\[/only] a value at the current input position and advance input after the value. **remove** *rule*: remove the matched input.

The core principles mention two modes for parsing. This is necessary in Red (as in Rebol) because of the two basic series datatypes we have: string! and block!. The string! datatype is currently an array of Unicode codepoints (Red will support an array of characters in a future version) while the block! datatype is an array of arbitrary Red values (including other blocks).

In practice, this results in some minor differences in Parse dialect usage. For example, it is possible to define arbitrary sets of characters using the new bitset! datatype, which are useful only for string! parsing in order to match with a large number of characters in one time. Here is an example using only bitsets matching and iterators:

```
    letter: charset [#"a" - #"z"]
    digit:  charset "0123456789"

    parse "hello 123 world" [5 letter space 3 digit space some letter]
```

The Bitset! datatype

A bitset value is an array of bits that is used to store boolean values. In the context of Parse, bitsets are very useful to represent arbitrary sets of characters across the whole Unicode range, that can be matched against an input character, in a single operation. As bitset! is introduced in this 0.4.1 release, it is worth having an overview of the features supported. Basically, it is on par with Rebol3 bitset! [implementation](http://www.rebol.com/r3/docs/datatypes/bitset.html).

In order to create a bitset, you need to provide one or several characters as base specification. They can be provided in different forms: codepoint integer values, char! values, string! values, a range or a group of previous elements. The creation of a new bitset is done using the following syntax:

```
    make bitset! <spec>

    <spec>: char!, integer!, string! or block!
```

For example:

```
    ; create an empty bitset with places at least for 50 bits
    make bitset! 50

    ; create a bitset with bit 65 set
    make bitset! #"A"

    ; create a bitset with bits 104 and 105 set
    make bitset! "hi"

    ; create and set bits using different values representations
    make bitset! [120 "hello" #"A"]

    ; create a bitset using ranges of values
    make bitset! [#"0" - #"9" #"a" - #"z"]
```

Ranges are defined using two values (char! or integer! allowed) separate by a dash word.

Bitsets are auto-sized to fit the specification value(s) provided. The size is rounded to the upper byte bound.

A shortcut **charset** function is also provided for practical usage, so you can write:

```
    charset "ABCDEF"
    charset [120 "hello" #"A"]
    charset [#"0" - #"9" #"a" - #"z"]
```

For reading and writing single bits, the path notation is the simplest way to go:

```
    bs: charset [#"a" - #"z"]
    bs/97     ; will return true
    bs/40     ; will return false
    bs/97: false
    bs/97     ; will return false
```

(Note: bitset indexing is zero-based.)

Additionally, the following actions are supported by bitset! datatype:  
**pick**, **poke**, **find**, **insert**, **append**, **copy**, **remove**, **clear**, **length?**, **mold**, **form**

See the Rebol3 bitset [documentation](http://www.rebol.com/r3/docs/datatypes/bitset.html) for more info about usage of these actions.

In order to cope with the wide range of Unicode characters, bits outside of the bitsets are treated as **virtual bits**, so they can be tested and set without errors, the bitset size will auto-expand according to the needs. But that is still not enough to deal with big ranges, like for example a bitset for all Unicode characters except digits. For such cases, it is possible to define a **complemented** bitset that represents the complement range of the specified bits. This makes possible to have large bitsets while using only a tiny memory portion.

Complemented bitsets are created the same way as normal bitsets, but they need to start with the **not** word and always use a block! for their specification:

```
    ; all characters except digits
    charset [not "0123456789"]

    ; all characters but hexadecimal symbols
    charset [not "ABCDEF" #"0" - #"9"]

    ; all characters except whitespaces
    charset reduce ['not space tab cr lf]
```

Set operations are also possible, but only **union** is currently implemented in Red (it is the most used anyway for bitsets). With **union**, you can merge two bitsets together to form a new one, which is very useful in practice:

```
    digit: charset "0123456789"
    lower: charset [#"a" - #"z"]
    upper: charset [#"A" - #"Z"]

    letters:  union lower upper
    hexa:     union upper digit
    alphanum: union letters digit
```

Parse implementation

Parse dialect has been implemented as a [FSM](http://en.wikipedia.org/wiki/Finite-state_machine) which differs from the Rebol3 implementation that relies on recursive function calls. The FSM approach makes possible several interesting features, like the ability to stop the parsing and resume it later, or even serialize the parsing state, send it remotely and reload it to continue the parsing. Such features could now be implemented with minimal efforts.

Red Parse [implementation](https://github.com/red/red/blob/master/runtime/parse.reds) is about 1300 lines of Red/System code, with a significant part of it spent on optimized iteration loops for common cases. About [770 unit tests](https://github.com/red/red/blob/master/tests/source/units/parse-test.red) have been hand-written to cover the basic Parse features.

The current Parse runs as an interpreter, which is fast enough for most use-cases you will have. For cases where maximum performance is required, work has started on a Parse static compiler to soon provide the fastest possible speed to Parse-intensive Red apps. The generated code is pure Red/System code and *should be* about a magnitude faster on average than the interpreted version. When Red will be self-hosted, a Parse JIT compiler will be provided to deal with the cases that the static compiler cannot process.

As Red gets more features, Parse will continue to be improved to take advantage of them. Among other future improvements, binary! parsing will be added as soon as **binary!** datatype is available, and stream parsing will be possible when **port!** datatype will be there.

The Red Parse also exposes a public event-oriented API in form of an optional callback function that can be passed to **parse** using the **/trace** refinement.

```
    parse/trace <input> <rules> <callback>

    <callback> specification:

    func [
        event   [word!]   ; Trace events
        match?  [logic!]  ; Result of last matching operation
        rule    [block!]  ; Current rule at current position
        input   [series!] ; Input series at next position to match
        stack   [block!]  ; Internal parse rules stack
        return: [logic!]  ; TRUE: continue parsing, FALSE: exit
    ]

    Events list:
    - push    : once a rule or block has been pushed on stack
    - pop     : before a rule or block is popped from stack
    - fetch   : before a new rule is fetched
    - match   : after a value matching occurs
    - iterate : after a new iteration pass begins (ANY, SOME, ...)
    - paren   : after a paren expression was evaluated
    - end     : after end of input has been reached
```

This API will be extended in the future to get more fine-grained events. This API could be used to provide Parse with tracing, stats, debugging, ... Let's see what Red users will come up with! ;-)

A [default callback](https://github.com/red/red/blob/master/boot.red#L1013) has been implemented for **tracing** purposes. It can be accessed using the handy **parse-trace** function wrapper:

```
    parse-trace <input> <rules>
```

You can try it with simple parsing rules to see the resulting output.

What about DSL support?

Parse is a powerful tool for implementing DSL parsers (both embedded and externals), thanks to its ability to inline Red expressions directly into the rules, allowing to easily link the DSL syntax with its corresponding semantics. To illustrate that, here is a simple interpreter for a famous obfuscated [language](http://en.wikipedia.org/wiki/Brainfuck), written using Parse:

```
    bf: function [prog [string!]][
        size: 30000
        cells: make string! size
        append/dup cells null size

        parse prog [
            some [
                  ">" (cells: next cells)
                | "<" (cells: back cells)
                | "+" (cells/1: cells/1 + 1)
                | "-" (cells/1: cells/1 - 1)
                | "." (prin cells/1)
                | "," (cells/1: first input "")
                | "[" [if (cells/1 = null) thru "]" | none]
                | "]" [
                   pos: if (cells/1 <> null)
                   (pos: find/reverse pos #"[") :pos
                   | none
                  ]
                | skip
            ]
        ]
    ]

    ; This code will print a Hello World! message
    bf {
        ++++++++++[>+++++++>++++++++++>+++>+<<<<-]>++.>+.+++++++..+++.
        >++.<<+++++++++++++++.>.+++.------.--------.>+.>.
    }

    ; This one will print a famous quote
    bf {
        ++++++++[>+>++>+++>++++>+++++>++++++>+++++++>++++++++>
        +++++++++>++++++++++>+++++++++++>++++++++++++>++++++++
        +++++>++++++++++++++>+++++++++++++++>++++++++++++++++<
        <<<<<<<<<<<<<<<-]>>>>>>>>>>>----.++++<<<<<<<<<<<>>>>>>>
        >>>>>>.<<<<<<<<<<<<<>>>>>>>>>>>>>---.+++<<<<<<<<<<<<<>>
        >>>>>>>>>>>>++.--<<<<<<<<<<<<<<>>>>>>>>>>>>>---.+++<<<<
        <<<<<<<<<>>>>.<<<<>>>>>>>>>>>>>+.-<<<<<<<<<<<<<>>>>>>>>
        >>>>>>+++.---<<<<<<<<<<<<<<>>>>.<<<<>>>>>>>>>>>>>>--.++
        <<<<<<<<<<<<<<>>>>>>>>>>>>>>-.+<<<<<<<<<<<<<<>>>>.<<<<>
        >>>>>>>>>>>>>+++.---<<<<<<<<<<<<<<>>>>>>>>>>>>>>.<<<<<<
        <<<<<<<<>>>>>>>>>>>>>>-.+<<<<<<<<<<<<<<>>>>>>>>>>>>>>-.
        +<<<<<<<<<<<<<<>>>>>>>>>>>>>>--.++<<<<<<<<<<<<<<>>>>+.-
        <<<<.
    }
```

Note: this implementation is limited to one-level of "\[...]" nesting to keep it as short as possible. A complete, but a bit more longer and complex implementation using Parse only, is availaible [here](https://gist.github.com/dockimbel/7713170).

So, such approach works incredibly well for small DSLs. For more sophisticated ones, Parse still works fine, but it might be less helpful as the DSL semantics get more complex. Implementing an interpreter or compiler for a more advanced DSL is not a trivial task for most users. Red will address that in the future by providing a meta-DSL wrapper on top of Parse, exposing a higher-level API to build more sophisticated DSL by abstracting away core parts of an interpreter or compiler. A DSL for building other DSLs is not a crazy idea, it already exists in a very powerful form as the [Rascal](http://www.rascal-mpl.org/) language for example. What Red will provide, will be just one step in that direction, but nothing as sophisticated (and complex) as Rascal.

Other changes in this release  
Just to mention other changes in this release, now that we got rid of the 800 pound gorilla in the room. This release brings a significant number of [bug fixes](https://github.com/red/red/issues?milestone=12&page=1&state=closed), both for Red and Red/System. Also, thanks to qtxie, the ELF file emitter is now on par with the other ones when producing shared libraries.

Thanks to all the people involved in helping for this big release, including design fixes and improvements, testing, bug reporting and test writing.

Enjoy! :-)

Posted by [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055 "author profile") at [1:22 PM](https://www.red-lang.org/2013/11/041-introducing-parse.html "permanent link") [16 comments:](https://www.red-lang.org/2013/11/041-introducing-parse.html#comment-form) [![](https://resources.blogblog.com/img/icon18_edit_allbkg.gif)](https://www.blogger.com/post-edit.g?blogID=5936111837781935054&postID=7425471288694953790&from=pencil "Edit Post")

Labels: [bitset](https://www.red-lang.org/search/label/bitset), [dialect](https://www.red-lang.org/search/label/dialect), [DSL](https://www.red-lang.org/search/label/DSL), [parse](https://www.red-lang.org/search/label/parse), [release](https://www.red-lang.org/search/label/release)

[Newer Posts](https://www.red-lang.org/search?updated-max=2015-03-15T08%3A50%3A00%2B01%3A00&max-results=7&reverse-paginate=true "Newer Posts") [Older Posts](https://www.red-lang.org/search?updated-max=2013-11-30T13%3A22%3A00%2B01%3A00&max-results=7 "Older Posts") [Home](https://www.red-lang.org/)

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

- [▼](javascript:void%280%29)  [2013](https://www.red-lang.org/2013/) (5)
  
  - [▼](javascript:void%280%29)  [November](https://www.red-lang.org/2013/11/) (1)
    
    - [0.4.1: Introducing Parse](https://www.red-lang.org/2013/11/041-introducing-parse.html)
  
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
