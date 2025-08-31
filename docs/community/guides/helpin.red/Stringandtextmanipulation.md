Original URL: <http://helpin.red/Stringandtextmanipulation.html>

# String and text manipulation

* * *

* * *

### Note: in the examples, some output  lines of the console were removed for clarity.

function! split  [Red-by-example](http://www.red-by-example.org/#split)    [MyCode4fun](http://www.mycode4fun.co.uk/red-beginners-reference-guide#TOC-Here-we-use:-split---break-a-string-into-pieces-using-delimiters.)

Returns a [block (a series)](http://helpin.red/BlocksSeries.html) containing the pieces of a string that are separated by a delimiter. Does not change original block. The delimiter is given as an argument. split is particularly useful to the parse dialect and to analyze and manipulate text [files](http://helpin.red/Files.html).

&gt;&gt; s: "My house is a very funny house"  
&gt;&gt; split s " "                                                        ;every space is a delimiter.  
\== \["My" "house" "is" "a" "very" "funny" "" "" "" "" "house"] ;result is a series with 11 elements.

&gt;&gt; s: "My house ; is a very ; funny house"  
&gt;&gt; split s ";"                                                        ;split happens at the semi-colons.  
\== \["My house " " is a very " " funny house"]        ;result is a series with 3 elements.

### removing characters: action! trim  [Red-by-example](http://www.red-by-example.org/#trim)    [MyCode4fun](http://www.mycode4fun.co.uk/red-beginners-reference-guide#TOC-Here-we-use:-trim-trim-head-trim-tail-trim-all-trim-with-)

The word trim with no refinements removes white space (tabs and spaces) from the beginning and end of a string! (it also removes none from a block! or object!). The value of the argument is altered. It has a refinement to remove specific characters. It returns the trimmed series and changes the original series.

Refinements:

/head - Removes only from the head.  
/tail - Removes only from the tail.  
/auto - Auto indents lines relative to first line.  
/lines - Removes all line breaks and extra spaces.  
/all - Removes all whitespace (but not line breaks).  
/with - Same as /all, but removes characters in a 'with' argument we supply. It must be one of: char! string! or integer!

&gt;&gt; e: " spaces before and after "    
&gt;&gt; trim e  
\== "spaces before and after"

#### trim leading spaces:

&gt;&gt; e: " spaces before and after "  
&gt;&gt; trim/head e  
\== "spaces before and after "

#### trim trailing spaces:

&gt;&gt; e: " spaces before and after "  
&gt;&gt; trim/tail e  
\== " spaces before and after"

#### trim specific characters:

&gt;&gt; d: "our house in the middle of our street"  
&gt;&gt; trim/with d " "  
\== "ourhouseinthemiddleofourstreet"

&gt;&gt; a: "house"  
&gt;&gt; trim/with a "u"  
\== "hose"

### the opposite of trim: function! pad  [Red-by-example](http://www.red-by-example.org/#pad)

pad expands the string to a given size by adding spaces. The default is to add spaces to the right, but with the refinement /left , spaces are added to the beginning of the string. Changes the original string, beware.

&gt;&gt; a: "House"  
&gt;&gt; pad a 10  
\== "House "

&gt;&gt; pad/left a 20  
\== " House "

### text concatenation: function! rejoin  [Red-by-example](http://www.red-by-example.org/#rejoin)    [MyCode4fun](http://www.mycode4fun.co.uk/red-beginners-reference-guide#TOC-Here-we-use:-read-foreach-find-rejoin-halt-)

&gt;&gt; a: "house" b: " " c: "entrance"  
&gt;&gt; rejoin \[a b c]  
\== "house entrance"

or, using append - this changes the original series

&gt;&gt; append a c  
\== "house entrance"

&gt;&gt; a: "house" b: " " c: "entrance"

&gt;&gt; append a c  
\== "houseentrance"

&gt;&gt; append a append b c  
\== "houseentrance entrance"                ; "a" was changed to "houseentrance" in the last manipulation

### turning a series into text: action! form  [Red-by-example](http://www.red-by-example.org/#form)    [MyCode4fun](http://www.mycode4fun.co.uk/red-beginners-reference-guide#TOC-Here-we-use:-now-time-append-and-form-)

form returns a series as a string, removing brackets and adding spaces between elements. form was briefly seen in the [Accessing and formating data](http://helpin.red/Accessingandformattingdata.html) chapter.

&gt;&gt; a: \["my" "house" 23 47 4 + 8 \["a" "bee" "cee"]]  
&gt;&gt; form a  
\== "my house 23 47 4 + 8 a bee cee"

/part

The refinement /part limits the number of characters of the created string.

&gt;&gt; a: \["my" "house" 23 47 4 + 8 \["a" "bee" "cee"]]  
&gt;&gt; form/part a 8  
\== "my house"

### string length: action! length?  [Red-by-example](http://www.red-by-example.org/#lengthxqm)    [MyCode4fun](http://www.mycode4fun.co.uk/red-beginners-reference-guide#TOC-Here-we-use:-length-returns-the-number-of-values-in-the-series.)

&gt;&gt; f: "my house"  
&gt;&gt; length? f          
\== 8

### left part of string:

using copy/part :

&gt;&gt; s: "nasty thing"  
&gt;&gt; b: copy/part s 5  
\== "nasty"

### right part of string:

using at :

&gt;&gt; s: "nasty thing"  
&gt;&gt; at tail s -5  
\== "thing"

using remove/part - this changes the original series, beware!

&gt;&gt; s: "nasty thing"  
&gt;&gt; remove/part s 6  
\== "thing"

### middle part of string:

using copy/part and at:

&gt;&gt; a: "abcdefghijkl"  
&gt;&gt; copy/part at a 4 3  
\== "def"

### insert strings:

at the beginning, using insert:

&gt;&gt; s: "house"  
&gt;&gt; insert s "beautiful "

&gt;&gt; s  
\== "beautiful house"

at the end, using append:

&gt;&gt; s: "beautiful"  
&gt;&gt; append s " day"  
\== "beautiful day"

in the middle, using insert at:

&gt;&gt; s: "nasty thing"  
&gt;&gt; insert at s 7 "little "

&gt;&gt; s  
\== "nasty little thing"

native! lowercase  [Red-by-example](http://www.red-by-example.org/#lowercase)    [MyCode4fun](http://www.mycode4fun.co.uk/red-beginners-reference-guide#TOC-Here-we-use:-do-uppercase-and-lowercase-)

Changes the original string, beware.

&gt;&gt; a: "mY HoUse"  
&gt;&gt; lowercase a  
\== "my house"

/part

&gt;&gt; a: "mY HoUse"  
&gt;&gt; lowercase/part a 2  
\== "my HoUse"

native! uppercase  [Red-by-example](http://www.red-by-example.org/#uppercase)    [MyCode4fun](http://www.mycode4fun.co.uk/red-beginners-reference-guide#TOC-Here-we-use:-do-uppercase-and-lowercase-)

Changes the original string, beware.

&gt;&gt; a: "mY HoUse"  
&gt;&gt; uppercase a  
\== "MY HOUSE"

/part

&gt;&gt; a: "mY HoUse"  
&gt;&gt; uppercase/part a 2  
\== "MY HoUse"

[&lt; Previous topic](http://helpin.red/Branching.html)                                                                                          [Next topic &gt;](http://helpin.red/Printingspecialcharacters.html)
