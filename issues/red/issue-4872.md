
#4872: Word lexing edge cases do not follow any logic
================================================================================
Issue is closed, was reported by hiiamboris and has 4 comment(s).
<https://github.com/red/red/issues/4872>

**Describe the bug**

```
>> [<<<>>>]
== [<<<>>>]  ;) word
>> ['<<<>>>]
== ['< <<>>>]  ;) 2 words
>> ['<'<<>>>]
== ['<' <<>>>]  ;) 2 words
>> ['<'<'<>>>]  ;) word and a tag (not closed)
<    
(escape)
>> ['<'<'<'>>>]  ;) word tag word
== ['<' <'<'> >>]

>> [:<<<>>>]
== [:< <<>>>]
>> [:<<<>>>:]
== [:< <<>>>:]
>> [<<<>>>:]
== [<<<>>>:]
```
total mess

```
>> '-1
== -1   ;) word
>> '-1x1
== -1x1    ;) word
```
this is simpler, just disallow words in `[sign][digit][..]` form

**Expected behavior**

We need a clear description of where one type ends and another type begins. Human-readable set of rules and a list of exceptions. Something we can use later as a reference and a learning material. Absence of such description is the core issue, one that leads to all such ambiguities, more of which will no doubt be found in the future.

**Platform version**
```
Red 0.6.4 for Windows built 18-Mar-2021/22:28:01+03:00  commit #73d9bd2
```



Comments:
--------------------------------------------------------------------------------

On 2021-04-08T14:10:42Z, 9214, commented:
<https://github.com/red/red/issues/4872#issuecomment-815857147>

    Duplicate of https://github.com/red/red/issues/4562, duplicate of https://github.com/red/red/issues/3569.

--------------------------------------------------------------------------------

On 2021-04-08T15:14:46Z, hiiamboris, commented:
<https://github.com/red/red/issues/4872#issuecomment-815906341>

    wow it's old

