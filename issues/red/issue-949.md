
#949: Function using #call get wrong result when invoke first time in Routine.
================================================================================
Issue is closed, was reported by qtxie and has 0 comment(s).
<https://github.com/red/red/issues/949>

```
Red []

inc: func [n [integer!]][n + 1]
#system [
    foo: does [
       #call [inc 123]
       int: as red-integer! stack/arguments
       print-line int/value
   ]
]
routine-test: routine [abc [integer!]][
    foo                     ;@@ print 1
    foo                     ;-- print 124
]
routine-test 1
```

The first time invoke `foo` in `routine-test` get wrong result.



