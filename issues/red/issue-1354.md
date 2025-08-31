
#1354: Accepts powers of wrong type
================================================================================
Issue is closed, was reported by WiseGenius and has 8 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1354>

```
red>> 0 ** "death"
== 0
red>> 1 ** "death"
== 1
red>> 2 ** "death"
== 0
red>> 3 ** "death"
== -1971559983
red>> 4 ** "death"
== 0
red>> 5 ** "death"
== -1103539215
red>> 6 ** "death"
== 0
red>> 7 ** "death"
== 1633022561
red>> 8 ** "death"
== 0
red>> 9 ** "death"
== 1792007841
```



Comments:
--------------------------------------------------------------------------------

On 2015-09-17T01:49:11Z, qtxie, commented:
<https://github.com/red/red/issues/1354#issuecomment-140941496>

    It's caused by no type checking for op! in the interpreter.

--------------------------------------------------------------------------------

On 2016-02-06T17:45:41Z, dockimbel, commented:
<https://github.com/red/red/issues/1354#issuecomment-180819658>

    Fixed by commit [94e002b1](https://github.com/red/red/commit/b20d3c6147d81724c45c96753671fd2f94e002b1).

--------------------------------------------------------------------------------

On 2016-09-02T14:55:48Z, rebolek, commented:
<https://github.com/red/red/issues/1354#issuecomment-244398275>

    Still returns 0 instead of error!  when compiled.

--------------------------------------------------------------------------------

On 2016-09-20T15:51:15Z, rebolek, commented:
<https://github.com/red/red/issues/1354#issuecomment-248344166>

    Also in interpreter:
    
    ```
    --== Red 0.6.1 ==-- 
    Type HELP for starting information. 
    
    red>> 0 ** "death"
    == 0
    red>> 
    ```

