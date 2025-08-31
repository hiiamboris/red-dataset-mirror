
#3406: `construct` result is order-dependent
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/3406>

Better covered at https://redd.it/8g7oce in comment https://www.reddit.com/r/redlang/comments/8g7oce/the_brittle_nature_of_redbol_objects/dzwjcmb/

### Short version:
```
x: 1
b: context [x: 2  f: does [x]]
c: context [f: does [x]  x: 3]
d: construct/with [x: 4] b
e: construct/with [x: 5] c
```

### Actual result
```
>> b/f
== 2
>> c/f
== 3
>> d/f
== 4
>> e/f
== 3
```

### Expected behavior
Whether both `d` and `e` should have a **rebound** body of `f`, and if `construct` or `context` or both will rebind it, is for @dockimbel to decide. But as `b` and `c` behave symmetrically, `d` and `e` should too.

### Red and platform version
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.3 ahead: 721 date: 25-May-2018/14:25:05 commit: #3573929958ac93c732407b42f09eaf4488ff6da3 ]
PLATFORM: [ name: "Windows 7 Service Pack 1" OS: 'Windows arch: 'x86-64 version: 6.1.1 build: 7601 ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2019-08-21T17:17:41Z, dockimbel, commented:
<https://github.com/red/red/issues/3406#issuecomment-523560100>

    The body of `f` is rebound, the issue is caused by a bug in the code constructing the new context, the function is rebound too early, before `x` is added to the new context, so that the rebinding fails, and the old binding remains.

