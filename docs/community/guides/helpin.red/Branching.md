Original URL: <http://helpin.red/Branching.html>

# Branching

* * *

* * *

native! if  [Red-by-example](http://www.red-by-example.org/#if)    [MyCode4fun](http://www.mycode4fun.co.uk/red-beginners-reference-guide#TOC-Here-we-use:-forever-unview-quit-if-and-print-)

Executes a block if a test is true.

if &lt;test&gt; \[ block ]

&gt;&gt; if 10 &gt; 4 \[print "large"]  
large

Remember from the Datatypes chapter that everything that is not false , off or no is considered true:

&gt;&gt; if "house" \[print "It's true!"]  
It's true!

&gt;&gt; if 0 \[print "It's true!"]  
It's true!

&gt;&gt; if \[] \[print "It's true!"]  
It's true!

&gt;&gt; if \[false] \[print "It's true!"]  ;bizarre!  
It's true!

native! unless  [Red-by-example](http://www.red-by-example.org/#unless)    [MyCode4fun](http://www.mycode4fun.co.uk/red-beginners-reference-guide#TOC-Here-we-use:-unless-)

Same as if not. Executes block only if a test is false.

unless &lt;test&gt; \[ block (if test false) ]

&gt;&gt; unless 10 &gt; 4 \[print "large"]  
\== none

&gt;&gt; unless 4 &gt; 10 \[print "large"]  
large

native! either  [Red-by-example](http://www.red-by-example.org/#either)    [MyCode4fun](http://www.mycode4fun.co.uk/red-beginners-reference-guide#TOC-Here-we-use:-either-)

A new name for the classic if-else. Executes the first block if the test is true or executes the second block if the test is false.

either &lt;test&gt; \[true block] \[false block]

&gt;&gt; either 10 &gt; 4 \[print "bigger"] \[print "smaller"]  
bigger

&gt;&gt; either 4 &gt; 10 \[print "bigger"] \[print "smaller"]  
smaller

native! switch  [Red-by-example](http://www.red-by-example.org/#switch)    [MyCode4fun](http://www.mycode4fun.co.uk/red-beginners-reference-guide#TOC-Here-we-use:-switch-switch-default-)

Executes the block correspondent to a given value.

Red\[]

switch 20 [

       10 \[print "ten"]

       20 \[print "twenty"]

       30 \[print "thirty"]

]

twenty

/default

If the program does not find a match, executes a default block.

Red\[]

switch/default 15 [

       10 \[print "ten"]

       20 \[print "twenty"]

       30 \[print "thirty"]

]\[ print "none of them"]        ;default block

none of them

native! case  [Red-by-example](http://www.red-by-example.org/#case)    [MyCode4fun](http://www.mycode4fun.co.uk/red-beginners-reference-guide#TOC-Here-we-use:-case-case-all---evaluates-a-block.)

Makes a series of tests, executing the block corresponding to the first true test.

Red\[]

case [

       10 &gt; 20 \[print "not ok!"]

       20 &gt; 10 \[print "this is it!"]

       30 &gt; 10 \[print "also ok!"]

]

this is it!

/all

Executes all the true tests.

Red\[]

case/all [

       10 &gt; 20 \[print "not ok!"]

       20 &gt; 10 \[print "this is it!"]

       30 &gt; 10 \[print "also ok!"]

]

this is it!  
also ok!

native! catch &amp; throw   [Red-by-example](http://www.red-by-example.org/#catch)  

Catch and throw may be used to create complex control structures. In its simplest form, catch receives a return from one of many throws:

Red\[]

a: 10

print catch [

       if a &lt; 10 \[throw "too small"]

       if a = 10 \[throw "just right"]

       if a &gt; 10 \[throw "too big"]

]

just right

## catch/name

## catches a named throw. Really deserves an example, hope to make one soon...

## throw/name

## throws a named catch.

* * *

## Boolean branching

native! all  [Red-by-example](http://www.red-by-example.org/#all)    [MyCode4fun](http://www.mycode4fun.co.uk/red-beginners-reference-guide#TOC-Here-we-use:-any-all-)

Evaluates all expressions in a block. If one evaluation returns false, it returns none, otherwise returns the result of the last evaluation.

![](http://helpin.red/lib/all.png)

&gt;&gt; john: "boy"  
\== "boy"

&gt;&gt; alice: "girl"  
\== "girl"

&gt;&gt; all \[john = "boy" alice = "girl" 10 + 3]        ;all true, the last evaluation is returned.  
\== 13

&gt;&gt; all \[john = "boy" alice = "boy" 10 + 3]        ; alice = "boy" is false!  
\== none

&gt;&gt; if all \[john = "boy" alice = "girl"] \[print "It' all true"]  
It' all true

native! any  [Red-by-example](http://www.red-by-example.org/#any)    [MyCode4fun](http://www.mycode4fun.co.uk/red-beginners-reference-guide#TOC-Here-we-use:-any-all-)

Evaluates each expression in a block in and returns the first resulting value that is not false. If all resulting values are false it returns none.

![](http://helpin.red/lib/any.png)

&gt;&gt; john: "boy"  
\== "boy"

&gt;&gt; alice: "girl"  
\== "girl"

&gt;&gt; any \[john = "girl"  alice = "girl"  10 + 3]        ;alice = "girl" is not false: return it!  
\== true

&gt;&gt; any \[john = "girl"  10 + 3  5 &gt; 2]                        ; 10 + 3 is not false: return it!  
\== 13

&gt;&gt; if any \[john = "girl" alice = "girl"] \[print "Something is true here"]

Something is true here

[&lt; Previous topic](http://helpin.red/Looping.html)                                                                                          [Next topic &gt;](http://helpin.red/Stringandtextmanipulation.html)
