Original URL: <http://helpin.red/Serieschangers.html>

# Series "changers"

* * *

* * *

These commands change the original series:

### action! clear [Red-by-example](http://www.red-by-example.org/#clear)    [MyCode4fun](http://www.mycode4fun.co.uk/red-beginners-reference-guide#TOC-Here-we-use:-clear-to-clear-contents-of-a-string-series.)

Deletes all elements from the series.

Simply assigning " " (empty string) or zero to a series may not produce the expected results. Red's logic makes it seem to "remember" things in unexpected ways. To really clear it, use clear.

&gt;&gt; a: \[11 22 33 "cat"]  
\== \[11 22 33 "cat"]

&gt;&gt; clear a  
\== \[]

&gt;&gt; a  
\== \[]

### action! poke [Red-by-example](http://www.red-by-example.org/#poke)    [MyCode4fun](http://www.mycode4fun.co.uk/red-beginners-reference-guide#TOC-Here-we-use:-pick-poke-)

Changes the value of a serie's element at the position given by the second argument to the value of the third argument.

![](http://helpin.red/lib/poke.png)

&gt;&gt; x: \["cat" "dog" "mouse" "fly"]  
\== \["cat" "dog" "mouse" "fly"]

&gt;&gt; poke x 3 "BULL"  
\== "BULL"

&gt;&gt; x  
\== \["cat" "dog" "BULL" "fly"]

&gt;&gt; s: "abcdefghijklmn"  
\== "abcdefghijklmn"

&gt;&gt; poke s 4 #"W"  
\== #"W"

&gt;&gt; s  
\== "abcWefghijklmn"

### action! append   [Red-by-example](http://www.red-by-example.org/#append)    [MyCode4fun](http://www.mycode4fun.co.uk/red-beginners-reference-guide#TOC-Here-we-use:-now-time-append-and-form-)

Inserts the values of the second argument at the end of a series. Changes only the original first series.

![](http://helpin.red/lib/append.png)

&gt;&gt; x: \["cat" "dog" "mouse" "fly"]  
\== \["cat" "dog" "mouse" "fly"]

&gt;&gt; append x "HOUSE"  
\== \["cat" "dog" "mouse" "fly" "HOUSE"]

&gt;&gt; x  
\== \["cat" "dog" "mouse" "fly" "HOUSE"]

&gt;&gt; x: \["cat" "dog" "mouse" "fly"]  
\== \["cat" "dog" "mouse" "fly"]

&gt;&gt; y: \["Sky" "Bull"]  
\== \["Sky" "Bull"]

&gt;&gt; append x y  
\== \["cat" "dog" "mouse" "fly" "Sky" "Bull"]

&gt;&gt; x  
\== \["cat" "dog" "mouse" "fly" "Sky" "Bull"]

&gt;&gt; append "abcd" "EFGH"  
\== "abcdEFGH"

#### /part

Limits the number of elements appended to the series.

&gt;&gt; append/part \["a" "b" "c"] \["A" "B" "C" "D" "E"]  2  
\== \["a" "b" "c" "A" "B"]

#### /only

Appends series A with series B, but B goes in as a series (block).

&gt;&gt; append/only \["a" "b" "c"] \["A" "B"]  
\== \["a" "b" "c" \["A" "B"]]

#### /dup

Appends series A with series B a given number of times. I think it should not be called dup from "duplicate" as it can triplicate, quadrupicate...

&gt;&gt; append/dup \["a" "b" "c"] \["A" "B"] 3  
\== \["a" "b" "c" "A" "B" "A" "B" "A" "B"]

### action! insert   [Red-by-example](http://www.red-by-example.org/#insert)    [MyCode4fun](http://www.mycode4fun.co.uk/red-beginners-reference-guide#TOC-Here-we-use:-insert-inserts-a-value-at-a-series-index.)

It is like append, but the addition is done at the current entry index (usually the beginning).  While append returns the series from head, insert returns it after the insertion. This allows to chain multiple insert operations, or help calculate the length of the inserted part, but a: insert a something will not change "a"!

![](http://helpin.red/lib/insert.png)

&gt;&gt; a: "abcdefgh"  
\== "abcdefgh"

&gt;&gt; insert a "OOO"  
\== "abcdefgh"

&gt;&gt; a  
\== "OOOabcdefgh"

![](http://helpin.red/lib/insert2.png)

&gt;&gt; a: "abcdefgh"  
\== "abcdefgh"

&gt;&gt; insert at a 3 "OOO"  
\== "cdefgh"

&gt;&gt; a  
\== "abOOOcdefgh"

#### /part

Inserts only a given number of elements from the second argument.

#### /only

Allows insertion of blocks as blocks, not their elements.

#### /dup

Allows the insertion to be repeated a given number of times.

&gt;&gt; a: "abcdefg"  
\== "abcdefg"

&gt;&gt; insert/dup a "XYZ" 3  
\== "abcdefg"

&gt;&gt; a  
\== "XYZXYZXYZabcdefg"

function! replace   [Red-by-example](http://www.red-by-example.org/#replace)    [MyCode4fun](http://www.mycode4fun.co.uk/red-beginners-reference-guide#TOC-Here-we-use:-replace-replaces-the-search-value-with-the-replace-value-)

Replaces an element of the series.

![](http://helpin.red/lib/replace.png)

&gt;&gt; replace \["cat" "dog" "mouse" "fly" "Sky" "Bull"] "mouse" "HORSE"  
\== \["cat" "dog" "HORSE" "fly" "Sky" "Bull"]

##### /all

Replaces all ocurrences.

&gt;&gt; a: "my nono house nono is nono nice"  
\== "my nono house nono is nono nice"

&gt;&gt; replace/all a "nono " ""  
\== "my house is nice"

action! sort   [Red-by-example](http://www.red-by-example.org/#sort)    [MyCode4fun](http://www.mycode4fun.co.uk/red-beginners-reference-guide#TOC-Here-we-use:-sort-sort-reverse-)

Sorts a series.

![](http://helpin.red/lib/changerssort.png)

&gt;&gt; sort \[8 4 3 9 0 1 5 2 7 6]  
\== \[0 1 2 3 4 5 6 7 8 9]

&gt;&gt; sort "sorting strings is useless"  
\== " eeggiiilnnorrsssssssttu"

### /case

### Perform a case-sensitive sort.

### /skip

### Treat the series as fixed size records.

### /compare

### Comparator offset, block or function. (?)

### /part

### Sort only part of a series.

### /all

### Compare all fields. (?)

### /reverse

### Reverse sort order.

### /stable

### Stable sorting. (?)

action! remove   [Red-by-example](http://www.red-by-example.org/#remove)    [MyCode4fun](http://www.mycode4fun.co.uk/red-beginners-reference-guide#TOC-Here-we-use:-remove-remove-part-reverse-)

Removes the first value of the series.

![](http://helpin.red/lib/remove1.png)

&gt;&gt; s: \["cat" "dog" "fox" "cow" "fly" "ant" "bee"]  
\== \["cat" "dog" "fox" "cow" "fly" "ant" "bee"]

&gt;&gt; remove s  
\== \["dog" "fox" "cow" "fly" "ant" "bee"]

#### /part

Removes a given number of elements.

![](http://helpin.red/lib/removepart.png)

&gt;&gt; s: "abcdefghij"  
\== "abcdefghij"

&gt;&gt; remove/part s 4  
\== "efghij"

Notice that you can do the same with remove at \[0 1 2 3 4 5] 2 .

### native! remove-each   [Red-by-example](http://www.red-by-example.org/#remove-each)

### Like foreach, it sequentially executes a block for each element of a series. If the block returns true, it removes the element from the series:

Red \[]

a: \["dog" 23 3.5 "house" 45]

remove-each i a \[string? i] ;removes all strings

print a

23 3.5 45

Red \[]

a: "   my house in the middle of our street"

remove-each i a \[i = #" "] ;removes all spaces

print a

myhouseinthemiddleofourstreet

action! take   [Red-by-example](http://www.red-by-example.org/#take)    [MyCode4fun](http://www.mycode4fun.co.uk/red-beginners-reference-guide#TOC-Here-we-use:-take-take-last-take-part-)

Removes the FIRST element of a series and gives this first element as return.

&gt;&gt; s: \["cat" "dog" "fox" "cow" "fly" "ant" "bee"]  
\== \["cat" "dog" "fox" "cow" "fly" "ant" "bee"]

&gt;&gt; take s  
\== "cat"

&gt;&gt; s  
\== \["dog" "fox" "cow" "fly" "ant" "bee"]

##### /last

Removes the LAST element of a series and gives this last element as return.

&gt;&gt; s: \["cat" "dog" "fox" "cow" "fly" "ant" "bee"]  
\== \["cat" "dog" "fox" "cow" "fly" "ant" "bee"]

&gt;&gt; take/last s  
\== "bee"

&gt;&gt; s  
\== \["cat" "dog" "fox" "cow" "fly" "ant"]

 take/last and append can be used to perform stack (queue) operations.

##### /part

Removes a given number of elements from the start of the series and gives them as return.

&gt;&gt; s: \["cat" "dog" "fox" "cow" "fly" "ant" "bee"]  
\== \["cat" "dog" "fox" "cow" "fly" "ant" "bee"]

&gt;&gt; take/part s 3  
\== \["cat" "dog" "fox"]

&gt;&gt; s  
\== \["cow" "fly" "ant" "bee"]

### /deep

### Documentation says "Copy nested values". I could not figure it out.

action! move   [Red-by-example](http://www.red-by-example.org/#move)    [MyCode4fun](http://www.mycode4fun.co.uk/red-beginners-reference-guide#TOC-Here-we-use:-move-move-part-Moves-elements-to-another-position-or-series.)

Moves one or more elements from the first argument into the second argument. Changes both original arguments.

![](http://helpin.red/lib/move1.png)

/part

To move more than one element.

![](http://helpin.red/lib/move2.png)

&gt;&gt; a: \[a b c d]  
\== \[a b c d]

&gt;&gt; b: \[1 2 3 4]  
\== \[1 2 3 4]

&gt;&gt; move a b  
\== \[b c d]

&gt;&gt; a  
\== \[b c d]

&gt;&gt; b  
\== \[a 1 2 3 4]

&gt;&gt; move/part a b 2  
\== \[d]

&gt;&gt; a  
\== \[d]

&gt;&gt; b  
\== \[b c a 1 2 3 4]

move can be used combined with other built-in functions (commands) to move things inside a single series. For example:

&gt;&gt; a: \[1 2 3 4 5]  
\== \[1 2 3 4 5]

&gt;&gt; move a tail a  
\== \[2 3 4 5 1]

&gt;&gt; move/part a tail a 3  
\== \[5 1 2 3 4]

action! change   [Red-by-example](http://www.red-by-example.org/#change)    [MyCode4fun](http://www.mycode4fun.co.uk/red-beginners-reference-guide#TOC-Here-we-use:-change---changes-a-value-in-a-string-or-block.)

Changes the first elements of a series and returns the series after the change. Modifies the first original series, not the second.

![](http://helpin.red/lib/change.png)

&gt;&gt; a: \[1 2 3 4 5]  
\== \[1 2 3 4 5]

&gt;&gt; change a \[a b]  
\== \[3 4 5]

&gt;&gt; a  
\== \[a b 3 4 5]

/part

Limits the amount to change to a given length.

/only

Changes a series as a series.

/dup  
Repeats the change a specified number of times

function! alter   [Red-by-example](http://www.red-by-example.org/#alter)    [MyCode4fun](http://www.mycode4fun.co.uk/red-beginners-reference-guide#TOC-Here-we-use:-alter-find-)

Either appends or removes an element from a series. If alter does NOT find the element in a series, it appends it and returns true. If it finds the element, removes it and returns false.

&gt;&gt; a: \["cat" "dog" "fly" "bat" "owl"]  
\== \["cat" "dog" "fly" "bat" "owl"]

&gt;&gt; alter a "dog"  
\== false

&gt;&gt; a  
\== \["cat" "fly" "bat" "owl"]

&gt;&gt; alter a "HOUSE"  
\== true

&gt;&gt; a  
\== \["cat" "fly" "bat" "owl" "HOUSE"]

action! swap   [Red-by-example](http://www.red-by-example.org/#swap)  

Swaps the first elements of two series. Returns the first series, but changes both:

![](http://helpin.red/lib/swap.png)

&gt;&gt; a: \[1 2 3 4]   b: \[a b c d]

&gt;&gt; swap a b  
\== \[a 2 3 4]

&gt;&gt; a  
\== \[a 2 3 4]

&gt;&gt; b  
\== \[1 b c d]

With find , for example, it can be used to swap any element of two series and even elements within a single series:

&gt;&gt; a: \[1 2 3 4 5] b: \["dog" "bat" "owl" "rat"]  
\== \["dog" "bat" "owl" "rat"]

&gt;&gt; swap find a 3 find b "owl"  
\== \["owl" 4 5]

&gt;&gt; a  
\== \[1 2 "owl" 4 5]

&gt;&gt; b  
\== \["dog" "bat" 3 "rat"]

action! reverse   [Red-by-example](http://www.red-by-example.org/#reverse)    [MyCode4fun](http://www.mycode4fun.co.uk/red-beginners-reference-guide#TOC-Here-we-use:-remove-remove-part-reverse-)

Reverses the order of the elements of a series:

&gt;&gt; reverse \[1 2 3]  
\== \[3 2 1]

&gt;&gt; reverse "abcde"  
\== "edcba"

/part   limits the reverse to the number of elements of the argument:

&gt;&gt; reverse/part "abcdefghi" 4  
\== "dcbaefghi"

[&lt; Previous topic](http://helpin.red/Seriesgetters.html)                                                                                          [Next topic &gt;](http://helpin.red/Copying.html)
