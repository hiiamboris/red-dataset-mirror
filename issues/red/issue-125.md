
#125: Cannot keep struct! type
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/125>

```
Red/System []

session!: alias struct! [
    dummy       [integer!]
]
bug: func [
    return:     [session!]
][
    as session! allocate size? session!
]
session: struct session!  ; Dummy
session: bug
```

This must be a regression from today's fixes:

```
*** Compilation Error: attempt to change type of variable: session 
*** from: [struct! [
        rest [integer!]
    ]] 
***   to: [session!] 
*** in file: %/users/administrator/Red/Red-cURL/examples/bug.reds 
*** at:  [
    session: bug
```



