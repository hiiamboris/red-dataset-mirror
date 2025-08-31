
#2387: [feature request] Allow `split` on blocks
================================================================================
Issue is open, was reported by maximvl and has 18 comment(s).
[status.reviewed] [type.task.wish] [type.design]
<https://github.com/red/red/issues/2387>

Currently `split` doesn't accept `block!` arguments:
```
red>> split [a y 1 z] 'y
*** Script Error: split does not allow block! for its series argument
*** Where: split
```
I suggest to make it work on blocks like this:
```
red>> split [a y 1 z] 'y
== [[a] [1 z]]
```


Comments:
--------------------------------------------------------------------------------

On 2016-12-31T13:33:13Z, meijeru, commented:
<https://github.com/red/red/issues/2387#issuecomment-269865234>

    Interesting generalization. Since `split` is a function (i.e. not a native or an action) it should be possible (for yourself?) to provide the necessary code and submit it.

--------------------------------------------------------------------------------

On 2017-02-14T15:56:10Z, dockimbel, commented:
<https://github.com/red/red/issues/2387#issuecomment-279747826>

    The current `split` function is a temporary minimalist implementation. We want a much more capable version, but it is low-priority for us right now. Please submit improvement to current `split` through PR, we will gladly accept it if it is backward-compatible and lightweight enough (don't submit 100+ LOC for that, in such case, propose it first as a gist in red/red room for prior discussion).
    
    IIRC, @greggirwin has a more sophisticate version, maybe even dialected?

--------------------------------------------------------------------------------

On 2017-02-14T17:02:08Z, greggirwin, commented:
<https://github.com/red/red/issues/2387#issuecomment-279768463>

    I do. I designed and worked on the one that is in R3 with Gabriele. It's big though because it was meant to be flexible. I'll dust it off and post it somewhere.

--------------------------------------------------------------------------------

On 2017-02-14T17:04:23Z, greggirwin, commented:
<https://github.com/red/red/issues/2387#issuecomment-279769107>

    Found it: https://gist.github.com/greggirwin/66d7c6892fc310097cd91ab354189542
    
    Probably needs a review, but it gives you the idea.

--------------------------------------------------------------------------------

On 2017-02-14T17:05:45Z, greggirwin, commented:
<https://github.com/red/red/issues/2387#issuecomment-279769520>

    I have a different, small, `split-at` func for what Maxim is asking about.

--------------------------------------------------------------------------------

On 2017-02-14T17:20:06Z, greggirwin, commented:
<https://github.com/red/red/issues/2387#issuecomment-279773690>

    ```
    split-at: function [
    	"Split the series at a position or value, returning the two halves."
    	series [series!]
    	value  "Delimiting value, or index if an integer"
    	/only  "Treat value as single value if a series, and as a literal value, not index, if an integer"
    	/tail  "Split at delim's tail, if splitting by value"
    	/last  "Split at the last occurrence of value, from the tail"
    ][
    	copy-to: func [end] [copy/part series end]
    	reduce either all [integer? value  not any [only tail last]] [
    		[copy-to value  copy at series value + 1]
    	][
    		pos: either tail [find/tail series value] [find series value]
    		[copy-to pos  copy pos]
    	]
    ]
    ```
    e.g.:
    ```
    [split-at [1 2 3 4 5 6 3 7 8] 3] == [[1 2 3] [4 5 6 3 7 8]]
    [split-at/tail [1 2 3 4 5 6 3 7 8] 3] == [[1 2 3] [4 5 6 3 7 8]]
    [split-at/only [1 2 3 4 5 6 3 7 8] 3] == [[1 2] [3 4 5 6 3 7 8]]
    
    red>> split-at [a y 1 z] 'y
    == [[a] [y 1 z]]
    red>> split-at/tail [a y 1 z] 'y
    == [[a y] [1 z]]
    ```
    
    I have a lot of variations I've tried. One design question is whether to remove the split value, or offer a refinement to do so.

--------------------------------------------------------------------------------

On 2017-02-14T17:22:44Z, greggirwin, commented:
<https://github.com/red/red/issues/2387#issuecomment-279774424>

    I also have `split-parts`, which handles a subset of `split's` functionality, as I looked at breaking the single big func apart into more specific splitters, so `split` itself became more of a dispatcher to those.

--------------------------------------------------------------------------------

On 2020-08-04T13:47:24Z, 9214, commented:
<https://github.com/red/red/issues/2387#issuecomment-668606516>

    To get the ball rolling, the proposed `split` implementation and tests can be ported to Red (maybe not in body but in spirit, e.g. compiler will choke on functions within function). Any volunteers?

--------------------------------------------------------------------------------

On 2020-10-14T00:33:24Z, greggirwin, commented:
<https://github.com/red/red/issues/2387#issuecomment-708083323>

    I volunteer. May be a bit while I catch up with things, but I need to code *something*. :^)

