
#5558: Output of `help` is a bit too verbose for hash & vector
================================================================================
Issue is open, was reported by hiiamboris and has 6 comment(s).
<https://github.com/red/red/issues/5558>

[Discussion](https://matrix.to/#/%21wUTlqkqOhNGtfQzIsO%3Amatrix.org/%24173193797953AKcvz%3Atchncs.de?via=gitter.im&via=matrix.org&via=nitro.chat)

**Describe the bug**

For these cases the type info is unnecessarily duplicated:
```
>> x: make vector! [1 0 1] ? x
X is a vector! value.  length: 3  make vector! [1 0 1]

>> x: make hash! [1 0 1] ? x
X is a hash! value.  length: 3  make hash! [1 0 1]
```

**Expected behavior**

@greggirwin:
> it would be nicer if it were construction/serialized syntax. But I suppose it doesn't really even need to show the type part, since that was already stated. If we just show the content after the length, then we should add a label for it, for clarity. These two types are the only exception in the block types.

**Platform version**
`Red 0.6.5 for Windows built 9-Nov-2024/4:54:12+07:00  commit #fc80690`


Comments:
--------------------------------------------------------------------------------

On 2024-12-15T18:57:16Z, greggirwin, commented:
<https://github.com/red/red/issues/5558#issuecomment-2544003335>

    Looking for the discussion now. The link takes me to a page for matrix apps.

--------------------------------------------------------------------------------

On 2024-12-15T19:00:18Z, greggirwin, commented:
<https://github.com/red/red/issues/5558#issuecomment-2544004110>

    It's in red/help on Gitter, but just a couple messages. Wasn't sure if there was more. 

--------------------------------------------------------------------------------

On 2024-12-15T19:12:45Z, greggirwin, commented:
<https://github.com/red/red/issues/5558#issuecomment-2544008807>

    @dockimbel @hiiamboris we can make this change now, but then should probably think about serialized syntax. Here's what Oldes's R3 does:
    ```
    >> x: make vector! [f32! [1 0 1]] ? x
    X is a vector of value: #(vector! decimal! 32 3 [1.0 0.0 1.0])
    >> x: make vector! [f64! [1 0 1]] ? x
    X is a vector of value: #(vector! decimal! 64 3 [1.0 0.0 1.0])
    >> x: make vector! [i32! [1 0 1]] ? x
    X is a vector of value: #(vector! integer! 32 3 [1 0 1])
    ```

