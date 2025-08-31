
#2907: WHILE keyword in PARSE stops looping at the tail of the input series.
================================================================================
Issue is closed, was reported by rgchris and has 10 comment(s).
[status.built] [status.tested] [type.wish]
<https://github.com/red/red/issues/2907>

The [definition]() of WHILE states: *"repeat rule zero or more times until failure regardless of input advancing."* However WHILE also stops repeating when the input series reaches the tail even though the rule, if tested, would not fail.

```rebol
parse "" [while []]
        ; would result in infinite loop

parse "" [while [end ()]]
        ; would result in infinite loop

parse "aaa" [while ["a" | end (probe 'end) fail]]
        ; would process if the sequence of A's ended at the tail
```

*('end is not probed)*

It is difficult to reproduce this behaviour otherwise.


Comments:
--------------------------------------------------------------------------------

On 2017-07-22T05:06:18Z, dockimbel, commented:
<https://github.com/red/red/issues/2907#issuecomment-317155843>

    @rgchris Your "definition" link is wrong.
    
    Red Parse has some infinite loop prevention checkings built in, they might be interfering with some edge cases like that one.

--------------------------------------------------------------------------------

On 2017-07-22T06:20:44Z, rgchris, commented:
<https://github.com/red/red/issues/2907#issuecomment-317159620>

    D'oh! A loop in and of itself :)
    
    Defined [here](http://www.red-lang.org/2013/11/041-introducing-parse.html)...

--------------------------------------------------------------------------------

On 2017-07-22T06:22:36Z, rgchris, commented:
<https://github.com/red/red/issues/2907#issuecomment-317159714>

    I wrote [this example](https://gist.github.com/rgchris/67cd497c097d7ff768a15424057bbdea) as a reduced version of something I'm working on that breaks. Works as-is in Rebol 3 (from rebolsource.net) with adapted header. *Also in that example, the `mark` part also seems to stop the `while` loop.*

--------------------------------------------------------------------------------

On 2018-03-17T10:49:32Z, dockimbel, commented:
<https://github.com/red/red/issues/2907#issuecomment-373911094>

    I have implemented your proposition in a local Red branch to experiment with it. After such change, basically, you need to have a failed rule, or use an explicit `break` or `fail` in order to exit the `while` loop.  So, it is very easy then to run into an infinite loop.
    
    Do you have any example in Rebol3, where you can exit from a `while` loop in a different way?

--------------------------------------------------------------------------------

On 2018-03-17T12:25:50Z, dockimbel, commented:
<https://github.com/red/red/issues/2907#issuecomment-373916322>

    I have decided to implement your proposal for two reasons:
    * Make `while` more useful by making its semantics more different than `any`.
    * Be compatible with `while` implementation in R3 and old `any` semantics in R2.

