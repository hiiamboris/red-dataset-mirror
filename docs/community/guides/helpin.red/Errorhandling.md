Original URL: <http://helpin.red/Errorhandling.html>

# Error handling

* * *

* * *

### function!  attempt  [Red-by-example](http://www.red-by-example.org/#attempt)    [MyCode4fun](http://www.mycode4fun.co.uk/red-beginners-reference-guide#TOC-Here-we-use:-style-group-box-reduce-origin-attempt-)

Evaluates a block and returns the result or none if an error occur.

&gt;&gt; attempt \[a: 10 b: 9]        ;first lets try with no errors...  
\== 9

&gt;&gt; a  
\== 10                                ;... no problems here!

&gt;&gt; attempt \[a: 10 nosyntax]        ;nosyntax has no value: ERROR!  
\== none

&gt;&gt; attempt \[divide 100 0]  
\== none

### native! try  [Red-by-example](http://www.red-by-example.org/#try)    [MyCode4fun](http://www.mycode4fun.co.uk/red-beginners-reference-guide#TOC-Here-we-use:-if-error-and-try-we-force-an-error-by-dividing-by-zero.)

Tries to evaluate a block. Returns the value of the block, but if an error! occurs, the block is abandoned, and an  
error value is returned.  
To identify a block that generates an error without actually having the error output printed, we use the function error?.

You may ask why not use attempt instead of error? &amp; try. I think the answer is that the error? &amp; try combination returns true and false, instead of none or an evaluation. This is useful when used inside other structures.

&gt;&gt; error? \[nosyntax]  
\== false                        ;nosyntax has no value and it generates an error,  
                               ;but only if evaluated. In itself, is not a error! datatype.

&gt;&gt; try \[nosyntax]  
\*\** Script Error: nosyntax has no value  
\*\** Where: try  
\*\** Stack:                ; just "try" does not work, you get an error!!

&gt;&gt; error? try \[nosyntax]  
\== true                        ;OK!

&gt;&gt; error? try \[divide 100 0]  
\== true

### native! catch and native! throw  [Red-by-example](http://www.red-by-example.org/index.html#catch)

These are used to handle errors, but I could not figure how. Does not seem to be a beginner's issue.

[&lt; Previous topic](http://helpin.red/Timeandtiming.html)                                                                                          [Next topic &gt;](http://helpin.red/Files.html)
