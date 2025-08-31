
#697: op! can not be called as prefix
================================================================================
Issue is closed, was reported by IngoHohmann and has 6 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/697>

```
red>> (+ 1 2)
== 2
```

I'm not sure, wether Red is meant to allow prefix in this case, but as Red/System and Rebol both allow it, I guess Red should do it, too.



Comments:
--------------------------------------------------------------------------------

On 2014-03-08T02:36:09Z, JerryTsai, commented:
<https://github.com/red/red/issues/697#issuecomment-37086714>

    REBOL 3 doesn't support that any more. Carl mentioned the reason somewhere but I couldn't find the web page now (Maybe it's in AltME?). The reason is "It made things complicated" or something like that. If anyone wants prefix of +, he can use ADD instead.

--------------------------------------------------------------------------------

On 2014-04-04T12:03:53Z, dockimbel, commented:
<https://github.com/red/red/issues/697#issuecomment-39557629>

    I also think we should not support it in Red nor Red/System, it does make internal code more complicated and it is not a common idiom in the Rebol world. You can still use the prefix math functions if you want prefix-only expressions.
    
    Do you have a test case for Red/System where this syntax works?

--------------------------------------------------------------------------------

On 2014-04-20T12:51:13Z, dockimbel, commented:
<https://github.com/red/red/issues/697#issuecomment-40894219>

    Prefix usage of infix operators in Red/System is now forbidden.

