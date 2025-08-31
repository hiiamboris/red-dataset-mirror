
#3910: Wrong error message when using foreach wrongly on map
================================================================================
Issue is closed, was reported by meijeru and has 8 comment(s).
<https://github.com/red/red/issues/3910>

**Describe the bug**
`foreach` on a map value should provide a block of 2 words as counters. If only one word is given, the error message is not clear and even misleading

**To reproduce**
```
>> m: #(a: 1)
== #(
    a: 1
)
>> foreach p m []
*** Script Error: foreach does not allow map! for its 'word argument
*** Where: foreach
```

**Expected behavior**
```
*** Script Error: foreach requires a block of 2 words for its 'word argument
```

**Platform version (please complete the following information)**
```
all
```



Comments:
--------------------------------------------------------------------------------

On 2019-06-04T17:44:47Z, greggirwin, commented:
<https://github.com/red/red/issues/3910#issuecomment-498773071>

    Good catch. It's better, but can't be entirely specific without adding a new error, if you use a block:
    ```
    >> m: #(a: 1)
    == #(
        a: 1
    )
    >> foreach p m []
    *** Script Error: foreach does not allow map! for its 'word argument
    *** Where: foreach
    *** Stack:  
    
    >> foreach [p] m []
    *** Script Error: invalid argument: [p]
    *** Where: foreach
    *** Stack:  
    ```

--------------------------------------------------------------------------------

On 2019-06-07T09:14:29Z, meijeru, commented:
<https://github.com/red/red/issues/3910#issuecomment-499815920>

    I look forward to that better error message (combined with better testing in the toolchain, if needed).

--------------------------------------------------------------------------------

On 2019-06-07T12:14:42Z, meijeru, commented:
<https://github.com/red/red/issues/3910#issuecomment-499862084>

    On closer inspection, the tests for erroneous first argument to `foreach` are not done in the main code (`foreach*` in `natives.reds`) but in the auxiliary functions `foreach-next-block` and `foreach-next`. This may have been an effective approach *before* extension to maps, but is currently more inconvenient. A redesign would be necessary which I am not ready to undertake.

--------------------------------------------------------------------------------

On 2019-12-02T22:01:54Z, 9214, commented:
<https://github.com/red/red/issues/3910#issuecomment-560696891>

    Related: https://github.com/red/red/issues/617

