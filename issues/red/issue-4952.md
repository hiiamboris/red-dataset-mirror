
#4952: FIND accepts binary target, but PARSE not
================================================================================
Issue is closed, was reported by Oldes and has 6 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/4952>

Although `find` _somehow_ accepts binary as its search value (without any conversion):
```red
>> find "a" #{61}
== "a"
>> find to-string #"^(7f)" to-binary #"^(7f)"
== "^~"
>> find to-string #"^(80)" debase/base "80" 16
== "^(80)"
```
`parse` don't handle it:
```red
>> parse "a" [#{61}]
== false
>> parse "#{61}" [#{61}]
== false
>> parse "61" [#{61}]
== false
```





Comments:
--------------------------------------------------------------------------------

On 2021-09-01T16:12:59Z, greggirwin, commented:
<https://github.com/red/red/issues/4952#issuecomment-910437379>

    The "somehow" is just using `as red-string!` on the search value, which could possibly also be done in `parse`.
    
    Are there use cases for this you have in mind? I haven't done mixed binary/string content parsing myself that I recall. Formats certainly exist that mix them, so having a couple of those as examples, would be great to show the power of this feature.

--------------------------------------------------------------------------------

On 2021-09-02T08:06:56Z, Oldes, commented:
<https://github.com/red/red/issues/4952#issuecomment-911352174>

    To be honest, I'm so far just looking for some consensus and have no idea, what would be the most useful. If nothing else, I think that `find` and `parse` should be consistent.

--------------------------------------------------------------------------------

On 2021-09-07T16:48:58Z, dockimbel, commented:
<https://github.com/red/red/issues/4952#issuecomment-914464625>

    That's a bug, that combination should not be allowed in `find`. It works only for ASCII strings.

