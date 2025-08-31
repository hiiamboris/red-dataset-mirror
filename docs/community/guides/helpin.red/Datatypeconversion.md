Original URL: <http://helpin.red/Datatypeconversion.html>

# Datatype conversion

* * *

#### Datatypes conversion:

* * *

#### [Red documentation](https://github.com/meijeru/red.specs-public/blob/master/specs.adoc#conversion-of-values-code-to-code)

action! to

Converts one datatype! to another, e.g. an integer! to a string! , a float! to an integer! and even a string! to a number!.

&gt;&gt; to integer! 3.4  
\== 3

&gt;&gt; to float! 23  
\== 23.0

&gt;&gt; to string! 23.2  
\== "23.2"

&gt;&gt; to integer! "34"  
\== 34

### function! to-time

### Converts values to time! datatype.

&gt;&gt; to-time \[22 55 48]  
\== 22:55:48

&gt;&gt; to-time \[22 65 70]  
\== 23:06:10

&gt;&gt; to-time "11:15"  
\== 11:15:00

### native! as-pair

### Converts two integer! or float! into pair!. Note that this is not exactly a "conversion" as we are creating a new value from two values that may even be of different datatypes, as is the case when we "join" a float! and an integer! into a pair!.

&gt;&gt; as-pair 11 53  
\== 11x53

&gt;&gt; as-pair 3.2 5.67  
\== 3x5

&gt;&gt; as-pair 88 12.7  
\== 88x12

### function! to-binary

### Convert to binary! value. It seems that it's not a base converter, but a datatype converter.

&gt;&gt; to-binary 8  
\== #{00000008}

&gt;&gt; to-binary 33  
\== #{00000021}

[&lt; Previous topic](http://helpin.red/Otherdatatypes.html)                                                                                          [Next topic &gt;](http://helpin.red/Accessingandformattingdata.html)
