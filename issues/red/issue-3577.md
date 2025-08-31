
#3577: SELECT/part behaves inconsistently
================================================================================
Issue is closed, was reported by Oldes and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3577>

This is supposed to be OK (although I would prefer NONE in this case personally)
```
>> select/part [3 4 5 6] 4 2
== 5
```
But when the series has index > 1, than:
```
>> select/part (probe skip [1 2 3 4 5 6] 2) 4 2
[3 4 5 6]
== none ;<--- should be 5, if above case is correct
```



