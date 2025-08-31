
#5606: Improve path evaluation error message
================================================================================
Issue is closed, was reported by greggirwin and has 18 comment(s).
[status.built] [status.tested] [type.wish]
<https://github.com/red/red/issues/5606>

Red inherited this from Rebol:
```
>> a: [a b c]
== [a b c]
>> a/4/1/24/11
*** Script Error: path a/4/1/24/11 is not valid for none! type
*** Where: catch
*** Near : a/4/1/24/11
*** Stack:  
```
R3 does this:
```
>> a/4/1/24/11

** Script error: cannot access 4 in path a/4/1/24/11
```
Which is nicer. `a/4` still returns none, so it might be even better as cannot access `4/1...`

Then Henrik said "What about a/4/4/4/4?" so I thought of this:
`a/4/4 returned none, so a/4/4/4 couldn't be accessed.`


Comments:
--------------------------------------------------------------------------------

On 2025-03-31T20:44:38Z, greggirwin, commented:
<https://github.com/red/red/issues/5606#issuecomment-2767357239>

    @dockimbel noted that it shouldn't be too hard to do, but compiled code will lose contextual info, so may not work there.

--------------------------------------------------------------------------------

On 2025-04-04T21:46:22Z, dockimbel, commented:
<https://github.com/red/red/issues/5606#issuecomment-2779783046>

    Implemented:
    ```
    >> a: [a b c]
    == [a b c]
    >> a/4/1/24/11
    *** Script Error: a/4 returned a none! value, so a/4/1/24/11 could not be accessed
    *** Where: catch
    *** Near : a/4/1/24/11
    *** Stack:
    ```
    
    Two remarks:
    1. It's reporting the type instead of the value that is causing the error. I thought that values may be long and in some cases move far away the rest of the error message. On second thought, the values that would be causing such error are usually short, so I let you decide which option is the best: report the value or its type only.
    
    2. I have removed the tail dot from your message for sake of consistency with all the other error messages. A while ago, I recall pondering about injecting that tail dot in all messages (just one extra LOC). What do you think?

--------------------------------------------------------------------------------

On 2025-04-04T22:30:15Z, greggirwin, commented:
<https://github.com/red/red/issues/5606#issuecomment-2779829321>

    I agree with your choices. Noting the type may be even more useful in many cases. It is more general, and we will learn more as we use it in real life.
    
    The missing dot has never bothered me. Just happened to be the way I wrote it.
    
    Thanks!

--------------------------------------------------------------------------------

On 2025-04-04T22:57:48Z, dockimbel, commented:
<https://github.com/red/red/issues/5606#issuecomment-2779871969>

    Last remark: compiled code will behave unchanged. It would be possible to retain the original path in the compile code, but it's significant work and I'm still aiming at dropping the Red compiler asap.

--------------------------------------------------------------------------------

On 2025-04-04T23:06:49Z, greggirwin, commented:
<https://github.com/red/red/issues/5606#issuecomment-2779879912>

    Just built and tested (interpreted). I like it! Even just that makes a big difference IMO, so no worries about the compiler change.

--------------------------------------------------------------------------------

On 2025-04-05T07:05:27Z, dockimbel, commented:
<https://github.com/red/red/issues/5606#issuecomment-2780365474>

    The only downside of such new error reporting is the need for creating an extra path to be able to display a cut version of it. This means GC pressure if such error is generated intensively in a loop with a `try` catching it... 
    
    I know of at least one case where that happens (though not that intensively), it's in the [reactivity code](https://github.com/red/red/blob/master/environment/reactivity.red#L81) (which now will cost more memory to run).

--------------------------------------------------------------------------------

On 2025-04-05T07:06:51Z, hiiamboris, commented:
<https://github.com/red/red/issues/5606#issuecomment-2780366366>

    Compared to the pressure from a new error object, should be negligible ;)

--------------------------------------------------------------------------------

On 2025-04-05T07:12:12Z, dockimbel, commented:
<https://github.com/red/red/issues/5606#issuecomment-2780370195>

    Sure, but I don't see how that could be avoided. I don't see any possible lazy approach to it.

--------------------------------------------------------------------------------

On 2025-04-05T07:40:43Z, hiiamboris, commented:
<https://github.com/red/red/issues/5606#issuecomment-2780394600>

    Simple improvements could be:
    - not using hash for errors (and small objects)
    - defer error creation until it one of its fields is accessed (e.g. by mold), just throw some stub containing a copy of the current stack
    - get error from a free list
    
    Ren-C went stackless because WebAssembly stack was way too limiting to be of any practical use. That should improve error capturing behavior. But as of now to me it seems to be an overkill for general purpose programming.
    
    Also not a priority right now.

