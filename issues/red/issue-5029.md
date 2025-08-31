
#5029: Subsecond times cannot be molded
================================================================================
Issue is open, was reported by hiiamboris and has 8 comment(s).
[type.bug]
<https://github.com/red/red/issues/5029>

**Describe the bug**

I was converting Red scripts, which involves loading them and saving. However `time!` and `date!` values get distorted in the process, causing embedded tests to fail:
```
>> t: 1:2:3.765432754321
== 1:02:03.76543
>> t/second
== 3.765432754320955
>> mold/all t
== "1:02:03.76543"
>> d: 1/1/1 + t
== 1-Jan-2001/1:02:03.76543
>> d/second
== 3.765432754320955
>> mold/all d
== "1-Jan-2001/1:02:03.76543"
```

**Expected behavior**

`mold/all` should not distort times and dates: `t == load mold/all t`

**Platform version**
```
Red 0.6.4 for Windows built 22-Dec-2021/17:36:36+03:00  commit #328c904
```



Comments:
--------------------------------------------------------------------------------

On 2022-09-20T02:48:25Z, qtxie, commented:
<https://github.com/red/red/issues/5029#issuecomment-1251770992>

    ```
    /all         => TBD: Return value in loadable format.
    ```
    
    It's no guarantee that `t == load mold/all t`. It just makes it `loadable`.

--------------------------------------------------------------------------------

On 2022-09-20T07:29:19Z, hiiamboris, commented:
<https://github.com/red/red/issues/5029#issuecomment-1251952008>

    what's the point of making it loadable if loaded value will not be the same?

--------------------------------------------------------------------------------

On 2022-09-20T09:16:33Z, qtxie, commented:
<https://github.com/red/red/issues/5029#issuecomment-1252071189>

    R3:
    ```
    >> t: 1:2:3.765432754321
    == 1:02:03.765432754
    
    >> t/second
    == 3.765432754
    
    >> mold/all t
    == "1:02:03.765432754"
    
    >> d: 1/1/1 + t
    == 1-Jan-2001/1:02:03.765432754
    
    >> d/second
    == 3.765432754
    
    >> mold/all d
    == "2001-01-01T01:02:03.765432754"
    
    >> t == load mold/all t
    == true
    ```
    
    R2: 
    ```
    >> t: 1:2:3.765432754321
    == 1:02:03.000928575
    ```
    
    R3 works as expected. R2 is very wrong.

--------------------------------------------------------------------------------

On 2022-09-20T15:48:31Z, greggirwin, commented:
<https://github.com/red/red/issues/5029#issuecomment-1252553803>

    We have a couple choices. If we spec it to use floats internally, there is potential for distortion and we need to doc that so people can work around if when necessary. If we want to avoid distortion, which I think is a good thing, we need to change the implementation.

