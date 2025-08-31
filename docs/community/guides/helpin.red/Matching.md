Original URL: <http://helpin.red/Matching.html>

# Matching

* * *

## Parse - Matching

* * *

PARSE skip

Skips (jumps) one element:

Red\[]

a:  \["fox" "dog" "owl" "rat" "elk" "cat"] ; input block

print parse a [   ;here the rules begin:

       "fox"  ; rule 1 matches element 1 =&gt; true

       skip   ; just skips this element

       "owl"  ; rule 3 matches element 3 =&gt; true

       "rat"  ; rule 4 matches element 4 =&gt; true

       "elk"  ; rule 5 matches element 5 =&gt; true

       "cat"  ; rule 6 matches element 6 =&gt; true          

]

true

Another example, noting that strings are series of characters, and are a common input block:

Red \[]

a: "XYZhello"

print parse a \[skip skip skip "hello"]

true

Or, more elegantly (check [repetition](http://helpin.red/RepetitionandMatchingLoops.html#known)):

Red \[]

a: "XYZhello"

print parse a \[3 skip "hello"]

true

PARSE  to  and  PARSE  thru

Skips elements until if finds a match. thru sets the input is set past the match, to sets it before the match.

The next two examples illustrate well the use of to and thru. They use strings (series of char!) as input blocks.  

Red\[]

a: "big black cat"

parse a \[ to "black" insert "FAT "]

print a

big FAT black cat

Red\[]

a: "big black cat"

parse a \[ thru "black" insert " FAT"]

print a

big black FAT cat

So:

![](http://helpin.red/lib/NewItem188.png)

Example of to:

Red\[]

a:  \["fox" "dog" "owl" "rat" "elk" "cat" "bat"] ; input block

print parse a [   ;here the rules begin:

       "fox"                ; rule 1 matches element 1 =&gt; true

       to "elk"        ; skips all elements until...

                       ; ...it finds a match, but..

       "elk"                ; ... it also checks if the match fits the rule

       "cat"                ; rules for the elements...

       "bat"                ; ... following the match

]

true

Example of thru:

Red\[]

a:  \["fox" "dog" "owl" "rat" "elk" "cat" "bat"] ; input block

print parse a [   ;here the rules begin:

       "fox"                ; rule 1 matches element 1 =&gt; true

       thru "elk"        ; skips all elements until...

                       ; ...it finds a match

       "cat"                ; rules for the elements...

       "bat"                ; ... following the match

]

true

PARSE end

Returns true if all input items have been checked by parse.

Red\[]

a:  \[33 18.2 #"c" "rat"] ; input block

print parse a [  

       integer!        

       float!

       char!

       string!

       end

]

true

However, the most common use of end is as a reference for  to and thru keywords, to skip all inputs and bring the parse to the end of the input block.

Red\[]

a:  \[33 18.2 #"c" "rat"]

print parse a \[to end]        ; just skips to the end, after "rat"

true

PARSE ahead

Checks if the next element (ahead) matches a rule.

Red\[]

a:  \["fox" "dog" "owl" "rat"]        ; input block

print parse a [  

       "fox"        

       "dog"

       ahead "owl" ;checks if the next item matches the rule

       "owl"

       "rat"

]

true

PARSE none

Always returns sucess. It is a catch-all rule

Red\[]

a:  \["fox" "dog" "owl" "rat"]  ; input block

print parse a [  

       "fox"        

       "dog"

       none        ; does nothing, but actions can be inserted here

       "owl"

       "rat"

]

true

PARSE opt

If it finds a match, it returns sucess, and parse follows to the next input. If the input does not match the opt rule, parse skips (ignores) this opt rule and checks the same input with the next rule.

Red\[]

a:  \["fox" "dog" "owl" "rat"]  ; input block

print parse a [   ;here the rules begin:

       "fox"  ; rule 1 matches element 1 =&gt; success

       "dog"  ; rule 2 matches element 2 =&gt; success

       opt "owl"  ; rule 3 matches element 3 =&gt; success

       "rat"  ; rule 4 matches element 4 =&gt; success  

]

print parse a [   ;here the rules begin:

       "fox"  ; rule 1 matches element 1 =&gt; success

       "dog"  ; rule 2 matches element 2 =&gt; success

       opt "BAT"        ; no "BAT" here in input, so parse just skip this rule...

       "owl"  ; ...and parse continues here with the next input.

       "rat"  ; rule 4 matches element 4 =&gt; success  

]

true

true

Another example:

Red \[]

a:  \["Mrs" "Robinson"]

print parse a \[opt "Mrs" "Robinson"] ;TRUE

a:  \["Robinson"]

print parse a \[opt "Mrs" "Robinson"] ;TRUE, the "Mrs" is OPTional

a:  \["Miss" "Robinson"]

print parse a \[opt "Mrs" "Robinson"] ; FALSE, "Mrs" is optional, but "Miss" is wrong!

Another example:

   a: \[ "elk" "cat" "owl"]

parse a \[ opt \[ "fig" ] "elk" "cat" "owl" ]  ; never or at least once

true

parse a \[ opt \[ "elk" "cat" ] "owl" ]      ; never or at least once        

true

parse a \[ opt \[ "elk" "owl" ]  "cat" ]     ; never or at least once        

false *

         *  If the entry does not match the opt rule , the parse skips this rule and checks the same entry by the following rule.

One more example for opt :

hd: "mountaintrack"       ; string  

parse hd \[ opt "mountain" "track"]   ; == true      

parse hd \[ opt "mountain" "rights"]   ; == false

PARSE  not

The official definition of the not rule is that it "invert the result of the sub-rule". To me, it seems as a rule that excludes a possible match from the next rule.  
It does not "consume" input.

Red\[]

a:  \["fox" "dog" "owl" "rat"]

print parse a [  

       "fox"

       "dog"  

       not "owl" ;does not consume input

       skip ;anything here, except "owl" - fails!

       "rat"

]

print parse a [  

       "fox"

       "dog"  

       not "COW" ; does not "consume" input

       skip ;anything here, except "COW" - success!

       "rat"

]

false

true

PARSE  quote

Matches the argument exactly as it is except for paren!

This gives an error:

&gt;&gt; parse \[x] \[x]

\*\** Script Error: PARSE - invalid rule or usage of rule: x

\*\** Where: parse

\*\** Stack:

But this works:

&gt;&gt; parse \[x] \[quote x]

== true

&gt;&gt; parse \['x] \[quote 'x]

== true

&gt;&gt; parse \[\[x]] \[quote \[x]]

== true

[&lt; Previous topic](http://helpin.red/DebuggingParse.html)                                                                                          [Next topic &gt;](http://helpin.red/Orderedchoices.html)
