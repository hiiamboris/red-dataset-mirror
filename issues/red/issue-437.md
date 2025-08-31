
#437: PRINT follows newline with space
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/437>

```
Red []

print [
    "a" newline
    "b^/c^/"
    "d" #"^/"
    "e"
]
```

Similar bug as there used to be in Red/System print-wide:

```
a 
 b
c
 d 
 e
```



