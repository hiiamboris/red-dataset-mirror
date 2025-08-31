Original URL: <http://helpin.red/Orderedchoices.html>

# Ordered choices

* * *

* * *

Rules accept a "ordered choice" operator, represented by "|":

If a block of rules separated by "|" is found by parse, it will try each rule, from left to right until it finds a match, returning success and going to the next rule after the block. If none of them is a match, of course, it fails and the parsing is stopped returning false.

![](http://helpin.red/lib/NewItem209.png)

This is similar to a logic "or" operator, but order matters.

Example1:

Red\[]

a: \["fox" "rat" "elk"]        

b: \["fox" "owl" "elk"]        

print parse a [  

       "fox"

       \["rat" | "owl"]                ;notice enclosing brackets

       "elk"  

]

print parse b [  

       "fox"

       \["rat" | "owl"| "cat" | "whatever"]

       "elk"  

]

true

true

Example2:

Red\[]

print parse \["this is a string"] \[ integer! (print "integer") | string! (print "string") | char! (print "char")]

string

true

![](http://helpin.red/lib/NewItem185.png)

Example3:

Red\[]

a: \["string" 3 #"A"] ; that is a string!, an integer! and a char!

print parse a \[integer! (print "I") | string! (print "S") | time! (print "T")]

S

false

Repeating the script with parse-trace instead of print parse (color highlights, newlines, bold font and comments added by edition):

--&gt;

  match: [integer! (print "I") | string! (print "S") | time

  input: \["string" 3 #"A"]  

  ==&gt; not matched

  match: \[string! (print "S") | time! (print "T")]

  input: \["string" 3 #"A"]  

  ==&gt; matched        

                                       ;keeps going to execute commands in parenthesis

  match: \[(print "S") | time! (print "T")]

  input: \[3 #"A"]  

S  

  match: \[| time! (print "T")]

  input: \[3 #"A"]  

return: false                 ;too much input and not enough rules -&gt; false

To obtain true, we may add more rules to the successful ordered choice...

Red\[]

a: \["string" 3 #"A"] ; that is a string!, an integer! and a char!

print parse a \[integer! (print "I") | string! (print "S") integer! char! | integer! (print "T")]

S

true

... or enclose the ordered choices in brackets and add rules to the main rule block:

Red\[]

a: \["string" 3 #"A"] ; that is a string!, an integer! and a char!

print parse a \[\[integer! (print "I") | string! (print "S") | time! (print "T")] integer! char!]

S

true

[&lt; Previous topic](http://helpin.red/Matching.html)                                                                                          [Next topic &gt;](http://helpin.red/RepetitionandMatchingLoops.html)
