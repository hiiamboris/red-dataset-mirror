
#567: PARSE KEEP COPY broken
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 2 comment(s).
[status.built] [status.tested] [type.wish] [test.written]
<https://github.com/red/red/issues/567>

```
Red []

probe parse "12" [collect [keep copy value 2 skip]]
?? value
```

[#"1"]
value: "12"



Comments:
--------------------------------------------------------------------------------

On 2013-11-18T17:33:03Z, dockimbel, commented:
<https://github.com/red/red/issues/567#issuecomment-28719304>

    KEEP is not broken, it was simply implemented to retrieve the first matched element (first char! in case of an input string). KEEPing the whole matched input is probably more useful and it seems it's not as complicated as I feared to support it.

