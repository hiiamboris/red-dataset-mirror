Original URL: <http://helpin.red/Built-inhelp.html>

# Built-in help

* * *

* * *

Red has an exceptional built-in help. There is a large amount of information you can get about the language and about your own code just typing a few commands on the console.

### function! ? (or help)        [Red-by-example](http://www.red-by-example.org/#help)

Gives information about all of Red's reserved words and also about your own code. You may also type help, but ? is, of course, shorter. ? by itself prints information about how to use help.

&gt;&gt; ? now

USAGE:

    NOW

DESCRIPTION:

    Returns date and time.

    NOW is a native! value.

REFINEMENTS:

    /year        =&gt; Returns year only.

    /month       =&gt; Returns month only.

    /day         =&gt; Returns day of the month only.

    /time        =&gt; Returns time only.

    /zone        =&gt; Returns time zone offset from UCT (GMT) only.

    /date        =&gt; Returns date only.

    /weekday     =&gt; Returns day of the week as integer (Monday is day 1).

    /yearday     =&gt; Returns day of the year (Julian).

    /precise     =&gt; High precision time.

    /utc         =&gt; Universal time (no zone).

RETURNS:

    \[date! time! integer!]

&gt;&gt; a: \[1 2 3]  
\== \[1 2 3]

&gt;&gt; help a  
A is a block! value: \[1 2 3]

&gt;&gt; help block!      
       a                length: 3  \[1 2 3]  
   cancel-captions  length: 3  \["cancel" "delete" "remove"]

&gt;&gt; a: function \[a b] \[a + b]  
\== func \[a b]\[a + b]

&gt;&gt; ? a  
USAGE:  
       A a b  
DESCRIPTION:  
       A is a function! value.  
ARGUMENTS:  
       a  
       b

You can get information about complex objects:

![](http://helpin.red/lib/builtinhelp1.png)

If you don't know exactly what you are looking for, "?" will perform a search for you:

&gt;&gt; ? -to

    hex-to-rgb      function!     Converts a color in hex format to a tuple value; returns NONE if it f...

    link-sub-to-parent function!     \[face \[object!] type \[word!] old new /local parent]

    link-tabs-to-parent function!     \[face \[object!] /init /local faces visible?]

You can find all defined words of a given datatype!

&gt;&gt; ? tuple!

   Red              255.0.0

   white            255.255.255

   transparent      0.0.0.255

   black            0.0.0

   gray             128.128.128

    ; ... the list is too long!

### function! what        [Red-by-example](http://www.red-by-example.org/#what)

Prints a list of globally-defined functions. Try it!

### function! source        [Red-by-example](http://www.red-by-example.org/#source)

Shows the source code for a mezzanine function or a user created function.

Try source replace .

#### mezzanine functions

Red interpreter has:

- the native functions which are "embedded" in the interpreter and are executed at a very low level;
- and mezzanine functions which, even though they are part of Red interpreter (come in the Red executable) are created using Red, that is, they have a source code you can read using source.

### function! about        [Red-by-example](http://www.red-by-example.org/#about)

Display version number and build date.

[&lt; Previous topic](http://helpin.red/Helloworld-runandcompile.html)                                                                                          [Next topic &gt;](http://helpin.red/Notesonsyntax.html)
