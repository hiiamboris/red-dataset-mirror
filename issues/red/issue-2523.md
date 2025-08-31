
#2523: bitset can be indexed by integers and chars using pick - but path with character is refused
================================================================================
Issue is closed, was reported by meijeru and has 0 comment(s).
[status.built] [status.tested] [type.wish]
<https://github.com/red/red/issues/2523>

```
>> b: charset "abc"
== make bitset! #{00000000000000000000000070}
>> pick b 1
== false
>> pick b #"a"
== true
>> b/1
== false
>> b/(#"a")  ; enclosed in ( ) to avoid lexical error
*** Script Error: char! type is not allowed here
*** Where: catch
```



