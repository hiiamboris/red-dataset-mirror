Original URL: <https://red.qyz.cz/code-is-data.html>

# code-is-data

* * *

@wolframkriesing liked my last article (thanks!) and was interested in the *code is data* claim. I take this for granted, so it’s bit hard for me to write about it, because I don’t have some point where to end my article. So it’s going to be a mess probably.

## In the beginning, there was a string!

When you write some code, it’s a `string!`. That’s same in basically all languages, I guess (unless you have to punch some paper cards or something). Let’s show some example of this, simple `plusone` function, that returns input plus one:

```
red>> source: "plusone: func [value] [value + 1]"
== "plusone: func [value] [value + 1]"
red>> type? source
== string!
```

So now we have `source` `string!`. To turn this string into something, that Red understands, we have to load it:

```
red>> code: load string
== [plusone: func [value] [value + 1]]
```

`load` parses the string and turns it into Red values. We still do not have our `plusone` function. We just have a `block!` of values. This is really important, `load` just tries to load string into memory and turn it into Red values. It does not run anything. Let’s check it:

```
red>> plusone
*** Script Error: plusone has no value
*** Where: catch
```

See? Red still does not now about `plusone` function. We have to `do` the block:

```
red>> do code
== func [value][value + 1]
red>> type? :plusone
== function!
```

So now we have our `plusone` function available. To sumarize this:

- `load` turns source string into data that Red can understand
- because data is code, `do` can run that data

## Wait, what?

Let’s try to write our function in some other language, for example Javascript (because it’s everywhere). In Javascript, we have `eval` that can turn our source into code:

```
> source = "plusone = function (value) {value + 1}"
'plusone = function (value) {value + 1}'
> plusone(1)
ReferenceError: plusone is not defined
```

We have our `source`, `plusone` is not a function yet, so we can use `eval` now:

```
> eval(source)
[Function: plusone]
> plusone(1)
2
```

Here’s the important difference between Red and Javascript: `eval` directly runs the source. The source is not loaded and turned into data. Now back to Red to show you, why it’s important:

```
red>> foreach value code [print [type? value mold value]]
set-word plusone:
word func
block [value]
block [value + 1]
```

As you can see, our `code` block holds four values. `set-word!`, `word!` and two `block!`s. Every value in Red has it’s datatype. Javascript’s `{value + 1}` may look almost same as Red’s `[value + 1]`, but they are vastly different. Because in Red it’s all data, it’s very easy to manipulate it. I am not going to use `plusone` function here, but something simpler, so it will be easier to understand. So define something really simple:

```
red>> code: [1 + 1]
== [1 + 1]
red>> length? code
== 3
```

Now we run that code:

Runs as expected. Let’s change first value to some different number:

```
red>> code/1: 5
== 5
red>> code
== [5 + 1]
red>> do code
== 6
```

Can we also change the operator? Of course we can!

```
red>> code/2: '-
== -
red>> code
== [5 - 1]
red>> do code
== 4
```

We must use so called `lit-word!` here (`'-` instead of `-`), so the minus is not evaluated. And now append something to our code:

```
red>> append code [+ 3]
== [5 - 1 + 3]
red>> do code
== 7
```

## Words and their values

I mentioned that we must prevent `-` from evaluation. What does that mean? Until it gets evaluated, `-` is just a word. It must be evaluated, to get its value, the minus operation:

```
red>> type? second code
== word!
red>> type? get second code
== op!
```

`get` gets word’s value and `op!` is operator datatype. So unless you evaluate the code, it’s just data. And of course, it’s possible to change word’s value:

```
red>> code: [1 + 1]
== [1 + 1]
red>> do code
== 2
red>> +: :-
== make op! [[
    "Returns the difference between two values"
    v...
red>> code
== [1 + 1]
red>> do code
== 0
```

Isn’t it funny? I think it is. Dangerous, yes, but funny. So I hope that this explains a bit what does it mean, that code is data.
