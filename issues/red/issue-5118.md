
#5118: Hash table becomes invalid after remove
================================================================================
Issue is closed, was reported by hiiamboris and has 4 comment(s).
[status.built] [type.bug] [test.written]
<https://github.com/red/red/issues/5118>

**Describe the bug**

I'm doing two identical things with 2 hashes, one using `clear` another using `remove`:
```
>> h1: make hash! [a b c a b c]
== make hash! [a b c a b c]
>> h2: make hash! [a b c a b c]
== make hash! [a b c a b c]

>> clear find/last/skip h1 'a 3
== make hash! []
>> remove/part find/last/skip h2 'a 3 3
== make hash! []

>> h1
== make hash! [a b c]
>> h2
== make hash! [a b c]

>> find/last/skip h1 'a 3
== make hash! [a b c]
>> find/last/skip h2 'a 3
== make hash! []
```
`find` somehow returns me a match on items that are no longer there

**Expected behavior**

`== make hash! [a b c]` 
But keep in mind bug https://github.com/red/red/issues/5096 - if it gets fixed, `find` expressions will need some tuning to reproduce this

**Platform version**
```
Red 0.6.4 for Windows built 4-Apr-2022/15:09:55+03:00  commit #28dad01
```



Comments:
--------------------------------------------------------------------------------

On 2022-04-10T04:20:58Z, qtxie, commented:
<https://github.com/red/red/issues/5118#issuecomment-1094172928>

    > find somehow returns me a match on items that are no longer there
    
    'a is still in the hash, right?

--------------------------------------------------------------------------------

On 2022-04-10T08:25:48Z, hiiamboris, commented:
<https://github.com/red/red/issues/5118#issuecomment-1094217303>

    Yes

