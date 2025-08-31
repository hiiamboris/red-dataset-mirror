Original URL: <http://helpin.red/Seriesgetters.html>

# Series "getters"

* * *

* * *

There are so many commands to manipulate series that I have split them into two chapters: one for the built-in functions (commands) that get information from a series, that I call "getters", and another for those that change the series directly.

The "getter" commands only return values, without altering the series. Notice that any "getter" command may be used to change the series if you reassign the series to the returned value.

### action! length? [Red-by-example](http://www.red-by-example.org/#lengthxqm)    [MyCode4fun](http://www.mycode4fun.co.uk/red-beginners-reference-guide#TOC-Here-we-use:-length-returns-the-number-of-values-in-the-series.)

Returns the size of a series from the current index to the end.

&gt;&gt; a: \[1 3 5 7 9 11 13 15 17]  
\== \[1 3 5 7 9 11 13 15 17]

&gt;&gt; length? a  
\== 9

&gt;&gt; length? find a 13                ;see the command "find"  
\== 3                                ;from "13" to the tail there are 3 elements

### function! empty? [Red-by-example](http://www.red-by-example.org/#emptyxqm)    [MyCode4fun](http://www.mycode4fun.co.uk/red-beginners-reference-guide#TOC-Here-we-use:-empty-check-if-series-is-empty.)

Returns true if a series is empty, otherwise returns false.

&gt;&gt; a: \[3 4 5]  
\== \[3 4 5]

&gt;&gt; empty? a  
\== false

&gt;&gt; b:\[]  
\== \[]

&gt;&gt; empty? b  
\== true

### action! pick [Red-by-example](http://www.red-by-example.org/#pick)    [MyCode4fun](http://www.mycode4fun.co.uk/red-beginners-reference-guide#TOC-Here-we-use:-text-list-pick-)

Picks the value from a series at the position given by the second argument.

