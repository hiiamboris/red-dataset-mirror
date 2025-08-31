Original URL: <http://helpin.red/Parseusage-Manipulatingtext.html>

# Parse usage - Manipulating text

* * *

* * *

Inserting words in text:

Red \[]

a: "Not great Britain nor small Britain, just Britain"

parse a \[any \[to "Britain" insert "blue " skip]]

print a

Not great blue Britain nor small blue Britain, just blue Britain

Notice that skip was added to the rule to prevent an endless loop: to takes the input to before the match, so "Britain" would be matched over and over again if we dont skip it.

Removing words from text:

Red \[]

a: "Not great Britain nor small Britain, just Britain"

parse a \[ any \[to remove "Britain"]] ;seems to work the same as \[to "Britain" remove "Britain"]

print a

Not great  nor small , just

Explaining the code:

First:

![](http://helpin.red/lib/NewItem179.png)

Then:

![](http://helpin.red/lib/NewItem180.png)

Changing words from text:

Red \[]

a: "Not great Britain nor small Britain, just Britain"

parse a \[ any \[to "Britain" change "Britain" "Australia"]] ;\[to change "Britain" "Australia"] also seems to work!

print a

Not great Australia nor small Australia, just Australia

[&lt; Previous topic](http://helpin.red/Parseusage-Extractdata.html)                                                                                          [Next topic &gt;](http://helpin.red/Parselinks.html)
