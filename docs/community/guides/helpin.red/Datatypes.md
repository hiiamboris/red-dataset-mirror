Original URL: <http://helpin.red/Datatypes.html>

# Datatypes

* * *

* * *

#### It may be a good idea to take a look first at the [chapters about series](http://helpin.red/BlocksSeries.html), as some examples use built-in functions listed there.

### native! type?  [Red-by-example](http://www.red-by-example.org/#typexqm)

#### Returns the datatype of a value or the datatype of what is assigned to a word in the dictionary:

&gt;&gt; type? 33  
\== integer!

&gt;&gt; type? "house"  
\== string!

&gt;&gt; birthday: 30/07/1963  
\== 30-Jul-1963  
&gt;&gt; type? birthday  
\== date!

#### Basic Datatypes:

#### ♦ none!   [Red documentation](https://doc.red-lang.org/en/datatypes/none.html)  [Red-by-example](http://www.red-by-example.org/#nonexex)

#### The equivalent of "null" in other programming languages. A non-existing data.

&gt;&gt; a: \[1 2 3 4 5]  
\== \[1 2 3 4 5]  
&gt;&gt; pick a 7  
\== none

#### ♦ logic!   [Red documentation](https://doc.red-lang.org/en/datatypes/logic.html)  [Red-by-example](http://www.red-by-example.org/#logicxex)

Aside from the classic true and false, Red recognizes on , off, yes and no as logic! datatype.

&gt;&gt; a: 2 b: 3  
\== 3  
&gt;&gt; a &gt; b  
\== false

&gt;&gt; a: on  
\== true  
&gt;&gt; a  
\== true

&gt;&gt; a: off  
\== false  
&gt;&gt; a  
\== false

&gt;&gt; a: yes  
\== true  
&gt;&gt; a  
\== true

&gt;&gt; a: no  
\== false  
&gt;&gt; a  
\== false

Notice that, as far as I know, everything that is not false , off or no is considered true:

&gt;&gt; if "house" \[print "It's true!"]  
It's true!

&gt;&gt; if 0 \[print "It's true!"]  
It's true!

&gt;&gt; if \[] \[print "It's true!"]  
It's true!

&gt;&gt; if \[false] \[print "It's true!"]  ;bizarre!  
It's true!

#### ♦ string!   [Red documentation](https://doc.red-lang.org/en/datatypes/string.html)  [Red-by-example](http://www.red-by-example.org/#stringxex)

A series of chars within quotes " " or curly brackets {}. If your string spans over more than one line, curly brackets are mandatory.

