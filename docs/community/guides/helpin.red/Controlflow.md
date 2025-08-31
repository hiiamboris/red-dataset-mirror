Original URL: <http://helpin.red/Controlflow.html>

# Control flow

* * *

## Parse - Control flow

* * *

PARSE  if

if tests the result of a logic expression within parenthesis. It is usually followed by a rule1 | rule 2 .

If there is no ordered choice ( rule1 | rule 2 ) after the if, and the result of the logic expression is false or none  the parsing is halted, returning false.

Red\[]

block: \[6 3 7]

print parse block \[integer! integer! if (1 = 1) integer!] ;(1 = 1) is true, so it goes on

print parse block \[integer! integer! if (1 = 2) integer!] ;(1 = 2) is false, so it halts, returning false

true

false

With ordered choices: If the result of this logic expression is true, the parsing loop uses rule1, if it's  false or none, it uses rule2 for the next parsing match attempt.

![](http://helpin.red/lib/NewItem183.png)

Red\[]

block: \[6 3 7]

print parse block \[integer! integer! if (1 = 1) \[integer! | string!]] ; 7 is an integer! -&gt; true

print parse block \[integer! integer! if (1 = 2) \[integer! | string!]] ; 7 is not a string! false

true

false

Another simple example:

Red\[]

block: \[1 2]

print parse block \[set value integer! if (value = 1) to end]

block: \[2 2]

print parse block \[set value integer! if (value = 1) to end]

true

false

PARSE  then

Regardless of failure or success of what follows, skip the next alternate rule. That is, when a then is encountered, the next alternate rule is disabled.

I couldn't find good examples and can't think of any use for that.

PARSE  into

Switch input to matched series (string or block) and parse it with rule.

Could not find good examples.

PARSE  fail

Force current rule to fail and backtrack.

Could not find good examples. I believe it is related mostly, if not completely, related to matching loops (any, some and while).

PARSE  break

Break out of a matching loop, returning success.

Could not find good examples. I believe it is related mostly, if not completely, related to matching loops (any, some and while), specifically to offer a way to avoid endless loops.

PARSE  reject

Break out of a matching loop, returning failure.

Could not find good examples. I believe it is related mostly to matching loops (any, some and while)

[&lt; Previous topic](http://helpin.red/Modifyinginput.html)                                                                                          [Next topic &gt;](http://helpin.red/Parseusage-Validateinputs.html)
