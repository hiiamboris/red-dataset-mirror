
#4397: Make TIME! with negative hours
================================================================================
Issue is closed, was reported by Oldes and has 22 comment(s).
[status.built] [status.tested] [type.design]
<https://github.com/red/red/issues/4397>

**To reproduce**
```red
>> t: make time! [1 2 3]
== 1:02:03
>> t/hour
== 1
>> t/minute
== 2
>> t: make time! [-1 2 3]
== -0:57:57 ;<--- should be: -1:02:03
>> t/hour
== 0 ;<---- should be -1
>> t/minute
== 57 ;<---- should be 2
```


Comments:
--------------------------------------------------------------------------------

On 2020-04-12T00:04:48Z, greggirwin, commented:
<https://github.com/red/red/issues/4397#issuecomment-612539721>

    See https://gitter.im/red/bugs?at=5e9203331aaf8e4b8e774740
    
    This isn't a right/wrong issue, but a choice.

--------------------------------------------------------------------------------

On 2020-04-16T22:12:37Z, endo64, commented:
<https://github.com/red/red/issues/4397#issuecomment-614923771>

    Similar to R2's behavior with one difference:
    
    ```
    >> t: make time! [-1 2 3]
    == -0:57:57
    >> t/hour: -1
    == -1
    >> t
    == -1:57:57 (R2)
    == -0:57:57 (Red)
    >> t/hour: -5
    == -5
    >> t
    == -5:57:57 (R2)
    == -4:57:57 (Red)
    ```

--------------------------------------------------------------------------------

On 2021-09-17T16:19:14Z, dockimbel, commented:
<https://github.com/red/red/issues/4397#issuecomment-921921549>

    I think the R3 way is more human-friendly. Though, semantics for negative time! values are not well-defined in any Redbol incarnation.

--------------------------------------------------------------------------------

On 2021-09-17T18:21:20Z, greggirwin, commented:
<https://github.com/red/red/issues/4397#issuecomment-921993497>

    R3 also doesn't let you assign negative values to time segments, even hours. Time is another one of those cases where Rebol got the most common bits right enough that we rarely hit edge cases where people do things that don't make much sense. I'll draft some design notes.

--------------------------------------------------------------------------------

On 2021-09-18T13:37:39Z, dockimbel, commented:
<https://github.com/red/red/issues/4397#issuecomment-922277711>

    I've implemented the R3 way:
    ```
    >> t: make time! [-1 2 3]
    == -1:02:03
    >> t/hour
    == -1
    ```

--------------------------------------------------------------------------------

On 2021-09-18T17:47:02Z, greggirwin, commented:
<https://github.com/red/red/issues/4397#issuecomment-922346059>

    I drafted some notes, for future spec use: [time.txt](https://github.com/red/red/files/7190410/time.txt)

--------------------------------------------------------------------------------

On 2023-06-14T20:30:28Z, hiiamboris, commented:
<https://github.com/red/red/issues/4397#issuecomment-1591933568>

    Current implementation has some serious flaws, mainly the /hour mentioned above:
    ```
    >> t/hour: 0 t/hour
    == 0
    >> t/hour: -1 t/hour
    == 0
    >> t/hour: -2 t/hour
    == -1
    ```
    And inability to make sub-hour negative times using `make` from block spec:
    ```
    >> make time! [0 0 -3]
    *** Script Error: cannot MAKE/TO time! from: [0 0 -3]
    *** Where: make
    *** Near : make time! [0 0 -3]
    *** Stack:  
    
    >> make time! [-0.0 0 3]
    *** Script Error: cannot MAKE/TO time! from: [-0.0 0 3]
    *** Where: make
    *** Near : make time! [-0.0 0 3]
    *** Stack: 
    ```
    Also accessors sign varies:
    ```
    >> t: -1:2:3
    == -1:02:03
    >> print [t/hour t/minute t/second]
    -1 2 -3.0
    ```

--------------------------------------------------------------------------------

On 2023-06-14T20:49:13Z, dockimbel, commented:
<https://github.com/red/red/issues/4397#issuecomment-1591962284>

    You should have opened a new ticket and linked it to this closed one...

--------------------------------------------------------------------------------

On 2023-06-14T20:52:56Z, hiiamboris, commented:
<https://github.com/red/red/issues/4397#issuecomment-1591968869>

    Isn't it all part of the same make time with negative hours issue?

--------------------------------------------------------------------------------

On 2023-06-14T21:00:47Z, dockimbel, commented:
<https://github.com/red/red/issues/4397#issuecomment-1591978158>

    The original issue reported in this ticket has been fixed. If there was a regression on that same issue (does not seem to be the case), then it's legit to expand this ticket and reopen it. Any other case requires a new ticket (with an eventual link to this one, as the issues _seem_ to be close/related, but are not the exact same).

--------------------------------------------------------------------------------

On 2023-06-14T21:09:15Z, hiiamboris, commented:
<https://github.com/red/red/issues/4397#issuecomment-1591988924>

    Ok done https://github.com/red/red/issues/5336