Strings are series, and can be manipulated using the the commands described in the [chapters about them](http://helpin.red/BlocksSeries.html).

&gt;&gt; a: "my string"  
\== "my string"

&gt;&gt; a: {my string}  
\== "my string"

&gt;&gt; a: {my  
{ string}        ;the first "{" is not a typo, is how the console shows it. Try!  
\== "my^/string"  
&gt;&gt; print a  
my  
string

&gt;&gt; a: "my new                          ;trying to span over more than one line  
\*\** Syntax Error: invalid value at {"my new}

#### ♦ char!  [Red documentation](https://doc.red-lang.org/en/datatypes/char.html)  [Red-by-example](http://www.red-by-example.org/#charxex)

Preceded by # and within quotes, char! values represent a Unicode code point. They are integer numbers in the range hexadecimal 00 to hexadecimal 10FFFF. (0 to 1,114,111 in decimal.)

#"A" is a char!

"A" is a string!

It may undergo math operations.

&gt;&gt; a: "my string"  
\== "my string"  
&gt;&gt; pick a 2  
\== #"y"  
&gt;&gt; poke a 3 #"X"  
\== #"X"  
&gt;&gt; a  
\== "myXstring"

&gt;&gt; a: #"b"  
\== #"b"  
&gt;&gt; a: a + 1  
\== #"c"

#### ♦ integer!  [Red documentation](https://doc.red-lang.org/en/datatypes/integer.html)  [Red-by-example](http://www.red-by-example.org/#integerxex)

32 bit whole signed numbers. From −2,147,483,648 to 2,147,483,647. If a number is outside this range, Red assigns it a float! datatype.

Note: Dividing 2 integers gives a truncated result:

&gt;&gt; 7 / 2  
\== 3

#### ♦ float!   [Red documentation](https://doc.red-lang.org/en/datatypes/float.html)  [Red-by-example](http://www.red-by-example.org/#floatxex)

64 bit floating point numbers. Represented by numbers with a period or using the e-notation.

&gt;&gt; 7.0 / 2  
\== 3.5

&gt;&gt; 3e2  
\== 300.0

&gt;&gt; 6.0 / 7  
\== 0.8571428571428571

#### ♦ file!   [Red documentation](https://doc.red-lang.org/en/datatypes/file.html)  [Red-by-example](http://www.red-by-example.org/#filexex)

Preceded by %. If you are not using the current path, you should add the path within quotes. The path uses forward slashes (/), and back slashes (Windows format) are converted automatically.

&gt;&gt; write %myfirstfile.txt "This is my first file"

&gt;&gt; write %"C:\\Users\\André\\Documents\\RED\\mysecondfile.txt" "This is my second file"

#### ♦ path!   [Red documentation](https://doc.red-lang.org/en/datatypes/path.html)  [Red-by-example](http://www.red-by-example.org/#pathxex)

Used to access items inside larger structures using "/". Can be used in many different situations, for example:

&gt;&gt; a: \[23 45 89]  
\== \[23 45 89]  
&gt;&gt; print a/2  
45

Slashes "/" are also used to access objects and refinements. I don't know the inner workings of the Red interpreter, but it seems to me that those are cases of the path! type.

#### ♦ time!   [Red documentation](https://doc.red-lang.org/en/datatypes/time.html)  [Red-by-example](http://www.red-by-example.org/#timexex)

Time is expressed as hours:minutes:seconds.subseconds. Notice that seconds and subseconds are separated by a period, not a colon. You can access each one with a refinement. Check the chapter about [Time and timing](http://helpin.red/Timeandtiming.html).

&gt;&gt; mymoment: 8:59:33.4  
\== 8:59:33.4  
&gt;&gt; mymoment/minute: mymoment/minute + 1  
\== 60  
&gt;&gt; mymoment == 9:00:33.4

&gt;&gt; a: now/time/precise        ; a datatype is time!  
\== 22:05:46.805                  
&gt;&gt; type? a  
\== time!  
&gt;&gt; a/hour  
\== 22  
&gt;&gt; a/minute  
\== 5  
&gt;&gt; a/second  
\== 46.805                        ;second is a float!

#### ♦ date!   [Red documentation](https://doc.red-lang.org/en/datatypes/date.html)  [Red-by-example](http://www.red-by-example.org/#datexex)

Red accepts dates in a variety of formats:

&gt;&gt; print 31-10-2017  
31-Oct-2017  
&gt;&gt; print 31/10/2017  
31-Oct-2017  
&gt;&gt; print 2017-10-31  
31-Oct-2017  
&gt;&gt; print 31/Oct/2017  
31-Oct-2017  
&gt;&gt; print 31-october-2017  
31-Oct-2017  
&gt;&gt; print 31/oct/2017  
31-Oct-2017  
&gt;&gt; print 31/oct/17                ;only works if the year is the last field, but be careful: 1917 or 2017?.  
31-Oct-2017

Red also checks if dates are valid, even considering leap years.  
You can refer to day, month or year using refinements:

&gt;&gt; a: 31-oct-2017  
\== 31-Oct-2017  
&gt;&gt; print a/day  
31  
&gt;&gt; print a/month  
10  
&gt;&gt; print a/year  
2017

#### ♦  pair!   [Red documentation](https://doc.red-lang.org/en/datatypes/pair.html)  [Red-by-example](http://www.red-by-example.org/#pairxex) Represents points in a cartesian coordinate system (x y axys). Represented by integers separated by "x" e.g. 23x45.

&gt;&gt; a: 12x23  
\== 12x23  
&gt;&gt; a: 2 * a  
\== 24x46  
&gt;&gt; print a/x  
24  
&gt;&gt; print a/y  
46

#### ♦ percent!   [Red documentation](https://doc.red-lang.org/en/datatypes/percent.html)  [Red-by-example](http://www.red-by-example.org/#percentxex)

Represented by adding the "%" symbol after the number.

&gt;&gt; a: 100 * 11.2%  
\== 11.2  
&gt;&gt; a: 1000 * 11.3%  
\== 113.0

#### ♦ tuple!   [Red documentation](https://doc.red-lang.org/en/datatypes/tuple.html)  [Red-by-example](http://www.red-by-example.org/#tuplexex)

A tuple! is a list of 3 up to 12 bytes (bytes range from 0 to 255) separated by periods. Notice that 2 numbers separated by a period is a float! not a tuple!  
Tuples are useful to represent things like version numbers, IP addresses , and colours (example: 0.255.0).  
A tuple! is not a series, so most series operations give an error when applied. Some operations that can be performed on a tuple! are: random, add, divide, multiply, remainder, subtract, and, or, xor, length?, pick (not poke), reverse.

&gt;&gt; a: 1.2.3.4  
\== 1.2.3.4  
&gt;&gt; a: 2 * a  
\== 2.4.6.8  
&gt;&gt; print pick a 3  
6  
&gt;&gt; a/3: random 255  
\== 41  
&gt;&gt; a  
\== 2.4.41.8

Words datatypes:

When you use type? to determine the datatype of a word, you usually get the datatype of the value assigned to that word, as in:

&gt;&gt; test: 33.8  
\== 33.8  
&gt;&gt; type? test  
\== float!

However, the word itself (in this case "test") may assume different datatypes, depending on context:

datatype

word

word!

word:

set-word!

:word

get-word!

'word

lit-word!

/word

refinement!

&gt;&gt; to-word "test"  
\== test

&gt;&gt; make set-word! "test"  
\== test:

&gt;&gt; make get-word! "test"  
\== :test

&gt;&gt; make lit-word! "test"  
\== 'test

#### Datatype classes - ♦ number! and ♦ scalar!

Some datatypes are classes of datatypes:

Any of the following datatypes is also a number! datatype: integer!, float!, percent!

And any any of the following datatypes is also a scalar! datatype: char!, integer!, float!, pair!, percent!, tuple!, time!, date!

[&lt; Previous topic](http://helpin.red/Stoppingcode.html)                                                                                          [Next topic &gt;](http://helpin.red/Hashvectorandmap.html)
