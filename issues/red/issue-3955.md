
#3955: `event/ctrl?` and `event/shift?` not set on `down` event
================================================================================
Issue is closed, was reported by toomasv and has 6 comment(s).
[status.built] [type.bug] [GUI]
<https://github.com/red/red/issues/3955>

**Describe the bug**
`event/ctrl?` and `event/shift?` are not set on `down` event. Neither are set corresponding flags

**To reproduce**
```
>> view [base on-down [print [event/ctrl? event/shift? event/flags]]]
false false 
false false 
false false 
```

**Expected behavior**
As previously:
```
>> view [base on-down [print [event/ctrl? event/shift? event/flags]]]
true false control
false true shift
true true control shift
>> about
Red 0.6.4 for Windows built 21-May-2019/3:23:06+03:00 commit #c80ba51
```

**Platform version (please complete the following information)**
```
>> about
Red 0.6.4 for Windows built 30-Jul-2019/9:19:01+03:00 commit #3f14bf4
```



Comments:
--------------------------------------------------------------------------------

On 2019-07-31T03:50:02Z, toomasv, commented:
<https://github.com/red/red/issues/3955#issuecomment-516683394>

    Same for `on-mid-down` and `on-alt-down`. Neither do any `on-key` events work.

--------------------------------------------------------------------------------

On 2019-07-31T09:44:39Z, bitbegin, commented:
<https://github.com/red/red/issues/3955#issuecomment-516778430>

    macOS ok, windows failed.

--------------------------------------------------------------------------------

On 2019-07-31T18:44:31Z, hiiamboris, commented:
<https://github.com/red/red/issues/3955#issuecomment-516972628>

    I can confirm this issue on W8.1

