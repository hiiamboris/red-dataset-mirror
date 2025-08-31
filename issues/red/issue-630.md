
#630: Parse infinite loop
================================================================================
Issue is closed, was reported by kealist and has 6 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/630>

Not getting advancing of parse input with the following code:

```
st1: "...<id>90,123</id>...<id>190</id>...<id>123,90</id>...<id>123,90,123</id>...<id>901</id>"
delimiter: charset ">,<"
rule: [ some [delimiter "90" delimiter (print "90") | copy c skip (print "other char") ] ]
parse st1 rule
```

Removing `copy c` seems to resolve it, although Peter says that he was getting an access error through compilation

```
st1: "...<id>90,123</id>...<id>190</id>...<id>123,90</id>...<id>123,90,123</id>...<id>901</id>"
delimiter: charset ">,<"
rule: [ some [delimiter "90" delimiter (print "90") | skip (print "other char") ] ]
parse st1 rule
```

I'll see if I can prune it down anymore, but wanted to get something written down



Comments:
--------------------------------------------------------------------------------

On 2013-12-25T17:42:00Z, kealist, commented:
<https://github.com/red/red/issues/630#issuecomment-31202686>

    Isolated it to this code which gives an Access Violation:
    
    ```
    st1: "<id"
    delimiter: charset "<"
    rule: [ some [delimiter | copy c skip ] ]
    print parse-trace st1 rule
    ```

--------------------------------------------------------------------------------

On 2013-12-25T17:43:37Z, kealist, commented:
<https://github.com/red/red/issues/630#issuecomment-31202711>

    With `st1: "<i"` it will parse properly.  The 3rd character makes it fail

--------------------------------------------------------------------------------

On 2013-12-26T09:01:03Z, dockimbel, commented:
<https://github.com/red/red/issues/630#issuecomment-31215332>

    Thank you for finding this bug, it's pretty nasty one.

