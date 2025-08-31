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

## December 24, 2014

[]()

### [Objects implementation notes](https://www.red-lang.org/2014/12/objects-implementation-notes.html)

I would like to share some notes about how some of the object features were implemented in the Red compiler. As these are probably the most complex parts in the Red toolchain right now, I thought that it would be worth documenting them a bit, as it can be useful to current and future code contributors.

Shadow objects and functions

*Reminder: the Red toolchain is currently written entirely in Rebol.*

During the work on object support in the Red compiler, I realized that I could leverage the proximity of Red with Rebol much deeper than before, in order to more easily map some Red constructs directly to Rebol ones. That's how I came up with the "shadow" objects concept (later extended to functions too).

It is pretty simple in fact, each time a Red object is processed from the source code, an equivalent, minimized object is created by the compiler in memory and connected to a tree of existing objects in order to match the [definitional scoping](http://www.rebol.com/docs/core23/rebolcore-9.html#section-9) used in the Red code.

Here is an example Red source code with two nested objects:

```
    Red []
    
    a: object [
        n: 123
        b: object [
            inc: func [value][value + n]
        ]
    ]
```

Once processed by the compiler, the following shadow objects are created in memory:

```
    objects: [
        a object [
            n: integer!
            b: object [
                inc: function!
            ]
        ]
    ]
```

But it does not just stop there, the **body** of the Red object is bound (using Rebol's **bind** native) to the internal Rebol object, in such way that the definitional scoping order is preserved. So the Red code is **directly linked** to the Rebol shadow objects in memory. The same procedure (including the Red code binding to Rebol objects part) is applied to all compiled functions, which context is represented as a nested Rebol object in the compiler's memory.

If you get where I am heading, yes, that means that resolving the context of any of the words contained in a Red object/function body becomes as simple as calling Rebol's **bind?** native on the word value. (Remember that Red source code is converted to a tree of blocks before being compiled). The **bind?** native will return one of the Rebol's objects, that can then be used as a key in an hashtable to retrieve all the associated metadata.

I wish I had come up with that simple method when I was implementing namespaces support for Red/System. I think that I will rework that part in Red/System in the future, reusing the same approach in order to reduce compilation times (namespaces compilation overhead is significant in Red/System, roughly taking 20% of the compilation time).

Choosing Rebol as the bootstrapping language for Red, shows here its unique advantages.

Dynamic invocation

Processing path values is really difficult in Red (as it would be in Rebol if it had a compiler). The main issue can be visualized easily in this simple example:

```
    foo: func [o][o/a 123]
```

Now if you put yourself in the shoes of the compiler, what code would you generate for **o/a** ?... Could be a block access, could be a function call with **/a** as refinement, could be an object path accessing a field, could be an object path calling the function **a** defined in the object. All these cases would require a different code output, and the compiler has *no way* to accurately guess which one it is in the general case. Moreover, **foo** can be called with different datatypes as argument, and the compiled code still need to account for that...

One method could be to generate different code paths for each case listed above. As you can guess, this would become quickly very expensive to manage for expressions with multiple paths, as the possible combinations would make the number of cases explode quickly.

Another, very simple solution, would be to defer that code evaluation to the interpreter, but as you cannot know where the expression ends, the whole function (or at least the root level of the function) would need to be passed to the interpreter. Not a satisfying solution performance-wise.

The solution currently implemented in Red compiler for such cases, is a form of "dynamic invocation". If you go through all cases, actually they can be sorted in two categories only:

a) access to a passive value  
b) function invocation

Only at runtime you can know which category the **o/a** path belongs to (even worse, category can change at each **foo** function call!). The issue is that the compiler generates code that evaluates Red expressions as stack manipulations (not the native stack, but a high-level Red stack), so the compiler needs to know which category it is, so it can:

- create the right corresponding stack frames.
- consume the right number of arguments in case of a function invocation.

Basically, the generated Red/System code for the **foo** function would be (omitting prolog/epilog parts for clarity):

For a) case:

```
    stack/mark-native ~eval-path 
    stack/push ~o
    word/push ~a 
    actions/eval-path* false 
    stack/unwind
    integer/push 123
    stack/reset
```

For b) case (with **/a** being a refinement):

```
    stack/mark-func ~o
    integer/push 123
    logic/push true               ;-- refinement /a set to TRUE
    f_o
    stack/unwind
```

As you can see, the moment where the integer value 123 is pushed on stack for processing is very different in both cases. In case a), it is outside of the **o/a** stack frame, in case b), it is part of it. So what should the compiler do then...looks unsolvable?

Actually some stack tricks can help solve it. This is how the compiler handles it now:

- The stack can either overwrite new expressions (default) or accumulate them.

<!--THE END-->

- At each level of a path evaluation, a check for a function result is applied. When a function is detected, it is pushed on stack and a new stack frame is opened to gather the required arguments. Such function is named a "dynamic call" in this context.

<!--THE END-->

- Some stack primitives (like stack/reset) are modified to not only support the overwritting/accumulative modes, but also check if the arity for the pending dynamic call has been fulfilled, and when appropriate, run the deferred function call, clean-up the stack and revert to the default overwritting mode.

This is the code currently produced by the Red compiler for **o/a 123**:

