Original URL: <http://helpin.red/RepetitionandMatchingLoops.html>

# Repetition and Matching Loops

* * *

* * *

## Keywords:  some, any, opt, while.

Rule rule can be optional or repeated in a different way.

Keyword or Value

Description

3 &lt;rule&gt;

repeat the rule 3 times

1 3 &lt;rule&gt;

repeat rule 1 to 3 times

0 3 &lt;rule&gt;

repeat the rule 0 to 3 times

some

repeat its rule(s) while (and if) it gets a true (match) from the rule. Returns false  if it doesn't get at least one match (makes the parse false).

any

repeat its rule(s) until it gets a false (no match) from the rule. Always returns true to the parse expression.

while

see text below.

[]()Known Repetition Number - Examples

&gt;&gt; parse "fogfogfog" \[3 "fog"]; determined exactly

== true

&gt;&gt; parse "fogfogfog" \[0 5 "fog"]; determined by range

== true                              

Script examples for exact repetitions:

Red\[]

a:  \["fox" "dog" "owl" "rat" "elk" "cat"]

print parse a [  

   4 skip        ; see command skip at Parse/Matching

       "elk"  

       "cat"    

]

true

Red\[]

a:  \["rat" "rat" "rat" "rat" "elk" "cat"]

print parse a [  

   4 "rat"

       "elk"  

       "cat"    

]

true

Or a range:

Red\[]

a:  \["rat" "rat" "elk" "cat"]

print parse a [  

   0 4 "rat"        ; will return success if there is from zero up to four "rat"

       "elk"  

       "cat"    

]

true

Matching Loops:

PARSE some, PARSE any

Again:

some - repeat its rule(s) while (and if) it gets a true (match) from the rule. Returns false  if it doesn't get at least one match (makes the parse false).

any - repeat its rule(s) until it gets a false (no match) from the rule. Always returns true to the parse expression

Both return success for as long as they find matches in the input, the difference is that some requires at least one occurrence of the input (match), while any will return success even with no match.

Red\[]

a:  \["fox" "dog" "fox" "dog" "fox" "dog" "elk" "cat"]

print parse a [

       some \["fox" "dog"]

       "elk"

       "cat"

]

print parse a [

       any \["fox" "dog"]

       "elk"

       "cat"

]

true

true

* * *

Red\[]

a:  \["elk" "cat"]

print parse a [

       some \["fox" "dog"]

       "elk"

       "cat"

]

print parse a [

       any \["fox" "dog"]

       "elk"

       "cat"

]

false

true

Example that shows the  "loop" behavior more clearly:

Red \[]

txt: {In a one-story blue house, there was a blue person,

a blue cat – everything was blue! What color were the stairs?}

print parse txt \[some \[thru "blue" (print "I found blue!")] to end]

I found blue!

I found blue!

I found blue!

I found blue!

true

&gt;&gt;

Explaining the example:

[some

       \[thru "blue" (print "I found blue!")] ; this rule will be repeated while if finds a match

to end]

- first loop:

In a one-story blue house, there was a blue person,

a blue cat – everything was blue! What color were the stairs?

-&gt; found a match, so repeat \[thru "blue" (print "I found blue!")]

- second loop:

In a one-story blue house, there was a blue person,

a blue cat – everything was blue! What color were the stairs?

-&gt; found a match, so repeat \[thru "blue" (print "I found blue!")]

- third loop:

In a one-story blue house, there was a blue person,

a blue cat – everything was blue! What color were the stairs?

-&gt; found a match, so repeat \[thru "blue" (print "I found blue!")]

- fourth loop:

In a one-story blue house, there was a blue person,

a blue cat – everything was blue! What color were the stairs?

-&gt; found a match, so repeat \[thru "blue" (print "I found blue!")]

-&gt; NO match, so exits some loop and goes for the next rule:  to end, which is a match, because it simply goes to the end.

Since all rules found a match (some found more than one), parse returns true.

* * *

PARSE while

Definitely not for beginners, as kindly explained by Vladimir Vasilyev (@9214) from [gitter](https://gitter.im/red/help):

"

&gt;&gt; parse x: \[a 1 a 1]\[while \[ahead \['a change quote 1 2] | 'a quote 2]]

== true

&gt;&gt; x

== \[a 2 a 2]

&gt;&gt; parse x: \[a 1 a 1]\[any \[ahead \['a change quote 1 2] | 'a quote 2]]

== false

&gt;&gt; x

== \[a 2 a 1]

The main difference between while and any is that the former continues parsing even if index did not advance after successful match, while the latter fails as soon as index remained at the same position, even if match was successful.

That's why I went with ahead - it's a look-ahead rule, that matches "in advance", but keeps index where it is. In the example above, ahead \['a change quote 1 2] will match successfully, and 1 after a will be changed to 2, but the input position will not advance, because ahead looks ahead, while standing where it is now. Outcomes are:

- With while, first ahead ... changes 1 to 2 without advancing the input, but since while doesn't care about that, it goes to the next iteration, on which top-level rule will fail and backtrack (an alternate after | ) to 'a quote 2, which will match (because we've just changed   a 1  to  a 2  and advance the input, thus leading us to the end marker and successful parsing of the whole series.

<!--THE END-->

- With any, however, first ahead ... changes  1  to  2 , does not advance the input, and any, because it's picky about input advancing, bails out without going to the second iteration.

The use-case for while is a tricky one. In my experience, I used it for context-sensitive parsing (that is, you first look behind and ahead, determining the context of a token, and only then decide what to do; "looking behind and ahead requires matching various rules while standing where you are, at current position\*) and also in situations where input needs to be modified during parsing (example above), or if parsing depends on some outside state. It's also proved to be useful for deep-first traversal of tree-like structures - situation is the same, you're tinkering with node, matching some rules successfully, but the position should not advance if you've matched something, otherwise you'll loose the track of the current node.

That is, while is anything but newbie-friendly. I'd noted in your tutorials that you shouldn't worry about it if you're a newcomer, and that it is useful in advanced situations, where you need more tight control over parsing."

[&lt; Previous topic](http://helpin.red/Orderedchoices.html)                                                                                          [Next topic &gt;](http://helpin.red/Storinginput.html)
