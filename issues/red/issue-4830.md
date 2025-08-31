
#4830: `do-file` breaks `halt`
================================================================================
Issue is closed, was reported by hiiamboris and has 4 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/4830>

**Describe the bug**

`1.red`: `Red [] do %2.red`
`2.red`: `Red [] halt`

```
D:\devel\red>red "2.red"
(halted)

D:\devel\red>red "1.red"
*** Throw Error: no catch for throw: halt-request
*** Where: do
*** Stack: do-file
```

**Expected behavior**

`halt` should display `halted` even if it's included.

**Platform version**
```
Red 0.6.4 for Windows built 9-Feb-2021/20:31:32+03:00 commit #18bc5f7
```



Comments:
--------------------------------------------------------------------------------

On 2021-02-14T12:14:05Z, hiiamboris, commented:
<https://github.com/red/red/issues/4830#issuecomment-778769325>

    Other include-related stuff:
    #4817 #4422 #4390 #4422 #4249 #4139 #4128 #3921 #3550 #3464 #2484 red/REP#56

--------------------------------------------------------------------------------

On 2021-08-20T16:10:27Z, dockimbel, commented:
<https://github.com/red/red/issues/4830#issuecomment-902801449>

    This one was not related to include system per se, but to `halt` proper catching when thrown from a script file.

