
#3009: HELP adds dot to arg docs strings, after ending quote
================================================================================
Issue is closed, was reported by greggirwin and has 0 comment(s).
<https://github.com/red/red/issues/3009>

Via Oldes:
```
>> f: func [a "foo" b "foo foo"] []
== func [a "foo" b "foo foo"][]
>> ? f
USAGE:
     F a b

DESCRIPTION: 
     F is a function! value.

ARGUMENTS:
     a             "foo".
     b             "foo foo".
```


