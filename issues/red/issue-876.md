
#876: Newly used words are recognized as datatype!
================================================================================
Issue is closed, was reported by Oldes and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/876>

```
-=== Red Console alpha version ===-
Type HELP for starting information.

red>> foreach w system/words [if w = 'xx [print [w tab type? get w]]]
xx      datatype
```



