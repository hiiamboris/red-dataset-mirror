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

## June 8, 2023

[]()

### [Dynamic Refinements and Function Application](https://www.red-lang.org/2023/06/dynamic-refinements-and-function.html)

### It's Time to Apply Yourself to Red

Red has never had an apply function, though we knew it would come someday. In the meantime, some of us rolled our own. Gregg's was simple, neither flexible nor efficient, and just a couple lines of code. Boris made a much more capable version, but it could still only be so fast as a mezzanine. R2 had a mezz version, which suffered the same problem. All that changes now. Apply is dead! Long live Apply! It required deep work, and a lot of design effort, but we think you'll like the results, whether you're a high-level Reducer, or anxious to see how much leverage you can, um, apply, from a functional perspective. Everybody wins.

If you don't know what apply is, in terms of functional languages, take a moment and [read up](https://en.wikipedia.org/wiki/Apply). If you can get through the introduction there without getting dizzy, great. If your head is spinning, feel free to stop after the first section of this article and ignore the deep dive. You still get 90% of the value for most high level use cases. Gregg got so dizzy that he fell down, but was still able to help with this article.

Function application is largely about composition. How you can combine functions in a concise way for maximum leverage and minimum code. The problem with its design in many languages is that it makes things harder to understand. Rather than concrete functions names, there is indirection and abstraction. It can be tricky to get right, especially in a flexible language like Red, while also maintaining as much safety as possible. You can drive fast, but still wear your seat belt.

## Dynamic Refinements

This subtle feature is likely to see wide use, because it will reduce code and let people build more flexible functions. It's also easy to explain. Here's an example. First, how you would write it today:

```
repend: func [
    {Appends a reduced value to a series and returns the series head} 
    series [series!] 
    value 
    /only "Appends a block value as a block"
][
    either only [
        append/only series reduce :value
    ][
        append series reduce :value
    ]
]
```

With dynamic refinements, it can be done like this.

```
repend: func [
    {Appends a reduced value to a series and returns the series head} 
    series [series!] 
    value 
    /only "Appends a block value as a block"
][
    append/:only series reduce :value
]
```

In case you missed the subtlety, it's :only being a get-word in the path. That's right, it's evaluated, rather than being treated literally, just like you use in selector paths. The value for the dynamic refinement is taken from its context, which can be a refinement in the function, or a local value. It can be any truthy value to use the refinement, and it is only retrieved not evaluated. That means you can't use a computed value directly, which makes it safer. Other than that, paths work just as they always have. If a refinement is used, fixed (literal) or dynamic, which can be mixed however you want, any arguments it requires will be fetched and used. Otherwise they are silently ignored, so you don't have to clutter your code or worry about what a dynamic path expression will consume.

```
repend: func [
    {Appends a reduced value to a series and returns the series head} 
    series [series!] 
    value 
    /only "Appends a block value as a block"
    /dup  "Duplicate the value"
        count [integer!]
][
    append/:only/:dup series reduce :value count
]

>> only: false  dup: false  repend/:only/:dup [] [1] 3
== [1]
>> only: true  dup: false  repend/:only/:dup [] [1] 3
== [[1]]
>> only: false  dup: true  repend/:only/:dup [] [1] 3
== [1 1 1]
>> only: true  dup: true  repend/:only/:dup [] [1] 3
== [[1] [1] [1]]
```

This is an incredibly exciting and powerful feature. It's a shame there isn't more to explain. ;^)

## Function Application

Functional Programming has never yet become mainstream, though it has periodic rises in popularity and a devoted following in many language camps. Even Red. Yes, Red is a functional language. It's not a *pure* functional language, because functions can have side effects, but functions are first class values and can be passed around like any other. It lets you do things like this:

```
>> do-math-op: func [
    fn    [any-function!]
    arg-1 [number!]
    arg-2 [number!]
][
    fn arg-1 arg-2
]

== func [fn [any-function!] arg-1 [number!] arg-2 [number!]][fn arg-1 arg-2]
>> do-math-op :add 1 2
== 3
>> do-math-op :subtract 1 2
== -1
```

That's called a Higher Order Function, or HOF. It also means you can *return* a function as a result.

