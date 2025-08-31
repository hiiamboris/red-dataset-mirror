
#5577: [Regression] Operator's body is not molded
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/5577>

**Describe the bug**

At some point op molding got broken:
```
>> about
Red 0.6.4 for Windows built 29-May-2023/9:43:26+08:00  commit #a3cacd3
>> make op! func [a b] ["I expect to see this text"]
== make op! func [a b]["I expect to see this text"]

>> about
Red 0.6.4 for Windows built 8-Jun-2023/3:38:46+08:00  commit #01ab176
>> make op! func [a b] ["I expect to see this text"]
== make op! func [a b]
```

**Expected behavior**

Operator body molded.

**Platform version**
`Red 0.6.5 for Windows built 29-Nov-2024/4:56:25+08:00  commit #a691592v`


Comments:
--------------------------------------------------------------------------------

On 2024-12-31T06:26:41Z, greggirwin, commented:
<https://github.com/red/red/issues/5577#issuecomment-2566170186>

    Confirmed.

