
#3076: Access violation while using poke in forall
================================================================================
Issue is closed, was reported by gltewalt and has 2 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/3076>

```
>> c: "catnap"
== "catnap"
>> forall c [poke c 1 #"!"]
== #"!"
>> c
== "!!!!!!"
>> c: "catnap"
== "catnap"
>> forall c [c: poke c 1 #"!"]

*** Runtime Error 1: access violation
*** at: 004581B1h
```


Comments:
--------------------------------------------------------------------------------

On 2017-10-10T00:23:18Z, gltewalt, commented:
<https://github.com/red/red/issues/3076#issuecomment-335324252>

    It's the the set operation to `c`
    `forall c [set 'c 1]`

