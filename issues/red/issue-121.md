
#121: EITHER can't return struct!
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/121>

Code:

```
session!: alias struct! [
    handle      [handle!]
    output      [binary!]
]

curl-new-session: func [  ; Return session handle.
    return:     [session!]
    /local      session [session!]
][
    session: as session! allocate size? session!

    either as-logic session [
        session
    ][
        none
    ]
]
```

Result:

```
*** Compilation Error: wrong return type in function: curl-new-session 
*** expected: [struct! [
        handle [pointer! [byte!]] 
        output [pointer! [byte!]]
    ]], found: [struct!] 
*** in file: %/users/administrator/Red/Red-cURL/examples/test.reds 
*** in function: curl-new-session
*** at:  []
```



Comments:
--------------------------------------------------------------------------------

On 2011-07-02T13:36:18Z, dockimbel, commented:
<https://github.com/red/red/issues/121#issuecomment-1489372>

    Please, provide complete (but minimized) working code cases exhibiting the issue. Not doing so might result in misinterpretations, ambiguities and loss of time for everyone.

