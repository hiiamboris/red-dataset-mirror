
#324: function constructor: /extern words are not checked against formal arguments
================================================================================
Issue is open, was reported by meijeru and has 20 comment(s).
[type.bug] [status.reviewed]
<https://github.com/red/red/issues/324>

`f: function [a [integer!] /extern [a]][a: 1]` is compiled without protest



Comments:
--------------------------------------------------------------------------------

On 2016-09-13T09:20:22Z, rebolek, commented:
<https://github.com/red/red/issues/324#issuecomment-246624338>

    0.6.1 can compile this function without any error raised.

--------------------------------------------------------------------------------

On 2018-12-02T21:59:00Z, hiiamboris, commented:
<https://github.com/red/red/issues/324#issuecomment-443546125>

    0.6.4:
    compiles `/extern [a]` without an error, `/extern a` reports an error
    interprets both `/extern [a]` and `/extern a` without an error

--------------------------------------------------------------------------------

On 2018-12-03T18:21:59Z, meijeru, commented:
<https://github.com/red/red/issues/324#issuecomment-443813736>

    But... `/extern [a]` is not recognized, resulting in `a` being local!, whereas `/extern a` has the desired effect. 

--------------------------------------------------------------------------------

On 2018-12-05T00:30:46Z, greggirwin, commented:
<https://github.com/red/red/issues/324#issuecomment-444312108>

    Do we have a spec that says `/extern [a]` is supported syntax?

--------------------------------------------------------------------------------

On 2018-12-05T09:52:39Z, hiiamboris, commented:
<https://github.com/red/red/issues/324#issuecomment-444425543>

    The point is to report an error in both cases. Which is doesn't.

--------------------------------------------------------------------------------

On 2018-12-05T17:52:30Z, greggirwin, commented:
<https://github.com/red/red/issues/324#issuecomment-444579473>

    Agreed. I thought you meant it should be supported, or that it was an open question. 

--------------------------------------------------------------------------------

On 2019-09-11T15:24:57Z, dockimbel, commented:
<https://github.com/red/red/issues/324#issuecomment-530432161>

    FYI, `/extern [...]` was the original syntax for specifying externals in Red. It then drifted away towards a Rebol-compatible syntax, without making a clear decision about which one is the best to support.
    
    Using a block for external words makes it way simpler and faster for the interpreter to process the function spec. Though, it is not consistent with how locals are specified, and probably more of a burden for end users.
    
    What do you think?

--------------------------------------------------------------------------------

On 2019-09-11T15:36:51Z, 9214, commented:
<https://github.com/red/red/issues/324#issuecomment-530437474>

    `/extern` use-cases are pretty rare in my experience, typically for escaping 1 or 2 words. With that said, I don't think that it should be overburdened with `[...]` syntax. OTOH, existing Rebol syntax confuses new users, who think that it's a refinement like e.g. `/local`.

--------------------------------------------------------------------------------

On 2019-09-11T16:27:03Z, dockimbel, commented:
<https://github.com/red/red/issues/324#issuecomment-530458402>

    > OTOH, existing Rebol syntax confuses new users, who think that it's a refinement like e.g. /local.
    
    That's a good argument for keeping new users away from `function`, and make them use `func` only until they master the basic concepts.

--------------------------------------------------------------------------------

On 2019-09-11T19:16:52Z, endo64, commented:
<https://github.com/red/red/issues/324#issuecomment-530525640>

    Keeping `/extern` consistent with `/local` looks better to me, we don't need much speed on interpreter since `function`s with `/extern` is a rare case.

