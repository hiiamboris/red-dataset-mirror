
#5076: String buffer corruption & Console CRASH after trimming a split unicode string
================================================================================
Issue is closed, was reported by hiiamboris and has 16 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/5076>

**Describe the bug**

`print trim first split {х^/+й} "+"` this code:
- crashes Linux CLI console with a lot of garbage output and an error:
```
*** Runtime Error 16: invalid virtual address
*** at: 0807070Eh
```
- hangs Windows GUI console (seemingly it's too slow to output the whole garbage)

**Expected behavior**
```
>> print trim first split {х^/+й} "+"
х
```

**Platform version**
```
Red 0.6.4 for Windows built 25-Jan-2022/14:48:41+03:00  commit #dbbe6e0
```



Comments:
--------------------------------------------------------------------------------

On 2022-02-16T11:25:33Z, hiiamboris, commented:
<https://github.com/red/red/issues/5076#issuecomment-1041388513>

    strange that neither `probe` nor `form` or `mold` trigger the bug
    maybe because they produce a copy, but print tries to output the string directly?

--------------------------------------------------------------------------------

On 2022-02-21T01:04:46Z, dockimbel, commented:
<https://github.com/red/red/issues/5076#issuecomment-1046373509>

    Cannot reproduce the issue outside of the GUI console (works fine from CLI console on W10). 
    In GUI console, the issue is caused by `dyn-print/red-print` function which enters an infinite loop. The string passed by `trim` seems correct, no traces of corruption.
    

--------------------------------------------------------------------------------

On 2022-02-21T12:35:25Z, hiiamboris, commented:
<https://github.com/red/red/issues/5076#issuecomment-1046831534>

    works after latest 2 commits by @qtxie
    but worth adding tests?
    e.g. just that line will crash affected linux interpreter

--------------------------------------------------------------------------------

On 2022-02-21T13:11:58Z, dockimbel, commented:
<https://github.com/red/red/issues/5076#issuecomment-1046864416>

    @hiiamboris Which simple regression test do you propose to write? This issue can't be easily detected, as it's a buffer internal corruption.

--------------------------------------------------------------------------------

On 2022-02-21T13:23:40Z, hiiamboris, commented:
<https://github.com/red/red/issues/5076#issuecomment-1046877452>

    how about this in regression-test-redc-5.r:
    ```
    		--compile-and-run-this {
    			Red []
    			do [print trim first split {х^/+й} "+"]
    		}
    		--assert compiled?
    		--assert qt/output == "х^/"
    ```

--------------------------------------------------------------------------------

On 2022-02-21T14:44:58Z, dockimbel, commented:
<https://github.com/red/red/issues/5076#issuecomment-1046953052>

    @hiiamboris That does not trigger the issue here, as I posted in my first comment above. I can only reproduce it in GUI console, not outside of it.

--------------------------------------------------------------------------------

On 2022-02-21T15:08:13Z, hiiamboris, commented:
<https://github.com/red/red/issues/5076#issuecomment-1046974864>

    Have you tried on Linux?
    > crashes Linux CLI console with a lot of garbage output and an error

--------------------------------------------------------------------------------

On 2022-02-22T20:10:42Z, hiiamboris, commented:
<https://github.com/red/red/issues/5076#issuecomment-1048170913>

    Nah, that's just cyrillic `х`, which looks similar to latin `x` :D 
    https://util.unicode.org/UnicodeJsps/confusables.jsp?a=x&r=None

