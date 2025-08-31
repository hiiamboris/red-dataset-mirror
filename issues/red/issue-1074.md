
#1074: Select on block! will set word to unexpected value
================================================================================
Issue is closed, was reported by qtxie and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1074>

```
--== Red 0.5.1 ==--
Type HELP for starting information.
red>> d
*** Script error: d has no value
*** Where: try
red>> x: [d 1]
== [d 1]
red>> select x d
== none
red>> d
== #"'"
```



Comments:
--------------------------------------------------------------------------------

On 2015-03-27T04:34:39Z, PeterWAWood, commented:
<https://github.com/red/red/issues/1074#issuecomment-86816559>

    Using a console compiled from the current master, I get the correct behaviour on OS X:
    
    ```
    --== Red 0.5.1 ==-- 
    Type HELP for starting information. 
    
    red>> d
    *** Script error: d has no value
    *** Where: try
    red>> x: [d 1]
    == [d 1]
    red>> select x 'd
    == 1
    red>> select x d
    *** Script error: d has no value
    *** Where: select
    red>> d
    *** Script error: d has no value
    *** Where: try
    ```

