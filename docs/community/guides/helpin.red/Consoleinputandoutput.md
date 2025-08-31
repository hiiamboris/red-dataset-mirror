Original URL: <http://helpin.red/Consoleinputandoutput.html>

# Console input and output

* * *

* * *

### Note: console input and output may cause problems if you compile your programs. This makes sense: if you compile it, the console is simply not there! [Red Wiki about issues](https://github.com/red/red/wiki/%5BNOTES%5D-Compiling-with-console-functions)

### native! print         [Red-by-example](http://www.red-by-example.org/#print)        [MyCode4fun](http://www.mycode4fun.co.uk/red-beginners-reference-guide#TOC-Here-we-use:-forever-unview-quit-if-and-print-)

print sends data to the console. After the data, it sends a newline character to the console. It evaluates its argument before printing it, that is , it applies a [reduce](http://helpin.red/Accessingandformattingdata.html#reduce) to the argument before printing.

Red \[]

print "hello"

print 33

print 3 + 5

hello

33

8

### native! prin        [Red-by-example](http://www.red-by-example.org/#prin)        [MyCode4fun](http://www.mycode4fun.co.uk/red-beginners-reference-guide#TOC-Here-we-use:-print-prin-probe-space-)

prin also sends data to the console, but it does NOT send the newline character . It evaluates its argument before printing it.

Red \[]

prin "Hello"

prin "World"

prin 42

HelloWorld42

### function! probe [Red-by-example](http://www.red-by-example.org/#probe)    [MyCode4fun](http://www.mycode4fun.co.uk/red-beginners-reference-guide#TOC-Here-we-use:-print-prin-probe-space-)

probe prints its argument without evaluation and also returns it.  Remember that print evaluates its argument. probe prints and returns the argument "as it is", so to speak. It's able to show expressions that would cause print to give an error.  
It may be used for debugging as a way of showing code (by printing) without changing it.

&gt;&gt; print \[3 + 2]

5

&gt;&gt; probe \[3 + 2]

\[3 + 2]

== \[3 + 2]

&gt;&gt; print probe \[3 + 2]

\[3 + 2]

5

&gt;&gt; a: \[circle 5x4 10]

== \[circle 5x4 10]

&gt;&gt; print a

\*\** Script Error: circle has no value

\*\** Where: print

\*\** Stack:  

&gt;&gt; probe a

\[circle 5x4 10]

== \[circle 5x4 10]

Described also [here](http://helpin.red/Accessingandformattingdata.html), following mold.

### function! input [Red-by-example](http://www.red-by-example.org/index.html#input)    [MyCode4fun](http://www.mycode4fun.co.uk/red-beginners-reference-guide#TOC-Here-we-use:-print-prin-probe-space-)

Inputs a string from the console. Notice that any number typed on console are converted to a string.newline character is removed.

Red \[]

prin "Enter a name: "

name: input

print \[name "is" length? name "characters long"]

John

John is 4 characters long

### routine! ask  [Red-by-example](http://www.red-by-example.org/index.html#ask)    [MyCode4fun](http://www.mycode4fun.co.uk/red-beginners-reference-guide#TOC-Here-we-use:-ask-)

Same as input, but displays a string.

Red \[]

name: ask "What is your name: "

prin "Your name is "

print name

What is your name: John

Your name is John

[&lt; Previous topic](http://helpin.red/SomepitfallsofRedlearning.html)                                                                                          [Next topic &gt;](http://helpin.red/Runningcode.html)
