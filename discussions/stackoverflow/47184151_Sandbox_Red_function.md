# Sandbox Red function

**Link:**
<https://stackoverflow.com/questions/47184151/sandbox-red-function>

**Asked:** 2017-11-08 15:56:30 UTC

------------------------------------------------------------------------

I\'m planning to write an application for managing a game-server in
[Red](http://www.red-lang.org/){rel="nofollow noreferrer"}. It should be
extendable by using interpreted Red scripts. Now, I want to set
restrictions for this scripts (I want to \"sandbox\" them) and remove
specific functionality like I/O, and some other functions.

I know that in Rebol such things are archived using `secure`, but is
something similar possible in Red too? I\'ve already done some
experiments with `context`s, but I just don\'t get it.

Thank you.

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 1) --- by rebolek

Red is probably not at the point the will satisfy your needs yet.
`secure` will be added in future versions, but right now you can change
everything, if you really want to. Remember, it is still alpha version.

You can take a look at [this
article](http://red.qyz.cz/safe-and-persistent-locals.html){rel="nofollow noreferrer"}
that describes some ways to make changing stuff harder (but not
impossible) in the meantime.

*Comment by nickkoro:* Hm\... than I probably have to write it in
Rebol\... Well, thank you for your answer and the helpful link.

------------------------------------------------------------------------

## Comments on question