```
>> make-multiplier: func [
    arg-1 [number!]
][
    ;; We're making a function and returning it here.
    func [n [number!]] compose [(arg-1) * n]
]

== func [arg-1 [number!]][func [n [number!]] compose [(arg-1) * n]]
>> fn-m: make-multiplier 4
== func [n [number!]][4 * n]
>> fn-m 3
== 12
```

That's all well and good, but what if you want to call different functions that take a different number or type of arguments? Now it gets tricky, and inefficient. Because Red uses free-ranging evaluation (function args are not contained in a paren or marked as ending in any way at the call site), how do you handle different arities (number of arguments)? Here's a very simple apply mezzanine:

```
apply: func [
    "Apply a function to a block of arguments." 
    fn [any-function!] "Function to apply" 
    args [block!] "Arguments for function" 
    /only "Use arg values as-is, do not reduce the block"
][
    args: either only [copy args] [reduce args] 
    do head insert args :fn
]
```

So easy! The power of Red. But there is a cost. It's a mezzanine function, so it's slower than a native function, the args are copied or reduced, and then do is used to evaluate it. We can live with this kind of overhead for a great deal of Red code, but apply is a building block, and may be used in deep code where performance is important. You may also have noticed that the fn argument is any-function!, that means two things: 1) If you want to know the *name* of the function, the word that refers to it, too bad. You'd have to pass another arg for that. 2) Refinements. You can't use them with this model. And that limitation is a killer. For example, you could pass :append but not :append/:only. And there's no way you could have an /only refinement in *your* function and just pass that along. Until now. 

### The Real Apply

Here's the new apply native that is now available in Red:

```
USAGE:
    APPLY func args

DESCRIPTION: 
    Apply a function to a reduced block of arguments. 
    APPLY is a native! value.

ARGUMENTS:
    func    [word! path! any-function!] "Function to apply, with eventual refinements."
    args    [block!] "Block of args, reduced first."

REFINEMENTS:
    /all    => Provides a continuous list of arguments, tail-completed with false/none.
    /safer  => Forces single refinement arguments, skip them when inactive instead of evaluating.
```

Notice that the func arg can now be a word! or path!, so you can use the name, or a path including refinements. That's right, the Dynamic Refinements feature explained above works with apply too. And having access to the name being used to call the function is enormously valuable when it comes to tracing and debugging. It's a huge win. 

One big difference is that all the arguments for apply are in a single block. Another is that you **MUST** include the on/off values for each dynamic refinement in the arg block, they **DO NOT** come from the environment (context). Compare this version to the one in the Dynamic Refinements section. Really, paste them into an editor and look at them side by side. 

```
>> only: false  dup: false  apply 'append/:only/:dup [[] [1] only dup 3] 
== [1]
>> only: true  dup: false  apply 'append/:only/:dup [[] [1] only dup 3] 
== [[1]]
>> only: false  dup: true  apply 'append/:only/:dup [[] [1] only dup 3] 
== [1 1 1]
>> only: true  dup: true  apply 'append/:only/:dup [[] [1] only dup 3] 
== [[1] [1] [1]]

; Refinement names in the arg block don't have to match the spec.
; You can use other names, or literal values. For example:

apply 'append/:only/:dup [[] [1] false false 3] 

a: b: false  apply 'append/:only/:dup [[] [1] a b 3]
```

It means you have to be more careful in lining things up with the function spec, in a different way than you're used to, but here's where you could use a computed refinement value, which may be useful for generative scenarios like testing. You can also see that both refinements are dynamic, so both need an associated on/off value in the args block.

```
>> only: does [random true]
== func [][random true]
>> blk: copy [] dup: no  loop 10 [apply 'append/:only/:dup [blk [1] only dup none]]
== [1 [1] 1 [1] [1] 1 [1] [1] 1 1]
```

But if you use a fixed refinement, it does not need the extra on/off value. In this example, /dup is always used, so there is no on/off value for it in the args, block, but its associated count arg has to be there, and is type-checked normally.

