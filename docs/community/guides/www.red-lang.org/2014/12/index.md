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

[Newer Posts](https://www.red-lang.org/search?updated-max=2016-06-29T23%3A33%3A00%2B02%3A00&max-results=7&reverse-paginate=true "Newer Posts") [Older Posts](https://www.red-lang.org/search?updated-max=2014-12-22T15%3A11%3A00%2B01%3A00&max-results=7 "Older Posts") [Home](https://www.red-lang.org/)

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