```
    stack/push ~o
    either stack/func? [stack/push-call path388 0 0 null] [
        stack/mark-native ~eval-path
        stack/push stack/arguments - 1      ;-- pushes ~o
        word/push ~a
        actions/eval-path* false
        stack/unwind-part
        either stack/func? [
            stack/push-call path388 1 0 null
        ][
            stack/adjust
        ]
    ]
    integer/push 123
    stack/reset
```

This generated code, with the help of the dual-mode stack, can support evaluation of **o/a** whatever value the path refers to (passive or function). **stack/func?** here checks if the stack top entry is a function or not. There is a little performance impact, but it is not significant, especially in respect to the high flexibility it brings.

So far so good. What happens now if the path is used as argument of a function call:

```
    foo: func [o][probe o/a 123]
```

The outer stack frame that **probe** will create then becomes problematic, because it will close just after **o/a**, preventing it to fetch eventual arguments when **o/a** is a function call...so back to the drawing board? Fortunately not, we can apply the same transformation for the wrapping call and defer it until its arguments have been fully evaluated. This is the resulting code:

```
    f_~path389: func [/local pos] [
        pos: stack/arguments 
        stack/mark-func ~probe 
        stack/push pos 
        f_probe 
        stack/unwind
    ] 

    stack/defer-call ~probe as-integer :f_~path389 1 null
    
    stack/push ~o
    either stack/func? [stack/push-call path388 0 0 null] [
        stack/mark-native ~eval-path
        stack/push stack/arguments - 1
        word/push ~a
        actions/eval-path* false
        stack/unwind-part
        either stack/func? [
            stack/push-call path388 1 0 null
        ][
            stack/adjust
        ]
    ]
    ------------| "probe o/a"
    integer/push 123
    stack/reset
```

As you can see, it gets more hairy, but still manageable. The outer stack frame is *externalized* (into another Red/System function), so it can be called later, once the nested expressions are evaluated.

That said, dynamic calls still need a bit more work in order to support routine! calls and refinements for wrapping calls. Those features will be added in the next releases. Also, the gain in flexibility makes the compiler more [short-sighted](https://github.com/red/red/issues/968) when a particular structure is expected, like for control flow keywords requiring blocks. I don't see yet how this dynamic call approach could support such use-cases in a more user-friendly way.

But another feature can come to the rescue, the upcoming **#alias** directive proposed in the previous blog post. As long as the user will be willing to use this new directive, it would simply avoid these dynamic constructions, by providing enough information to the compiler to statically determine what kind of value, paths are referring to, resulting in much shorter and faster code, without the short-sightness issue.

This is the kind of problem I had to solve during object implementation and why it took much longer than planned initially.

Hope this deeper look inside the compiler's guts is not too scary. ;-) Now, back to coding for next release!

And, by the way, Merry Christmas to all Red followers. :-)

