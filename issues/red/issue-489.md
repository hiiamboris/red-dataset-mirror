
#489: Compiler doesn't support SELECT index variable
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 2 comment(s).
[status.built] [status.tested] [type.wish]
<https://github.com/red/red/issues/489>

```
Red []

b: [x y]
i: 1
print b/:i
i: 'x
print b/:i
```

**\* Error: word has no value!
unset
Error: feature not implemented yet!

red>> b: [x y]
== [x y]
red>> i: 1
== 1
red>> b/:i
== x
red>> i: 'x
== x
red>> b/:i
== y



Comments:
--------------------------------------------------------------------------------

On 2013-07-08T13:44:20Z, dockimbel, commented:
<https://github.com/red/red/issues/489#issuecomment-20605933>

    Right, that feature has not been yet implemented in the compiler. I will see if this can be added quickly, else it will need to wait for my return from the ReCode conference.

