
#2927: COLLECT/INTO adds to the tail of the COLLECTED block
================================================================================
Issue is open, was reported by rgchris and has 20 comment(s).
[type.task.wish]
<https://github.com/red/red/issues/2927>

Would expect to insert new values at the index of the given block:

```
>> also target: [] repeat x 3 [collect/into [keep x] target]
== [1 2 3]
```

Expected:

```
>> also target: [] repeat x 3 [collect/into [keep x] target]
== [3 2 1]
```



Comments:
--------------------------------------------------------------------------------

On 2017-07-25T00:13:54Z, greggirwin, commented:
<https://github.com/red/red/issues/2927#issuecomment-317590915>

    You can see in the source of `collect` that `append` is used. Different than R3. The `/into` doc string does say "insert", so maybe that should be changed. 

--------------------------------------------------------------------------------

On 2017-07-25T00:18:35Z, greggirwin, commented:
<https://github.com/red/red/issues/2927#issuecomment-317591614>

    Different use cases. Insert does allow more control from the outside.

--------------------------------------------------------------------------------

On 2017-07-25T03:49:38Z, dockimbel, commented:
<https://github.com/red/red/issues/2927#issuecomment-317621043>

    Relates to #2189.
    
    Changing the `/into` behavior would need to be done everywhere at the same time.

--------------------------------------------------------------------------------

On 2017-07-25T05:33:50Z, rgchris, commented:
<https://github.com/red/red/issues/2927#issuecomment-317634151>

    @dockimbel My bad, I did a search for 'collect into' before posting, didn't see that in the results...

--------------------------------------------------------------------------------

On 2020-07-15T10:49:26Z, hiiamboris, commented:
<https://github.com/red/red/issues/2927#issuecomment-658697486>

    I vote for appending behavior, for it being the most common case and not letting you shoot yourself into the foot performance-wise. When insertion is required, `insert <here> collect` will do it in a single operation.

--------------------------------------------------------------------------------

On 2020-07-15T18:28:46Z, greggirwin, commented:
<https://github.com/red/red/issues/2927#issuecomment-658930324>

    How is this for a new `/into` doc string?
    
    "Append to a buffer instead of creating a new block"

--------------------------------------------------------------------------------

On 2020-07-15T18:45:57Z, greggirwin, commented:
<https://github.com/red/red/issues/2927#issuecomment-658938612>

    Or "Put results in out block, instead of creating a new block."
    
    Here `out` is the param name used in `load/into`. We should sync up the param name and doc strings for all `/into` cases if possible.  `Transcode` uses `dst`, `output` is clearer than `out`, maybe `output`? `Out` is not a normal noun, and doesn't read well to me, e.g.:
    
    ```
        out: case [
            part [transcode/part source length] 
            next [
                set position second out: transcode/next source 
                return either :all [reduce [out/1]] [out/1]
            ] 
            'else [transcode source]
        ] 
        either trap [out] [
            unless :all [if 1 = length? out [out: out/1]] 
            out
        ]
    ```
    
    Providing a target buffer is a pattern used in other cases as well, it would be fantastic to find a good name we can add to recommendations in the style guide. I don't like `buf/buffer` and `dest` as much where it's used for a return value. For a modified arg, optional or not, that is changed as a side effect, those are OK, but more precise names may be even better. e.g. a function that logs actions taken in addition to a result.
    
    `Output`  as the `/into` param name?

--------------------------------------------------------------------------------

On 2020-07-15T19:01:32Z, greggirwin, commented:
<https://github.com/red/red/issues/2927#issuecomment-658946250>

    https://github.com/red/red/wiki/%5BDOC%5D-Coding-Style-Guide#common-refinement-names section added. In just quick searches, it turned up a number of cases where names are not consistent. Pretty good overall, but worth noting. Something @meijeru might already have in a list somewhere.

--------------------------------------------------------------------------------

On 2025-03-19T13:37:20Z, rebolek, commented:
<https://github.com/red/red/issues/2927#issuecomment-2736679447>

    > I vote for appending behavior, for it being the most common case and not letting you shoot yourself into the foot performance-wise. When insertion is required, `insert <here> collect` will do it in a single operation.
    
    I disagree as it goes against the purpose of `into`. `insert <here> collect` needs creation of a new buffer before inserting it on desired position. `append` behaviour can be easily emulated with `insert` but not vice-versa.

--------------------------------------------------------------------------------

On 2025-03-19T17:26:38Z, hiiamboris, commented:
<https://github.com/red/red/issues/2927#issuecomment-2737481065>

    @rebolek I suggest reading the discussion in https://github.com/red/red/issues/3340 to understand my vote deeper. But TL;DR: don't assume, benchmark :)

