
#4945: Weird undocumented function call in REPLACE
================================================================================
Issue is closed, was reported by hiiamboris and has 6 comment(s).
[status.built] [status.tested] [type.review] [test.written]
<https://github.com/red/red/issues/4945>

**Describe the bug**
```
>> replace/all [1 2 1] 1 does ['Q]
== [func []['Q] 2 func []['Q]]
>> replace/all/deep [1 2 1] 1 does ['Q]
== [Q 2 Q]
>> replace/all "121" 1 does ['Q]
== "?function?2?function?"
>> replace/all "121" ["1"] does ['Q]
== "Q2Q"
```

**Expected behavior**

Needs redesign from scratch.
Such an attempt is made [here](https://gitlab.com/hiiamboris/red-mezz-warehouse/-/blob/master/new-replace.red) (see notes in the header) whereas Parse mode was split into [mapparse](https://gitlab.com/hiiamboris/red-mezz-warehouse/-/blob/master/mapparse.red)
Replace design discussion resides here: https://github.com/red/red/issues/4174
Other replace-related issues: https://github.com/red/REP/issues/18 https://github.com/red/REP/issues/83 https://github.com/red/red/issues/4944 https://github.com/red/red/commit/9e0a4a4315180aeb91bf7a1f02c23a1c22a4dd7f
Replace had [more than 15 issues historically](https://github.com/red/red/issues?q=is%3Aissue+is%3Aclosed+replace+in%3Atitle) which indicates a problem with design

**Platform version**
```
Red 0.6.4 for Windows built 22-Jul-2021/20:44:06+03:00  commit #3c8d386
```



Comments:
--------------------------------------------------------------------------------

On 2021-09-16T16:09:28Z, dockimbel, commented:
<https://github.com/red/red/issues/4945#issuecomment-921037722>

    Fixing the above inconsistency does not require any redesign.

--------------------------------------------------------------------------------

On 2021-09-16T16:46:02Z, hiiamboris, commented:
<https://github.com/red/red/issues/4945#issuecomment-921063858>

    Above one maybe not, but when I walked through the replace tests one by one I couldn't help but conclude that current implementation is a loosely coupled bunch of special cases and not a result of design effort.

--------------------------------------------------------------------------------

On 2021-09-16T17:56:19Z, dockimbel, commented:
<https://github.com/red/red/issues/4945#issuecomment-921112118>

    `replace` features and implementation used to be very simple and straightforward. Then people started asking for more features and pushing PR for extending it... here we are now. ;-)

