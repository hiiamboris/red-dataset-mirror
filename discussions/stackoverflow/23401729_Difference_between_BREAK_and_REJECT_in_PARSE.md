# Difference between BREAK and REJECT in PARSE

**Link:**
<https://stackoverflow.com/questions/23401729/difference-between-break-and-reject-in-parse>

**Asked:** 2014-05-01 03:48:23 UTC

------------------------------------------------------------------------

Both in
[Rebol](http://www.rebol.com/r3/docs/concepts/parsing-summary.html#section-3){rel="nofollow"}
and
[Red](http://www.red-lang.org/2013/11/041-introducing-parse.html){rel="nofollow"},
there are two PARSE key words: `break` and `reject` which have similar
behavior: *break out of a match loop (such as any, some, while)*, the
difference is that `break` *always indicating* **success** while
`reject` *indicate* **failure**. I know what it means literally, but
can\'t figure out a proper scenario where which of the two keywords
should be used.

    blk: [ 1 #[none] 2 #[none] #[none] 4 5 6 #[none] ]
    count: 0
    result: parse blk [
        any [ 
                remove none! insert 2 
                if ((count: count + 1) >= 2) break
                | 
                skip
        ]
    ]
    probe blk          ;will get [1 0 2 0 none 4 5 6 none]
    probe result       ;will get false
    probe count        ;will get 2

In the code above, either `break` or `reject` will produce the same
result.

So anyone can show me what is the difference between these two keywords?

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 3) --- by Graham Chiu

The truth value produced by `break` depends on whether the minimum
number of iterations in an iterative rule have been reached or not.

    >> parse "aaabbb"  [ some [ "a" break ] to end]
    == true

Here we have matched \"a\" at least once, and then broken out of the
some rule and continued to the end. This is true.

    >> parse "aaabbb"  [ some [ "a" reject ] to end]
    == false

Here although we matched \"a\" once, reject causes the some rule to
fail.

See [Carl\'s
blog](http://www.rebol.net/cgi-bin/r3blog.r?view=0277){rel="nofollow"}
for more details.

------------------------------------------------------------------------

## Comments on question
