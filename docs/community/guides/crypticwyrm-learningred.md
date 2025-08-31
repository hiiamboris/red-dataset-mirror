Original URL: <https://crypticwyrm.neocities.org/learningred/>

# Learning Red

* * *

If you want to support this project or any of my other free work, please consider donating: [![Buy Me A Coffee](https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png)](https://www.buymeacoffee.com/cryptowyrm)

You can find me on [Steemit](https://steemit.com/@crypticwyrm) or contact me on [Keybase](https://keybase.io/cryptowyrm) which offers free, open source, fully encrypted messaging in the style of WhatsApp (in addition to encrypted file storage, encrypted Git, and encrypted Slack style team messaging). If all else fails, send an email to cryptowyrm at protonmail dot ch.

**This document is constantly being updated, some sections are unfinished and new sections will be added over time.**

**Last updated on July 11th, 2018**

## About this document

This document can be read from start to finish to learn Red and Rebol programming, or can be used as a reference to look up specific parts of the language. It is expected that you know at least one programming language already, you don’t have to be an expert, you just need to know the absolute basics of programming because those aren’t taught in this document.

Rebol was designed to be easy to learn and use, and that carries over to Red. I’m by no means an expert in either Rebol or Red, but I’ve used them on and off for many years. One of the reasons for writing this document is to help me get a deeper understanding of the languages and record my findings so that I can look something up when I forget.

This document is going to be constantly evolving and the plan is to add short screencasts to every section. Sometimes, watching a video of a concept in action is easier to understand than a mere text description. This isn’t a book, it’s a computer document, so we can and should make use of that fact and use the enhanced multimedia features it provides where it makes sense. In the undying words of Egon Spengler (Ghostbusters): Print is dead. Or in the German translation, “written things are dead”, which I always took to mean that the written word is constant, it cannot change, it cannot evolve, it cannot be improved once written down on paper.

Why Red AND Rebol? The main focus is on Red, but there are two reasons for learning Rebol together with Red in my opinion. Most of the documentation and most of the open source apps you can learn from are written for Rebol, not Red. And while Red is better than Rebol in almost every possible way, it isn’t finished yet, so in some cases you might actually still want to use Rebol. The language hasn’t been updated in years, true, but it still works fine on Windows, Mac and Linux and offers a lot of features Red has yet to implement. And at any rate, the differences between the two languages are so small, you need to learn so little to use both that it just doesn’t make sense not to.

## General

Both Rebol and Red come with a console that runs a REPL, a read eval print loop, that you might know from languages such as Lisp or Python’s IDLE. It’s an amazing tool to learn the language. You can enter a line of code and see the result, instantly.

There are two functions which will help you learn, the first is `help` which you can also abbreviate to just the question mark:

```
? help
```

This will show you information about the `help` function. You can use the function on any function, even those defined by yourself, to see it’s documentation. It also works on objects and in that case shows you the different fields an object has. Whenever you want to know something about a word, just use the `help` function on it.

Another useful function is the `source` function, which shows you the source code of a function, so you can learn how it works.

Rebol and Red distinguish between two different types of code, native and mezzanine. Native code you don’t have access to with the source command. Mezzanine code is that which is written in Rebol/Red itself and can be viewed using the source function. Type `source` and the name of any rebol function and if it’s a mezzanine function, its source code will be shown to you.

## Good text editor for Red

While most of this document has you writing code in the console, you do need a text editor for the larger examples.

You can of course use any text editor you want, but if you want syntax highlighting you might want to use Github’s [Atom](https://atom.io/) with the “language-rebol” plugin (which coincidentally was created by me and works for both Rebol and Red) or Microsoft’s [Visual Studio Code](https://code.visualstudio.com/) with the Red plugin, which also offers auto-complete functionality and in-editor documentation. I would recommend Visual Studio Code since it offers the most features. You can also configure it to compile Red scripts by pressing F7 or execute scripts by pressing F6.

## Other learning resources

### Rebol

[Rebol User Guide](http://www.rebol.com/docs/core23/rebolcore.html)

[Rebol - A programmer’s guide](http://www.lulu.com/shop/olivier-auverlot-and-peter-william-alfred-wood/rebol-a-programmers-guide/ebook/product-17515075.html)

[Rebol Quick Start](http://re-bol.com/rebol_quick_start.html)

[Creating Business Applications with Rebol](http://business-programming.com/business_programming.html)

### Red

[Red Programming Language Documentation](https://doc.red-lang.org/en/)

[List of Learning Resources on Red’s Wiki](https://github.com/red/red/wiki/Learning-resources)

All Rebol and Red scripts start with a header, unless you are directly typing your code into the console.

```
Red [
	Title: "My App"
]
```

```
REBOL [
	Title: "My App"
]
```

You can also leave the header empty, or as in the example use it as a place to store information about the file. Since the header is in normal block format, it can be easily read by both humans and machine, so the information from the header can be easily accessed from Red and Rebol scripts.

While you can provide any information in the header you want, it often looks like this:

```
Red [
	Title: "My App"
	Date: 11-June-2018
	Version: 1.2.0
	File: %myapp.red
	Author: "John Doe"
	Purpose: {An example application}
	Email: user@host.com
	License: "MIT"
]
```

As you can see in the example, people often use the wide range of datatypes Rebol and Red understand to fill out the header. In this example you can see `string!`, `date!`, `tuple!`, `file!` and `email!` being used.

## Compiling

Red scripts can be compiled to native bytecode for Mac, Windows and Linux. Cross compilation is supported, so you can create binaries for all platforms on a single computer.

To compile a script on Windows, from the command line do the following:

```
red.exe -r script.red
```

Compilation can take a minute, so there is an alternative compilation mode which uses `-c` instead of `-r`, which you can use in development. It compiles Red into a dynamic library and then only has to compile your script when you make changes, not Red every time.

To compile for another platform, you use `-t`, for example:

```
red.exe -r -t windows script.red
```

Instead of `windows` you can also use `darwin`, `macos`, `linux`, or `msdos` as compilation targets.

If you don’t want a console window to appear when compiling apps on Windows, use `-t windows`. The default target when compiling on Windows is `msdos`, which opens the console.

Some very dynamic code cannot be compiled yet (or in some cases never). In that case, you can include (encap) the Red interpreter in the compiled output by using the `-e` option, then the compiled code works just like the interpreted code. Methods also don’t work well yet with compilation and you can run into issues if you use them and then try to compile your code. You can read about issues when compiling on [Red’s Wiki](https://github.com/red/red/wiki/Compiler-Limitations).

## Evaluation

Red and Rebol’s syntax might look a bit weird when you see it for the first time, because it tends to look more like a spoken language than a programming language. You might ask yourself, where are all the parentheses, the curly braces, the commas and so on. Let’s look at an example:

```
print reverse "olleH"
```

This prints `Hello` to the console. It uses the `reverse` function to reverse the string `olleH` and the result is printed to the console by the `print`function. No parentheses needed.

In Lisp, it would have looked like this:

```
(print (reverse "olleH"))
```

Or in JavaScript:

```
console.log("olleH".split("").reverse().join(""));
```

Looks a lot nicer in Rebol and Red, but you need to know how many arguments a function takes to understand the code. Thankfully, as said before, you can use the `help`function on any function to find out and a text editor like Visual Studio Code shows you the help when you hover your mouse cursor over a function, so you don’t need to remember it. So in practice, this is not a problem. And it makes the syntax super flexible and clean of any unnecessary cruft.

Evaluation happens only outside of blocks, which are pieces of code or data (there is no difference between the two in Rebol and Red) wrapped in square brackets like this: `[print "Hello"]`. Some functions take blocks as arguments and evaluate them, like the `if` function, which is given a block that should be executed if the condition is true. You can also evaluate blocks yourself with the `do` function, like `do [print "Hello"]`.

Evaluation is strictly from the left to the right, but operators take precedence (more on that later). So when you write math:

```
2 + 2 * 4

```

The result is `16`, not `10`. You can use parentheses where needed:

```
2 + (2 * 4)

```

Now the result is `10`.

Parentheses are rarely used in Rebol and Red, sometimes you can just change the order of code you write to get rid of parentheses. Let’s look at an example:

```
if (length? "hello") > 3 [print "The string is longer than 3."]

```

Since operators like `>` take precedence, we need to wrap parentheses around `length? "hello"`, otherwise `"hello" > 3` would have been evaluated by the language instead of `length? "hello" > 3`, which results in an error since you can’t compare strings and integers that way. But we can get rid of the parentheses by simply reversing the condition:

```
if 3 < length? "hello" [print "The string is longer than 3."]

```

The result is the same, so use whatever approach you prefer. If the parentheses don’t bother you, they are there for you to use. But the experts tend to avoid them.

Semicolons have been a scourge on people trying to learn programming. In languages like C, forgetting to end a line with a semicolon will lead to errors. In JavaScript it can lead to hard to debug bugs. In Rebol and Red, semicolons are used for comments, so they are literally ignored by the compiler. Anything after a semicolon is a code comment.

## Variables

Strictly speaking, there are no variables in Rebol and Red. A word can be used to lookup a value or function so you can use it like a variable, where a word is set directly to some value, but it is also symbol in it's own right. Symbols are a very important part of the language, you will see them used much more than in other languages you might know. The official Rebol documentation does use the word variable though, and I will do so here as well, it's just what most people are familiar with.

In most languages the equality sign is used to set variables which leads to problems when you want to check for equality. In Rebol and Red, the equality sign checks for equality and the colon sets the contents of a variable:

```
myvar: 15
```

You don’t need to assign a type, it’s done automatically for you. You can check the type with the `type?` function:

```
type? myvar
```

This will output: `integer!`

You can however set the type by using the `make` function, which also allows you to do type casting:

```
myvar: make integer! 15.5
```

The floating point number `15.5` (of type `float!`) is converted to an integer, so myvar is now of type `integer!` with the value `15`.

The type of a variable can change, so if you assign a string to it it’s now of type `string!`:

```
myvar: "Hello"
type? myvar
```

This will output: `string!`

When you write `myvar:`, the colon isn't actually an operator like `+` or `-`, instead the whole expression `myvar:` is called a `set-word!` and when the language's reader encounters such a word, it knows you want to set a variable. You don't really need to know this to use Red, but sometimes documentation mentions `set-word!` so it's good to know anyway.

Programmers can never decide on anything, so there are lots of different ways of naming variables, pascal case `myVariable`, camel case `MyVariable`, some use underscores `my_variable`. Rebol and Red use a hyphen between words `my-variable`. And the code is case-insensitive, so if you call a variable (and therefore also functions) `hello` it also works as `hEllO` or `HELLO`.

Variables are global by default, there are however ways to make them local. Functions can have local, temporary variables and you can define a context and all variables defined in that context will be local to it.

## Functions

Functions can be defined using either the `func` or the `function` function. They work the same for the most part, but `function` has the added bonus that variables declared inside of the block are automatically temporary variables, whereas using `func` you have to explicitly list the variables that should be temporary variables local to that function. In Rebol, `func` works the same as in Red, but `function` works differently.

Here is a simple function `inc` that takes an `integer!` and returns it increased by 1:

```
inc: function [n] [
	return n + 1
]
```

You can also declare the type of function arguments, `n` in this case which we want to be an `integer!`:

```
inc: function [n [integer!]] [
	return n + 1
]
```

You can also add documentation to a function and to it’s arguments which is shown when you use the `help` function on it:

```
inc: function [
	"Increases a number by 1."
	n [integer!] "Number to increase"
] [
	return n + 1
]
```

Help will now show this for our function:

```
USAGE:
     INC n

DESCRIPTION:
     Increases a number by 1.
     INC is a function! value.

ARGUMENTS:
     n            [integer!] "Number to increase."
```

Here is how you would use `func` and declare a variable to be local:

```
myfunc: func [n /local my-temp-var] [
	my-temp-var: 10
	return n + 1
]
```

Try running the function and then check if my-temp-var exists. It doesn’t, since that variable is local and therefore Red will show an error.

Last but not least, optional arguments in Rebol and Red are defined using refinements:

```
inc: function [n /by x] [
	either (x) [
		return n + x
	] [
		return n + 1
	]
]
```

This function will now increase the number you give it by 1, unless you call the function using its by refinement `inc/by 1 5` which will then increase the number 1 by 5, so the result is 6.

One thing of note here is that since functions are created by plain old functions and not by using a special syntax, you can easily build functions programatically:

```
spec: [a b]
body: [a + b]
add: function spec body

add 1 2
```

This will return `3`. In this example we’ve saved the function spec and body to a variable first before using the `function` function on it to create the `add` function. Now think about how powerful this is, the function spec and body are just blocks that you can manipulate like any other series. Metaprogramming, code that writes code, is very easy to do in Rebol and Red and this is one such case. You can even write your own version of `func` and `function`.

## has &amp; does

There are two more words that can create functions, `has` and `does`. You don’t need to use them since they are just there as convenient shortcuts, but it can also make your intention more clear for readers of your code.

With `has`, you define a function that has local variables, but no arguments:

```
say-hello: has [main-window] [
	main-window: layout [area "Hello, world!"]
	view main-window
]

say-hello
```

And `does` defines a function without arguments or local variables, so it just takes a block to be executed when called:

```
say-hello: does [print "Hello, world!"]

say-hello
```

This will print `Hello, world!` to the console.

## Datatypes

Rebol and Red have much more datatypes than languages usually do. Rebol has about 60, Red has fewer but regularly adds new ones. Instead of the usual things like strings and numbers, Rebol and Red also understand urls and files and email addresses, xml tags, lots of different things that make the tasks of a programmer in the modern era much more comfortable.

Types always end in `!` so they are easily identifiable. To get a list of all types, just enter `? datatype!` in the console.

## Characters

A single character in Rebol and Red is defined as follows:

```
my-char: #"a"
```

## Strings

A string is a series of characters. Like in most languages, a string is written between double-quotes in Rebol and Red. There is however one additional method to create a string and that is by wrapping it in curly braces. This allows you to write text without having to escape double quotes. The curly braces version of strings can also be multi-line. Combined, it allows you for example to easily write HTML in your code:

```
my-html: {
	<html>
	<head>
		<title>My website</title>
	</head>
	<body>
		<div id="content">
			<p>Hello, world!</p>
		</div>
	</body>
	</html>
}
```

In Rebol and Red many things are a series (strings, paths, urls, blocks, …) not just strings and there are a bunch of functions that can manipulate a series.

You can get the length of a series with the `length?` function:

```
length? "Hello, world!"
```

This will output: `13`

You can use `append` to concatenate two series or add a single new element to a series:

```
append "hello" "world"
```

This will output `helloworld`

You can search for something in a series by using `find`:

```
find "hello" "e"
```

This will output: `ello`

In Rebol and Red, a series has a pointer to the current index. You can move that pointer around and get its current position using a number of functions. This allows for some very powerful but easy to use manipulations of series. But when you’re new to this, you might be surprised that find returned `ello` instead of the index `2`. What was output was the series `"hello"` with the pointer set at index 2. And if you want to get the current index, you can use the `index?` function.

```
index? find "hello" "e"
```

This would output: `2`

But what can we do with this pointer on a series, why is it useful? Well, we could for example easily change something in the series:

```
head change find "hello" "e" "a"
```

This outputs: `hallo`, the german word for hello, because we replaced the e with an a.

Let’s go through this step by step. First we use `find` to return the series at the index where the “e” character can be found. Then we use the `change` function to replace the element in the series that its pointer is pointing to, so in this case the “e” we just found with `find`. Then we use the `head` function to move the pointer back to the start of the series (otherwise the output would be `llo`). `Head` moves the pointer to the start and `tail` to the end. There are also `head?` and `tail?` functions which return true if the pointer is at the start or the end of a series respectively.

## Blocks

A block is one of the basic building blocks (pun intended) of Rebol and Red. It is a series, just like strings, so all of the series functions work on blocks as well. Blocks are used all over the language, it is the most important data structure.

You can mix different types in blocks, and you can append and remove things from a block, they aren’t fixed size so you can add as many elements to one as you want.

Blocks are extremely versatile. You can access elements in a block by index with the refinement operator `/`, as if it was an array:

```
my-block: ["one" "two" "three"]
print my-block/1
```

This would print: `one` in the console. Rebol and Red start counting at 1. That’s rare in programming languages, they usually start counting at 0 which is of course silly. The only exceptions I know of are Smalltalk-80, Rebol and now Red.

You can also use blocks as an associative map:

```
my-block: [name "Chris" age 34]
print [my-block/name "is" my-block/age "years old."]
```

This prints: `Chris is 34 years old.`

## Arrays

Instead of an Array you use just blocks in Red. From other languages you might be used to this kind of syntax to set and get an element in an array:

```
myArray[0] = "Hello";
print(myArray[0]);
```

In Red and Rebol however, there are two differences. First, arrays start at 1 not at 0. Because starting at 0 makes no sense. And you use the refinement syntax to access and set elements:

```
my-array/1: "Hello"
print my-array/1
```

But we started a bit in the middle here, how do we define an array? We could just create an empty block.

```
my-array: copy []
```

Red doesn’t have support for it yet, but in Rebol we could also create an array with a fixed size by using the array function:

```
my-array: array 5
```

And we can initialize with a given value:

```
my-array: array/initial 5 0
```

Adding and removing elements from an array works like it does on any other block, so you don’t need to learn anything new here.

## Vectors

While there is no `array!` type in Red, there is `vector!`, which is an array but specifically for numerical values and characters. It is very fast, mathematical functions can be applied to the whole series at once.

In this example, we’ll create a `vector!` with five `integer!` values and apply `+ 1` to the `vector!`:

```
my-vector: make vector! [1 2 3 4 5]
probe my-vector + 1
```

This will output: `[2 3 4 5 6]`.

## Pairs

A pair looks like this: `300x200`. It’s very useful to define the size of a face (GUI widget) for example, or to set its position.

You can create a pair from two integers using the as-pair function:

```
as-pair 300 200
```

If you want to get just one element of the pair, you can use the refinements `/x` and `/y`.

```
my-pair: 300x200
print my-pair/x
```

This will output: `300`.

You can use the mathematical operators on pairs:

```
100x100 + 10
```

This will output: `110x110`, so both elements of the pair got changed. If you want to change just one, you can do this:

```
100x100 + 0x10
```

This will output: `100x110`.

## Int &amp; Float

There are different types of numbers in Red, the most common ones are integers and floats, which have the type `integer!` and `float!` respectively.

```
my-int: 10
my-float: 10.5
```

You can convert between them using either `to-integer` and `to-float`, or use the `make` function:

```
print to-integer 10.5
my-int: make integer! 10.5
print my-int
```

This will output `10` twice.

## Words

Words are one one of the most peculiar and important concepts to understand in Red and Rebol. Words can act as variables `myvar: 10`, they can call functions `print "Hello"`, but they can also be just plain symbols. And they can be all of that at the same time, they can have different meanings in different contexts, and that is where it gets confusing and where beginners make mistakes they don’t understand, especially when coming from another programming language.

To understand it, you need to understand how evaluation works in Rebol and Red. When the interpreter encounters a `word!` like `print` and it is inside of a block (for example `[print]`), the word acts as a symbol. It is not evaluated, the function that `print` refers to isn’t called. Outside of a block, it is evaluated. If it points to a value, it’s returned. If it points to a function like `print` does, it’s called. If there is no definition, trying to evaluate the word leads to an error.

There is one other special case where words can have different meanings and that is in a dialect (Domain Specific Language) like `PARSE`, `DRAW` or `VID` provided by Rebol and Red, or a dialect you or someone else has written.

Let’s look at an example that is sure to confuse beginners:

```
x: 1
y: 2
z: 3
foreach val [x y z] [print val]
```

As a beginner, you would expect this to print 1, 2 and 3 to the console. But what happens? x, y and z is printed. Why? Remember, words are not evaluated inside of blocks. So `val` refers to the words x, y and z as symbols, not as variables with a value to be looked up. To get the value instead, use the `get` function:

```
x: 1
y: 2
z: 3
foreach val [x y z] [print get val]
```

And now 1, 2 and 3 are printed to the console.

Using `get` isn’t the only way, there are quite a few, one of them is to use `reduce` on the block which evaluates all words in a block:

```
x: 1
y: 2
z: 3
foreach val reduce [x y z] [print val]
```

This prints 1, 2 and 3.

Some functions evalute the block for you, so you don’t have to use `reduce` on it. For example the `if` function:

```
if true [1 + 2]
```

Even though words in blocks aren’t evaluated by default, this returns `3` because the block `[1 + 2]` is evaluted by the `if` function. You can evaluate blocks yourself with the `do` function:

```
do [1 + 2]
```

This will return 3, because the last value in a block is returned by default (so you don’t need to use the `return` function). Without `do`, the block itself would be returned. With `reduce` the block would be returned as well, but the contents of it would be evaluated:

```
reduce [1 + 2]
```

This returns `[3]`.

If you want to only evaluate certain words in the block, `compose` is a good way to do it. It evaluates only what is inside of parens `()`:

```
x: 1
y: 2
z: 3
foreach val compose [x (y) z] [print val]
```

This prints x, 2 and z. Only y is evaluated because only y was put in parens.

### Special notation for words

Sometimes the default interpretation of a word isn’t what you want, so there are different special notations for words. A `set-word!` allows you to use a word as a variable, it sets the word to a value or a function. A `set-word!` ends in a `:`, like `myvariable:`.

A `get-word!` allows you to return the value a word points to without evaluating it, this is useful if you want to refer to a function for example without calling it. A `get-word!` starts with a `:`, like `:print`. This word would retrieve the `print` function, but not call it, so you could set it to a variable or use it as an argument in another function.

A `lit-word!`, short for literal word, interprets the word as a symbol, so it isn’t evaluated. It starts with a `'`, like `'green`.

A `refinement!` is a word starting with `/`, like `/local` and is used to access fields in objects for example.

### How words are bound

But how do Rebol and Red lookup the value of a word? In other programming languages, you have something called a scope. There are dynamic scopes and lexical scopes. Rebol and Red don’t have that. Instead, a word has a pointer to a context (an object or a function), which is called a binding. So when you move words around, their meaning doesn’t change based on scope, they retain their binding. It can look like changing the position changes the word, but that’s just because for example `func` and `function` which you use to create a function, changes the binding of words in the block that you provide as the function body.

It does in effect mimick a lexical scope. The effect is the same, but the reason for the effect coming to be is different and you can change the binding of words using the `bind` function which means you aren’t limited to the lexical scope. Some call this definitional scoping, the scope is set when you create a value and stays that way until it’s rebound to another context. Let’s look at an example:

```
x: 1
f1: func [][print x]
obj: make object! [
	x: 2
	f2: func [][print x]
	f3: :f1
]

f1
obj/f2
obj/f3
```

This prints `1 2 1`.

With lexical scoping, the `f1` function will print `1` and calling `f2` will print `2` because it’s in the same scope as `x: 2`. `f3` prints `1` because the f1 function is in the scope of `x: 1`.

In Rebol and Red it will print the same, but it does so because in the case of `f1`, `x` was bound to the global context so `1` is what was printed. In the case of `f2`, `x` was bound to the `obj` context. `f3` is just calling the `f1` function, and in that function `x` is still bound to the global context where it is `1`, so that is what is printed. The location of the function inside or outside of the object `obj` doesn’t matter after the initial creation, it’s scope doesn’t matter, instead the binding of the word `x` itself does. So again, same result, different reason for that result. And since it’s a binding and not a scope, you can change the binding using the `bind` function and do some very interesting things.

These two concepts, bindings and words not being evaluated inside of a block, is a big difference to other homoiconic languages like Lisp, where lists are evaluated by default and the first word in a list is always called as a function, unless you quote the list. That is why in Rebol and Red, the phrase “Code is data and data is code” is even more true than in Lisp. There is no difference between code and data. You can interpret any piece of data as code. And you can manipulate code as you would manipulate any other data. Bindings travel with words, so when you evaluate a block of code with `do`, the words can have meaning (values or functions) attached to them, which Lisp’s `eval` can’t do so you have to resort to macros in Lisp which do compile time transformation of code. Red has macros too by the way, since Red can be both interpreted or compiled (and at some point JIT compiled).

### Binding words with bind

As alluded to above, you can rebind words with the `bind` function. Understanding how it works might also help you better understand bindings in general.

Let’s look at an example:

```
a: 1
obj: make object! [a: 2]
block: [print a]
do block
```

This will print `1`, because the word! `a` in the block! `block` was bound to the global context, where `a` was set to `1`. The word! `a` in the object! `obj` is `2`, but it’s a different context that `a` inside of `block` isn’t attached to.

So what if we want to rebind the `a` in the block, from using the global context to using the context of `obj` where `a` is `2` instead of `1`?

```
a: 1
obj: make object! [a: 2]
block: [print a]
bind block obj
do block
```

This will print `2`, because the `a` in `block` is now bound to the context of `obj` where `a` is `2`.

`bind` has one refinement, `/copy`, which copies the block! (`block` in our example) instead of changing it.

```
a: 1
obj: make object! [a: 2]
block: [print a]
block2: bind/copy block obj
do block
do block2
```

This will print `1` and `2`, because the `a` in `block` is still bound to the global context as before, while `block2` is a copy of `block` with the context of `a` bound to `obj` where `a` is `2`.

The `context?` function can help you understand while experimenting with bindings. It takes a `word!` and returns the context it belongs to, so either an `object!` or a `function!`. Let’s use it on `block` and `block2` from the last example:

```
context? first block ; print - returns global context
context? second block ; a - returns global context

context? first block2 ; print - returns global context
context? second block2 ; a - returns obj context
```

The interesting part here is when we check the `print` and `a` words of `block2`. It tells us that the word `print` is still bound to the global context, but `a` is bound to the `obj` context. So when we give `bind` a block, it doesn’t change the bindings of all the words in it, just those that exist in the target context, which in the case of `obj` is just the word! `a`. Otherwise, the `print` function wouldn’t have been called by `do block2` of course.

And this is why bindings, though they may be confusing at first, are very powerful. In Lisp you need macros to transform code, because if we had “evaled” the block `[print a]` in a language like Lisp, there would have been an error that `a` is undefined. In Rebol and Red, `a` can have an attached meaning, an attached binding that stays with it so that you can do a lot more with `do` than you can with `eval` in other languages.

If you’re not sure if what `context?` returns is the global context or not, you can just compare it to `system/words`, which is the global context:

```
(context? first block) = system/words
```

This will return `true`.

So far we have bound a block of words to a new context, but what if you want to just bind a single word? Let’s look at another example:

```
a: 1
b: 2
obj: make object! [a: 3 b: 4]
block: [print a print b]
do block
```

This will print `1` and `2`. We want to change it so that it prints `3` and `2`, so we only want to bind the `a` in `block` to `obj`, but not the `b`. If we bind the whole block of words, it would print `3` and `4` instead. We’ll use a combination of `change` and `find` to bind just `a` and leave `b` alone:

```
a: 1
b: 2
obj: make object! [a: 3 b: 4]
block: [print a print b]
change find block 'a bind first find block 'a obj
do block
```

This will print `3` and `2`, like we wanted, because `a` is now bound to `obj` and `b` is left bound to the global context.

`bind` actually creates a new word `a` bound to obj in the example, it doesn’t just change the binding of the `a` that is already in the block, so when writing real code we can achieve the same effect with a little less work:

```
a: 1
b: 2
obj: make object! [a: 3 b: 4]
block: [print a print b]
block/2: bind 'a obj
do block
```

## Hash and Map

In Rebol, the datatype `hash!` and `map!` are the same. If you write `hash! = map!` in the Rebol console, it will return `true`.

In Red however, they are different. Hash works like a block, like a series, so you can use any of the series functions on it, but searching is a lot faster, with the caveat that creating a hash costs more time because the series needs to be hashed, so you should use it only if you do a lot of searches on the series.

A map in Red is a strictly associative data structure, it is not a series, it doesn’t have a pointer that can change the current index, you can only use it to access and set elements by key.

The types allowed for keys in maps are `all-word!`, `any-string!`and `scalar!`, which are `typeset!`s that include `[char! integer! float! pair! percent! tuple! time! date! string! file! url! tag! email! word! set-word! lit-word! get-word! refinement! issue!]`.

To create a `hash!`, you use the `make` function:

```
make hash! [a 1 b 2 c 3]
```

And then you can treat it exactly like you would any other series to add new elements, do searches and so on.

You can create a map in the same way, or use the special map syntax:

```
my-map: #(a 1 b 2 c 3)
```

To change a value or add a new element, you can use `put`:

```
put my-map 'a 10
```

This changes `a` from `1` to `10`.

Keys are treated as case-insensitive by default, you can use `put/case` to treat it case-sensitively.

You can also use `set` instead of put:

```
set 'my-map/a 15
```

Instead of set and put you can also just use a refinement:

```
my-map/a: 5
```

Now `a` is `5`.

To remove an element, you just set it to `none`.

You can also do bulk changes by using `extend`, which takes a block:

```
extend my-map [d 4 e 5]
```

This adds d and e to the map with the values 4 and 5 respectively.

You can use a refinement or the `select` function to get the value for a key in the map:

```
select my-map 'd
my-map/e
```

This will output: `4` and `5`.

## Control flow (If/else)

One of the most basic building blocks in any programming language is the if construct which lets you make decisions in your code. Almost every language out there has an if/else construct. Red is a bit different, it works like Rebol originally did (but was then changed when people asked for it).

You can use if in Red:

```
if (myvar = true) [
	; do something here
]
```

But you cannot use if/else like you can do in Rebol:

```
if/else (myvar = true)[
	; do something when true
] [
	; do something when false
]
```

Fear not however, Red has a function called either which works exactly like Rebol’s else refinement on the if function:

```
either (myvar = true)[
	; do something when true
] [
	; do something when false
]
```

So it’s not that Red is lacking functionality, it is just called by a different name. A lot of things in Rebol and Red are named differently than you might expect it from other languages. The idea was to use intuitive names instead of the jargon programmers came up with, because Rebol (and therefore Red) is supposed to be very easy to learn and use for everyone.

## Loops

There are a number of different loops you can use, some work like you’d expect coming from another language, like the foreach loop, but some make use of the fact that series in Rebol and Red have a pointer you can move around in the series so it works like an enumerable list in some other languages.

Loops that set a word in each iteration, like foreach and repeat, aren't local to the loop in Red because the processing cost for that was deemed too high. So in Red, remember that if you use them inside of a function created with `func` instead of `function`, you add the word as a `/local`. `function` makes words automatically local, so there is no extra step needed there.

Let’s look at the traditional examples first.

## for (only Rebol)

For is only available in Rebol, not in Red:

```
for i 1 10 1 [print i]
```

This outputs the numbers from 1 to 10. The first argument of for is the name of the variable, the second the starting value, the third the end value and the fourth by how much the value should be incremented or decremented in each go through the for loop. The last argument is a block that gets executed for every iteration through the loop.

## foreach

```
foreach character "Hello" [
	print character
]
```

This will output a list of all the characters in the word “Hello”. The first argument to the function is the variable name that holds the current element of the series, which is the second argument. The third argument is a block that is called with every iteration through the loop.

Instead of just getting one element from the series in each iteration, you can provide a block as the first argument to `foreach`:

```
foreach [name age] ["Chris" 34 "Bob" 27] [
	print name
]
```

This will output the names “Chris” and “Bob”.

## forall

The forall loop makes use of the pointer feature of series. It works very similar to foreach, but instead of setting a variable with every current element of the series, it just moves the pointer to the next element in the series and when it reaches the end, returns the pointer to the head:

```
text: "Hello"
forall text [
	print first text
]
```

This outputs a list of all the chracters in the word “Hello”, just like the example for the foreach loop does.

## forskip (only Rebol)

Forskip is only available in Rebol. It can be used to iterate over elements of a series at specific intervals, for example if skipping by 2 it will start with the first element, then the third, then the fifth. It makes use of the pointer feature of series, so it sets the pointer to the next element in each iteration through the loop and at the end, returns the series to its head:

```
text: "Hello"
forskip text 2 [
	print first text
]
```

This will output the characters H, l and o.

## while

The while loop you probably know from other languages. It is especially useful in combination with Rebol and Red’s pointer feature of series, because it allows you to modify a series while you are traversing it without the indexes changing getting you into trouble when you remove or add elements in an interation of the loop.

```
text: "Helo"

while [not tail? text] [
    if text/1 = #"l" [
        text: insert text #"l"
    ]
    text: next text
]

print head text
```

This will go through every element of the string “Helo” and when it encounters the character #“l”, insert another to fix the spelling error. The loop stops when it has reached the tail of the string. The series isn’t reverted back to the head, so we have to call the `head` function ourselves.

## repeat

The `repeat` function creates a loop that is run a given number of times and sets a given word to the current iteration cound.

```
repeat i 5 [print i]
```

This prints `1 2 3 4 5`.

## OOP - Object Oriented Programming

Rebol and Red are multi paradigm languages and OOP is one of the programming paradigms you can use. It’s used extensively when it comes to GUI programming for example.

There are two popular kinds of OOP, class based and prototype based. Most languages are class based, you write a class which then gets instantiated into an object at runtime. Few languages are prototype based, the most popular examples would be JavaScript, Lua, Self and Rebol &amp; Red.

Prototype based OOP gives you greater flexibility, but it also is easier to shoot yourself in the foot (with great power comes great responsibility), so you can’t really say if one is better than the other, it’s just two different approaches to solve a problem, both with positive and negative aspects.

Let’s create a simple object:

```
person: make object! [
	name: "Chris"
	age: 34

	sayhello: function [] [print ["Hi, my name is" name]]
]

person/sayhello
```

This will output: `Hi, my name is Chris` .

Instead of `make object!` you can also just write `object`, it’s a convenience function.

Expanding on the prior example, we now want to create another `person`. There is no difference between subclassing and creating another instance of an object:

```
bob: make person [
	name: "Bob"
	age: 27
]

bob/sayhello
```

This will output: `Hi, my name is Bob`.

The fields `name` and `age` where overwritten and the `sayhello` function was inherited from the `person` class. Since everything is an object, we could now even subclass our new bob object.

Outside of the object definition, you can get and set fields with the usual refinement syntax:

```
person/name: "Alice"
print person/name
```

This will print: `Alice`

## Contexts

The `context` function lets you define a new context. Any word defined in a context only exists within that context, not globally, so this is a way to keep from decluttering the global word space.

```
x: 5

mycon: context [
	x: 10
	view [button "Inc" [x: x + 1]]
]

print x
```

This will output: `5`, because x was changed in the context but not globally. If we want to access a variable in the context, we just use the refinement like we do on objects, because a context is actually just a simple object:

```
print mycon/x
```

This will output `10` or more if you pressed the button a few times.

Under the hood, the `context` function is nothing but an alias to `make object!`, just like the `object` function. It’s just a different name for it so that you can make your intention in your code more clear, the name implies what the object is going to be used for.

The global context, the place where words you define outside of functions and objects go, is in fact just an object as well. You can access it using the system object:

```
z: 3
probe system/words
```

Close to the bottom of the output you can see the `z: 3` that was just defined.

## Files

Both Rebol and Red have a datatype `file!`, and also a special syntax for filenames. If I wanted to access the file readme.txt in the current directory, I would therefore write: `%readme.txt`.

I can also give an absolute path to the file: `%/c/users/chris/readme.txt`. The same format is used no matter if your code runs on Windows, Mac or Linux, so you don’t have to convert paths.

## Reading and writing files

Reading and writing files is complicated stuff. Thankfully, Red and Rebol do all of that for you:

```
write %test.txt "Hello, world!"
print read %test.txt
```

Both the read and the write functions have a bunch of refinements to change how they behave. The `/binary` refinement for example reads or writes a file as a binary instead of a string.

If you want to store Rebol or Red data directly so that you can load it in again into your application, you can use `save` and `load`. You can use that instead of a database for example. The popular data interchange format `JSON` was actually inspired by Rebol, so just like JSON you can use this to save data to files or send data over the net.

```
save %mydata.red ["Chris" "Bob" "Alice"]
print first load %mydata.red
```

This will print: `Chris`.

## Network

URLs in Rebol and Red are a datatype: `url!`. You can write URLs directly in your code, you don’t wrap them in double quotes.

The networking features of Red are still a work in progress, right now it uses libcurl I believe so that the basics already work, but you can’t yet do advanced network stuff.

## Download a URL

To download a URL, all you need to do is this:

```
read http://www.google.com
```

So it works exactly like reading from a file does.

## GUI programming

## VID - Visual Interface Dialect

### Overview

There is no language other than Red that can let you create a fully native GUI hello world app in just one line of code:

```
view [area "Hello, world!"]
```

![hello area](https://lh3.googleusercontent.com/AjUGqvxKLtJIt0A_6aUPQI2_GHZDUt6BifGKFNlaiTIANpgxFZtz0GdOjB9RpiiBrDnSobskGyM3)

This displays the text “Hello, world!” in a text area. It’s a native text area, so all the shortcuts and the right click menu functions you know from your operating system are available in there.

We could also combine our GUI hello world with the traditional which outputs its message to the console:

```
view [
	button "Say hello" [
		print "Hello, world!"
	]
]
```

![hello print](https://lh3.googleusercontent.com/oucEEdYjevWTAEz9_5H2iagLsq9v6df797X6aMfnn7k6Zdw9G9NrYI2HQSG4ioyWjwfErdrcRh7e)

This will display a window with a single button on the screen, with the label “Say hello”. Clicking on the button will print our hello world message to the console. Again, there is no other language in existance which makes native GUI development as easy as this.

All of the faces (as Rebol and Red call the GUI widgets) work about the same, so it’s easy to learn how to use them, when you understand how one works you know how nearly all of them work.

You’ve already seen how a button works, the word button followed by a string which sets the text on the button and a block which is executed when the button is clicked. Let’s look at the text area next:

```
view [
	area "Say hello" [
		print "Hello, world!"
	]
]
```

![area print](https://lh3.googleusercontent.com/ng7vyHEW1Myq2PWzUhdnVT4XZqXqJcy4pRDB-_SHv0InRddBOPp7HTyu_NwiG7dBjMfG1PdS5Ejv)

We only changed button into area but left the rest of the code as is. A text area is displayed on the screen with the text “Say hello”. Now try typing something into the text area. “Hello, world!” is going to be printed into the console whenever the content of the text area changes.

So in this case, the block gets executed not when you click, but when you change the contents of the text area which makes sense. Rebol and Red try to do the sane thing by default. We could also have said explicitly when the block should be executed:

```
view [
	area "Say hello" on-up [
		print "Hello, world!"
	]
]
```

![area print](https://lh3.googleusercontent.com/ng7vyHEW1Myq2PWzUhdnVT4XZqXqJcy4pRDB-_SHv0InRddBOPp7HTyu_NwiG7dBjMfG1PdS5Ejv)

Now, “Hello, world!” is only printed to the console when you click inside of the text area, so now it works like the button does. You can set the event to respond to with the on-* word, on-up in this case. There is also on-click but that only works on buttons. You can check the [Red documentation](https://doc.red-lang.org/en/view.html#_events) for a list of all the 35 events that are supported.

Another thing you need to know about faces is their data field, let’s look at a text-list next:

```
view [
	text-list data ["one" "two" "three"] [
		print pick face/data face/selected
	]
]
```

![text-list](https://lh3.googleusercontent.com/_kKJaJM4JnAWV2Ya9AOE8wDFYn-otGo46gP80IDoMoNij-r7JIYnNeb_mUp3GA3wWGexAixhl6gs)

This will display a text list on the screen with the lines “one”, “two” and “three”. You can select entries in the list, and now the block is executed whenever you select an entry, just like you would want.

But what is the line in the block doing? What’s `face` referring to? The block is automatically passed a variable `face` which contains the object of the text-list. We used the word `data` to prefill the list with “one”, “two” and “three”, and the `face` object has a field `data` which stores its data, in this case the list of entries in the text list, but it is used for different things in different faces. A slider for example uses the `data` field to store the current value of the slider.

So with `face/data` we can access the data of the list, and by using the `pick` function which gets an element from a series by a given index, we use `face/selected` as the index to get the currently selected element from the `face/data` series.

Let’s look at a textfield next:

```
view [
	field [
		probe face
	]
]
```

![field](https://lh3.googleusercontent.com/tdIVDsEbypA8r9jhJXNNGWM_zhkGdH-0JouckFeY0_oHQ8ZGPREO-VRTlPH5YK2k-EkJhzGhpPVH)

Enter something into the field. It’s not going to print anything to the console. Now hit enter, and you see the face object printed to the console. So in case of the field, the default is to execute the block once the enter key is pressed. If you want to execute the block whenever the content of the field changes, use `on-change`.

Looking through the field `face` object, we can see that it has whatever we have written into the field before pressing enter saved in two fields, `text` and `data`. So you can access the text of the field with either of the two. Why? There is a difference. Try entering a number, like 123. Now the `text` field will contain the number as a `string!`, whereas the `data` field contains the number as an `integer!`. So you can choose whatever fits best, without having to manually convert the value to the format you want.

Rebol and Red give you as much control over the display as you need. You can for example also set the size of a face, and the color:

```
view [area red green 300x200 "Hello, world!"]
```

![red area](https://lh3.googleusercontent.com/33L40V1kCWowKt2IXScChxZd1U1ukil-fFtrR_uGPSUwC3TxTWHitqbJftW98E3gTjej6Z_2WhdI)

This will display a text area with a red background and green text on the screen, and the size of the text area is set to 300x200. This works for lots of different faces, just try it out. And you don’t need to remember the position of the size or the color or where to put the block that gets executed or the string with the text you want displayed. Use whatever order you prefer. How that works will be explained later in the section about dialects, where you will also learn how to write your own little language that can do that.

You can also save a face to a variable, so that you have access to it from other faces. For example, to set the text of a text area after clicking on a button:

```
view [
	a: area
	button "Say hello" [
		a/text: "Hello, world!"
	]
]
```

![say hello](https://lh3.googleusercontent.com/AzbHBk_SrdFYmo0V8uqtRBrVuYnG9ebMvXe_9JwSL216rFCCLZLZ05sS1CZMQn0qA6tLnDId0DJs)

This is all that is needed in Red to make the button change the text of the text area, changing the text field automatically updates the GUI display. In Rebol, you would need to also call `show a` after changing the text field to tell Rebol that the face needs to be updated. In most cases, Red’s automatic handling of updating the GUI is good enough, but when you need more fine grained control to bundle a bunch of changes together and only update the GUI once, you can disable this automatic updating so that it behaves like it does in Rebol.

To do that, you just need to set system/view/auto-sync? to no:

```
system/view/auto-sync?: no
```

In Rebol, everything shown here so far works pretty much the same, but there are two small differences. You cannot use the `view` function directly, instead you combine it with `layout` which you can also do in Red, but don’t have to:

```
view layout [button "Say hello" [print "Hello, world!"]]
```

When you do use layout, you can also save the layout to a variable before displaying it:

```
main-window: layout [area "Hello, world!"]
view main-window
```

The other difference in Rebol is in the text-list. It doesn’t have a `face/selected` field, instead it uses `face/picked`, which is a block of one or more items selected in the list.

### Other faces

You’ve seen the most important faces already, but there are a lot more, so lets go over them quickly.

Here is a `group-box`:

```
view [group-box "Message" [area]]
```

![group-box](https://lh3.googleusercontent.com/36fdJN9A-D7pj6FLGI_OV8O-jMR7eER1WMDQP78R1WNg_F-AUGhiGU_9dJmkoMXRfa8spJH6DmJ3)

A group-box allows you to visually group child faces together. In this example I only added one face into the group-box, a text `area`, but you can add as many as you want. It allows you to group faces both visually but also in terms of their position for example. Instead of just moving one face at a time, you can move the group-box and all child faces will move with it.

Similar to the group-box, but without the border and the text title is the `panel`:

```
view [panel cyan [area]]
```

![panel](https://lh3.googleusercontent.com/HtxX-9BTeqm5SFWY1kMA85OvsPqkwjxVYQIlZk8BxFrEpvN_9HEZJNyI-Ie5NxmBN_goD4j2sXgT)

While the look is different, it allows you to do the same things the group-box can do, it groups faces together. In this example, to make it more visible, I set the background color (the backdrop in Red terminology) of the `panel` to cyan.

There are different button types as well. For example the `radio` button:

```
view [radio "one" radio "two"]
```

![radio](https://lh3.googleusercontent.com/EADtResQoTRHeSLN7BYR9j1h5VNnaPnUzkRtlXhVbvIQZX7mAEuHH-mVVAsQcrsNklQYfTYJywLs)

And the `check` box:

```
view [check "one" check "two"]
```

![check](https://lh3.googleusercontent.com/PNL8jH99DCqOaDAJXRZxuEwXADWU_eRkCj8LTjU2ItAjpRC-OfevbcT2Hvsw_TGxaa0E97q1CQSs)

You can display images with `image`:

```
view [
	image https://upload.wikimedia.org/wikipedia/en/e/e9/Red_Language_Tower_Logo.png
]
```

![image](https://lh3.googleusercontent.com/U2Z8FPxUQETO5ecNLZu7WtogewHlRwYMEau-x_GOpklR2UtfGdnseIICIxmDxTxWD81CaU-xilx7)

As you can see, you can directly enter a URL for the image you want to display and Red will download it automatically. This shows a cool 3D rendering of the Red logo from its Wikipedia article.

The `camera` face lets you display the user’s webcam, if available:

```
view [camera [face/selected: 1]]
```

Since multiple cameras could be attached, we have to choose which one to use, so here we select the first one. You can look at the `data` field to see if the user has one or more webcams. When you run this snippet in the console, you will see a black rectangle, but no camera feed:

![camera](https://lh3.googleusercontent.com/29oTTOB8HR9gT1d-bTFGlRJSiOu2YO5OrYhTKzRJUBPstgmIVTOBcDEDfqIflj33YD1rLY1ypabI)

The block gets executed when you click, so click on the black rectangle and if you have a webcam attached, you should see yourself.

You can easily take screenshots from the camera (or any other face) by using the `to-image` function on it:

```
view [
	c: camera [
		face/selected: 1
	]
	button "Screenshot" [
		save %camera-screenshot.png to-image c
	]
]
```

Now when you click the button, a picture from the webcam is going to be saved as `camera-screenshot.png` in the current folder.

### Timers

Faces in Red can’t just react to user input events, they can also react to the passing of time. Every face can act as a timer by using `rate` to set how often the timer should fire per second and then providing a block for the `on-time` event:

```
view [
	field "1" rate 1 on-time [
		face/data: face/data + 1
	]
]
```

![enter image description here](https://lh3.googleusercontent.com/2q2GRaNq-fPy77syZA4WEm8uSypXSHkJwOXdd8IPu3tSyZC-jD1hG66DuZlrVqQ8sJZthSrmITxv)

Here we’ve set the `rate` to `1`, which means that the timer is going to fire once per second. The `on-time` block then increases the number in the text field by 1, counting up. Instead of converting between strings and integers, we make use of the fact that `field` faces store numbers in the `/data` field in addition to storing them as a `string!` in the `/text` field. Otherwise the code would be a bit less pretty:

```
view [
	field "1" rate 1 on-time [
		face/text: to-string (to-integer face/text) + 1
		]
	]
```

In Rebol, faces have timers too but the syntax is quite different:

```
view layout [
	field "1" rate 1 feel [
		engage: func [face action event][
			if action = 'time [
				face/text: to-string (to-integer face/text) + 1 show face
			]
		]
	]
]
```

In both Rebol and Red, you can also use `time!` instead of `integer!` for the `rate`. If you use `rate 0:0:5` for example, the timer is going to fire every 5 seconds.

You can use these timers to make animations with DRAW, periodically download a resource from the internet or update data you get from a database, it’s quite an important part of the language so it’s nice that Red has made it so much easier to use.

One caveat, since timers are tied to faces, if you don’t want something displayed in the GUI but do need a timer, you need to create an invisible face. `base` works fine for that since it’s the most simple face and will be hidden when you set the size to: `0x0`. You would do this when your timer interacts with multiple faces so that it doesn’t make sense to tie it to one particular face.

## View - The graphics system

### Overview

While there aren’t that many differences when using the VID dialect to create GUIs, the underlying graphics system called View is quite different in Rebol compared to Red. Instead of using VID you can for example directly create `face` objects, which is sometimes necessary when VID can’t do what you want to do.

All VID does is generate `face` objects, so you can mix your manually created face objects with those created by VID, so you only add as much complexity as you need. However, since View is so different in Rebol, I will only cover that for Red, not Rebol here. Rebol does however have extensive documentation available, so you can look it up there if you need to.

### Panes

Every `face` object has a field `pane` and a field `parent`. Think of `pane` as `child`, and then it might become obvious what these two fields are for. Every `face` can be the child of another parent `face` by adding it to the `pane` field of that parent.

A `face` can have multiple children, in that case you set the `pane` field to a `block!` instead of a `face` directly. The z-order of the child panes is based on their position in the`block!`. The last entry has the highest z-order, so it’s displayed on the very top of all other faces.

Here is a demonstration which uses the `repeat` function to add ten `base` faces with random background colors as children of a 200x200 panel:

```
view [
	p: panel 200x200 do [
		p/pane: copy []
		repeat i 10 [
			append p/pane layout/only compose [
				at (as-pair i * 10 i * 10)
				base 50x50 (as-color random 255 random 255 random 255) loose
			]
		]
	]
]
```

![z-order](https://lh3.googleusercontent.com/L57NKZHHuhidciK8Fq7AVBGzI693Hfneby1R1hUfbXkWdaChy73srm9dnaQRJsE_BnGZuwcm36Cw)

Try dragging the rectangles around with your mouse (`loose` makes faces draggable), so that you can see the z-order in action.

## DRAW (Scalable Vector Graphics dialect)

DRAW is one of the dialects (Domain Specific Language) that comes with Red (and Rebol) out of the box. It’s a very simple and powerful way to draw vector graphics. You can use it to create your own GUI widgets or even make games.

The function `draw` creates an image that you could save to a file or display on the screen, but you can also use the DRAW dialect directly within the VID dialect to create GUIs, we’re going to use that for the examples here.

```
view [box 200x200 white]
```

![draw box white](https://lh3.googleusercontent.com/4vOD4EIR_YScVOoVIfa-tTeNoU-FWX6khxqwyrl6Z_LLqT-uxT5Nuqo2c_YEY21ZdKEuaB2A9Uz8)

This will display an empty box on the screen with a white background. Now we’re going to add a draw command:

```
view [
	box 200x200 white draw [
		fill-pen green
		circle 100x100 50
	]
]
```

![draw green circle](https://lh3.googleusercontent.com/xnlh2gIQjZ0pNfYwGGYV2Yh9RK7JFM_zJu4mrPrxFQiy_8HIayqxte0N7KcPSPdEFS0WwmZliptG)

This will draw a green circle in the box. `fill-pen` is used to set the fill color of whatever you draw from that point on. `pen` can be used to change the stroke. The `pair!` after `circle` sets the position to draw the circle and the `integer!`, in this case `50`, sets the radius of the circle.

To draw rectangles:

```
view [
	box 200x200 white draw [
		fill-pen green
		box 50x50 150x150
	]
]
```

![draw green rect](https://lh3.googleusercontent.com/W1f0eWwdAbqQdNgXIr1qMIy--59u0KSxLTOkwpvq1l2WJg37msHQNM-P3NjAiooaMnIXXxkeU9eo)

Here, the first `pair!` is used as the top left corner of the rectangle and the second `pair` for the bottom right corner.

## Good to know

## Viewing images with help

The `help` function, aliased to `?`, doesn’t just show you documentation for a function and fields of an object, it can also be used to quickly view images.

If you use the `draw` function to create an image for example, you might want to quickly check in the Red console how it looks:

```
img: draw 100x100 [pen green fill-pen linear yellow green box 0x0 100x100]
? img
```

You can also combine it directly with the `draw` function, you just need to wrap around parentheses otherwise `help` will show you the documentation for `draw`:

```
? (draw 100x100 [pen green fill-pen linear yellow green box 0x0 100x100])
```

## Taking screenshots

You can use the `to-image` function on a `face` object to create a screenshot of the face. What you might not know, is that the `system` object which contains a lot of useful information about the computer your application is running on, also contains a field `view` which is an object with another field `screens`.

This `screens` field is a list of monitors attached to the computer, and when you write `system/view/screens/1` for example to get the first screen, a `face` object is returned.

You can use this face object to get the desktop resolution of the user’s computer (`system/view/screens/1/size`), but since it is a `face` object, you can also use the `to-image` function on it and thus create a screenshot with just a single line of code, so writing a screenshot app becomes trivial:

```
view [
	i: image 400x300
	return
	button "Screenshot" [
		i/image: to-image system/view/screens/1
	]
]
```

Maybe at some point you’ll be able to do the same with video, to easily write screencast software.

## Passing a function as a value

Let’s say you define a function sayhello:

```
sayhello: function [name [string!]] [
	print ["Hello, " name "!"]
]
```

And now you want to save this function to another variable or pass it as a value to a function. You can’t just write `newvariable: sayhello`, because then Red shows you an error that `sayhello` is missing its argument because it tried to call the `sayhello` function. To get around that problem, you can quote the function name: `'sayhello`. But that returns not the function itself but something called a `lit-word!`. The function `get` takes such a `lit-word!` and returns the function associated with it:

```
newvariable: get 'sayhello
```

You can also use a shorthand for this by just prepending a colon to the function name:

```
newvariable: :sayhello
```

## Dialects

Parse can be used to create dialects, for example:

```
rules: [
	any [
		'log set arg string! (print arg) |
		'dialog set arg string! (view [area arg])
	]
]
```

This block of “rules” for the Parse dialect, Rebol’s (and Red’s) much more powerful replacement for the concept of regular expressions, lets us do something like the following:

```
parse [
	log "Hello"
	dialog "World"
] rules
```

We created our own mini language where writing log followed by a string! outputs it on the screen, and writing dialog followed by a string! shows the string! in a GUI text area.

But how does it work? There are three important concepts used in this example.

First, we have the word “any” which matches 0 or more of whatever comes after it (in this case a block!) OR ( using the | operator) something else. Using that, we can create a list of commands our mini language, or dialect as Rebol and Red call it, understands. Instead of any you can also use “some” which matches 1 or more of the following, or directly input a number. So the number 3 matches 3 of whatever comes next.

Looking at an entry in the any block closely shows us that we are trying to match a word and then it’s followed by “set arg string!”. Read that as **set** **variable** to **something**. So “set arg string!” sets the variable called arg to whatever follows it, which in this case is a string!. We could have written pair!, url!, file! or any other datatype the language recognizes. And we can set multiple variables to give our command multiple parameters.

The third and last concept used in the example is the instruction in parentheses. These instructions get executed while our rules block is parsed.

And with these three simple concepts, you can already create very powerful dialects that make writing code easier for a particular problem. But there is of course much more to learn, much more advanced concepts. Parse is the most powerful tool in Rebol and Red so you’ll have to learn a lot to master it, but it is absolutely worth doing so and I hope that little example showed why.

Rebol (and Red) already come with many of these dialects. Parse is one, VID is another which lets you easily create GUIs. And there are more written by the community. There is for example one for Rebol which outputs PDF, another that outputs Flash (the game Machinarium was written using that, the game written in Rebol but then distributed as Flash).

## Resizable window

By default, GUIs created by Red cannot be resized and right now it’s a bit more complex than it needs to be to make them resize, but it is still easy to do. You need to create a layout and save it to a variable so that you can modify it before you use the `view` function on it.

```
mainwin: layout [a: area 300x200]
```

Then you need to add an actor to the mainwin object. An actor is an event handler for GUI events, a function that takes two parameters, a face object that represents the window being resized and an event object. For window resizing we need to take care of two events, `on-resize` which is fired after a window has been resized and `on-resizing` which is fired live during the resize operation. If you only used `on-resizing`, your code would not be called if the user presses the maximize window button instead of manually resizing the window. So we define a `resize-func` function that we can reuse for both events, so that we don’t have to write duplicate code:

```
resize-func: function [face event] [
    a/size: face/size - 20x20
]
```

And then we add our `resize-func` to the `mainwin`'s `actors` field:

```
mainwin/actors: make object! [
    on-resize: :resize-func
    on-resizing: :resize-func
]
```

Instead of using a function here so that we don’t have to write duplicate code, we could also have done this:

```
mainwin/actors: make object! [
	on-resize: on-resizing: function [face event] [
		a/size: face/size - 20x20
	]
]
```

That way, the function definition is saved in both `on-resize` and `on-resizing`, you might want to make use of that feature when you just very quickly want to prototype things in the console for example and don’t want to write an extra function definition.

Now we can call the `view` function on our `mainwin`, but we need to use the `/flags` refinement so that we can add the option to enable resizing:

```
view/flags mainwin 'resize
```

Now the window is displayed and you can resize it by dragging the window border or by pressing the maximize button. The text area resizes along with the window. That was easy enough, but what if we add a button below the text area?

```
mainwin: layout [
    a: area 300x200
    return
    b: button "Click me"
]
```

The button stays in the same position it had at the start and doesn’t move when the window is resized, so our `resize-func` also needs to take care of the button’s position in the window (its `offset`). As you can probably see, this can get quite complex pretty fast:

```
resize-func: function [face event] [
    a/size: as-pair (face/size/x - 20) (face/size/y  - b/size/y - 30)
    b/offset: as-pair 10 (face/size/y - b/size/y - 10)
]
```

Other GUI toolkits usually offer a constrait based system to deal with this, instead of absolutely positioning widgets on the screen, you can position a button for example in relation to the position of the text area. Red’s VID dialect will support this at some point, but it doesn’t right now. There is however something you can do to make this a bit easier if you have a lot of controls.

Let’s say we want to add not just one but three buttons below the text area. Writing resizing code for every single one of these buttons would be tedious. But instead, we could just wrap them in a `panel` and then change the position of that `panel` instead of the buttons. That makes it much easier:

```
mainwin: layout [
    a: area 300x200
    return
    p: panel [
        button "One"
        button "Two"
        button "Three"
    ]
]
```

And we change our `resize-func` accordingly:

```
resize-func: function [face event] [
    a/size: as-pair (face/size/x - 20) (face/size/y  - b/size/y - 30)
    p/offset: as-pair 10 (face/size/y - p/size/y - 10)
]
```

## Example Apps

## Text Editor

This is going to be a very simple text editor that uses a few of the concepts you have learned so far. Save the code into a file and compile it with Red.

```
Red [
	Title:  "Red Text Editor"
]

selected-file: none

view [
	button "Open" [
		selected-file: request-file
		if selected-file [
			a/text: read selected-file
			save-button/enabled?: false
		]
	]
	
	save-button: button "Save" disabled [
		write selected-file a/text
		save-button/enabled?: false
	]
	return
	a: area 800x600 [
		save-button/enabled?: true
	]
]
```

With just this bit of code we already have a working little text editing application that can open, edit and save text files. Still, it would be nice if we could resize the editor window.
