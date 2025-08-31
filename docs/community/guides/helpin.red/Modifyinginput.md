Original URL: <http://helpin.red/Modifyinginput.html>

# Modifying input

* * *

* * *

PARSE  insert

Inserts a value in the input block at the current input position.

Red\[]

a:  \["fox" "dog" "owl" "rat"]

print parse a [

       "fox"        

       "dog"

       insert 33

       "owl"

       "rat"  

]

print a

true

fox dog 33 owl rat

Another example using a string:

Red\[]

a: "My big eyes"

parse a \[ thru "big" insert " brown"]

print a

My big brown eyes

PARSE  remove

Removes the matched input from the input block.

Red\[]

a:  \["fox" "dog" "owl" "rat"]

print parse a [

       "fox"

       remove "dog"

       remove "owl"

       "rat"  

]

print a

true

fox rat

Another example, using strings:

Red\[]

a: "My big eyes"

parse a \[ to "big" remove "big "]

print a

My eyes

PARSE  change

Changes a matched input:

Red\[]

a:  \["fox" "dog" "owl" "rat"]

print parse a [

       "fox"        

       "dog"

       change "owl" "COW"

       "owl"

       "rat"  

]

print a

false

fox dog COW rat

[&lt; Previous topic](http://helpin.red/Storinginput.html)                                                                                          [Next topic &gt;](http://helpin.red/Controlflow.html)
