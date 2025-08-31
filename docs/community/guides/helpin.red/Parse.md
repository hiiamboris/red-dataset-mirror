Original URL: <http://helpin.red/Parse.html>

# Parse

* * *

* * *

[Very good information also in red-by-example.](http://www.red-by-example.org/parse.html) and in the links in [Parse links](http://helpin.red/Parselinks.html) chapter.

Parse is a "dialect" of Red (a DSL - domain specific language to be precise), that is, a mini-language embedded inside Red. The Red interpreter you download comes with a few of these languages: VID, for GUI creation, DRAW for graphics and PARSE.

Parse should be studied as a small programming language.

native! parse

In a very basic level,  parse picks each element of the input and submits it to the corresponding rule in the rules block. It returns true if all rules are matched or false, if one fails to match its corresponding rule.

A most basic example would be to simply check if each element in the input block is equal to the corresponding rule in the rules' block:

Red\[]

a:  \["fox" "dog" "owl" "rat" "elk" "cat"]                ; input block

print parse a \["fox" "dog" "owl" "rat" "elk" "cat"]

true

For the sake of clarity in the description of parse, lets rewrite the example above with a different format:

Red\[]

a:  \["fox" "dog" "owl" "rat" "elk" "cat"]                ; input block

print parse a [   ;here the rules begin:

       "fox"  ; rule 1 matches element 1 =&gt; success

       "dog"  ; rule 2 matches element 2 =&gt; success

       "owl"  ; rule 3 matches element 3 =&gt; success

       "rat"  ; rule 4 matches element 4 =&gt; success

       "elk"  ; rule 5 matches element 5 =&gt; success

       "cat"  ; rule 6 matches element 6 =&gt; success  

]

; since all matches are success, the result is "true"

true

The match may be done with datatypes:

Red\[]

a:  \[33 18.2 #"c" "rat"]        ; input block

print parse a [  

       integer!        

       float!

       char!

       string!

]

true

## Regular code may be inserted in the rules' block by enclosing it in parenthesis:

Red\[]

a:  \["fox" "dog" "owl" "rat" "elk"]                ; input block

print parse a [  

       "fox"

       "dog"

       "owl"

       (loop 3 \[print "just regular code here!"])

       "rat"

       "elk"  

]

just regular code here!

just regular code here!

just regular code here!

true

Parse Refinements:

    /case        =&gt;

    /part        =&gt;

    /trace       =&gt;

Important clarification:

parse command returns true or false, but the matching itself passes to parse  success or failure. Have that in mind to avoid confusion.

![](http://helpin.red/lib/NewItem269.png)

[&lt; Previous topic](http://helpin.red/Createviewsprogammatically.html)                                                                                          [Next topic &gt;](http://helpin.red/DebuggingParse.html)
