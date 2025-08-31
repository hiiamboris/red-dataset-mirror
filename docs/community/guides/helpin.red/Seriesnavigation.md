Original URL: <http://helpin.red/Seriesnavigation.html>

# Series navigation

* * *

* * *

- The first element of a series is called "head". As we will see, it may not be the "first" as we manipulate the series;
- AFTER the last element of a series there is something called "tail". It has no value.
- Every series has an "entry index". The best definition of it is "where the usable part of this series begin". Many operations with series have this "entry index" as a starting point. You can move the entry index back and forth to change the result of your operations.
- Every element of the series have an index number, starting with 1 (not zero!) at the first element.
- Starting from the position of the entry index, the elements of the series have an alias: "first" for the first, "second" for the second and so on until "fifth".

Note: I made up the name "entry index". It is not in the documentation. I have seen the "entry index" being called just "index", but I dislike that, as it may cause confusion with the index number of the elements. It is a somewhat subtle concept. Novvorto @novvorto\_twitter suggest it should be called "first index" since this index always points to the element returned by first command, noting that head index will always be 1. This makes sense, and I may change it in the future.

### action! head? action! tail? action! index?  [Red-by-example](http://www.red-by-example.org/index.html#cat-s01)

These built-in functions return information about the position of the entry index. If the entry index is at the head, head? returns true, otherwise false. The same logic applies to tail?. index? returns the index number of the entry index location.

The following examples will make their use clear.

Lets create the series s having the strings "cat" "dog" "fox" "cow" "fly" "ant" "bee" :

&gt;&gt; s: \[ "cat" "dog" "fox" "cow" "fly" "ant" "bee" ]  
\== \["cat" "dog" "fox" "cow" "fly" "ant" "bee"]

We will have something that look like this:

![](http://helpin.red/lib/series1b.png)

&gt;&gt; head? s  
\== true

&gt;&gt; index? s  
\== 1

&gt;&gt; print first s  
cat

### action! head  action! tail  [Red-by-example on head](http://www.red-by-example.org/index.html#head)   [Red-by-example on tail](http://www.red-by-example.org/index.html#tail)

head moves the entry index to the first element of the series, the head.

tail moves the entry index to position after the last element of the series, the tail.

head and tail by themselves don't change the series, head only returns the whole series and tail returns nothing. To change the series you must do an assignment, e.g. list: head list

### action! next  [Red-by-example](http://www.red-by-example.org/index.html#next)

next moves the entry index one element towards the tail. Notice that next only returns the changed series, does not modify it. Therfore, simply repeating next on the same series will not make the entry index go further than the second position, because you would be doing it on the original series, where the entry index is still over the first element. So for most practical uses, we reassign the series to a word (variable). In our example it would be: s: next s.

&gt;&gt; s: next s  
\== \["dog" "fox" "cow" "fly" "ant" "bee"]

Now we have:

![](http://helpin.red/lib/series2b.png)

&gt;&gt; print s  
dog fox cow fly ant bee

&gt;&gt; head? s  
\== false

&gt;&gt; print first s  
dog

&gt;&gt; index? s  
\== 2

Notice that even though the first element is now "dog", the index remains 2!

### action! back  [Red-by-example](http://www.red-by-example.org/index.html#back)

back is the opposite of next: moves the entry index one element towards the head. If you use back in our s series "cat" is brought back from oblivion into the series again! It was never deleted!

This means that Red did not discard any part of the old s. This is part of the peculiarities of Red: the data remains there, embedded in the code.

After you moved forward the index of our series s, even if you assign it to another word (variable) like b(b: s) you can still perform back and negative skip operations on b and retrieve the "hidden" values of s because b points to the same data as s.

If you want to avoid that, you must create your new variable using copy

Like I mentioned before, in Red, unlike other languages, the variable (word) is assigned to the data and not the other way around.

### action! skip [Red-by-example](http://www.red-by-example.org/#skip)    [MyCode4fun](http://www.mycode4fun.co.uk/red-beginners-reference-guide#TOC-Here-we-use:-skip-)

Moves the entry index a given number of elements towards the tail.

![](http://helpin.red/lib/series3b.png)

&gt;&gt; s: skip s 3  
\== \["fly" "ant" "bee"]

&gt;&gt; print s  
fly ant bee

&gt;&gt; print first s  
fly

&gt;&gt; print index? s  
5

If the number of skips is larger then the number of elements in the series, the entry index stays at the tail.

&gt;&gt; s: skip s 100  
\== \[]

![](http://helpin.red/lib/series4b.png)

&gt;&gt; tail? s  
\== true

&gt;&gt; index? s  
\== 8

You can do negative skips to restore elements of the series:

&gt;&gt; s: skip s -4  
\== \["cow" "fly" "ant" "bee"]

![](http://helpin.red/lib/series5b.png)

&gt;&gt; print first s  
cow

&gt;&gt; print index? s  
4

[&lt; Previous topic](http://helpin.red/BlocksSeries.html)                                                                                          [Next topic &gt;](http://helpin.red/Seriesgetters.html)
