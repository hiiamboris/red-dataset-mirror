Original URL: <https://red.qyz.cz/safe-and-persistent-locals.html>

# safe-and-persistent-locals

* * *

## Safe and persistent local values

## Local is not safe

Local values in Red are just words in function's context, so they can be set from outside. `function!` datatype somehow limits access to them, but it is possible to set them anyway. Let’s make some simple function with local value:

```
red>> f: func [/local word] [word]
== func [word][word]
red>> f
== none
```

As you can see, local value is initialized to `none`. But actually, it’s not a "real" local value, it’s a trick. `/local` is refinement just as any other and it’s possible to call our function with that refinement:

So do not expect that your local value will be always initialized to `none`, user can override it. As I just demonstrated, local values are not safe.

Another thing, that will be important later is the `/local` refinement. It’s actually just another word defined in the function context:

```
red>> f: func [/local] [local]
== func [/local][local]
red>> f
== false
red>> f/local
== true
```

As you can see, when the refinement is used, it’s value is set to `true`. With `local`, you just don’t expect it to be used.

## Some locals can be persistent

In previous examples we used scalar value. Things are bit different when we use `series!` value:

```
red>>  f: func [value /local block] [block: [] append block value]
== func [value /local block][block: [] append block value]
red>> f 1
== [1]
red>> f 2
== [1 2]
```

This is something that is confusing for newcomers. Why is not `block` empty on each call? Here’s the very importand difference between Red and some other languages. The source is not just parsed and executed, it is loaded. This is very important step that turns data into the code, in our case the source of the function into the function itself. When you are calling the function, it’s not loaded again, you are calling what was loaded into the memory when defining that function. Why is this important?

What you see above is an empty `block!`. Like all `series!`, `block!` is passed by reference in Red. It happens automatically, you don’t have to care about it. But what it means in our case? We have `block: []` in our function. When this code is loaded into memory, it is translated into something like `block: <reference to some block>`. And this reference is there, in the body of our function and does not change. This is the reason, why the block is not empty on each call. Because on each call, it’s still the same `block!`, that was created when the function was loaded.

Remember this.

## Introducing literal map!

Red, like Rebol3, has `map!` type. If you are not familiar with `map!`, it is basically key/value storage. Unlike Rebol3, Red has also literal `map!` representation. To make an empty `map!`, you can type `#()`. As with the empty block above, I am going to put this on separate line:

### Intermezzo

> The title of this article is **Safe and persistent local values**. I’ve already shown that locals can be persisent - sometimes against user’s will, when they don’t understand Red good enough yet - and by now, you probably already figured out how to prevent the problems described above and make locals safe. But for the reference, I am going to describe it anyway. So back to the literal `map!`.

This literal `map!` has basically the same properties as `block!` described above as demonstrated in following example:

```
red>> f: func [word value /local map] [map: #() map/:word: value map]
== func [word value /local map][map: #() map/:word: value map]
red>> f 'a 1
== #(
    a: 1
)
red>> f 'b 2
== #(
    a: 1
    b: 2
)
```

As you can see, local word `map` always word refers to same `map!`. Which is something we can use to make safe local values.

## Safe local values

So back to local values. How can we make them safe (safe - user cannot change them)? Here’s some simple example of an attack on local values:

```
red>> f: func [/local val] [if val [#panic]]
== func [/local val][if val [#panic]]
red>> f/local #evil
== #panic
```

The obvious and right solution to this problem is to initialize local value(s):

```
red>> f: func [/local val] [val: none if val [#panic]]
== func [/local val][val: none if val [#panic]]
red>> f/local #evil
== none
```

But as you can see, we now have to define `val` in the header and then initialize it in the body. There sure must be some easier way:

```
red>> f: func [/local] [local: #(val: #[none]) if local/val [#panic]]
== func [/local][local: #() if local/val [#panic]]
```

> **NOTE:** Because literal `map!` is not reduced, we have to use literal `none!` here (that is `#[none]`), otherwise it would be `word!` like any other. But that is something that I’m not going to explain here.

So now we can test it:

```
red>> f
== none
red>> f/local
== none
```

So, what have we done? We defined just `/local` refinement in the header. In the body, `map!` was assing to the `local` `word!` and in that `map!` we defined word `val`. To access `val`, we need to use `local/val`, but as you can see, it is local to our function, even when not defined in the header:

```
red>> val
*** Script error: val has no value
*** Where: do
```

As said before, this could be done with initializing the `val` value manually. But what couldn’t be done without literal `map!` is the following example:

```
red>> f: func [/local] [
    local: #(count: 0) 
    local/count: local/count + 1 
    print ["function was called" local/count "time(s)."]
]
== func [/local][local: #(
    count: 0
) local/count: local/count + ...
red>> f
function was called 1 time(s).
red>> f
function was called 2 time(s).
red>> f
function was called 3 time(s).
```

We can use the `/local` refinement, but it doesn’ make any difference:

```
red>> f/local
function was called 4 time(s).
```

`count` is now really *local* and cannot be set and get from outside.

So now it’s time for some closure.

## Notes

- It is of course possible to use literal `block!` instead of `map!`. It’s just bit more complicated.
- This calls for a function generator, something like [described here](https://red.qyz.cz/dependent-types.html), so safe locals can be declared in function header.
- So `count` is safe now, right? Actually, no:

```
red>> m: second body-of :f
== #(
    count: 4
)
red>> m/count: 42
== 42
red>> f
function was called 43 time(s).
```
