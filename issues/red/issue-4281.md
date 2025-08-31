
#4281: REPEND crashes when using TRIM on the target series.
================================================================================
Issue is open, was reported by dockimbel and has 8 comment(s).
[status.waiting] [type.bug]
<https://github.com/red/red/issues/4281>

The following code crashes the console:
```
data: "   123   "
repend data [trim data]
```
If `trim` is removed, it works as expected.



Comments:
--------------------------------------------------------------------------------

On 2020-02-04T16:52:49Z, dockimbel, commented:
<https://github.com/red/red/issues/4281#issuecomment-582006715>

    See also https://github.com/red/red/issues/3340
    
    Temporary workaround:
    ```
    data: "   123   "
    append data reduce [trim data]
    == "123123"
    ```
    
    Minimal code to reproduce the crash:
    ```
    data: "   123   "
    insert tail data reduce [trim data]
    ```
    Caused by `insert` not handling properly the case of same string series used for both arguments.

--------------------------------------------------------------------------------

On 2020-02-04T18:11:56Z, dockimbel, commented:
<https://github.com/red/red/issues/4281#issuecomment-582042507>

    Crash happens in `string/alter` in:
    ```
    if mode = MODE_INSERT [
    	move-memory				
    		(as byte-ptr! s1/offset) + h1 + offset + size
    		(as byte-ptr! s1/offset) + h1 + offset
    		(as-integer s1/tail - s1/offset) - h1
    ]
    ```
    The last argument to `move-memory` is negative (`-6` in above case), because `trim data` makes the `tail data` reference become "past-end".
    
    The fix for this issue should be part of the general solution for handling past-end series internally.

--------------------------------------------------------------------------------

On 2020-02-04T18:23:03Z, hiiamboris, commented:
<https://github.com/red/red/issues/4281#issuecomment-582047342>

    https://github.com/red/red/pull/4097

--------------------------------------------------------------------------------

On 2020-02-04T21:23:51Z, dockimbel, commented:
<https://github.com/red/red/issues/4281#issuecomment-582121895>

    @hiiamboris I will process the pending PRs once the lexer branch is merged into master.

