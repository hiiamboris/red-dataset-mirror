
#1881: New-line error on paren! when loading a script
================================================================================
Issue is closed, was reported by Zamlox and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1881>

Executing script:

```
Red []

rule: [ any [
        mark: set a [ any-word! ] (
            if [ ][ ]
        ) | into rule | skip
    ] ]
```

gives error:

```
*** Script error: new-line does not allow paren! for its blk argument
*** Where: new-line
```



