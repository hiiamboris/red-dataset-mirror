
#2602: parse can't match binary! datatype inside collect body
================================================================================
Issue is closed, was reported by 9214 and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2602>

```
>> collect [ #{deadbeef} ]
*** Script Error: PARSE - matching by datatype not supported for any-string! input
*** Where: parse
```

Workaround suggested by @greggirwin is to add `binary!` check inside `parse` rule:
```
collect: func [ {Collect in a new block all the values passed to KEEP function from the body block} body [block!] "Block to evaluate" /into {Insert into a buffer instead (returns position after insert)} 
    collected [series!] "The buffer series (modified)" 
    /local keep rule pos
][
    keep: func [v /only] [either only [append/only collected v] [append collected v] v] 
    unless collected [collected: make block! 16] 
    parse body rule: [
        any [pos: ['keep | 'collected] (pos/1: bind pos/1 'keep) | any-string! | binary! | into rule | skip] ; <-- here
    ] 
    do body 
    either into [collected] [head collected]
]
```


Comments:
--------------------------------------------------------------------------------

On 2017-04-21T05:17:07Z, dockimbel, commented:
<https://github.com/red/red/issues/2602#issuecomment-296070052>

    Good catch, thanks to @greggirwin for finding a fix.
    
    @greggirwin I don't have a better fix, yours seems correct to me. Do you mind posting it as a PR?