```
>> only: does [random true]
== func [][random true]
>> blk: copy [] dup: no  loop 10 [apply 'append/:only/dup [blk [1] only 2]]
== [[1] [1] 1 1 1 1 [1] [1] [1] [1] 1 1 [1] [1] [1] [1] 1 1 [1] [1]]
>> blk: copy [] dup: no  loop 10 [apply 'append/:only/dup [blk [1] only none]]
*** Script Error: append does not allow none! for its count argument
*** Where: append
*** Near : apply 'append/:only/dup [blk [1] only none]
*** Stack: 
```

But those aren't your only options. During the design of apply there was a *lot* of discussion about the interface(s) to it, and different use cases benefit from different models. For example, programmatically constructed calls means you need to build the path, and keep the args in sync. It may be easier to build a single block with everything in it, which you can do.

```
>> only: does [random true]
== func [][random true]
>> blk: copy []  loop 5 [apply :append [blk [1] /only only /dup no none]]
== [1 1 [1] [1] 1]
>> blk: copy []  loop 5 [apply :append [blk [1] /only only /dup yes 2]]
== [[1] [1] 1 1 1 1 [1] [1] 1 1]
>> blk: copy []  loop 5 [apply 'append [blk [1] /only only /dup no none]]
== [1 1 [1] [1] 1]
>> blk: copy []  loop 5 [apply 'append [blk [1] /only only /dup yes 2]]
== [[1] [1] [1] [1] 1 1 1 1 [1] [1]]
```

This interface is used if the first argument to apply is a function or lit-word, and /all is not used.

### Apply/all

This is the most direct model, and what the others map to internally. In those models, you get friendly refinements, which may be optional, and those may have their own optional args. It's great for humans, and one of the best things about Redbol languages. But look at it from the view of a function spec.

```
>> print mold spec-of :append
[
    {Inserts value(s) at series tail; returns series head} 
    series [series! bitset! port!] 
    value [any-type!] 
    /part "Limit the number of values inserted" 
    length [number! series!] 
    /only {Insert block types as single values (overrides /part)} 
    /dup "Duplicate the inserted values" 
    count [integer!] 
    return: [series! port! bitset!]
]
```

