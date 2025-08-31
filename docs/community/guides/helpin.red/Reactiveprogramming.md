Original URL: <http://helpin.red/Reactiveprogramming.html>

# Reactive programming

* * *

* * *

[Reactive programming in Red's documentation](https://doc.red-lang.org/en/reactivity.html)

Reactive programming creates an internal mechanism that automatically updates things when a special kind of object is changed. No need to call functions or subroutines do do that. You change object A, and B is automatically changed too.

Reactor: is the object that, when changed, triggers the changes. Created by make reactor! .

Reactive expression: changes when the reactor changes. Created by is .

action! make reactor! and op! is [Red's documentation on reactor!](https://doc.red-lang.org/en/reactivity.html#_reactor)  [Red's documentation on is](https://doc.red-lang.org/en/reactivity.html#_is)

Very basic example of using reactive programming:

Red\[]

a: make reactor! \[x: ""]        ;reactor object - triggers changes when changed

b: is \[a/x]                                ;reactive expression - changes when 'a' changes

forever [

       a/x: ask "?"                ;here we input a value for 'x' field of 'a'

       print b                        ;here we print 'b' and... surprise! it changed!

]

?house

house

?fly

fly

?bee

bee

A reactor can update itself:

Red\[]

a:  make reactor! \[x: 1 y: 2 total: is \[x + y]]

forever [

       a/x: to integer! ask "?"

       print a/total

]

?33

35

?45

47

 Be careful not create an endless loop. That happens if a change triggers a change in itself.

### deep-reactor!    [Red's documentation](https://doc.red-lang.org/en/reactivity.html#_deep_reactor)

Just like copy has the refinement /deep to reach nested values (blocks within the main block), so does reactor!.

This program is supposed to repeat what you type on the console, but it does not work:

Red\[]

a: make reactor! \[z: \[x: ""]]

b: object \[w: is \[a/z/x]]

b/w: "no change"

forever [

       a/z/x: ask "?"

       print b/w

]

?house  
no change  
?blue  
no change

However, if you change to deep-reactor!:

Red\[]

a: make deep-reactor! \[z: \[x: ""]]

b: object \[w: is \[a/z/x]]

b/w: "no change"

forever [

       a/z/x: ask "?"

       print b/w

]

?house  
house  
?blue  
blue

function! react    [Red's documentation](https://doc.red-lang.org/en/reactivity.html#_react)

This is the built-in function used for creating reactive GUIs. Please look at [GUI/Advanced topics](http://helpin.red/Advancedtopics.html).

* * *

Copied-and-pasted from the [documentation](https://doc.red-lang.org/en/reactivity.html):

function! clear-reactions

Removes all defined reactions, unconditionally.

function! react?

Checks if an object’s field is a reactive source . If it is, the first reaction found where that object’s field is present as a source, will be returned, otherwise none is returned. /target refinement checks if the field is a target instead of a source, and will return the first reaction found targeting that field or none if none matches.

    /target      =&gt; Check if it's a target instead of a source.

function! dump-reactions

Outputs a list of registered reactions for debug purposes.

[&lt; Previous topic](http://helpin.red/Objects.html)                                                                                          [Next topic &gt;](http://helpin.red/OSinterface.html)