![](http://helpin.red/lib/pick.png)

&gt;&gt; pick \["cat" "dog" "mouse" "fly"] 2  
\== "dog"

&gt;&gt; pick "delicious" 4  
\== #"i"

### action! at [Red-by-example](http://www.red-by-example.org/#at)    [MyCode4fun](http://www.mycode4fun.co.uk/red-beginners-reference-guide#TOC-Here-we-use:-below-text-font-size-font-color-at-and-bold-)

Returns the series at a given index.

&gt;&gt; at \["cat" "dog" "fox" "cow" "fly" "ant" "bee" ] 4  
\== \["cow" "fly" "ant" "bee"]

### action! select and action! find   [Red-by-example on select](http://www.red-by-example.org/#select)  [Red-by-example on find](http://www.red-by-example.org/#find)   [MyCode4fun on select](http://www.mycode4fun.co.uk/red-beginners-reference-guide#TOC-Here-we-use:-select-Find-a-value-in-a-series-and-return-the-next-value-or-NONE.-)   [MyCode4fun on find](http://www.mycode4fun.co.uk/red-beginners-reference-guide#TOC-Here-we-use:-alter-find-)

Both search a series for a given value. The search goes from left to right, except if /reverse or /last is used.

When they find a match:

- select returns the next element from the series after the match;

&gt;&gt; select \["cat" "dog" "fox" "cow" "fly" "ant" "bee" ] \["cow"]  
\== "fly"

- find returns a series that starts in the match and goes all the way to tail.

&gt;&gt; find \["cat" "dog" "fox" "cow" "fly" "ant" "bee" ] \["cow"]  
\== \["cow" "fly" "ant" "bee"]

##### An example of select:

&gt;&gt; movies: [  
   title "Gone with the wind"  
   star "Scarlet Something"  
   quality "pretty good"  
   age "very old"  
   ]  
&gt;&gt; print select movies 'quality  
pretty good

##### Is interesting to note that a "shortcut" for select is the path notation:

&gt;&gt; print movies/star  
Scarlet Something

##### /part

Limits the length of the area to be searched to a given number of elements. In the image below, the search area is highlighted:

&gt;&gt; select/part \["cat" "dog" "fox" "cow" "fly" "ant" "bee" ] \["cow"]  3  
\== none

&gt;&gt; select/part \["cat" "dog" "fox" "cow" "fly" "ant" "bee" ] \["fox"]  3  
\== "cow"

&gt;&gt; find/part \["cat" "dog" "fox" "cow" "fly" "ant" "bee" ] \["cow"]  3  
\== none

&gt;&gt; find/part \["cat" "dog" "fox" "cow" "fly" "ant" "bee" ] \["cow"]  4  
\== \["cow" "fly" "ant" "bee"]

##### /only

Treat a series search value as a block, so it looks for a block inside the search area.

&gt;&gt; find/only \["cat" "dog" "fox" "cow" "fly" "ant" "bee" ] \["cow" "fly"]        ;finds nothing  
\== none

&gt;&gt; find/only \["cat" "dog" "fox" \["cow" "fly"] "ant" "bee" ] \["cow" "fly"]        ;finds the block  
\== \[\["cow" "fly"] "ant" "bee"]

##### /case

To perform a case sentive search. Upper and lower case become relevant.

##### /skip

Treats the series as a set of records, where each record has a fixed size. Will only try to match against each first item of such a record.

I highlighted below the "records" in yellow and the match in red:

&gt;&gt; find/skip \["cat" "dog"  "fox" "dog"  "dog" "dog" "cow" "dog"  "fly" "dog"  "ant" "dog"  "bee" "dog"] \["dog"]  2  
\== \["dog" "dog" "cow" "dog" "fly" "dog" "ant" "dog" "bee" "dog"]

/same

Uses same? as comparator. This comparator returns true if the two objects have the same identity:

&gt;&gt; a: "dog" b: "dog"

== "dog"

&gt;&gt; same? a b

== false                ;each is associated with a string with "dog", but not the same string.

&gt;&gt; b: a

== "dog"

&gt;&gt; same? a b        ;both refer to the very same string

== true

##### /last

Finds the last occurrence of the key, from the tail

&gt;&gt; find/last \[33 11 22 44 11 12] 11  
\== \[11 12]

##### /reverse

The same as /last , but from the current index that can be set, for example by the built-in function  at .

##### find/tail

Normally find returns the result including the matched item. With /tail the returned is the part AFTER the match, similarly to select

&gt;&gt; find \["cat" "dog" "fox" "cow" "fly" "ant" "bee" ] "fly"  
\== \["fly" "ant" "bee"]

&gt;&gt; find/tail \["cat" "dog" "fox" "cow" "fly" "ant" "bee" ] "fly"  
\== \["ant" "bee"]

##### find/match

Match always compares the key to the beginning of the series. Also, the result is the part AFTER the match.

&gt;&gt; find/match \["cat" "dog" "fox" "cow" "fly" "ant" "bee"] "fly"  
\== none                ;no match

&gt;&gt; find/match \["cat" "dog" "fox" "cow" "fly" "ant" "bee"] "cat"  
\== \["dog" "fox" "cow" "fly" "ant" "bee"]                        ;match

### function! last  [Red-by-example](http://www.red-by-example.org/#last)    [MyCode4fun](http://www.mycode4fun.co.uk/red-beginners-reference-guide#TOC-Here-we-use:-last-returns-the-last-value-in-the-series.)

Returns the last value of the series.

&gt;&gt; last \["cat" "dog" "fox" "cow" "fly" "ant" "bee"]  
\== "bee"

### function! extract [Red-by-example](http://www.red-by-example.org/#extract)    [MyCode4fun](http://www.mycode4fun.co.uk/red-beginners-reference-guide#TOC-Here-we-use:-extract-extract-index-)

Extracts values from a series at given intervals, returning a new series.

&gt;&gt; extract \[1 2 3 4 5 6 7 8 9] 3  
\== \[1 4 7]

&gt;&gt; extract "abcdefghij" 2  
\== "acegi"

##### /index

Extracts values starting from a given position.

##### /into

Append the extracted values to a given series.

&gt;&gt; newseries: \[] ;creates empty series - necessary as extract/into does not initialize a series  
\== \[]

&gt;&gt; extract/into "abcdefghij" 2 newseries  
\== \[#"a" #"c" #"e" #"g" #"i"]

&gt;&gt; extract/into \["cat" "dog" "fox" "cow" "fly" "ant" "bee" "owl"] 2 newseries  
\== \[#"a" #"c" #"e" #"g" #"i" "cat" "fox" "fly" "bee"]

### action! copy [Red-by-example](http://www.red-by-example.org/#copy)    [MyCode4fun](http://www.mycode4fun.co.uk/red-beginners-reference-guide#TOC-Here-we-use:-text-list-copy-data-)

See [Copying](http://helpin.red/Copying.html) chapter.

## Sets

### native! union [Red-by-example](http://www.red-by-example.org/#union)    [MyCode4fun](http://www.mycode4fun.co.uk/red-beginners-reference-guide#TOC-Here-we-use:-Union-returns-the-union-of-2-data-sets.)

Returns the result of joining two series. Duplicate entries are only included once.

&gt;&gt; union \[3 4 5 6] \[5 6 7 8]  
\== \[3 4 5 6 7 8]

/case

Use case-sensitive comparison

/skip

Treat the series as fixed size records.

&gt;&gt; union/case \[A a b c] \[b c C]  
\== \[A a b c C]

With the /skip refinement, only the first element of each group (size given by argument) is compared. If there are duplicate entries, the record of the first series is kept:

&gt;&gt; union/skip \[a b c c d e e f f] \[a j k c y m e z z] 3  
\== \[a b c c d e e f f]

&gt;&gt; union/skip \[k b c c d e e f f] \[a j k c y m e z z] 3  
\== \[k b c c d e e f f a j k]

### native! difference  [Red-by-example](http://www.red-by-example.org/#difference)

Returns only the elements that are not present in both series.

&gt;&gt; difference \[3 4 5 6] \[5 6 7 8]  
\== \[3 4 7 8]

/case

Use case-sensitive comparison

/skip

Treat the series as fixed size records.

### native! intersect  [Red-by-example](http://www.red-by-example.org/#intersect)

Returns only the elements that are present in both series:

&gt;&gt; intersect \[3 4 5 6] \[5 6 7 8]  
\== \[5 6]

/case

Use case-sensitive comparison

/skip

Treat the series as fixed size records.

### native! unique [Red-by-example](http://www.red-by-example.org/#unique)    [MyCode4fun](http://www.mycode4fun.co.uk/red-beginners-reference-guide#TOC-Here-we-use:-unique-removes-all-duplicates.)

Returns the series removing all duplicates:

&gt;&gt; unique \[1 2 2 3 4 4 1 7 7]  
\== \[1 2 3 4 7]

Allows the refinements:

/skip

Treat the series as fixed size records.

### native! exclude [Red-by-example](http://www.red-by-example.org/#exclude)

Returns a series where the second argument elements are removed from the first argument series.

&gt;&gt; a: \[1 2 3 4 5 6 7 8]  
\== \[1 2 3 4 5 6 7 8]

&gt;&gt; exclude a \[2 5 8]  
\== \[1 3 4 6 7]

&gt;&gt; a  
\== \[1 2 3 4 5 6 7 8]

I could not find it in documentation, but I think the returned series is a list of non-repeated elements:

&gt;&gt; exclude "my house is a very funny house" "aeiou"  
\== "my hsvrfn"

&gt;&gt; exclude \[1 1 2 2 3 3 4 4 5 5 6 6] \[2 4]  
\== \[1 3 5 6]

/case

Use case-sensitive comparison

/skip

Treat the series as fixed size records.

[&lt; Previous topic](http://helpin.red/Seriesnavigation.html)                                                                                          [Next topic &gt;](http://helpin.red/Serieschangers.html)
