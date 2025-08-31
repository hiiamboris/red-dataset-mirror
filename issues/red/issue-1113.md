
#1113: Word path access on a string broken
================================================================================
Issue is closed, was reported by dockimbel and has 2 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/1113>

```
red>> about 
Red 0.5.2 - 23-Apr-2015/14:33:43-7:00 
red>> a: "abcz" 
== "abcz" 
red>> b: 5 
== 5 
red>> a/5 
== none 
red>> a/b
== #"c"                       ;@@ should return `none`
```



Comments:
--------------------------------------------------------------------------------

On 2015-04-25T07:47:24Z, PeterWAWood, commented:
<https://github.com/red/red/issues/1113#issuecomment-96146330>

    I've added a test of this case to path-test.red

