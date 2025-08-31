Original URL: <https://red.qyz.cz/pattern-matching.html>

# pattern-matching

* * *

## Pattern matching, overriding and extensible functions

This is another article on function constructors, because they are cool and unfortunately underused. Why? Because you don't need them. As you don't need roof, car or computer. They just make your life much easier. That's why.

If you remember my article on [Dependent types and value assertion](https://red.qyz.cz/dependent-types.html), you know that I've started it with simple factorial example. So let's start this article with same function:

```
factorial: func [
    "Factorize number"
    n "Number to factorize"
][
    if n = 0 [return 1]
    n * fac n - 1
]
```

I'm going to ignore all the assertions that were introduced in last article, because that's not the point of this one. Let's focus on something else. How can this function be implemented in - for example - Haskell? With [pattern matching](https://en.wikipedia.org/wiki/Pattern_matching), that's how:

```
factorial 0 = 1
factorial n = n * factorial (n - 1)
```

This is certainly nice code that can be implemented 1:1 in Red as dialect, but I don't want to talk about dialects now, so let's try to reimplement in in pure Red.

```
factorial: func [n][
    case [
        n = 0 [1]
        true  [n * factorial n - 1]
    ]
]
```

See? Pattern matching! We have patterns (I will use *patterns* , *conditions* and *rules* during this article interchangably, because for the scope of this article, they are all the same thing, so you've been warned) that we match and when successful, we will do some action. So that was easy. But can we do it like in Haskell? Define patterns separately, not all at once? If we write our own function constructor, we of course can. And as mentioned before, we don't want to do it with dialect, but directly in Red. So let's introduce new kind of function, `dispatcher`. This function can be extended with `dispatch` function that will define rules (patterns) and corresponding actions.

> For latest version, see [https://github.com/rebolek/red-tools/blob/master/func-tools.red](https://github.com/rebolek/red-tools/blob/master/func-tools.red) , maybe I've improved something there, who knows.

So how the `dispatcher` is going to look like?

```
dispatcher: func [
	"Return dispatcher function that can be extended with DISPATCH"
	spec [block!] "Function specification"
][
	func spec [
		case []
	]
]
```

There's not much to do, it's just a simple function that returns basic template. Now we need `dispatch` function, that will add new rules and actions to our dispatcher. This function will take three args, `dispatcher` - function to extend, `cond` - pattern, and `body` - action to do, when pattern is matched. So the basic dispatcher would look something like this:

```
dispatch: func [dispatcher cond body][
    cond: bind cond :dispatcher
    body: bind body :dispatcher
    append second body-of dispatcher compose/deep [
        all [(cond)] [(body)]
    ]
    :dispatcher
]
```

So that's it. Actual function used is more complicated as it does more stuff, but the basics are same. Here's source for full version, because the examples need it:

```
dispatch: func [
	"Add new condition and action to DISPATCHER function"
	dispatcher  [any-function!] "Dispatcher function to use"
	cond		[block! none!]	"Block of conditions to pass or NONE for catch-all condition (forces /RELAX)" 
	body		[block! none!]  "Action to do when condition is fulfilled or NONE for removing rule"
	/relax						"Add condition to end of rules instead of beginning"
	/local this cases mark penultimo
][
    cases: second body-of :dispatcher
    penultimo: back back tail cases
    unless equal? true first penultimo [penultimo: tail cases]
    if cond [bind cond :dispatcher]
    if body [bind body :dispatcher]
    this: compose/deep [all [(cond)] [(body)]]
    case [
        all [not cond not body not empty? penultimo][remove/part penultimo 2]   ; remove catch-all rule (if exists)
        all [not body mark: find/only cases cond][remove/part back mark 3]      ; remove rule (if exists)
        all [not cond true = first penultimo][change/only next penultimo body]  ; change catch-all rule (if exists)
        not cond [repend cases [true body]]                                     ; add catch-all rule
        mark: find/only cases cond [change/part back mark this 3]               ; change existing rule (if exists)
        relax [insert penultimo this]                                           ; add new rule to end
        'default [insert cases this]                                            ; add new rule to beginning
    ]
    :dispatcher
]
```

So let's rewrite factorial using `dispatcher` :

```
factorial: dispatcher [n]
dispatch :factorial [zero? n][1]
dispatch :factorial none [n * factorial n - 1]
```

When we look at `dispatch` function, we see it takes three arguments: dispatcher function (`factorial` in our case), pattern and action. When we pass `none` as pattern, we want to use it as *catch-all* rule that's executed when all other rules fail (patterns are not matched, if you want).

We can also use dispatcher to extend functionality of existing function. On Gitter, @dander wrote that it would be nice, if `foreach` supported `function!` as `series` argument, so there won'ŧ be need to generate intermediate series, but passing values directly from function to `foreach` (with `none` as stopper). Writing such function is easy, it would look like:

```
foreach: func ['word series block][while [set :word series][do block]]
```

but that would rewrite current `foreach` of course. So how can we extend it using `dispatcher`? First, we will store original `foreach` and redefine it as dispatcher function:

```
foreach*: :foreach
foreach: dispatcher ['word series body]
```

Now we will add catch-all rule, that would work like original `foreach`:

```
dispatch :foreach none [foreach* :word series body]
```

So now is foreach working as before. Let's add support for `function!`:

```
dispatch :foreach [function? :series][while [set :word series][do block]]
```

And that's it, `foreach` now supports `function!` besides working as before.

What else can `dispatcher` do? Rules are automatically added to the beginning, so later rules have higher priority than former rules. This can be overridden with `/relax` refinement, that adds rule to end (actually before catch-all rule that has always lowest priority).  
You can also delete rules, by passing pattern and `none` instead of rule: `dispatch my-function [a = b] none`.

So, that's all for now, I guess.
