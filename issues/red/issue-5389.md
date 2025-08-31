
#5389: NaN arithmetic still broken
================================================================================
Issue is closed, was reported by hiiamboris and has 4 comment(s).
[type.bug] [status.duplicate]
<https://github.com/red/red/issues/5389>

**Describe the bug**
```
>> 1.#nan >= 1.#nan
== true
>> 1.#nan <= 1.#nan
== true
>> 1.#nan <= 1
== true
>> 1.#nan >= 1
== true
>> 1 <= 1.#nan
== true
>> 1 >= 1.#nan
== true
```

**To reproduce**
```
1.#nan >= 1.#nan
1.#nan <= 1.#nan
1.#nan <= 1
1.#nan >= 1
1 <= 1.#nan
1 >= 1.#nan
```

**Expected behavior**

All false

**Platform version**
```
Red 0.6.4 for Windows built 11-Sep-2023/10:40:41+03:00  commit #def4b65
```


Comments:
--------------------------------------------------------------------------------

On 2023-09-24T21:05:24Z, dockimbel, commented:
<https://github.com/red/red/issues/5389#issuecomment-1732669184>

    I went back to July 2022 and it was broken already... Can you tell when the regression happened approximately?

--------------------------------------------------------------------------------

On 2023-09-24T21:15:57Z, hiiamboris, commented:
<https://github.com/red/red/issues/5389#issuecomment-1732671185>

    Sorry must be my memory playing tricks on me.
    We should reopen https://github.com/red/red/issues/847 and close this as duplicate.

