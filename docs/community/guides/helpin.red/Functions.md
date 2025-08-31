Original URL: <http://helpin.red/Functions.html>

# Functions

* * *

* * *

Functions must be declared before they are used and so must be written on top of your program. However, this is not required if a function is called from within another function.

native! func  [Red-by-example](http://www.red-by-example.org/#func)    [MyCode4fun](http://www.mycode4fun.co.uk/red-beginners-reference-guide#TOC-Here-we-use:-function-func-exit-)

Variables inside a function created with func are global. They are the seen by the entire program.

A function is created with func as follows:

&lt;function name&gt;: func \[&lt;argument1&gt; &lt;argument2&gt; ... &lt;argument n&gt;] \[ &lt;actions performed on arguments&gt;]

Red \[]

mysum: func \[a b] \[a + b]

print mysum 3 4

7

Demonstrating that variables are global:

Red \[]

mysum: func \[a b] [

       mynumber: a + b

       print mynumber

]

mynumber: 20

mysum 3 4

print mynumber

7

7

native! function  [Red-by-example](http://www.red-by-example.org/#function)    [MyCode4fun](http://www.mycode4fun.co.uk/red-beginners-reference-guide#TOC-Here-we-use:-function-func-exit-)

function makes its variables local, i.e. it hides (shades) the variables inside it from the rest of the program.

Same program as above, only using function instead of func:

Red \[]

mysum: function \[a b] [

       mynumber: a + b

       print mynumber

]

mynumber: 20

mysum 3 4

print mynumber

Different results:

7

20

#### Forcing variables to be global with /extern refinement:

Red \[]

myfunc: function \[/extern a b] [

       a: 22

       b: 33

]

a: 7

b: 9

myfunc

print a

print b

22

33

#### Defining the argument type:

You can force your arguments to be of a certain datatype:

Red \[]

mysum: function \[a \[integer!] b\[integer!]] \[print a + b]

print mysum 3.2 4        ; oops! 3.2 is a float!

\*\** Script Error: mysum does not allow float! for its a argument

\*\** Where: mysum

\*\** Stack: mysum

You may allow multiple datatypes:

Red \[]

mysum: function \[a \[integer! float!] b\[integer!]] \[print a + b]

print mysum 3.2 4

7.2

Or use an upper class of datatypes:

Red \[]

mysum: function \[a \[number!] b\[number!]] \[print a + b]

print mysum 3.2 4

7.2

#### Documenting your functions

#### A description of your function may be included by placing a string inside the argument block before the arguments. Also, you may also add explanations about your arguments as a string after the restriction block. These descriptions and explanations will show when you ask for help on your own function.

Red \[ ]        

sum: func [

       "Adds two integers, floats or pairs"

       a \[integer! float! pair!] "Fisrt number"

       b \[integer!] "Next Number - must be integer"

][

       a + b

]

print "This is my function's help:"

print ? sum

This is my function's help:

USAGE:

    SUM a b

DESCRIPTION:

    Adds two integers, floats or pairs.

    SUM is a function! value.

ARGUMENTS:

    a            \[integer! float! pair!] "Fisrt number."

    b            \[integer!] "Next Number - must be integer."

&gt;&gt; sum 5 8,4

\*\** Script Error: sum does not allow float! for its b argument

\*\** Where: sum

\*\** Stack: sum  

&gt;&gt; sum 2x3 4

== 6x7

#### Returning values from functions:  native! return  [Red-by-example](http://www.red-by-example.org/#return)    [MyCode4fun](http://www.mycode4fun.co.uk/red-beginners-reference-guide#TOC-Here-we-use:-return-)

The return value of a function is either the last value evaluated by the function or one explicitly determined by the word return:

Last evaluation example:

Red \[]

myfunc: function \[] [

       8 + 9

       3 + 3

       print "got here"        ; this executes

       10 + 5                ; this is returned

]

print myfunc

got here

15

return example:

Red \[]

myfunc: function \[] [

       8 + 9

       return 3 + 3                        ; this is returned

       print "never got here"        ; NOT executed

       10 + 5                                

]

print myfunc

6

#### Creating your own refinements:

You can create refinements to you functions, like the native refinements of Red: &lt;myfunction&gt;/&lt;myrefinement&gt;. The refinements are boolean values that are checked by the function:

Red \[]

myfunc: function \[a /up   b /down   c] [

       if up \[print a + b]

       if down \[print a - c]

]

myfunc/up 10 3

myfunc/down 10 3

13

7

Note that arguments are not mandatory for refinements.

A more complete example:

Red \[ ]        

sum: func [

       "Adds two integers, floats or pairs"

       a \[integer! float! pair!] "Fisrt number"

       b \[integer!] "Next Number - must be integer"

       /average "Average instead of add"

][

       either average \[a + b / 2] \[a + b]

]

print "This is my function help:"

print ? sum

print

print "Using add with 10 and 16:"

prin "sum = " print sum 10 16

prin "sum/average = " print sum/average 10 16

This is my function help:

USAGE:

    SUM a b

DESCRIPTION:

    Adds two integers, floats or pairs.

    SUM is a function! value.

ARGUMENTS:

    a            \[integer! float! pair!] "Fisrt number."

    b            \[integer!] "Next Number - must be integer."

REFINEMENTS:

    /average     =&gt; Average instead of add.

Using add with 10 and 16:

sum = 26

sum/average = 13

#### Assigning functions to words (variables)

To assign a function to a variable (a word) you must precede the function with a colon: &lt;word&gt;: :&lt;function&gt;

&gt;&gt; mysum: func \[a b] \[a + b]

== func \[a b]\[a + b]

&gt;&gt; a: :mysum

== func \[a b]\[a + b]

&gt;&gt; a 3 9

== 12

native! does  [Red-by-example](http://www.red-by-example.org/#does)    [MyCode4fun](http://www.mycode4fun.co.uk/red-beginners-reference-guide#TOC-Here-we-use:-does-defines-a-function-with-no-arguments-or-local-variables.)

If your function just do something with no arguments and no local variables, create it with the word does :

Red \[]

greeting: does [

       print "Hello"

       print "Stranger"

]

greeting

Hello

Stranger

native! has  [Red-by-example](http://www.red-by-example.org/#has)    [MyCode4fun](http://www.mycode4fun.co.uk/red-beginners-reference-guide#TOC-Here-we-use:-has-defines-a-function-with-local-variables-only.)

If your routine uses no external arguments but has local variables, use the word has. has turns the argument into a local variable. Compare the three programs below. The first uses has with no argument, hence "number"is a global variable. The second gives "number" as argument, making it local. And the third shows that a function with argument need that argument to be sent by the calling event.

  ![](http://helpin.red/lib/has1.png) ![](http://helpin.red/lib/NewItem210.png) ![](http://helpin.red/lib/has3.png)

native! exit  [Red-by-example](http://www.red-by-example.org/#exit)    [MyCode4fun](http://www.mycode4fun.co.uk/red-beginners-reference-guide#TOC-Here-we-use:-function-func-exit-)

Exits a function without returning any values.

[&lt; Previous topic](http://helpin.red/Readingfiles.html)                                                                                          [Next topic &gt;](http://helpin.red/Objects.html)