The doc string isn't used when calling functions, so we can ignore that for this discussion. We can also ignore return: here. What's left is all the parameters (we often interchange arg and parameter, but there's a technical difference. Parameters are the named slots in a function spec, and arguments are the actual values passed in those slots). There are seven of those. Some are required args, some are refinements, and some are optional args. But there are seven slots, and when a function is invoked it expects there to be seven values on the stack that it *could* use if needed, or ignored if not.

When you use /all, you're telling apply that you are going to provide *all* those values in a single block, *in the order of the function spec*, like a stack frame (don't worry about the terminology too much if it's unfamiliar). Apply/all calls look like this:

```
1.
>> blk: copy []  loop 5 [apply/all 'append [blk [1] false none false true 2]]
== [1 1 1 1 1 1 1 1 1 1]

2.
>> blk: copy []  loop 5 [apply/all 'append [blk [1] false none true true 2]]
== [[1] [1] [1] [1] [1] [1] [1] [1] [1] [1]]

3.
>> blk: copy []  loop 5 [apply/all 'append [blk [1] false none true false 2]]
== [[1] [1] [1] [1] [1]]

4.
>> blk: copy []  loop 5 [apply/all 'append [blk [1] false none only false none]]
== [1 [1] 1 1 [1]]

5.
>> blk: copy []  loop 5 [apply/all 'append [blk [1] false none 1 false none]]
*** Script Error: append does not allow integer! for its only argument
*** Where: append
*** Near : apply/all 'append [blk [1] false none 1 ]
*** Stack:  

6.
>> blk: copy []  loop 5 [apply/all 'append [blk [1] false none true true none]]
*** Script Error: append does not allow none! for its count argument
*** Where: append
*** Near : apply/all 'append [blk [1] false none true ]
*** Stack:  

7.
>> blk: copy []  loop 5 [apply/all 'append [blk [1]]]
== [1 1 1 1 1]
```

You can see that the refinement slots are now anonymous logic values in examples 1-3, but 4 uses only, our func from earlier examples, which randomly returns true or false. You can use anything that evaluates to logic! for a refinement slot. 5 shows that it has to be logic!, not just truthy, because types are checked (and logic refinement values then stand out against none argument values). And 6 shows that if you use /dup (second from the last arg), the count arg is also type checked, where 4 didn't complain because /dup was false. Confused yet? Look at 7. How can that work? I thought we had to fill all the slots! Yes and No. Apply "tail completes" the block with false/none values for you, if you don't provide enough arguments. Think of find, which has 16 slots. You only have to include enough args *up to* the last one you need. That may help, but if you need to use /match, the last refinement in find, you will have to provide all 16 args. Before you think this is unacceptable, consider our first repend example:

```
repend: func [
    {Appends a reduced value to a series and returns the series head} 
    series [series!] 
    value 
    /only "Appends a block value as a block"
][
    append/:only series reduce :value
]
```

It would look like this:

```
repend: func [
    {Appends a reduced value to a series and returns the series head} 
    series [series!] 
    value 
    /as-one "Appends a block value as a block"
][
    apply/all 'append [series reduce :value false none :as-one]
]
```

The point here is not to show that apply/all is longer, but that we can use a different name, where the first example must use :only in the path (make your own version to try it). Not all refinements will propagate using the same name. With /all it cares only about the logic value in the slot.

### Apply/safer

/Safer is a form of short-circuit logic. Its purpose is to avoid the evaluation of unused args. Without it, everything in the args block is evaluated, but may be discarded if an associated refinement isn't active. The easiest way to explain this is with an example. 

```
; This is the function we're going to apply
applied: func [i [integer!] b /ref c1 /ref2 /ref3 c3 c4][
    reduce ['i i 'b b 'ref ref 'c1 c1 'ref2 ref2 'ref3 ref3 'c3 c3 'c4 c4]
]
; And some passive and active arg values
c: 0
bar40: does [4 * 2]
baz40: does [c: c + 1 456]

; Refinement args are evaluated
apply       'applied [10 "hi" /ref on bar40  /ref3 on  baz40            "ok"]

; No /safer difference because all refinement args are single values.
apply       'applied [10 "hi" /ref no bar40  /ref3 no  baz40            "ok"]
apply       'applied [10 "hi" /ref no bar40  /ref3 no  (c: c + 1 4 * 2) "ok"]
apply/safer 'applied [10 "hi" /ref no bar40  /ref3 no  (c: c + 1 4 * 2) "ok"]


apply       'applied [10 "hi" /ref no 4 * 2  /ref3 no  baz40            "ok"]
apply       'applied [10 "hi" /ref no bar40  /ref3 no  c: c + 1 4 * 2   "ok"]
apply/safer 'applied [10 "hi" /ref no 4 * 2  /ref3 no  baz40            "ok"]
apply/safer 'applied [10 "hi" /ref no bar40  /ref3 no  c: c + 1 4 * 2   "ok"]

```

### In Real Life

Here are [some examples](https://github.com/red/red/commit/ca49d8d5df7d7b0bdf3e432bf571e1eb52f29dbe) of these new features being applied in the Red code base. The parse-trace example is jaw-dropping, not because it turns 9 lines into 1 (though, wow!), but because it makes the intent so much clearer and eliminates so much redundant code and the errors they can lead to. Not only that, it adds a capability! Before now you couldn't use both refinements together, i.e. parse-trace/case/part, but now you can.

### Things we left out

The design of apply took many turns, with long and vigorous discussion and analysis. Many views and preferences were expressed, and which ultimately led to dynamic refinements as what we called **straight sugar**. That is, syntactic sugar at its sweetest. We knew /all had to be there, as that's what the others build on, but it was originally the default. We all eventually agreed that it shouldn't be, as it's the lowest level and likely the least directly used, though still vital for some use cases. Our problem was striking a balance between what would be most useful, with minimal overlap in use cases, and making the rules too complex to remember and get right. So a couple models didn't make the cut.

If Dynamic Refinements are straight sugar, the candy-wrapper version might be something like this, where you can still use a path, but only the args are in the block.

```
apply-args: function [
    "Make straight sugar call from semi-sweet model."
    fn [word! path!] "Get-word refinements come from context."
    args [block!]	 "Args only, no refinement values."
][
    ; Use temp result so we don't return any extra args
    do compose [res: (fn) (args)]
    res
]

>> apply-args 'append [[] [a]]
== [a]
>> apply-args 'append/only [[] [a]]
== [[a]]
>> only: false
== false
>> apply-arg 'append/:only [[] [a]]
== [a]
>> only: true
== true
>> apply-args 'append/:only [[] [a]]
== [[a]]
```

It's easy, but has quite a bit of overhead, because of compose and do. Remember, this amount of overhead only matters in loops running thousands of times at the very least, or in a real-time interactive interface. When in doubt, clock it. Write for humans to understand, and only optimize as needed (and after you know what's slow)

Another model is name-value args. That is, you provide a structure of arg names and their values, which is applied. It can make some code much clearer, but you also have to make sure the names match, so any refactoring of names will break code, which doesn't happen if args are positional. This is a bit involved, but it shows the power of Red. We'll use objects in our example, for a particular reason. That reason is values-of. The idea being that apply/all wants all the args, in order, and every slot filled. If your object matches the function spec, it's a perfect match. But making objects manually that way is error prone. So we'll use reflection for an object tailor-made for a given function.

Step 1: Find all the words in the spec. Remember it could have doc strings and arg types as well.

```
func-spec-words: function [
    "Get all the word-type values from a func spec."
    fn [any-function!]
    /as type [datatype!] "Cast results to this type."
][
    arg-types: make typeset! [word! lit-word! get-word! refinement!]
    parse spec-of :fn [
        ; If we want an apply-specific version of objects, we could
        ; denote refinements with a sigil for added clarity.
        collect [
            any [set w arg-types keep (either type [to type w][w]) | skip]
        ]
    ]
]
```

Step 2:  Make an object from that

```
func-spec-to-obj-proto: function [
    "Returns an object whose words match a function's spec."
    fn [any-function!]
    ; The idea here is that you can both preset values that are in the spec,
    ; and also extend the object with extra words, which will be ignored.
    /with args [block!] "APPLY/ALL ignores extra values."
][
    obj: construct/with any [args []]
    construct append func-spec-words/as :fn set-word! none
    ; Refinement values in APPLY/ALL calls MUST be logic!, not none!.
    foreach word func-spec-words :fn [
        if refinement? word [set in obj to word! word false]
    ]
    obj
]
```

Step Aside: Here's another approach, which combines steps 1 and 2, and lets you use a path for the function arg.

```
; Alt approach to func-spec-to-obj-proto, does NOT allow extending the spec.
make-apply-obj-proto: function [
    "Returns an object whose words match a function's spec."
    fn [any-function! word! path!]
    /with args [block!] "TBD: If APPLY doesn't ignore extra values, keys must be in spec."
][
    if path? :fn [refs: next fn   fn: first fn]        ; split path
    if word? :fn [
        name: fn                                       ; hold on to this for error report
        set/any 'fn get/any fn                         ; get func value
        if not any-function? :fn [
            do make error! rejoin ["FN argument (" name ") does not refer to a function."]
        ]
    ]                                                  ; get func value
    obj: construct append func-spec-words/as :fn set-word! none	; make object
    ; Refinement values in apply calls MUST be logic!, not none!.
    foreach word func-spec-words :fn [
        if refinement? word [set in obj to word! word false]
    ]
    if refs [foreach ref refs [obj/:ref: true]]        ; set refinements
    ; can't use obj/:key: if key is a set-word!
    if args [foreach [key val] args [set in obj key :val]]  ; set arg values
    obj
]

o-1: make-apply-obj-proto/with 'find/case/part/tail/skip/with [wild: "*?+" length: 10 size: 2]
```

Step 3. Using the object with APPLY

```
; We finally get here, and it's anticlimactic.
apply-object: func [
    "Call APPLY using an object's values as args."
    fn  [any-function!]
    obj [object!]
][
    apply/all :fn values-of obj
]
```

And an example call:

```
>> o-fctm: make-apply-obj-proto/with 'find/case/tail/match [series: [a b c] value: 'a]
== make object! [
    series: [a b c]
    value: 'a
    part: false
    length: none
    only: false
    case: true
    same: fal...
>> apply-object :find o-fctm
== [b c]
```

But you may see that this is verbose and inefficient, making a whole object just for a call like this. And you'd be right. It's just an example.

You don't want to recreate objects like this, especially in a loop. But you don't have to. You can reuse the object and just change the important values in it. This blog is getting long already, so we'll leave that as an exercise for the reader, or a question in community chat. And if you reuse the same object, the overhead is minimal.

We even talked about an idea whose time has not come, and is not guaranteed to work in the future. Here's the idea:

```
dyna-ref: func [p [path!]][
    res: make path! collect [
        keep p/1
        foreach val next p [
            case [
                get-word? val [if get :val [keep to word! val]]
                all [paren? val get-word? val/1] [if do next val [keep to word! val/1]]
                paren? val [do make error! "Sorry, has to be (get-word expr) for use with dyna-path."]
                'else [keep val]
            ]
        ]
    ]
    res
]

c: true
print mold dyna-ref 'a/b/:c/(:d true)
print mold dyna-ref 'a/b/:c/(:d false)
c: false
print mold dyna-ref 'a/b/:c/(:d true)
print mold dyna-ref 'a/b/:c/(:d false)
```

That's right, it's a dialected path! that builds a dynamic path. Crazy, right? You may know that while paths can *currently* contain parens, for Rebol compatibility, that feature may go away. It has deep design implications, but is also very handy at times. And while this isn't part of Red, it's another example of how Red lets us think off the beaten path.

## Interpreter improvements

Dynamic refinements and function application are supported at interpreter level, for maximum efficiency and code reuse (mostly arguments fetching and type-checking). In addition to that, long standing issues and needed simplifications have been made in the interpreter code. Here is the changelog:

Function arguments cache entirely reimplemented:

- Massively reduces the amount of code needed to manage the caches.
- Simpler and faster cache design, O(1) lookup time for refinements in paths.
- Adds a context! to native!, action! and routine!, to speed up word lookups.
- Fixes long standing issue #4854 (CRASH &amp; CORRUPTION in "dynamic" function calls with refinements)

Simpler reimplementation of op! datatype and its evaluation:

- red-op! structure redesigned: it is now a shallow copy of the underlying function (nodes are not copied), the sub-type is stored in the op! header.
- is infix function has been deprecated and replaced by a prefix version: relate.
- Massive code reduction and simplification compared to previous version. Now op! maximally reuses the interpreter code for evaluating other functions.

Those changes lead to a general interpreter speed-up of 3-5% and up to 20% in some cases.

Additional language changes:

- The in native now accepts any-function! as its first argument and refinements as the second argument. Refinements, if matched, will be converted to word values. This makes in a fast way to check if a symbol is part of an object or function spec and return a word bound to that context.

## Conclusion

The most important thing you should do now is try it. It's a new design, and we want to hear what people like, see what they try, and where it falls short.

Happy Reducing!

-Red Team

Posted by [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055 "author profile") at [12:55 AM](https://www.red-lang.org/2023/06/dynamic-refinements-and-function.html "permanent link") [8 comments:](https://www.red-lang.org/2023/06/dynamic-refinements-and-function.html#comment-form) [![](https://resources.blogblog.com/img/icon18_edit_allbkg.gif)](https://www.blogger.com/post-edit.g?blogID=5936111837781935054&postID=2723064935429924561&from=pencil "Edit Post")

Labels: [apply](https://www.red-lang.org/search/label/apply), [HOF](https://www.red-lang.org/search/label/HOF)

[Newer Posts](https://www.red-lang.org/search?updated-max=2025-04-15T11%3A08%3A00%2B02%3A00&max-results=7&reverse-paginate=true "Newer Posts") [Older Posts](https://www.red-lang.org/search?updated-max=2023-06-08T00%3A55%3A00%2B02%3A00&max-results=7 "Older Posts") [Home](https://www.red-lang.org/)

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

- [▼](javascript:void%280%29)  [2023](https://www.red-lang.org/2023/) (3)
  
  - [►](javascript:void%280%29)  [November](https://www.red-lang.org/2023/11/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [August](https://www.red-lang.org/2023/08/) (1)
  
  <!--THE END-->
  
  - [▼](javascript:void%280%29)  [June](https://www.red-lang.org/2023/06/) (1)
    
    - [Dynamic Refinements and Function Application](https://www.red-lang.org/2023/06/dynamic-refinements-and-function.html)

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
