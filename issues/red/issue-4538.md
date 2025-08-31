
#4538: Errors lose their context unless `form`ed immediately
================================================================================
Issue is closed, was reported by hiiamboris and has 8 comment(s).
[status.built] [status.tested] [type.design]
<https://github.com/red/red/issues/4538>

**Describe the bug**

Suppose I caught an error, decided this error is not interesting to me, and want to re-throw it:
```
>> x: try [probe 1 / 0]
*** Math Error: attempt to divide by zero
*** Where: /
*** Stack: probe  

>> pad do x
*** Math Error: attempt to divide by zero
*** Where: do
*** Stack: pad 
```
As you can see it now reports `do` as a culprit, and stack became replaced by the new one of the same depth.

**Expected behavior**

Exactly the same error message after rethrow.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 20-Jun-2020/20:24:25+03:00 commit #4d864b1
```



Comments:
--------------------------------------------------------------------------------

On 2021-02-24T19:06:20Z, hiiamboris, commented:
<https://github.com/red/red/issues/4538#issuecomment-785305583>

    Seems this issue is bigger than I thought.
    
    ```
    >> f: does [1 / 0]
    == func [][1 / 0]
    >> e: try/all [f]
    *** Math Error: attempt to divide by zero
    *** Where: /
    *** Stack: f            ;) f is properly reported only if error is immediately followed by form
    >> e
    *** Math Error: attempt to divide by zero
    *** Where: /
    *** Stack: object?      ;) f is lost
    ```
    I want `f` func to be reported in the stack trace (in my project it maybe 3-5 functions that are lost from the trace.
    Use case: View-like error handling.

--------------------------------------------------------------------------------

On 2021-02-24T19:18:54Z, hiiamboris, commented:
<https://github.com/red/red/issues/4538#issuecomment-785312874>

    A bit trickier to reproduce in a standalone script, but here you go:
    ```
    Red []
    f: does [1 / 0]
    e: try [f]
    rejoin ["WTF"]
    print form e
    ```
    ```
    D:\devel\red\red-src\red>red "1.red"
    *** Math Error: attempt to divide by zero
    *** Where: /
    *** Stack: first         ;) what?????????
    ```
    remove `rejoin` and stack trace will be correct.
    
    Reminds me of https://github.com/red/red/issues/4260

--------------------------------------------------------------------------------

On 2021-05-11T16:42:46Z, hiiamboris, commented:
<https://github.com/red/red/issues/4538#issuecomment-838807670>

    I don't want to spend a day to isolate it but with deeper stack usage (20-30 items) it brings totally nonsensical reports, no matter what I do: both function and it's argument names get replaced with seemingly random names, whatever garbage is left on the stack, and those names also switch at random. Immediate forming of the error doesn't help it.

--------------------------------------------------------------------------------

On 2021-07-03T12:43:07Z, dockimbel, commented:
<https://github.com/red/red/issues/4538#issuecomment-873401925>

    "WHERE:" field issue was fixed recently, while the stack capture is now handled by `try/keep`:
    ```
    >> x: try/keep [probe 1 / 0]
    *** Math Error: attempt to divide by zero
    *** Where: /
    *** Stack: probe 
    
    >> pad do x
    *** Math Error: attempt to divide by zero
    *** Where: /
    *** Stack: probe 
    ```

