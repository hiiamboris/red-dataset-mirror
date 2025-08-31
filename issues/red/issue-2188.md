
#2188: TRY does not catch errors in reactor!
================================================================================
Issue is closed, was reported by rebolek and has 0 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/2188>

This code:

```
print error? try [d: make reactor! [x: is [y + 1] y: is [x + 3]]]
```

will cause infinite loop in console that prints:

```
*** Script Error: + does not allow none! for its value1 argument
*** Where: +
*** Near: [y + 1]
*** Script Error: + does not allow none! for its value1 argument
*** Where: +
*** Near: [x + 3]
```

It should just print `true`.



