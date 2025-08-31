
#5079: tag lexing glitch
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/5079>

**Describe the bug**
```
>> '<img src=(url)>
== <<img src=(url)>
```
Where the extra `<` comes from?

**Expected behavior**

Hmm.. `'<img` could be a lit-word

**Platform version**
```
Red 0.6.4 for Windows built 25-Jan-2022/14:48:41+03:00  commit #dbbe6e0
```



Comments:
--------------------------------------------------------------------------------

On 2022-02-19T14:41:28Z, dockimbel, commented:
<https://github.com/red/red/issues/5079#issuecomment-1046033205>

    This will now be reported as a tag error, as it's anyway ambiguous.

