
#4485: [Preprocessor] Fetch-next can't be silenced
================================================================================
Issue is open, was reported by hiiamboris and has 2 comment(s).
[type.wish]
<https://github.com/red/red/issues/4485>

**Describe the bug**

... which hurts it's usage in dialects based on it:
```
>> preprocessor/fetch-next [object/no-ref]
*** Macro Error: unknown refinement
*** Where: object/no-ref
(halted)
>> type? try [preprocessor/fetch-next [object/no-ref]]
*** Macro Error: unknown refinement
*** Where: object/no-ref
(halted)
>> type? try/all [preprocessor/fetch-next [object/no-ref]]
*** Macro Error: unknown refinement
*** Where: object/no-ref
== error!                  ;) <-- this error was thrown by `halt`
```
I was simply trying to [`prettify`](https://gitlab.com/hiiamboris/red-mezz-warehouse/-/blob/master/prettify.red) a routine. Of course, it's not Red code and the result is expected to be ugly, but it doesn't let me do even that.

**Expected behavior**

At least when used *from Red code*:
1) I'd like it to throw more meaningful errors instead of halt
2) I'd like it to produce no unchecked output

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 28-May-2020/17:51:04+03:00 commit #36857eb
```



Comments:
--------------------------------------------------------------------------------

On 2020-06-01T12:45:48Z, dockimbel, commented:
<https://github.com/red/red/issues/4485#issuecomment-636840669>

    FYI, `fetch-next` and related code will probably be obsoleted once we get interpreter events and callbacks support. In the meantime, if you have some simple changes to improve the current code, I will accept them.

