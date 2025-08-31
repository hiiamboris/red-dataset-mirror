
#164: as-logic byte! of a structure member gives incorrect result in a conditional expression
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/164>

```
s: declare struct! [
    a   [byte!]
    b   [byte!]
]
s/a: as-byte 0
s/b: as-byte 1
print either as-logic s/a ["bogus"] [""]
```

bogus



Comments:
--------------------------------------------------------------------------------

On 2011-08-21T01:44:45Z, PeterWAWood, commented:
<https://github.com/red/red/issues/164#issuecomment-1861696>

    The issue appears to be connected to the cast being part of the conditional statement. The following code shows the issue and a temporary workaround:
    
    ```
    Red/System []
    
    s: declare struct! [
        a   [byte!]
        b   [byte!]
    ]
    s/a: as-byte 0
    s/b: as-byte 1
    print as-logic s/a
    print lf
    print either as-logic s/a ["bogus"] [""]
    print lf
    c: as-logic s/a
    print either c ["bogus"] ["correct"]
    print lf
    d: as-byte 0
    print either as-logic d ["bogus"] ["correct"]
    print lf
    ```
    
    The output:
    
    ```
    Rodney:builds peter$ ./test
    false
    bogus
    correct
    correct
    ```
    
    Changed title of issue.

--------------------------------------------------------------------------------

On 2011-08-21T01:58:01Z, PeterWAWood, commented:
<https://github.com/red/red/issues/164#issuecomment-1861715>

    I've written up a test in cast-test.reds (group cast in conditional) to reflect this issue.

