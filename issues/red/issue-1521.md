
#1521: Linear Interpolation function
================================================================================
Issue is closed, was reported by Skrylar and has 10 comment(s).
[type.wish]
<https://github.com/red/red/issues/1521>

A `lerp` function should be added to Red, to handle linear interpolation.

Why?
LERPs are very common operations when doing graphical work (one example is alpha blending between two colors.) 

A potential implementation:

```
; Performs a linear interpolation between `from-value` and `to-value`.
lerp: func [
   from-value [integer! float!]
   to-value [integer! float!]
   amount [float! percent!]
][
   from-value + ((to-value - from-value) * amount)
]
```

(Taken from Ralette's lerp function. Obviously could use some refinements for integer rounding and docstrings; I'm not well educated on how to set those up.)



Comments:
--------------------------------------------------------------------------------

On 2016-05-16T18:21:59Z, greggirwin, commented:
<https://github.com/red/red/issues/1521#issuecomment-219503584>

    I have some old R2 code along these lines:
    
    ```
    make-linear-interpolater: func [
        src-min  [number!]
        src-max  [number!]
        dest-min [number!]
        dest-max [number!]
        /local src-range dest-range scale
    ][
        src-range: src-max - src-min
        dest-range: dest-max - dest-min
        scale: dest-range / src-range
        func [value [number!]] compose/deep [
            add (dest-min) (to paren! compose [value - (src-min)]) * (scale)
        ]
    ]
     lin-terp-fn: make-linear-interpolater 0 10 -1 0
     for i 0 10 1 [print [i lin-terp-fn i]]
     lin-terp-fn: make-linear-interpolater 0 200 20 50
     for i 0 200 20 [print [i lin-terp-fn i]]
    ```

--------------------------------------------------------------------------------

On 2016-05-16T18:28:17Z, greggirwin, commented:
<https://github.com/red/red/issues/1521#issuecomment-219505391>

    Skrylar, I do agree that certain things can add value without adding too much weight. It's figuring out how best to organize things (naming is always a big challenge) and see what the Red module system brings us. e.g. I have a few aggregator funcs, ala DTrace, that I think could be generally handy in this day and age of data collection and analysis (not to mention development and debugging).

--------------------------------------------------------------------------------

On 2016-05-16T18:30:07Z, greggirwin, commented:
<https://github.com/red/red/issues/1521#issuecomment-219505915>

    But, before these, we should have `sum`, `avg`, and a few others. :^)

--------------------------------------------------------------------------------

On 2016-05-16T19:29:46Z, Skrylar, commented:
<https://github.com/red/red/issues/1521#issuecomment-219522290>

    I don't much care what you do with it (or how much punting around people want to do.) It's free code I wrote last year, and it's clear nobody wanted it.

--------------------------------------------------------------------------------

On 2016-05-16T20:42:44Z, greggirwin, commented:
<https://github.com/red/red/issues/1521#issuecomment-219541528>

    I wouldn't say that's clear at all. I just found it and support the idea. Team Red is incredibly busy, and the mezzanine level stuff hasn't become a priority yet. 

