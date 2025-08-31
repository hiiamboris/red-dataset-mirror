# Garbage collection in Rebol &amp; Red

**Link:**
<https://stackoverflow.com/questions/46204102/garbage-collection-in-rebol-red>

**Asked:** 2017-09-13 18:01:01 UTC

------------------------------------------------------------------------

Do [Rebol](http://www.rebol.com){rel="nofollow noreferrer"} and
[Red](http://www.red-lang.org/){rel="nofollow noreferrer"} have
automatic or manual methods for garbage collection or memory management
to avoid system crashes?

If so, what are the methods that can be called manually to clear up
memory problems?

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 1) --- by sqlab

Rebol has garbage collection [see
recycle](http://www.rebol.com/docs/words/wrecycle.html){rel="nofollow noreferrer"}
,

Red will get it, [see
trello](https://trello.com/b/FlQ6pzdB/red-tasks-overview){rel="nofollow noreferrer"}

*Comment by rnso:* That is great news. Please see my compile question
also:
[stackoverflow.com/questions/46210235/...](https://stackoverflow.com/questions/46210235/compile-rebol-code-to-executable "compile rebol code to executable")

*Comment by Maciej Łoziński:* Red already has a simple garbage
collector:
[red-lang.org/2018/12/...](https://www.red-lang.org/2018/12/064-simple-gc-and-pure-red-gui-console.html){rel="nofollow noreferrer"}

------------------------------------------------------------------------

## Comments on question

*Comment by HostileFork says dont trust SE:* *\"Rebol \... seem to be
new programming languages\"* =\> depends on your standards for \"new\".
Rebol 1.0 was [released in
1997](https://en.wikipedia.org/wiki/Rebol){rel="nofollow noreferrer"},
20 years ago at time of writing.
