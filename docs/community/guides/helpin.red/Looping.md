Original URL: <http://helpin.red/Looping.html>

# Looping

* * *

* * *

native! loop  [Red-by-example](http://www.red-by-example.org/#loop)    [MyCode4fun](http://www.mycode4fun.co.uk/red-beginners-reference-guide#TOC-Here-we-use:-loop-)

Executes a block a given number of times.

Red\[]

loop 3 \[print "hello!"]

hello!  
hello!  
hello!  
&gt;&gt;

native! repeat  [Red-by-example](http://www.red-by-example.org/#repeat)  

repeat is the same as loop, but it has an index that gets incremented each loop

Red\[]

repeat i 3 \[print i]

1  
2  
3  
&gt;&gt;

native! forall  [Red-by-example](http://www.red-by-example.org/#forall)    [MyCode4fun](http://www.mycode4fun.co.uk/red-beginners-reference-guide#TOC-Here-we-use:-forall-to-read-a-block.)

Executes a block as it moves forward in a series.

Red\[]

a: \["china" "japan" "korea" "usa"]

forall a \[print a]

china japan korea usa  
japan korea usa  
korea usa  
usa  
&gt;&gt;

native! foreach  [Red-by-example](http://www.red-by-example.org/#foreach)    [MyCode4fun](http://www.mycode4fun.co.uk/red-beginners-reference-guide#TOC-Here-we-use:-foreach-to-read-a-block.)

Executes a block for each element of the series.

Red\[]

a: \["china" "japan" "korea" "usa"]

foreach i a \[print i]

china  
japan  
korea  
usa  
&gt;&gt;

native! while  [Red-by-example](http://www.red-by-example.org/#while)    [MyCode4fun](http://www.mycode4fun.co.uk/red-beginners-reference-guide#TOC-Here-we-use:-while-)

Executes a block while a condition is true.

Red\[]

i: 1

while \[i &lt; 5] [

print i

       i: i + 1

]

1  
2  
3  
4  
&gt;&gt;

native! until  [Red-by-example](http://www.red-by-example.org/#until)    [MyCode4fun](http://www.mycode4fun.co.uk/red-beginners-reference-guide#TOC-Here-we-use:-until-)

Evaluates a block until the block returns a true value.

Red\[]

i: 4

until [

       print i

       i: i - 1

       i &lt; 0        ;  &lt;= condition

]

4  
3  
2  
1  
0  
&gt;&gt;

native! break  [Red-by-example](http://www.red-by-example.org/#break)    [MyCode4fun](http://www.mycode4fun.co.uk/red-beginners-reference-guide#TOC-Here-we-use:-break-)

Forces an exit from the loop.

##### /return

Forces the exit and sends a given value, like a code or a message, as a return value.

native! forever  [Red-by-example](http://www.red-by-example.org/#forever)    [MyCode4fun](http://www.mycode4fun.co.uk/red-beginners-reference-guide#TOC-Here-we-use:-forever-unview-quit-if-and-print-)

Creates a loop that never ends.

[&lt; Previous topic](http://helpin.red/Copying.html)                                                                                          [Next topic &gt;](http://helpin.red/Branching.html)
