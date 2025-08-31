
#4260: `halt` & generally `catch` lead to invalid error messages
================================================================================
Issue is closed, was reported by hiiamboris and has 6 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/4260>

**Describe the bug**

First error message after `halt` is misleading. It makes debugging more annoying.
Note `body`:
```
(halted)
>> c/f 1
*** Script Error: body does not allow integer! for its x argument
*** Where: f
*** Stack:

>>
>> c/f 1
*** Script Error: f does not allow integer! for its x argument
*** Where: f
*** Stack:
```

All subsequent error messages will be okay

**To reproduce**

1. Run this script with GUI console
```
Red []
c: object [f: function [x [object!]][]]
halt
```
2. Type `c/f 1`
3. Observe `none` instead of `f`

**Expected behavior**

Valid error messages

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 27-Dec-2019/1:01:27+03:00
```



Comments:
--------------------------------------------------------------------------------

On 2020-01-24T14:49:14Z, meijeru, commented:
<https://github.com/red/red/issues/4260#issuecomment-578160987>

    In my trial the first function reported is `=` instead of `body`. So I suppose that it is somewhat random. Note: I typed directly into console, not using a file with `Red []` in front.

--------------------------------------------------------------------------------

On 2020-01-24T16:20:39Z, hiiamboris, commented:
<https://github.com/red/red/issues/4260#issuecomment-578198851>

    Yes, that's even simpler:
    ```
    c: object [f: function [x [object!]][]]
    halt
    c/f 1
    ```
    Thanks

--------------------------------------------------------------------------------

On 2021-04-14T15:49:39Z, hiiamboris, commented:
<https://github.com/red/red/issues/4260#issuecomment-819623757>

    ```
    >> catch [throw 1]
    == 1
    >> add none none
    *** Script Error: all does not allow none! for its value1 argument
    *** Where: add
    *** Stack:  
    ```
    in CLI:
    ```
    *** Script Error: throw does not allow none! for its value1 argument
    *** Where: add
    *** Stack:
    ```

