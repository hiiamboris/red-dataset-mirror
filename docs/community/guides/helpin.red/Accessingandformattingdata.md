Original URL: <http://helpin.red/Accessingandformattingdata.html>

# Accessing and formatting data

* * *

* * *

### native! get  [Red-by-example](http://www.red-by-example.org/#get)

Every word in Red, the native ones and the ones you create, go into a dictionary. If the word is associated with an expression, the dictionary keeps the whole expression that may or may not be evaluated depending on the type of call that fetch the word

If you want to know what is the dictionary description of a word, you use get . Notice that when you refer to a word in Red (the word itself, not the value) you precede it with a quote ( ' ). get gives you the "meaning" even of Red's native words, but returns an error if used on a value, e.g. integer!  pair! tuple! :

&gt;&gt; get 'print  
\== make native! [[  
       "Output...

&gt;&gt; get 'get  
\== make native! [[  
       "Return...

&gt;&gt; a: 7  
\== 7

&gt;&gt; get 'a  
\== 7

&gt;&gt; a: \[7 + 2]  
\== \[7 + 2]

&gt;&gt; get 'a  
\== \[7 + 2]

&gt;&gt; get 8  
\*\** Script Error: get does not allow integer! for its word argument

action! mold  [Red-by-example](http://www.red-by-example.org/#mold)    [MyCode4fun](http://www.mycode4fun.co.uk/red-beginners-reference-guide#TOC-Here-we-use:-mold-returns-string-representation-of-a-value.)

mold turns a datatype! (i.e. a block!, an integer! a series! etc.) into a string and returns it:

&gt;&gt; type? 8  
\== integer!

&gt;&gt; type? mold 8  
\== string!

&gt;&gt; print \[4 + 2]  
6

&gt;&gt; print mold \[4 + 2]  
\[4 + 2]

Refinements  
/only - Exclude outer brackets if value is a block!  
/all - Return value in loadable format  
/flat - Exclude all indentation  
/part - Limit the length of the result, where limit is an integer!

action! form  [Red-by-example](http://www.red-by-example.org/#form)    [MyCode4fun](http://www.mycode4fun.co.uk/red-beginners-reference-guide#TOC-Here-we-use:-now-time-append-and-form-)

form also turns a datatype! into a string, but depending on the type, the resulting text might not contain extra type information (such as \[ ] { } and "") as would be produced by mold. Useful for [String and text manipulation](https://ungaretti.gitbooks.io/red-language-notebook/content/string-and-text-manipulation.html).

Red \[]

print "---------MOLD----------"

print mold {My house

       is a very

       funny house}

print "---------FORM----------"        

print form {My house

       is a very

       funny house}

print "---------MOLD----------"        

print mold \[3 5 7]

print "---------FORM----------"        

print form \[3 5 7]

---------MOLD----------

"My house^/^-is a very^/^-funny house"

---------FORM----------

My house

   is a very

   funny house

---------MOLD----------

\[3 5 7]

---------FORM----------

3 5 7

Allows the refinement /part to limit the number of characters.

#### Main uses for mold and form:

mold is basically used to turn a series into code that can be saved and interpreted later

form is basically used to generate regular text from a series

&gt;&gt; a: \[b: drop-down data\[ "one" "two" "three"]\[print a/text]]  
\== \[b: drop-down data \["one" "two" "three"] \[print a/text]]

&gt;&gt; mold a  
\== {\[b: drop-down data \["one" "two" "three"] \[print a/text]]}

&gt;&gt; form a  
\== "b drop-down data one two three print a/text"

### function! ??  [Red-by-example](http://www.red-by-example.org/#xqmxqm)

### Prints a word and the value it refers to, in molded form.

&gt;&gt; cat: 33  
\== 33  
&gt;&gt; ?? cat  
cat: 33

### function! probe  [Red-by-example](http://www.red-by-example.org/#probe)    [MyCode4fun](http://www.mycode4fun.co.uk/red-beginners-reference-guide#TOC-Here-we-use:-print-prin-probe-space-)

probe prints its argument without evaluation but also returns it.  Remember that print evaluates its argument. probe prints and returns the argument "as it is", so to speak.  
It may be used for debugging as a way of showing code (by printing) without changing it.

&gt;&gt; print \[3 + 2]  
5

&gt;&gt; probe \[3 + 2] \[3 + 2]  
\== \[3 + 2]

&gt;&gt; print probe \[3 + 2]  
\[3 + 2]  
5

### native! []() reduce  [Red-by-example](http://www.red-by-example.org/#reduce)    [MyCode4fun](http://www.mycode4fun.co.uk/red-beginners-reference-guide#TOC-Here-we-use:-reduce-)

Evaluates expressions inside a block and returns a new block with the evaluated values. Take a look at the [chapter about evaluation](http://helpin.red/Evaluation.html).

&gt;&gt; a: \[3 + 5 2 - 8 9 &gt; 3]  
\== \[3 + 5 2 - 8 9 &gt; 3]

&gt;&gt; reduce a  
\== \[8 -6 true]

&gt;&gt; b:\[3 + 5 2 + 9 7 &gt; 2 \[6 + 6 3 &gt; 9]]  
\== \[3 + 5 2 + 9 7 &gt; 2 \[6 + 6 3 &gt; 9]]

&gt;&gt; reduce b  
\== \[8 11 true \[6 + 6 3 &gt; 9]]                ;it does not evaluate expressions of blocks inside blocks

&gt;&gt; b  
\== \[3 + 5 2 + 9 7 &gt; 2 \[6 + 6 3 &gt; 9]]        ;the original block remains unchanged.

/into        =&gt; Put results in out block, instead of creating a new block.

Here I quote Vladimir Vasilyev (@9414):

" Imagine that block is a piece of paper, and some words are written on it. Initially they are just scribbles and sets of letters with symbols - "London" is a 6-letter word. But if you "infer" their meaning, then they become something else - London is the capital of Great Britain.

This is kinda the same with Red. \[a] is a list of paper with one word written on it, reduce "infers" the meaning of all words (of all expressions, to be specific), and a brings forward its meaning."

&gt;&gt; London: "the capital of Great Britain"

== "the capital of Great Britain"

&gt;&gt; paper: \[London]

== \[London]

&gt;&gt; paper

== \[London]

&gt;&gt; reduce paper        ; reduce "returns" evaluation result.

== \["the capital of Great Britain"]

&gt;&gt; probe paper

\[London]                ; this is "returned" (could be assigned to a word, for example).

== \[London]        ; this is the "output" of probe (printed).

&gt;&gt; print paper        ; print reduces (evaluates) and prints.

the capital of Great Britain

&gt;&gt; type? first paper

== word!

&gt;&gt; type? first reduce paper

== string!

### function! collect and keep  [Red-by-example](http://www.red-by-example.org/#collect)    [MyCode4fun](http://www.mycode4fun.co.uk/red-beginners-reference-guide#TOC-Here-we-use:-collect-compose-)

### Collect in a new block all the values passed to keep function from the body block.

### In other words: creates a new block keeping only the values determined by keep, usually values that fulfill some condition.

Red \[]

a: \[11 "house" 34.2 "dog" 22]

b: collect [

       foreach element a \[if string? element \[keep element]] ;keeps string elements

       ]

print b

house dog

/into        =&gt;  Insert into a buffer instead (returns position after insert).

syntax: collect/into \[........] &lt;existing output block&gt;

Red \[]

c: \["one" "two"]                                ; creating the output block with some elements

a: \[11 "house" 34.2 "dog" 22]   ; a generic series

collect/into [

       foreach element a \[if scalar? element \[keep element]] ;keeps numbers of a

       ] c                                                        ;appends them into c

print c

one two 11 34.2 22

### native! compose  [Red-by-example](http://www.red-by-example.org/#compose)    [MyCode4fun](http://www.mycode4fun.co.uk/red-beginners-reference-guide#TOC-Here-we-use:-collect-compose-)

Returns a copy of a block, evaluating only paren! (things inside parenthesis).

Compose is very important for the [DRAW dialect](http://helpin.red/Draw.html);

Red \[]

a: \[add 3 5 (add 3 5) 9 + 8 (9 + 8)]

print compose a                        ;print evaluates everything!!

probe compose a                        ;probe prints "as is"

8 8 17 17  
\[add 3 5 8 9 + 8 17]

    /deep        =&gt; Compose nested blocks.

Red \[]

a: \[add 3 5 (add 3 5) \[9 + 8 (9 + 8)]]

probe compose a                

probe compose/deep a        

\[add 3 5 8 \[9 + 8 (9 + 8)]]  
\[add 3 5 8 \[9 + 8 17]]

    /only        =&gt; Compose nested blocks as blocks containing their values.

    /into        =&gt; Put results in out block, instead of creating a new block.

syntax: compose/into \[........] &lt;existing output block&gt;

Red \[]

a: \[add 3 5 (add 3 5) 9 + 8 (9 + 8)]

b: \[]

compose/into a b

probe b

\[add 3 5 8 9 + 8 17]

[&lt; Previous topic](http://helpin.red/Datatypeconversion.html)                                                                                          [Next topic &gt;](http://helpin.red/Mathandlogic.html)
