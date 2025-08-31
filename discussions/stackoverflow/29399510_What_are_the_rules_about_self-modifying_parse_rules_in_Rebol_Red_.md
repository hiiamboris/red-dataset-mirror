# What are the rules about self-modifying parse rules in Rebol/Red?

**Link:**
<https://stackoverflow.com/questions/29399510/what-are-the-rules-about-self-modifying-parse-rules-in-rebol-red>

**Asked:** 2015-04-01 19:48:07 UTC

------------------------------------------------------------------------

I am looking at self-modifying rules and wondering what exactly the
semantics are and how they would work at all. That\'s a pretty broad
question, but I\'ll use a specific \"how would I do this\" to turn it
into a more focused one. *(\^(64) being the hex ascii for lowercase
\"d\" so it doesn\'t get found)*

    rule: ["a" "b" (insert find rule "^(64)" "c" probe rule) "d" "e"]
    parse "abcde" rule

If I run that, I get (in both Rebol and Red):

    ["a" "b" (insert find rule "d" "c" probe rule) "c" "d" "e"]
    == false

The rule seems to have been updated, and it was updated in a fairly
\"safe-seeming way\" (if there is any such thing as safe). There are
more evil versions:

    rule: ["a" "b" (clear rule probe rule) "d" "e"]
    parse "abcde" rule

In both Rebol and Red that gets:

    []
    == false

I\'m sort of confused how it doesn\'t crash. But assuming it\'s been
bulletproofed somehow, is there a way to get the first example to work?

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 2) --- by sqlab

This works

    >> rule: ["a" "b"  (insert first find rule block! "c" probe rule ) [] "d" "e"]
    == ["a" "b" (insert first find rule block! "c" probe rule) [] "d" "e"]
    >> parse "abcde" rule
    ["a" "b" (insert first find rule block! "c" probe rule) ["c"] "d" "e"]
    == true

as there are the number of rule elements and the position of the rule
cursor at the first level not changed. The second level seems to get
loaded just at entry.

This works too

    >> rule: ["a" "b"   (insert first find rule "d" "c" probe rule )  "d" "e"]
    == ["a" "b" (insert first find rule "d" "c" probe rule) "d" "e"]
    >> parse "abcde" rule
    ["a" "b" (insert first find rule "d" "c" probe rule) "cd" "e"]
    == true

**In a general form of a self modifying rule you use a variant lower
level rule you can change or replace as in**

    sub_rule: []
    rule: ["a" "b" (sub_rule: "c" probe rule) sub_rule "d" "e"]

    parse "abcde" rule
    ["a" "b" (sub_rule: "c" probe rule) sub_rule "d" "e"]
     == true

------------------------------------------------------------------------

### Answer (score: 1) --- by endo64

This might work:

    >> rule: ["a" "b" m: (insert find rule "^(64)" "c" probe rule) skip "d" "e"]

or

    >> rule: ["a" "b" m: (insert find rule "^(64)" "c" probe rule m: next m) :m "d" "e"]
    >> parse "abcde" rule
    ["a" "b" m: (insert find rule "d" "c" probe rule m: next m) :m "c" "d" "e"]
    == true

------------------------------------------------------------------------

### Answer (score: 0) --- by HostileFork says dont trust SE

> But assuming it\'s been bulletproofed somehow\...

In R3-Alpha it hasn\'t, and if you are unlucky (such as by causing a
series expansion) you can crash by doing this. See [#2214: \"Modifying
running PARSE rule leads to execution beyond rule TAIL, possible
crash\"](https://github.com/rebol/rebol-issues/issues/2214){rel="nofollow"}

So you should *not* modify a rule that is currently being processed by
PARSE. You can\--however\--modify a nested rule inside a rule if that
rule is not running at that moment:

     subrule: ["c"]
     rule: ["a" (insert subrule "b") subrule]
     parse "abc" rule

This is formalized in the [Ren-C
build](https://github.com/metaeducation/ren-c){rel="nofollow"} by
locking rules from modification while the parser is traversing them.
Another approach for the parser would be to test the length on each
fetch in the rule and abort if it was past the length. Though that would
prevent crashing, this would lead to complex and dodgy behavior\--and
degrade performance by paying for the check.

*(For similar reasons, in Ren-C you cannot modify a block currently
being executed with DO either. But by modifying a nested parentheses
group that isn\'t running you can accomplish the same workaround as with
PARSE above.)*

>     rule: ["a" "b" (clear rule probe rule) "d" "e"]
>     parse "abcde" rule
>
> I\'m sort of confused how it doesn\'t crash.

In Rebol\'s R3-Alpha, this particular case doesn\'t crash or complain
because it doesn\'t reclaim the memory in the series *unless it expands
and requires a new allocation*. It merely writes a terminator at the
head position of the series (overwriting the \"a\") and adjusts a cached
length. PARSE ignores the length and only looks for an END marker. So it
kept going until it found the stale old end marker.

To see that, you could have also tried:

    >> rule: ["a" "b" (clear rule) "c" "d" "e"]
    == ["a" "b" (clear rule) "c" "d" "e"]

    >> parse "abcde" rule
    == true

You\'re basically using values that are in garbage memory.

*Comment by Anderson Green:* If a grammar in Rebol is
\"self-modifying,\" then it is essentially an [adaptive
grammar](https://en.wikipedia.org/wiki/Adaptive_grammar){rel="nofollow noreferrer"}.

------------------------------------------------------------------------

## Comments on question

*Comment by endo64:* What about SKIPing the inserted char? rule: \[\"a\"
\"b\" (insert find rule \"d\" \"c\" probe rule) skip \"d\" \"e\"\] ;this
returns true
