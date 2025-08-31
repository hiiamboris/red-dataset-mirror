
#5011: Refinements can be repeated multiple times with no error
================================================================================
Issue is closed, was reported by hiiamboris and has 6 comment(s).
[status.built] [status.tested] [type.review] [test.written]
<https://github.com/red/red/issues/5011>

**Describe the bug**
```
>> mold/part/part/part/part 'x 100 
*** Script Error: mold/part/part/part/part is missing its limit argument
*** Where: mold
*** Stack:  

>> mold/part/part/part/part 'x 100 100 100 100
== "x"
```
Funny, R2 & R3 has the same issue.

**Expected behavior**

An error about duplicate refinements. Otherwise such typo will likely take the argument from the next line of code and will be hard to debug.

**Platform version**
```
Red 0.6.4 for Windows built 17-Dec-2021/23:20:59+03:00  commit #2b5d37a
```



Comments:
--------------------------------------------------------------------------------

On 2022-08-30T16:56:30Z, dockimbel, commented:
<https://github.com/red/red/issues/5011#issuecomment-1231925482>

    Doing such duplicate checks at runtime on every path call looks very expensive, that's why no Redbol version does it.
    
    However, as Red uses a special cache for path calls, maybe it would be possible to integrate such check at low cost during the cache building...

--------------------------------------------------------------------------------

On 2022-08-30T20:01:01Z, greggirwin, commented:
<https://github.com/red/red/issues/5011#issuecomment-1232107193>

    Dynamically generated calls are where this could be exploited to bad effect. 
    ```
    >> mold/part/part "12345678901234567890" 5 10
    == {"123456789}
    >> mold/part/part "12345678901234567890" 10 5
    == {"1234}
    ```
    @hiiamboris how do you handle this in your `apply` design?

--------------------------------------------------------------------------------

On 2022-08-30T20:15:43Z, hiiamboris, commented:
<https://github.com/red/red/issues/5011#issuecomment-1232121100>

    Currently it just locates the first occurrence using `select/skip`.
    R/S-based `apply` with block argument will have to devise a solution based on how this issue gets solved, I guess, and depending how function and native call works internally. If it's a fixed set of stack slots, that remedies the problem automatically, last value will just override the first.

