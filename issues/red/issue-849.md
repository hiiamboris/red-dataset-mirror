
#849: Invalid form float! result after using non Latin1 string!
================================================================================
Issue is closed, was reported by Oldes and has 2 comment(s).
[type.bug] [status.resolved]
<https://github.com/red/red/issues/849>

```
red>> 1.2
== 1.2
red>> "ščř"
== "ščř"
red>> 1.2
== 0.12
red>> -1.0203
== -0.00010203
```



Comments:
--------------------------------------------------------------------------------

On 2014-07-29T06:36:37Z, dockimbel, commented:
<https://github.com/red/red/issues/849#issuecomment-50440715>

    This bug disappeared after `string/to-float` rewrite. 

