
#2863: spec block for make date! is treated differently from most other spec blocks
================================================================================
Issue is closed, was reported by meijeru and has 6 comment(s).
<https://github.com/red/red/issues/2863>

A `word!`  value in the spec block for `make date!`  is replaced by its value. In most spec blocks, e.g. for `make time!` this is not the case.
```
>> harvest: 8
== 8
>> make date! [1 harvest 2017]
== 1-Aug-2017
>> midday: 12
== 12
>> make time! [midday 0 0]
*** Script Error: cannot MAKE/TO time! from: [midday 0 0]
*** Where: make
*** Stack: 
>> make time! reduce [midday 0 0]
== 12:00:00
```
As the example shows, `reduce` will also substitue the `word!` value, and of course do much more. It is not clear why the words in the date spec block are treated specially when reduce is available.


Comments:
--------------------------------------------------------------------------------

On 2017-07-07T21:15:50Z, greggirwin, commented:
<https://github.com/red/red/issues/2863#issuecomment-313795011>

    Maybe in anticipation of allowing month names to be used? e.g. `[1 jan 2017]`

--------------------------------------------------------------------------------

On 2017-07-07T21:49:22Z, meijeru, commented:
<https://github.com/red/red/issues/2863#issuecomment-313801298>

    But that would imply defining these month names in the global context. And everything can still be done by `reduce`.

--------------------------------------------------------------------------------

On 2017-07-08T04:41:14Z, dockimbel, commented:
<https://github.com/red/red/issues/2863#issuecomment-313833290>

    This is part of a move to allow spec block arguments to `make` to accept also words, removing the need to rely on `reduce` for just resolving words.

