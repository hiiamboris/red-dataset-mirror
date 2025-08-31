Original URL: <http://helpin.red/BlocksSeries.html>

# Blocks &amp; Series

* * *

* * *

##### Don't miss the series' page at [Red-by-example.](http://www.red-by-example.org/series.html)

##### Blocks

Red is built on "blocks". Essencially anything delimited by brackets is a block: \[one block], \[another block \[block within a block]]

##### Series

Series are group of elements. They are an essential topic on Red Programming. In fact, data and even Red programs themselves are series. The elements of a series can be anything inside the Red lexicon: data, words, functions, objects, and other series.

&gt;&gt; myFirstSeries: \["John" "Mary" 33 55 \[9.2 8]]  
\== \["John" "Mary" 33 55 \[9.2 8]]

##### Strings etc.

Notice that strings are treated by Red as series of characters, and so the techniques used to manipulate series are also used for string operations. However, since string manipulation is so important, there is a special [Strings and text manipulation](http://helpin.red/Stringandtextmanipulation.html) chapter.

Actually, a lot of datatypes are also series that can be manipulated with the built-in functions (commands) described in the following chapters.

##### Arrays

##### [Toomas Vooglaid's matrix DLS](https://github.com/toomasv/matrix)

Other languages have a data type called array. It is not difficult to realize that a one dimensional array is simply a series ([not really, see comment)](https://gitter.im/red/help?at=5c361b8057c6883f9b8a21f8), and multi-dimensional arrays are series that contain other series as elements.

Here is an example of a 3 x 2 array:

&gt;&gt; a: \[\[1 2]\[3 4]\[5 6]]  
\== \[\[1 2] \[3 4] \[5 6]]

To access its elements, you may use "/":

&gt;&gt; a/1  
\== \[1 2]

&gt;&gt; a/1/1  
\== 1

&gt;&gt; a/3/2  
\== 6

The following script creates a 5 by 5 two dimensional array, inserts a number in it and prints some results:

Red \[needs: 'view]

size: 5x5

matrix: make block! size/x

loop size/x [

   row: make block! size/y

   loop size/y \[append row none]

   append/only matrix row

]

new-line/all matrix on ;just for pretty printing...

                      ; adds new lines after each row block

matrix/3/4: 23

probe matrix

print matrix/3/4

[

   \[none none none none none]

   \[none none none none none]

   \[none none none 23 none]

   \[none none none none none]

   \[none none none none none]

]

23

&gt;&gt;

[]()Using variable as keys for series:

Suppose you want to refer to the 4th element of a series using a value associated with a word. You can't use the word directly, you must use the :word syntax:

&gt;&gt; a: \["me" "you" "us" "them" "nobody"]

== \["me" "you" "us" "them" "nobody"]

&gt;&gt; b: 4

== 4

&gt;&gt; a/b         ;this does not work as expected!!!

== none

&gt;&gt; a/:b        ;this works!

== "them"

It seems words are not evaluated by default to allow their use as keys.

By the way, this also works:

&gt;&gt; a/(b)           ;this also works!

== "them"

[&lt; Previous topic](http://helpin.red/Cryptography.html)                                                                                          [Next topic &gt;](http://helpin.red/Seriesnavigation.html)
