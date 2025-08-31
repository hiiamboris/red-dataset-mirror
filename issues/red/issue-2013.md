
#2013: Multiplication with time values is not obvious
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/2013>

Just a few examples

```
red>> 3600 * 0:0:1
*** Script error: time! type is not allowed here
*** Where: *
red>> 3600.0 * 0:0:1
== 3600.0
red>> 0:0:1 * 3600
== 0:59:59.99999999999955
red>> 0:0:3600
== 1:00:00.0
```



Comments:
--------------------------------------------------------------------------------

On 2016-06-15T05:54:08Z, dockimbel, commented:
<https://github.com/red/red/issues/2013#issuecomment-226094765>

    Now you get more consistent results:
    
    ```
    red>> 3600 * 0:0:1
    == 0:59:59.99999999999955
    red>> 3600.0 * 0:0:1
    == 0:59:59.99999999999955
    ```

