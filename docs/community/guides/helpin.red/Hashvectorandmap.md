Original URL: <http://helpin.red/Hashvectorandmap.html>

# Hash!, vector! and map!

* * *

* * *

I think these are special datatypes that deserve a special chapter for them. They may improve the quality and speed of your work considerably.

Hash! and vector! are high performance series, i.e., they are faster when dealing with large sets.

I suggest you take a look at the [Blocks &amp; Series](http://helpin.red/BlocksSeries.html) chapters before studying this.

#### ♦ hash!  [Red-by-example](http://www.red-by-example.org/#hashxex)

hash! is a series that is "hashed" to make searches faster. Since "hashing" consumes resources, it is not worth creating  a hash!  for a series that will be searched just a few times. However, if your series will be constantly searched, consider making it a hash! . Rebol website claims searches may be 650 times faster than on a regular series.

&gt;&gt; a: make hash! \[a 33 b 44 c 52]  
\== make hash! \[a 33 b 44 c 52]

&gt;&gt; select a \[c]  
\== 52

&gt;&gt; select a 'c  
\== 52

&gt;&gt; a/b  
\== 44

#### Nothing new really, it's just a series.

#### ♦ vector!  [Red-by-example](http://www.red-by-example.org/#vectorxex)

Vectors are high performance series of integer! ,float!, char! or percent!

To create a vector you must use make vector!

#### While hash! allow you to perform searches faster,  vector! allows faster math operations as they can be performed on the entire series at once.

&gt;&gt; a: make vector! \[33 44 52]  
\== make vector! \[33 44 52]

&gt;&gt; print a  
33 44 52

&gt;&gt; print a * 8  
264 352 416

#### Notice that you could not do that on a regular series:

&gt;&gt; a: \[2 3 4 5]

== \[2 3 4 5]

&gt;&gt; print a * 2

\*\** Script Error: * does not allow block! for its value1 argument

\*\** Where: *

\*\** Stack:  

#### ♦ map! &amp;  action! put   [Red documentation](https://doc.red-lang.org/en/datatypes/map.html)  [Red-by-example](http://www.red-by-example.org/#mapxex)

Maps are high performance dictionaries that associate keys with values (key1: val1  key2: val2 ... key3: val3).

Maps are not series. You can't use most of series' built-in functions (commands) on them.

To set and retrieve values from the dictionary we use select (from series) and a a special action: put.

&gt;&gt; a: make map! \["mini" 33 "winny" 44 "mo" 55]  
\== #(  
       "mini" 33  
       "winny" 44  
       "mo" 55  
...

&gt;&gt; print a  
"mini" 33  
"winny" 44  
"mo" 55

&gt;&gt; print select a "winny"  
44

&gt;&gt; put a "winny" 99  
\== 99

&gt;&gt; print a  
"mini" 33  
"winny" 99  
"mo" 55

#### []()How to  native! extend a map!

Since map! is not a series and so you can't use things like append, poke or insert, how do you add new items to it? The answer is the built-in function extend.

&gt;&gt; a: make map! \["mini" 33 "winny" 44 "mo" 55]

== #(

   "mini" 33

   "winny" 44

   "mo" 55

)

&gt;&gt; extend a \["more" 23 "even more" 77]

  ...

&gt;&gt; probe a

#(

   "mini" 33

   "winny" 44

   "mo" 55

   "more" 23

   "even more" 77

)

  ...

[&lt; Previous topic](http://helpin.red/Datatypes.html)                                                                                          [Next topic &gt;](http://helpin.red/Otherdatatypes.html)
