Original URL: <http://helpin.red/Storinginput.html>

# Storing input

* * *

## Parse - Storing input

* * *

PARSE set and PARSE copy

Both get the input of the next parse rule, if successful. The difference happens when you have a subexpression (see examples below). The set operation sets the given variable to the first matched value, while the copy operation copies the whole part of the input matched by the subexpression.

Red\[]

a: \["fox" "rat" "elk"]        

parse a [  

       "fox"

       set b                ;ready to assign if next rule is successful. Could use copy instead.

       "rat"        ;success here, so "rat" =&gt; b

       "elk"  

]        

print b

rat

Red\[]

block: \[7 9]

print parse block \[set value integer! integer!]

print value

true

7

Red\[]

block: \[6 3]

print parse block \[integer! copy value integer!]

print value

true

3

Explaining the code:

![](http://helpin.red/lib/NewItem181.png)

Showing the difference between copy and set:

Set gets only the first match of a subexpression:

Red\[]

a: \["cat" "dog" "bat" "owl"]

parse a \["cat" set b any string!]

print b

dog

Copy gets all the matches of a subexpression:

Red\[]

a: \["cat" "dog" "bat" "owl"]

parse a \["cat" copy b any string!]

print b

dog bat owl

PARSE collect and PARSE keep

If you have a collect block inside your rules' block, parse will no longer return a logical true or false, instead it will return a block with all the successes that preceded by the built-in function (command) keep .

Red\[]

a:  \["fox" "dog" "owl" "rat" "elk" "cat"]                ; input block

print parse a [

       collect[

       keep "fox"        ; success, WILL be kept

       "dog"

       "owl"

       keep "rat"  ; success, WILL be kept

       keep "cow"        ; FAIL! will NOT be kept

       "cat"

               ]

]

fox rat

PARSE collect set

parse will return a logical true or false, and insert all the successes preceded by the word keep in a new block.

Red\[]

a:  \["fox" "dog" "owl" "rat" "elk" "cat"]                ; input block

print parse a [

       collect set b [                                        ; creates b to store keeps

       keep "fox"        ; success, WILL be kept

       "dog"

       "owl"

       keep "rat"  ; success, WILL be kept

       keep "cow"        ; FAIL! will NOT be kept

       "cat"

               ]

]

print b

false

fox rat

PARSE collect into

parse will return a logical true or false, and insert all the successes preceded by the word keep in a block you previously created. It seems to append results to the block.

Red\[]

a:  \["fox" "dog" "owl" "rat" "elk" "cat"]                ; input block

b:""                                                                ; must create block first

print parse a [

       collect into b [

       keep "fox"        ; success, WILL be kept

       "dog"

       "owl"

       keep "rat"  ; success, WILL be kept

       keep "cow"        ; FAIL! will NOT be kept

       "cat"

               ]

]

print b

false

foxrat

[]()Collecting the input using set-word syntax

During parse processing, you may assign what is left of the input to a word (variable):

Red\[]

a:  \["fox" "dog" "owl" "rat" "elk" "cat"]

print parse a [  

       "fox"

       "dog"  

       b:

]

probe b

false

\["owl" "rat" "elk" "cat"]

Red \[]

txt: "They are one person, they are two together"

parse txt \[thru "person, " b:]

print b

they are two together

[&lt; Previous topic](http://helpin.red/RepetitionandMatchingLoops.html)                                                                                          [Next topic &gt;](http://helpin.red/Modifyinginput.html)
