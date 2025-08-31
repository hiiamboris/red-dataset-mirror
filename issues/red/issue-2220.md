
#2220: Make image! pair! with both float! returns float!
================================================================================
Issue is closed, was reported by ifgem and has 4 comment(s).
[status.dismissed] [type.review]
<https://github.com/red/red/issues/2220>

`make image! 100.1x100` works as expected but:

```
make image! 100.0x100.0 => 0.0
make image! 100.0x100.1 => 0.1
make image! 100.1x100.0 => 0.0
```



Comments:
--------------------------------------------------------------------------------

On 2016-09-10T18:35:37Z, greggirwin, commented:
<https://github.com/red/red/issues/2220#issuecomment-246128056>

    There is another ticket, which I can't find right now, that covers the pair parsing with floats, and there was chat on gitter as well. You still get a good image result in this case. Once pair! lexing is completely defined and implemented, this will be fixed. For now, this shows the behavior:
    
    ```
    red>> [1.1x2.3]
    == [1x2 0.3]
    ```

--------------------------------------------------------------------------------

On 2017-02-21T08:02:11Z, dockimbel, commented:
<https://github.com/red/red/issues/2220#issuecomment-281271367>

    Pairs cannot contain float values yet, the lexer has some provision for supporting that in the future, that's why it is not reporting any error for now.

