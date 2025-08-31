
#1003: on-change* not called on copied objects
================================================================================
Issue is closed, was reported by IngoHohmann and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1003>

When an object is copied, or the master object is in the 'spec position of 'make, the 'on-change\* handler is not called on the new object.

```
red>> master: make object! [
[   v: 0
[   on-change*: function[w o n][print [w 'changed]]]
== make object! [
    v: 0
    on-change*: func [w o n][print [w 'cha...
red>> m1: make object! master
== make object! [
    v: 0
    on-change*: func [w o n][print [w 'cha...
red>> m2: make master []
== make object! [
    v: 0
    on-change*: func [w o n][print [w 'cha...
red>> c1: copy master
== make object! [
    v: 0
    on-change*: func [w o n][print [w 'cha...

red>> master/v: 4
v changed
== 4
red>> m2/v: 2    ; make master []
v changed
== 2

red>> m1/v: 1    ; make object! master
== 1
red>> c1/v: 3     ; copy master
== 3
```



Comments:
--------------------------------------------------------------------------------

On 2015-01-02T14:26:12Z, dockimbel, commented:
<https://github.com/red/red/issues/1003#issuecomment-68529588>

    The `m1: make object! master` is erroneous, the second argument cannot be an object! value. The fact that it passes is only due to errors not being implemented yet in Red.
    
    The COPY case is a bug.

