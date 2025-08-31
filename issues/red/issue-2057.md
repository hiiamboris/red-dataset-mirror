
#2057: Functions that need time! support added
================================================================================
Issue is closed, was reported by greggirwin and has 16 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/2057>

mod modulo
even? odd?
absolute negate
negative? positive? zero?
pick first second third
min max
sign? (TBD)



Comments:
--------------------------------------------------------------------------------

On 2016-06-21T21:48:04Z, meijeru, commented:
<https://github.com/red/red/issues/2057#issuecomment-227582846>

    If negative? and positive? are added, I think sign? should be too, but then also for number! types.

--------------------------------------------------------------------------------

On 2016-06-24T16:00:04Z, dockimbel, commented:
<https://github.com/red/red/issues/2057#issuecomment-228385601>

    `pick first second third` now support time!.

--------------------------------------------------------------------------------

On 2017-03-21T23:43:59Z, Oldes, commented:
<https://github.com/red/red/issues/2057#issuecomment-288254218>

    `absolute negate mod modulo sign?` also already support time!

--------------------------------------------------------------------------------

On 2017-03-22T09:24:14Z, Oldes, commented:
<https://github.com/red/red/issues/2057#issuecomment-288342094>

    I'm not sure if to support `even?` and `odd?` for decimal numbers - so for time too. Rebol converts the decimal value to integer before even/odd test. Should we do the same in Red?

--------------------------------------------------------------------------------

On 2017-03-22T09:27:41Z, Oldes, commented:
<https://github.com/red/red/issues/2057#issuecomment-288342919>

    `zero?` is now in Red just an ordinary function.. don't we want to make it native?

--------------------------------------------------------------------------------

On 2017-03-22T11:15:15Z, dockimbel, commented:
<https://github.com/red/red/issues/2057#issuecomment-288368128>

    `even?` and `odd?`, yes we can do the implicit conversion to integer. 
    
    For `zero?`, we could yes, though, it's not high-priority for now.

--------------------------------------------------------------------------------

On 2017-03-22T12:20:14Z, Oldes, commented:
<https://github.com/red/red/issues/2057#issuecomment-288381836>

    Just wanted to know if you will merge it, if I do it, or if you are still in the mode _not to add anything we really don't need now_

--------------------------------------------------------------------------------

On 2017-03-23T22:25:13Z, Oldes, commented:
<https://github.com/red/red/issues/2057#issuecomment-288879155>

    @dockimbel  In the pull request is now also implemented `odd?` and `even?` on `float!` and `time!` and `zero?` as a native with `time!` and additionally `char!` support. So it is more than requested in this issue.

