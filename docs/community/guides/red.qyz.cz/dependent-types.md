Original URL: <https://red.qyz.cz/dependent-types.html>

# dependent-types

* * *

## Dependent types and value assertion

\*This article was inspired by discussion in [AltME](http://www.altme.com/)'s [#World](https://github.com/Geomol/World) group and **Dependent types** section in this [article](http://brikis98.blogspot.cz/2014/04/six-programming-paradigms-that-will.html).*

Let's say you want to write simple [factorial](https://en.wikipedia.org/wiki/Factorial) function.

```
fac: func [
    "Factorize number"
    n "Number to factorize"
][
    if n = 0 [return 1]
    n * fac n - 1
]
```

Using loop would be faster than recursive version, but that's not the point. Let's test it.

```
>> fac 3
== 6

>> fac 4
== 24
```

So far, so good. Let's be bit evil.

```
>> fac 3.0
== 3.0

>> fac "three"
** Script error: cannot use subtract on string! value

>> fac 3.14
** Internal error: stack overflow
```

Ok, so some datatypes are not fine. Rebol offers [type checking](https://en.wikipedia.org/wiki/Type_system#Type_checking), so we can improve our function:

```
fac: func [
    "Factorize number"
    n [integer!] "Number to factorize"
][
    if zero? n [return 1]
    n * fac n - 1
]
```

We added `[integer!]` to specify that only integer! values are acceptable. So what changed?

```
>> fac 3.14
** Script error: fac does not allow decimal! for its n argument

>> fac "three"
** Script error: fac does not allow string! for its n argument
```

We still get an error but now it tells us that **fac does not allow** whatever you throw at it. This is much better debugging. But let's be more evil!

```
>> fac -1
** Internal error: stack overflow
```

Not that great again. Fortunately, Rebol has `assert` function than can check a condition and throw error when it's `false`. So we can improve our code again:

```
fac: func [
    "Factorize number"
    n [integer!] "Number to factorize"
][
    assert [n >= 0]
    if zero? n [return 1]
    n * fac n - 1
]
```

So let's try the evil example again.

```
>> fac -1
** Script error: assertion failed for: [n >= 0]
```

Nice, we are safe again and when there's a problem we get much better error than generic **stack overflow**. But that leads to another question. *Why can I define required types in function specs, but nothing else?* Rebol does not allow that currently, but it's so free-form that we can do it ourselves.

So let's introduce new function, called `afunc` (*assert-function*) that simplifies boundaries checking:

```
afunc: func [
    "Make function with more checks"
    spec [block!]
    body [block!]
    /local 
        word-rule type-rule
        word desc type symbol val
] [
    ; define some rules
    word-rule: [
        (type: desc: none)
        ; this is very simple func constructor, 
        ; so it ignores lit-word! and get-word!
        set word word!
    ]
    type-rule: [
        ; type can end with ! but it's word! still
        set type word! 
        any [   
            set symbol ['< | '> | '<= | '>=] 
            set val number!
            (
                insert body compose/deep [
                    assert [(word) (symbol) (val)]
                ]
            ) 
        ]
    ]
    local: make block! length? spec
    parse spec [
        some [
            word-rule
            any [
                set desc string!
            |   opt into type-rule
            ]
            (repend local [word reduce [type] desc])
        ]
    ]
    remove-each word local [none? word]
    make function! copy/deep reduce [local body]
]
```

So now we can write our factorial function like this:

```
fac: afunc [
    "Factorize number"
    n [integer! >= 0] "Number to factorize"
][
    if zero? n [return 1]
    n * fac n - 1
]
```

Let's try our evilness now:

```
>> fac -3
** Script error: assertion failed for: [n >= 0]
```

Nice! We just saved few keystrokes and eliminated source for few errors. But can we be more evil than that? Of course we can!:

```
>> fac 20
== 2432902008176640000

>> fac 21 
** Math error: math or number overflow
```

And once again we get generic math error. Fortunately, our `afunc` is already equipped to handle this situation, so we just make one small addition to `fac`:

```
fac: afunc [
    "Factorize number"
    n [integer! >= 0 < 21] "Number to factorize"
][
    if zero? n [return 1]
    n * fac n - 1
]
```

So instead of `integer! >= 0` we now support `integer! >= 0 < 21`. Error changed to:

```
>> fac 21
** Script error: assertion failed for: [n < 21]
```

And makes more sense now.

## But...

I know.

- What if I want to support more ranges?
- What if I want to match some values?
- What if I want to exclude some values?
- What if I want to combine all of above and maybe something else too?
- What if I don't care about numbers but other datatypes?

These are all valid questions. But remember that this is just an experiment how we can improve function specification. I'm certain others have better ideas how this can be handled. You can comment here, or [change the function](https://github.com/rebolek/dvorek/blob/master/afunc.reb). Or write your own. Any ideas are welcomed.
