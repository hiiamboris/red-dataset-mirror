
#3439: Bitset constructor using negative indexes yields garbage
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3439>

### Expected behavior
`make bitset! [-1]` should give an error
### Actual behavior
>> make bitset! [-1]
== make bitset! #{0000000000000000000000000000000001000020C834B90010000000883FC702983FC7026D616B65206269747365742120237B3001000020C834B90020000000AC3FC702CC3FC7026D616B65206269747365742120237B303030303030303030303030303030303001000020C834B90040000000E03FC7022040C7026D616B65206269747365742120237B30303030303030303030303030303030303030303030303030303
### Steps to reproduce the problem
execute above code
### Red and platform version
```
presumably all, tested on W10
```


Comments:
--------------------------------------------------------------------------------

On 2018-06-24T00:27:07Z, greggirwin, commented:
<https://github.com/red/red/issues/3439#issuecomment-399719597>

    Great catch!

