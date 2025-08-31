
#2898: `source prompt` throws an error
================================================================================
Issue is closed, was reported by greggirwin and has 6 comment(s).
<https://github.com/red/red/issues/2898>

```
>> source prompt
*** Script Error: val needs a value
*** Where: set
*** Stack: source  
```


Comments:
--------------------------------------------------------------------------------

On 2017-08-01T10:22:06Z, geekyi, commented:
<https://github.com/red/red/issues/2898#issuecomment-319331267>

    I see that `prompt` is unset in my 31 July console.
    Did you mean `source any-unset-value` throws an error?

--------------------------------------------------------------------------------

On 2017-08-01T10:24:29Z, geekyi, commented:
<https://github.com/red/red/issues/2898#issuecomment-319331736>

    ```red
    >> source source
    source: func [
        "Print the source of a function" 
        'word [any-word! any-path!] "The name of the function" 
        /local val
    ][
        val: get/any word   ; should check for unset here
    ...
    ```

--------------------------------------------------------------------------------

On 2017-08-01T17:44:00Z, greggirwin, commented:
<https://github.com/red/red/issues/2898#issuecomment-319444048>

    https://github.com/red/red/pull/2955

