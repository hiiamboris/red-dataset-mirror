Original URL: <http://helpin.red/Copying.html>

# Copying

* * *

* * *

 WARNING FOR BEGINNERS: If you are assigning the value of a word (variable) to another word (variable) in Red, COPY IT!

&gt;&gt; var1: var2                ;only if you are sure about it

&gt;&gt; var1: copy var2        ;may save you hours of debugging

action! copy [Red-by-example](http://www.red-by-example.org/#copy)    [MyCode4fun](http://www.mycode4fun.co.uk/red-beginners-reference-guide#TOC-Here-we-use:-text-list-copy-data-)

Assigns a copy of the data to a new word.

It may be used to copy series and [objects](http://helpin.red/Objects.html).

It is not used on single items such as: integer! float! char! etc. For these, we can simply use the colon.

First lets look at a simple assignment:

![](http://helpin.red/lib/copy1.png)

&gt;&gt; s: \[ "cat" "dog" "fox" "cow" "fly" "ant" "bee" ]  
\== \["cat" "dog" "fox" "cow" "fly" "ant" "bee"]

&gt;&gt; b: s  
\== \["cat" "dog" "fox" "cow" "fly" "ant" "bee"]

&gt;&gt; take/part s 4  
\== \["cat" "dog" "fox" "cow"]

&gt;&gt; b  
\== \["fly" "ant" "bee"]                ;b changes!!

Now with copy:

![](http://helpin.red/lib/copy2.png)

&gt;&gt; s: \[ "cat" "dog" "fox" "cow" "fly" "ant" "bee" ]  
\== \["cat" "dog" "fox" "cow" "fly" "ant" "bee"]

&gt;&gt; b: copy s  
\== \["cat" "dog" "fox" "cow" "fly" "ant" "bee"]

&gt;&gt; take/part s 4  
\== \["cat" "dog" "fox" "cow"]

&gt;&gt; b  
\== \["cat" "dog" "fox" "cow" "fly" "ant" "bee"]

If you have a nested series (e.g. a block within your series) copy does not change the reference to these nested series. If you want to create an independent copy in this case, you must use the refinement /deep to create a "deep" copy.

/part

Limits the length of the result, where length is a number! or series!

&gt;&gt; a: "my house is a very funny house"  
&gt;&gt; b: copy/part a 8  
\== "my house"

/types

Copies only specific types of non-scalar values.

/deep

Copies nested values, as mentioned above.

[&lt; Previous topic](http://helpin.red/Serieschangers.html)                                                                                          [Next topic &gt;](http://helpin.red/Looping.html)
