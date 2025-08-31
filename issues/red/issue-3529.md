
#3529: Red Header Inconsistency
================================================================================
Issue is closed, was reported by audinue and has 2 comment(s).
<https://github.com/red/red/issues/3529>

I believe Red header should be case insensitive.

```
Red [] ; Ok
Print "Love Red"
```

```
RED [] ; *** Error: not a Red program!
PRINT "Hello world!"
```



Comments:
--------------------------------------------------------------------------------

On 2018-09-05T09:44:41Z, 9214, commented:
<https://github.com/red/red/issues/3529#issuecomment-418669235>

    This is a design decision.
    
    > The reason why the Red[/System] header was made case-sensitive was to lower the risk of collision when running a Red script which is appended to a non-Red textual content (HTML, email body, etc...). Rebol has less chances of accidental collision, as it's a unique word (unlike "red").
    
    If you have any solid arguments for a proposed change, you are welcome to discuss them (and any Red-related topics for that matter) in our [Gitter chat](https://gitter.im/red/home).

