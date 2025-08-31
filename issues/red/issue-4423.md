
#4423: Trim doesn't trim last newline char
================================================================================
Issue is open, was reported by endo64 and has 14 comment(s).
[type.review]
<https://github.com/red/red/issues/4423>

**Describe the bug**
`trim` without `tail` doesn't trim the last newline character.

**To reproduce**
Steps to reproduce the behavior:
```
>> trim "^/x^/"
== "x^/"
>> trim "^/^/^/x^/^/^/"
== "x^/"
>> trim/head/tail "^/^/^/x^/^/^/"
== "x"

```

**Expected behavior**
`trim` should behave as `trim/head/tail` default.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 29-Apr-2020/15:24:35+03:00 commit #db7f36a
```



Comments:
--------------------------------------------------------------------------------

On 2020-05-03T21:19:08Z, hiiamboris, commented:
<https://github.com/red/red/issues/4423#issuecomment-623183963>

    See also trim bugs with blocks https://github.com/red/red/issues/4210
    Personally I'm not using it as it's totally unreliable right now.

--------------------------------------------------------------------------------

On 2020-05-13T02:22:00Z, qtxie, commented:
<https://github.com/red/red/issues/4423#issuecomment-627704915>

    It's the same behavior in Rebol.
    ```
    R2 & R3:
    >> trim "^/x^/"
    == "x^/"
    >> trim "^/^/^/x^/^/^/"
    == "x^/"
    ```

--------------------------------------------------------------------------------

On 2020-05-13T03:04:57Z, greggirwin, commented:
<https://github.com/red/red/issues/4423#issuecomment-627716669>

    My question is whether Rebol got it right. What's the logic for *not* trimming that final newline?

--------------------------------------------------------------------------------

On 2020-05-13T06:05:56Z, qtxie, commented:
<https://github.com/red/red/issues/4423#issuecomment-627766318>

    My guess: For trimming multiline text. E.g. Trimming an article. Using `trim/head/tail` will turn it into a single line of text.

--------------------------------------------------------------------------------

On 2023-04-17T16:59:43Z, greggirwin, commented:
<https://github.com/red/red/issues/4423#issuecomment-1511747437>

    I think the use cases for trimming head or tail are close to equal. When you only want to trim one of them, that's a specific case. When you want to trim *both* of them, that seems like the general case, and should be the default. We can *say* head or tail is more important, but do we have any evidence to back that up? I don't. By making `/head/tail` the default that case also becomes much shorter.

--------------------------------------------------------------------------------

On 2023-04-17T17:48:25Z, hiiamboris, commented:
<https://github.com/red/red/issues/4423#issuecomment-1511821244>

    But in the original example it *does* trim the tail too, just not fully. It's clear though that the workings of `trim` are so mysterious that no one understands them :)

--------------------------------------------------------------------------------

On 2023-04-17T18:39:18Z, greggirwin, commented:
<https://github.com/red/red/issues/4423#issuecomment-1511892551>

    Good clarification. A key point for me is that nothing about `/tail` versus the current default behavior, says there's anything special about the last newline. If there's a reason, let's doc it; otherwise let's change it.

