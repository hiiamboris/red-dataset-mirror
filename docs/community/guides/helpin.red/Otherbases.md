Original URL: <http://helpin.red/Otherbases.html>

# Other bases

* * *

* * *

### native! to-hex  [Red-by-example](http://www.red-by-example.org/#to-hex)    [MyCode4fun](http://www.mycode4fun.co.uk/red-beginners-reference-guide#TOC-Here-we-use:-to-hex-)

### Converts an integer! to a hex issue! datatype (with leading # and 0's).

&gt;&gt; to-hex 10  
\== #0000000A

&gt;&gt; to-hex 16  
\== #00000010

&gt;&gt; to-hex 15  
\== #0000000F

### /size        =&gt; Specify number of hex digits in result.

&gt;&gt; to-hex/size 15 4  
\== #000F

&gt;&gt; to-hex/size 10 2  
\== #0A

### native!  enbase and native! debase,    [Red-by-example](http://www.red-by-example.org/#enbase)    [MyCode4fun](http://www.mycode4fun.co.uk/red-beginners-reference-guide#TOC-Here-we-use:-enbase-debase-to-string-)

### These are used do code and decode binary-coded strings. These are not for number conversion and, honestly, I don't understand the use for them, but here is how they work:

&gt;&gt; enbase "my house"  
\== "bXkgaG91c2U="

&gt;&gt; probe to-string debase "bXkgaG91c2U="  
"my house"  
\== "my house"

### /base        =&gt; Binary base to use. It may be 64 (default), 16 or 2.

&gt;&gt; enbase/base "Hi" 2  
\== "0100100001101001"

&gt;&gt; probe to-string debase/base "0100100001101001" 2  
"Hi"  
\== "Hi"

### native! dehex  [Red-by-example](http://www.red-by-example.org/#dehex)

### Converts URL-style hex encoded (%xx) strings.

&gt;&gt; dehex "www.mysite.com/this%20is%20my%20page"  
\== "www.mysite.com/this is my page" ; Hex 20 (%20) is space

&gt;&gt; dehex "%33%44%55"  
\== "3DU"  
; %33 is hex for "3", %44 is hex for "D" and %55 is hex for "U".

### Bitwise functions:

### Bitwise functions work at the binary level of values:

### op! &gt;&gt;   [Red-specs](https://github.com/meijeru/red.specs-public/blob/master/specs.adoc#84-bitwise-functions)  [Red-by-example](http://www.red-by-example.org/#xgtxgt)

### right shift - [documentation](https://github.com/meijeru/red.specs-public/blob/master/specs.adoc#84-bitwise-functions) says: "lowest bits are shifted out, highest bit is duplicated".

&gt;&gt; 144 &gt;&gt; 2

== 36

### ![](http://helpin.red/lib/NewItem190.png)

### I could not figure out how to duplicate the highest bit if it's 1. I tried 32 bit words, but Red converts them to floats.

### op! &lt;&lt;   [Red-specs](https://github.com/meijeru/red.specs-public/blob/master/specs.adoc#84-bitwise-functions)  [Red-by-example](http://www.red-by-example.org/#xltxlt)

### left shift - highest bits are shifted out, zero bits are added to the right.

&gt;&gt; 17 &lt;&lt; 1

== 34

### ![](http://helpin.red/lib/NewItem191.png)

### op! &gt;&gt;&gt;  [Red-specs](https://github.com/meijeru/red.specs-public/blob/master/specs.adoc#84-bitwise-functions)  [Red-by-example](http://www.red-by-example.org/#xgtxgtxgt)

### logical shift -  lowest bits are shifted out, zero bits are added to the left.  I could not figure out how this is different from &gt;&gt;.

### op! and  &amp;  and~   [Red-specs](https://github.com/meijeru/red.specs-public/blob/master/specs.adoc#84-bitwise-functions)  [Red-by-example](http://www.red-by-example.org/#and)

&gt;&gt; 27 and 50

== 18

0

0

0

1

1

0

1

1

27

0

0

1

1

0

0

1

0

50

and

0

0

0

1

0

0

1

0

18

The functional version (not infix) of and is and~

### op! or  &amp;  or~   [Red-specs](https://github.com/meijeru/red.specs-public/blob/master/specs.adoc#84-bitwise-functions)  [Red-by-example](http://www.red-by-example.org/#or)

&gt;&gt; 27 or 50

== 59

0

0

0

1

1

0

1

1

27

0

0

1

1

0

0

1

0

50

or

0

0

1

1

1

0

1

1

59

The functional version (not infix) of or is or~

### op! xor  &amp;  xor~   [Red-specs](https://github.com/meijeru/red.specs-public/blob/master/specs.adoc#84-bitwise-functions)  [Red-by-example](http://www.red-by-example.org/#xor)

&gt;&gt; 27 xor 50

== 41

0

0

0

1

1

0

1

1

27

0

0

1

1

0

0

1

0

50

xor

0

0

1

0

1

0

0

1

41

The functional version (not infix) of xor is xor~

### action! complement   [Red-specs](https://github.com/meijeru/red.specs-public/blob/master/specs.adoc#84-bitwise-functions)  [Red-by-example](http://www.red-by-example.org/#complement)

### todo -

todo

[&lt; Previous topic](http://helpin.red/Mathandlogic.html)                                                                                          [Next topic &gt;](http://helpin.red/Cryptography.html)
