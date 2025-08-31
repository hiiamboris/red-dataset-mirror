
#2988: `to word!` is missing check for `char!` type
================================================================================
Issue is closed, was reported by toomasv and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2988>

Currently, `to word!` is making words of non-word-chars like #" ", #"^/", #"{", #";", #"2" etc., eg:
```
>> set to word! #";" 42
== 42
>> get to word! #";"
== 42
```
IMHO, the problem is here: 
https://github.com/red/red/blob/master/runtime/datatypes/word.reds#L398


Comments:
--------------------------------------------------------------------------------

On 2017-08-20T11:10:16Z, meijeru, commented:
<https://github.com/red/red/issues/2988#issuecomment-323578343>

    A suggestion: use `load-value` just like done for `string!`.