Posted by [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055 "author profile") at [6:54 PM](https://www.red-lang.org/2014/12/objects-implementation-notes.html "permanent link") [3 comments:](https://www.red-lang.org/2014/12/objects-implementation-notes.html#comment-form) [![](https://resources.blogblog.com/img/icon18_edit_allbkg.gif)](https://www.blogger.com/post-edit.g?blogID=5936111837781935054&postID=9066527040010974670&from=pencil "Edit Post")

Labels: [compiler](https://www.red-lang.org/search/label/compiler), [dynamic calls](https://www.red-lang.org/search/label/dynamic%20calls), [implementation](https://www.red-lang.org/search/label/implementation), [objects](https://www.red-lang.org/search/label/objects)

## December 22, 2014

[]()

### [0.5.0: Objects support](https://www.red-lang.org/2014/12/050-objects-support.html)

We are bumping the version number up higher as we are bringing a new foundational layer and important construct to Red: **object!** datatype and **contexts** support.

Supporting objects in the Red interpreter is relatively easy and straightforward. But adding those features in the compiler has proven to be more complex than expected, especially for access-path support, paths being especially tricky to process, given their highly dynamic nature. Though, I have pushed Red beyond the edges I was planning to stop at for objects support, and the result so far is really exciting!

Object model

Just a short reminder mainly intended for newcomers. Red implements the same object concept as Rebol, called [prototype-based](http://en.wikipedia.org/wiki/Prototype-based_programming) objects. Creating new objects is done by cloning existing objects or the base **object!** value. During the creation process, existing field values can be modified and new fields can be added. It is a very simple and efficient model to encapsulate your Red code. There is also a lot to say about words binding and contexts, but that topic is too long for this blog entry, we will address that in the future documentation.

Object creation

The syntax for creating a new object is:

```
    make object! <spec>
 
    <spec>: specification block
```

Shorter alternative syntaxes (just handy shortcuts):

```
    object  <spec>
    context <spec>
```

The specification block can contain any valid Red code. Words set at the root level of that block will be collected and will constitute the new object's fields.

Example:

```
    make object! [a: 123]
    
    object [a: 123 b: "hello"]
    
    c: context [
       list: []     
       push: func [value][append list value]
    ]
```

You can put any valid code into a specification block, it will be evaluated during the object construction, and only then.

Example:

```
    probe obj: object [
        a: 123
        print b: "hello"
        c: mold 3 + 4
    ]
```

will output:

```
    hello
    make object! [
        a: 123
        b: "hello"
        c: "7"
    ]
```

Objects can also be nested easily:

```
    obj: object [
        a: 123
        b: object [
            c: "hello"
            d: object [
                data: none
            ]
        ]
    ]
```

Another way to create an object is to use the **copy** action which does not require a specification block, so does just a simple cloning of the object. Existing functions will be re-bound to the new object.

Syntax:

```
    copy <object>
```

Object access paths

In order to access object fields, the common path syntax is used (words separated by a slash character). Each word (or expression) in a path is evaluated in the context given by the left side of the path. Evaluation of a word referring to a function will result in invoking the function, with its optional refinements.

Example:

```
    book: object [
        title: author: none
        show: does [print [mold title "was written by" author]]
    ]

    book/title: "The Time Machine"
    book/author: "H.G.Wells"
    print book/title
    book/show
```

will output:

```
    The Time Machine
    "The Time Machine" was written by H.G.Wells
```

SELF reference

A special keyword named **self** has been reserved when self-referencing the object is required.

Example:

```
    book: object [
        title: author: none
        list-fields: does [words-of self]
    ]
    book/list-fields
```

will output:

```
    [title author list-fields]
```

Object inheritance

While cloning produces exact replicas of the prototype object, it is also possible to extend it in the process, using **make** action.

Syntax:

```
    make <prototype> <spec>

    <prototype> : object that will be cloned and extended
    <spec>      : specification block
```

Example:

```
    a: object [value: 123]
    
    c: make a [
        increment: does [value: value + 1]
    ]
    
    print c/increment
    print c/increment
```

will output:

```
    124
    125
```

It is also possible to use another object as **&lt;spec&gt;** argument. In such case, both objects are merged to form a new one. The second object takes priority in case both objects share same field names.  
   
Example:

```
    a: object [
        value: 123
        show: does [print value]
    ]
    b: object [value: 99]
    
    c: make a b
    c/show
```

will output:

```
    99
```

Detecting changes in objects

Sometimes, it can be very useful to detect changes in an object. Red allows you to achieve that by defining a function in the object that will be called just after a word is set. This event is generated only when words are set using a path access (so inside the object, you can set words safely). This is just a first incursion in the realm of [metaobject protocols](http://en.wikipedia.org/wiki/Metaobject#Metaobject_protocol), we will extend that support in the future.

In order to catch the changes, you just need to implement the following function in your object:

```
    on-change*: func [word [word!] old new][...]
    
    word : field name that was just affected by a change
    old  : value referred by the word just before the change
    new  : new value referred by the word
```

It is allowed to overwrite the word just changed if required. You can directly set the field name or use **set**:

```
    set word <value>
```

Example:

```
    book: object [
        title: author: year: none
  
        on-change*: func [word old new /local msg][
            if all [
                word = 'year
                msg: case [
                    new >  2014 ["space-time anomaly detected!"]
                    new < -3000 ["papyrus scrolls not allowed!"]
                 ]
            ][
               print ["Error:" msg]
            ]
        ]
    ]

    book/title: "Moby-Dick"
    book/year: -4000
```

will output:

```
    Error: papyrus scrolls not allowed!
```

Extended actions and natives for objects

You can use **set** on an object to set all fields at the same time. **get** on an object will return a block of all the fields values. **get** can also be used on a get-path!.

Example:

```
    obj: object [a: 123 b: "hello"]
    probe get obj
    set obj none
    ?? obj
    set obj [hello 0]
    ?? obj
    probe :obj/a
```

will output:

```
    [123 "hello"]
    obj: make object! [
        a: none
        b: none
    ]
    obj: make object! [
        a: 'hello
        b: 0
    ]
    hello
```

**Find** action gives you a simple way to check for a field name in an object. If found it will return **true**, else **none**.

**Select** action does the same check as **find**, but returns the field value for matched word.

```
    obj: object [a: 123]
    probe find obj 'a
    probe select obj 'a
    probe find obj 'hello
```

will output:

```
    true
    123
    none
```

The **in** native will allow you to bind a word to a target context:

```
    a: 0
    obj: object [a: 123]
    probe a
    probe get in obj 'a
```

will output:

```
    0
    123
```

**Bind** native is also available, but not completly finished nor tested.

Reflectors

Some reflective functions are provided to more easily access objects internal structure.

- **words-of** returns a block of field names.
- **values-of** returns a block of field values.
- **body-of** returns the object's content in a block form.

Example:

```
     a: object [a: 123 b: "hello"]
     probe words-of a
     probe values-of a
     probe body-of a
```

will output:

```
    [a b]
    [123 "hello"]
    [a: 123 b: "hello"]
```

SYSTEM object

The **system** object is a special object used to hold many values required by the runtime library. You can explore it using the new extended **help** function, that now accepts object paths.

```
red>> help system
`system` is an object! of value:
    version          string!   0.5.0
    build            string!   21-Dec-2014/19:27:05+8:00
    words            function! Return a block of global words available
    platform         function! Return a word identifying the operating system
    catalog          object!   [datatypes actions natives errors]
    state            object!   [interpreted? last-error]
    modules          block!    []
    codecs           object!   []
    schemes          object!   []
    ports            object!   []
    locale           object!   [language language* locale locale* months da...
    options          object!   [boot home path script args do-arg debug sec...
    script           object!   [title header parent path args]
    standard         object!   [header]
    view             object!   [screen event-port metrics]
    lexer            object!   [make-number make-float make-hexa make-char ...
```

*Note: not all system fields are yet defined or used.*

Future evolutions

As this release already took a lot of time, some of the planned features are postponed to future releases. Here are a few of them.

Sometimes, it is convenient to be able to add fields to an object in-place, without having to recreate it, losing lexical binding information in the process. To achieve that, a new **extend** native will be added, working like [originaly intended](http://www.rebol.com/article/0233.html) in Rebol3.

In order to help the Red compiler produce shorter and faster code, a new **#alias** compilation directive will be introduced. This directive will allow users to turn an object definition into a "virtual" type that can be used in type spec blocks. For example:

```
    #alias book!: object [
        title: author: year: none
        banner: does [form reduce [author "wrote" title "in" year]]
    ]
    
    display: func [b [book!]][
        print b/banner
    ]
```

This addition would not only permit finer-grained type checking for arguments, but also help the user better document their code.

Another possible change will be in the output **mold** produces for an object. Currently such output will start with "**make object!**", this might be changed to just "**object**", in order to be shorter and easier to read in addition to be more consistent to the way function! values are molded.

Fixed issues

In order to make this release happen as quickly as possible, we have not fixed all the open tickets that were planned to be fixed in this release, but we still managed to fix a [few of them](https://github.com/red/red/issues?q=is%3Aissue%20milestone%3A0.5.0%20is%3Aclosed). The other pending tickets will be fixed in the upcoming minor releases.

I should also mention that 537 [new tests](https://github.com/red/red/blob/master/tests/source/units/object-test.red) were added to cover objects features. The coverage is already good, but we probably need more of them to cover edge cases.

That's all for this blog article! :-)

I will publish another blog entry about additional information regarding the implementation strategy used by the compiler for supporting contexts and object paths.

As we have almost completed other significant features during the last months, you should expect new minor releases happening very quickly in the next weeks. They will include:

- New cross-platform console engine written entirely in Red (no dependencies).
- New Android toolchain for creating APK files 100% ported to Red (no dependencies).
- Full error and exceptions support at Red level.
- Redbin initial implementation (not started yet).

Also, the work for 0.6.0 has started already (GUI support), even if its at prototype stage right now. I plan to release a first minimal version in the next few weeks (we will extend it step by step until 1.0).

Hope the waiting for the new release was worth it. ;-)

Posted by [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055 "author profile") at [3:11 PM](https://www.red-lang.org/2014/12/050-objects-support.html "permanent link") [4 comments:](https://www.red-lang.org/2014/12/050-objects-support.html#comment-form) [![](https://resources.blogblog.com/img/icon18_edit_allbkg.gif)](https://www.blogger.com/post-edit.g?blogID=5936111837781935054&postID=4660923163502128838&from=pencil "Edit Post")

Labels: [objects](https://www.red-lang.org/search/label/objects), [release](https://www.red-lang.org/search/label/release)

## August 3, 2014

[]()

### [0.4.3: Floating point support](https://www.red-lang.org/2014/08/043-floating-point-support.html)

After a long time having only partial floating point support in Red/System, it comes now to Red with a broader support, thanks to the terrific work from Qtxie and Oldes, who managed to push Red further while I was busy moving from Europe to China (though, this might be the topic for another blog entry, as requested by many of you).

The new **float!** datatype implements [IEEE-754 64-bit floating point](http://en.wikipedia.org/wiki/Double-precision_floating-point_format) format. It is available with most of the usual math functions support:

- infix operators: +, -, \*, /, \*\*.
- prefix base functions: **add, substract, multiply, divide, power.**
- trigonometric functions:  **cosine, sine, tangent, arcsine, arccosine, arctangent.**
- other math functions: **log-2, log-10, log-e, exp, square-root, round**

Note that these trigonometric functions are taking arguments in **degrees**, a **/radians** refinement is provided for input values in **radians**. However, this can result in extra verbosity for some long math expressions where using only radians, like:

> `((sine/radians b) * (cosine/radians c)) + ((cosine/radians b) * (sine/radians c))`

Some radians-oriented shortcuts to these functions are also provided for convenience: **cos, sin, tan, arcsin, arccos, arctan**. So the above expression becomes:

> `((sin b) * (cos c)) + ((cos b) * (sin c))`

Here are some code examples from Red console:

> ```
> red>> 1.23456
== 1.23456
red>> 1e10
== 10000000000.0
red>> 1.23 * 2
== 2.46
red>> 1.23 * 2.0
== 2.46
red>> to integer! 1.23 * 2.0
== 2
red>> cos pi
== -1.0
red>> sin pi
== 0.0
red>> cos pi / 2
== 0.0
red>> cos pi / 3
== 0.5
red>> cosine/radians pi / 3
== 0.5
red>> cosine 60
== 0.5
red>> .1 + .2 + .3
== 0.6
red>> .1 + .2 + .3 = .6
== true
red>> .1 + .2 + .3 - .6
== 1.110223024625157e-16
red>> float? load "0.1"
== true
red>> to float! 1
== 1.0
red>> 1 = to integer! to float! 1
== true
> ```

As you can see, Red tries to give you meaningful outputs even when the result is not exact, but this approach has its limits too. Qtxie has ported partially [dtoa()](http://www.netlib.org/fp/dtoa.c) functions to Red/System, however, the overhead of the additional code (20-40KB once compiled) is quite costly given how tiny is currently our runtime library (~350KB). So, for now, that implementation has been provided as an optional [library](https://github.com/red/red/tree/master/system/library/dtoa) for Red/System, and will be modularized for Red, once modules will be supported.

IEEE-754 special values

You might know that standard floating point format supports a few extra special values that are meant to make some calculation possible in edge cases. Those are also supported natively by Red, with the following literal formats:

> ```
> Not a Number (NaN)        :  1.#NaN
Positive Infinity (+INF)  : +1.#INF (or just 1.#INF)
Negative Infinity (-INF)  : -1.#INF
Positive Zero             : +0.0 (or just 0.0)
Negative Zero             : -0.0
> ```

These values are mostly intended for scientific calculations, you do not have to worry about them. They can be produced as results of some math operations on floats, but by default, an error will be thrown instead.

In case, you need to operate with maximum precision, and have all the special float values as results instead of errors, a couple of flags are available for that through the **system** special access. The syntax is:

> ```
> system/float-options [spec]

[spec]: block of flags (word! | set-word!) with values (logic! | word!)
> ```

Valid flags are:

- **pretty?**: enables pretty printing of float numbers when very close to an integer value (default: true)
- **full?**: enables math operations on float special values (default: false)

 Examples:

> ```
> red>> 4.000000000000001e32
== 4.0e32
red>> system/float-options [pretty?: no]
red>> 4.000000000000001e32
== 4.000000000000001e32
> ```

Armhf support

So far, Red supported only the [armel ABI](https://wiki.debian.org/ArmEabiPort) for ARM backends. Since this release, we fully support now [armhf ABI](https://wiki.debian.org/ArmHardFloatPort) too, through a specific compilation option that can be found in the new **RPi** [compilation target](https://github.com/red/red/blob/master/system/config.r#L116) (intended mainly for default OS on RaspberryPi). The main difference between these ABI is the way float values are passed as arguments to functions, armel requires passing them on stack, while armhf requires passing them through FPU registers.

Other changes

- **url!** datatype preliminary support: all actions are working, but no path access support yet.
- New actions: **reverse, random, swap, take, to**(\*), **trim**
- New natives: **same?, NaN?**
- New mezzanines: **float?, routine?**
- Red/System FPU direct access through [system/fpu/* options](http://static.red-lang.org/red-system-specs.html#section-12.9).
- Help command now displays full help on routines too.
- Many [bug fixes](https://github.com/red/red/issues?q=is%3Aissue%20is%3Aclosed%20milestone%3A0.4.3) and a few wishes granted.

(\*) **to** is currently limited to integer/float/string conversions only.

What's next?

After the digression in the floating point lands, we go back to our main roadmap, so in the next releases, expect (in no particular order):

- GUI support for Android / Windows platforms
- Improved toolchain for Android APK generation
- Object compilation support
- New console engine
- Error! datatype and exceptions handling
- Typeset! and other new datatypes
- Redbin format specification and implementation for the compiler
- Improved compiler performance

Thanks for your patience and support during these last months, we are now back to our cruise development speed, so expect faster changes until the end of the year.

Posted by [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055 "author profile") at [6:38 PM](https://www.red-lang.org/2014/08/043-floating-point-support.html "permanent link") [10 comments:](https://www.red-lang.org/2014/08/043-floating-point-support.html#comment-form) [![](https://resources.blogblog.com/img/icon18_edit_allbkg.gif)](https://www.blogger.com/post-edit.g?blogID=5936111837781935054&postID=7376446968834338620&from=pencil "Edit Post")

Labels: [ARM](https://www.red-lang.org/search/label/ARM), [armhf](https://www.red-lang.org/search/label/armhf), [floating point](https://www.red-lang.org/search/label/floating%20point), [FPU](https://www.red-lang.org/search/label/FPU), [math](https://www.red-lang.org/search/label/math), [RaspberryPi](https://www.red-lang.org/search/label/RaspberryPi)

## April 29, 2014

[]()

### [0.4.2: Unicode console and FreeBSD support](https://www.red-lang.org/2014/04/042-unicode-console-and-freebsd-support.html)

This long awaited new release is now available. As I have been travelling a lot in the last months, this release has been delayed much more than I wanted. Anyway, we managed to achieve a really big amount of work, as shown by the 500+ commits since previous release and the [**75** fixes](https://github.com/red/red/issues?milestone=13&page=3&state=closed) over 210 new tickets opened. As usual, we strive to keep the number of opened tickets (especially bug reports) as low as possible, achieving 97.5% of closed tickets out of a total of 794 tickets so far! We really do care about bug reports.

New runtime lexer

The first runtime lexer (wrapped by **load** function) was implemented a year ago, as a quick hack for the console addition to Red. It was coded in Red/System and supported ASCII inputs only. It was not meant to stay more than a few weeks, but as often in the software world, temporary code lifespan exceeds by far the wishes of the author. The addition of Parse dialect in previous release has opened the possibility of rewriting the Red runtime lexer using the **Unicode**-aware **parse** function. It turned out to be a great design choice and opens even more interesting future options like I/O streaming support (when **parse** will support it) or dynamically extending the lexical rules (when loading custom datatypes for example).

Improved console

The new runtime lexer is now powering the Red console, so we finally have proper **Unicode** input support!

[![](https://lh3.googleusercontent.com/blogger_img_proxy/AEn0k_vdhS--JKjF_M36WthukTpgIA3bbalEk86PfCYQoAXvzlDdVOTe4mMkCzvyh8eEfIKFhzXnRHpU26MAbMRCOgllQo-xJ5-pAED7_hzoVzOS5QEfrHxU7Kz3=s0-d)](http://static.red-lang.org/images/unicode-console.png)

A help system has also been provided, including the following functions: **help**, **what** and **source**. Try them from the console!

From the console code, the line editing features have been extracted in a different [source file](https://github.com/red/red/blob/master/runtime/console/input.red) that can be now included in your Red programs when you need user input support. For that, two new functions have been provided (working like in Rebol): **input** and **ask**.

Moreover, a new [branch](https://github.com/red/red/tree/new-console) was started in order to provide cross-platform line editing capabilities without the burden of external dependencies that have proved to be [problematic](https://github.com/red/red/pull/792) and limited. The new vt100 version should work fine, but it is unfinished. Contributors with deep terminal coding experience are welcome to help improve the current [code](https://github.com/red/red/tree/new-console/runtime/devices/console). We are aiming at a cross-platform console engine that could be used both in CLI and GUI apps.

Additional functions

- New actions: **absolute, remainder, complement, power, odd?, even?, and, or, xor, reverse**

<!--THE END-->

- New natives: **complement?, positive?, negative?, min, max, shift, to-hex**

<!--THE END-->

- New operators: **&lt;&lt;, &gt;&gt;, &gt;&gt;&gt;**

A new option was added to the **system** function: **system/interpreted?**, that will return **true** if the code is run by the interpreter (remember that **do** invokes the interpreter until we get JIT-compilation abilities).

**Parse** and **load** have been extended to accept a **/part** refinement.

Infix operators can now be created from existing functions or routines.

A first **call** function implementation has been [contributed](https://github.com/red/red/tree/master/system/library/call) by Bruno Anselme with support for both Red and Red/System.

FreeBSD support

Yes, we got it now! :-) All thanks to Richard Nyberg who kindly provided us with the low-level patches required to make Red work on FreeBSD.

Red/System changes

The Red/System lexer used to be simply the **load** native from Rebol, which was a great way to speed up the development at the beginning, but was also limitating the syntax to only what Rebol2 accepts. Now the Red/System lexer uses the same code as the Red lexer (the compiler version, not the runtime one), freeing the Red/System syntax from the limitations and making it truly a dialect of Red!

Literal arrays support has been [added](http://static.red-lang.org/red-system-specs.html#section-4.8.6) also in order to facilitate initialization of arrays of value (until we get a first class array! datatype).

CPU registers read/write access has been [added](https://github.com/red/red/commit/b1589af1374fa274ee3831cceda51651130c7c56). It will be extended in the future to support special registers (like status flags register).

The maximum number of function local variables supported by Red/System was limited to 16, this was [limitating](https://github.com/red/red/issues/600) also the number of local words that could be used in a Red function. This limitation has now been raised much higher, at least **512** local variables are now allowed.

Work in progress...

Object support is already present in this release, but is it not official yet, as it is supported by the interpreter only and not the compiler. Expect quick progress on this front.

The Android GUI support is also under heavy work in the [android](https://github.com/red/red/tree/android) branch. In order to implement a proper GUI API, the implementation of a [VID](http://rebol.com/docs/easy-vid.html)-like dialect has [started](https://gist.github.com/dockimbel/8599438), with [Android](http://static.red-lang.org/android-gui.jpg) as first back-end. Windows support should follow shortly, then Linux (most probably using GTK+) and finally MacOSX (once we implement the objective-c bridge).

Gear second!

I am not made of [rubber](http://en.wikipedia.org/wiki/Monkey_D._Luffy), but I can go [gear second](http://onepiece.wikia.com/wiki/Gomu_Gomu_no_Mi/Gear_Second_Techniques) too! ;-) You may have not noticed, but the project is rapidly growing up in the last months. It is moving faster and on a larger scale as more contributors are joining. We also get better organized. This is the github stats for just **this month**:

[![](https://lh3.googleusercontent.com/blogger_img_proxy/AEn0k_ui7TdJ777fiBAAht3ypVoR2EDXIjb1gYYJGN6_RT6575bND1YA1kUKiz5VeKIy-hCLTHHVHHgHYTxOh8o9TMCoDXtgVNwM6vdp9yhgyREaKbBnGN8=s0-d)](http://static.red-lang.org/images/gear-second.png)

The most important power-up we got was the addition of [Xie Qingtian](http://static.red-lang.org/nenad-qtxie.jpg) (aka [qtxie](https://github.com/qtxie)) to the Red core team. Xie is an amazingly skilled young programmer from China, who is contributing to Red since more than a year now. But the thing is that he is working **full time** on Red project now, thanks to the kind sponsoring of [CSDN](http://www.csdn.net/) and his CEO, Jiang Tao. Xie is the one who implemented all the new functions listed above and in a short amount of time! So consider that from now on, Red will be advancing **twice** faster thanks to him! ;-)

In order to organize better the work on Red, we are now using extensively [Trello](https://trello.com/b/FlQ6pzdB/red-tasks-overview) as our main task manager tool. The Red tasks board contains three main lists:

- "Work in progress": for features we are working on.
- "Road to 1.0": lists the required features for 1.0 version.
- "Milestones": helps us organize upcoming releases.

Last but not least, the number of visitors on this site and the github repo has, at least, doubled since new year, thanks to an [article](http://www.csdn.net/article/2014-02-27/2818560) on CSDN about Red, our Google Summer of Code [campaign](http://www.red-lang.org/2014/02/project-ideas-for-google-summer-of-code.html) and the successful StackOverflow ad campaign (finished earlier this month) run by HostileFork, that brought us more than 10k new visitors who clicked the ad, making it the most clicked ad on SO since the new year! The ad is still visible [here](http://www.csdn.net/article/2014-02-27/2818560).

Big thank to all the people that have contributed to this (big) release. Enjoy it! :-)

Posted by [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055 "author profile") at [9:04 PM](https://www.red-lang.org/2014/04/042-unicode-console-and-freebsd-support.html "permanent link") [9 comments:](https://www.red-lang.org/2014/04/042-unicode-console-and-freebsd-support.html#comment-form) [![](https://resources.blogblog.com/img/icon18_edit_allbkg.gif)](https://www.blogger.com/post-edit.g?blogID=5936111837781935054&postID=2608033692019889429&from=pencil "Edit Post")

Labels: [Android](https://www.red-lang.org/search/label/Android), [China](https://www.red-lang.org/search/label/China), [console](https://www.red-lang.org/search/label/console), [CSDN](https://www.red-lang.org/search/label/CSDN), [freebsd](https://www.red-lang.org/search/label/freebsd), [lexer](https://www.red-lang.org/search/label/lexer), [literal arrays](https://www.red-lang.org/search/label/literal%20arrays), [load](https://www.red-lang.org/search/label/load), [objects](https://www.red-lang.org/search/label/objects), [Unicode](https://www.red-lang.org/search/label/Unicode)

## February 6, 2014

[]()

### [Project Ideas for the Google Summer of Code 2014](https://www.red-lang.org/2014/02/project-ideas-for-google-summer-of-code.html)

Red has been ramping up its recruiting efforts in 2014.  So far in January, we've done very well with our [open-source recruitment campaign](http://meta.stackoverflow.com/ads/display/210389) on StackOverflow.  Now in February, we are throwing our hat into the ring to be a mentoring organization for Google's **Summer of Code**:

[![](https://developers.google.com/open-source/soc/images/logo-2014-600x540.png)](http://www.google-melange.com/gsoc/homepage/google/gsoc2014)

If you haven't heard about Summer of Code, it pairs college students with mentors who represent an open source project.  The students work remotely and are paid a stipend... and they are expected to complete a measurable goal in the 3 months that they have.  There's an opportunity to start getting involved before the summer, and hopefully the students will have a good experience and stay involved after the summer ends!

Though Nenad will be too busy in the [new Beijing Red headquarters](http://www.red-lang.org/2014/01/year-of-horse.html) :-) to mentor, several members of the Red team have stepped up to volunteer if we are selected.  There is of course around-the-clock support in the [\[Rebol and Red\]](http://chat.stackoverflow.com/rooms/291/rebol-and-red) chat room, but Google needs commitments from specific people to fill out paperwork and reviews.  As the project "admin" Nenad should only have to be consulted if there was a disagreement between the student and the mentor (which would not happen!)  Of course he would be reviewing any pull request, as with any other code submission.

Google says the best project ideas come from students, which sounds like a good idea.  Still, they require a "starter list" of example projects to originate from the potential mentoring organizations.  So here is the one we came up with...

[Read more »](https://www.red-lang.org/2014/02/project-ideas-for-google-summer-of-code.html#more "Project Ideas for the Google Summer of Code 2014")

Posted by [Brian Dickens](https://www.blogger.com/profile/01873914328480997979 "author profile") at [9:27 PM](https://www.red-lang.org/2014/02/project-ideas-for-google-summer-of-code.html "permanent link") [14 comments:](https://www.red-lang.org/2014/02/project-ideas-for-google-summer-of-code.html#comment-form) [![](https://resources.blogblog.com/img/icon18_edit_allbkg.gif)](https://www.blogger.com/post-edit.g?blogID=5936111837781935054&postID=198730093251928115&from=pencil "Edit Post")

## January 27, 2014

[]()

### [Year of the Horse](https://www.red-lang.org/2014/01/year-of-horse.html)

In a few days is the Chinese New Year, the year of the Horse. This is what you can find [online](http://www.travelchinaguide.com/intro/social_customs/zodiac/horse.htm) about its meaning:

*The spirit of the horse is recognized to be the Chinese people's ethos – making unremitting efforts to improve themselves. It is energetic, bright, warm-hearted, intelligent and able. Ancient people liked to designate an able person as 'Qianli Ma', a horse that covers a thousand li a day (one li equals 500 meters).*

[![](https://lh3.googleusercontent.com/blogger_img_proxy/AEn0k_vbcTU3Hh-LHHIW20pGy0hATOUVtSUAvkU87qEcW_Cby4TurmSWxtLSJmFCOKOWHOF18DHJ7l8GQcZWwHDMh0x8tIbnyfpBTfVae2MKqbQy40lryZbZ4r0zXAw=s0-d)](http://static.red-lang.org/images/year_of_the_horse.jpg)

*Clever combination of 2,0,1,4 numbers and an artistic horse illustration!*

The horse empowers men to reach out far places quickly, Red aims at empowering programmers to accomplish more with less efforts. It looks like the Year of the Horse might be a good one for Red to take off.

I have been travelling through Asia since a month now and will be getting back home in a few days. I went to Hong-Kong, Shanghai and Beijing. This is my first time in Asia, and it felt like accomplish a kid's dream, full of exotic names and places. So, it was full of Marco Polo's stories in mind that I came in China...What a contrast! China is so modern that I must confess Europe looks really behind sometimes... China is also full of opportunities for western people, that's not just a saying, I experienced it first hand.

The purpose of my trip was to get information about the Chinese market for programmers and especially mobile programmers, meet with some startups there and IT people there, present Red (and Rebol) to any group of programmers interested in knowing more about it and get feedback from them.

[![](https://lh3.googleusercontent.com/blogger_img_proxy/AEn0k_ta758NSosMk7SoyXOacTJbFLEf3NpbtGTdkdWjrfurrX1ujLlAa-yVcicytWCj_bP73VdMPAx19UWCLVJcwSmrWAqWOfe_J3LSnYnhKw=s0-d "Nenad and Qtxie")](http://static.red-lang.org/nenad-qtxie.jpg)

*[Meeting](http://static.red-lang.org/nenad-qtxie.jpg) with [Qtxie](http://blog.csdn.net/qtxie/), one of the most talented Red contributors.*

I got much more than that in fact and I was not even expecting it. Thanks to [Jerry Tsai](http://weibo.com/rebol) who is supporting Red and Rebol since many years, we could meet with some of the key IT people in China and main startups. I had the opportunity to give an interview at [CSDN](http://www.csdn.net/) (the largest developer community in China) and even give a teaching to an audience of beginners and non-programmers using Rebol2 and its GUI DSL.

[![](https://lh3.googleusercontent.com/blogger_img_proxy/AEn0k_v57xu4BbJWgwoIgQ5NrrW9MWJgZPYZGhY7kS5Lokfn-ldOpEWiwOrA3d6oQIAhgMAylN-f2JdVoWizJRaDKezYPZ7EpwDZyc0wNoGiP0n_kg=s0-d)](http://static.red-lang.org/images/teaching.jpg)

So, not only, I could gather much more information than I expected, but I could also meet with the #1 incubator in China: [InnovationWorks](http://en.chuangxin.com/) (IW).

[![](https://lh3.googleusercontent.com/blogger_img_proxy/AEn0k_tv3p0He1NtCmAVBLQVJONifBmvHVVQBR1qMuI_9CspNTk2rZRdp7Rkq0P68Kdv_pvcczu4JGLchXY9G17K-jGqNqFLYYiJz3QYkA=s0-d)](http://static.red-lang.org/images/IW.jpg)

[IW](http://en.chuangxin.com/) made me an offer for spending 6 months at their offices in Beijing as a EIR (Entrepreneur In Residence) that I accepted. Basically, I will be able to continue coding on Red project while providing some architecture and tech advices to the incubated startups. This will be a great opportunity for me to study deeply the Chinese programmer's market and prepare for proposing some Red-related products or services in China and worldwide. So I will be moving in Beijing in a few months. This move does not change in any way my work on Red, as I will be able to continue working hard during the whole year on pushing Red closer to a production version.

I was able to work a bit during my trip, mainly on GUI support for Android (reusable for other platforms as well), so the next Red release should feature an alpha version of GUI programming support!

Special thank to Tamas Herman who hosted me during my stay at Hong-Kong and provided me with all I needed for working (including delicious Thai food!). :-)

So, let's start riding the Red horse this year! ;-)

Posted by [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055 "author profile") at [3:44 PM](https://www.red-lang.org/2014/01/year-of-horse.html "permanent link") [10 comments:](https://www.red-lang.org/2014/01/year-of-horse.html#comment-form) [![](https://resources.blogblog.com/img/icon18_edit_allbkg.gif)](https://www.blogger.com/post-edit.g?blogID=5936111837781935054&postID=4085041808703955029&from=pencil "Edit Post")

Labels: [China](https://www.red-lang.org/search/label/China), [GUI](https://www.red-lang.org/search/label/GUI), [IW](https://www.red-lang.org/search/label/IW), [startups](https://www.red-lang.org/search/label/startups)

[Newer Posts](https://www.red-lang.org/search?updated-max=2016-06-29T23%3A33%3A00%2B02%3A00&max-results=7&reverse-paginate=true "Newer Posts") [Older Posts](https://www.red-lang.org/search?updated-max=2014-01-27T15%3A44%3A00%2B01%3A00&max-results=7 "Older Posts") [Home](https://www.red-lang.org/)

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

- [▼](javascript:void%280%29)  [2014](https://www.red-lang.org/2014/) (6)
  
  - [▼](javascript:void%280%29)  [December](https://www.red-lang.org/2014/12/) (2)
    
    - [Objects implementation notes](https://www.red-lang.org/2014/12/objects-implementation-notes.html)
    - [0.5.0: Objects support](https://www.red-lang.org/2014/12/050-objects-support.html)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [August](https://www.red-lang.org/2014/08/) (1)
    
    - [0.4.3: Floating point support](https://www.red-lang.org/2014/08/043-floating-point-support.html)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [April](https://www.red-lang.org/2014/04/) (1)
    
    - [0.4.2: Unicode console and FreeBSD support](https://www.red-lang.org/2014/04/042-unicode-console-and-freebsd-support.html)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [February](https://www.red-lang.org/2014/02/) (1)
    
    - [Project Ideas for the Google Summer of Code 2014](https://www.red-lang.org/2014/02/project-ideas-for-google-summer-of-code.html)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [January](https://www.red-lang.org/2014/01/) (1)
    
    - [Year of the Horse](https://www.red-lang.org/2014/01/year-of-horse.html)

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
