Original URL: <https://red.qyz.cz/apply-and-ufcs.html>

# Writing better apply and uniform function call syntax

* * *

If you take a look at [`apply` function](http://www.rebol.com/r3/docs/functions/apply.html) in Rebol, you may find its design less than optimal. Take a look at the example:

> Function refinements can also be passed in the order they are specified by the arguments spec block. For example, we can see:
> 
> ```
> >> ? append
USAGE:
   APPEND series value /part length /only /dup count
> ```
> 
> So in this example we use the `/dup` refinement:
> 
> ```
> data: [456]
apply :append [data 1 none none none true 3]
probe data
[456 1 1 1]
> ```
> 
> Note that the refinement itself must be set to true.

So from `append/dup data 1 3` we will get to `apply :append [data 1 none none none true 3]`. I don't know about you, but I find this design less than optimal. What if we could do it simpler? Like, for example: `apply :append [data 1 /dup 3]`?

So how would we write such function? Look here, that's how:

```
apply: func [
    "Apply a function to a block of arguments"
    fn      [any-function!] "Function value to apply"
    args    [block!]        "Block of arguments (to quote refinement use QUOTE keyword)"
    /local refs vals val
][
    refs: copy []
    vals: copy []
    set-val: [set val skip (append/only vals val)]
    parse args [
        some [
            'quote set-val
        |   set val refinement! (append refs to word! val)
        |   set-val
        ]
    ]
    do compose [(make path! head insert refs 'fn) (vals)]
]
```

We will also define some simple function that we can use for testing:

```
f: func [
    foo
    /bar
        baz
][
    reduce [foo bar baz]
]
```

Now some explanations. Our `apply` function works by parsing block of arguments and building code from it. If it finds refirenments, it adds them to `refs` block and build builds `path!` from that block in the end. So when do `apply :append [data 1 /dup 3]`, it's turned into `append/dup`. Rest of values is collected into the `vals` block and on the last line code is build from these blocks and executed. In the case when we want to pass refinement as argument to a function, we will prefix it with the only keyword of our dialect: `quote`. See these examples of our `f` function, that show how it works:

```
>> apply :f [1 /bar 1]
== [1 true 1]
>> apply :f [quote /bar]
== [/bar false none]
>> apply :f [quote /bar /bar 1]
== [/bar true 1]
```

So that's it. It's easier to use and when you look at the source of Rebol's `apply`, it's also much simpler code.

So what can we do with such function? For example write support for [UFCS](https://en.wikipedia.org/wiki/Uniform_Function_Call_Syntax) in Red.

There are different ways how to implement it in Red, for the sake of simplicity, I'm going to put arguments in `block!`. It can be done without it, but it will be much easier this way. You are of course free to rewrite the code in different matter.

Let's take a look at this code (it's a nonsense, but who cares):

```
head remove/part skip sort split form now charset "+-:/" 3 2
```

It's not very readable, right? So with our `ufc` function, we can turn it into:

```
ufc form now [
    split [charset "+-:/"]
    sort []
    skip [3]
    remove [/part 2]
    head []
]
```

Better now, isn't it? So let's try to define such function:

```
ufc: function [
    "Uniform Function Call for Red"
    data
    dialect
][
    foreach [cmd args] dialect [
        data: apply get cmd head insert/only args data
    ]
    data
]
```

That was easy, right? The function goes through command and argument pairs, inserts data into arguments and passes it to `apply` function. That's all there's to it.

So now we have better `apply` and `ufc` dialect also and all of that in less than 30 lines of code. Phew, Red is too easy.
