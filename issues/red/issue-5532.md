
#5532: Selection on series with `path!` is undefined/untested
================================================================================
Issue is open, was reported by hiiamboris and has 6 comment(s).
[status.reviewed] [type.design]
<https://github.com/red/red/issues/5532>

**Describe the bug**

Total mess here, see the comments:
```
>> b: [a b a/b c]
>> b/('a/b)                        ;) seems to work
== c
>> select b 'a/b                   ;) or not??
== a/b
>> select/only b 'a/b              ;) or it does???
== c
>> b/('a/b): 'D
>> b
== [a D a/b c]                     ;) what is this result?
>> b/('a/b)                        ;) change at completely wrong place 🤦🏻‍♂️
== c
>> put b 'a/b 'E                   ;) and put is not even on par.. and why no put/only if there's select/only?
*** Script Error: put does not allow path! for its key argument
*** Where: put
*** Near : put b 'a/b 'E
*** Stack:  
```

**To reproduce**
```
b: [a b a/b c]
b/('a/b)
select b 'a/b 
select/only b 'a/b 
b/('a/b): 'D
b
b/('a/b)
put b 'a/b 'E
```

**Expected behavior**

`put` and path writes should accept `any-type!` key.
Lookup semantic should mirror that of `select`.

**Platform version**
```
Red 0.6.5 for Windows built 2-Jul-2024/1:21:21+08:00  commit #bbecb7e
```


Comments:
--------------------------------------------------------------------------------

On 2024-07-28T14:22:22Z, hiiamboris, commented:
<https://github.com/red/red/issues/5532#issuecomment-2254537106>

    Related but different in meaning `put` usage was proposed in https://github.com/red/red/issues/1233

--------------------------------------------------------------------------------

On 2024-07-29T00:34:41Z, greggirwin, commented:
<https://github.com/red/red/issues/5532#issuecomment-2254736036>

    This is where paths run into a wall, because of `/only` being either implied or not used. Of course it should be just one or the other. :^)

--------------------------------------------------------------------------------

On 2024-08-09T10:35:37Z, dockimbel, commented:
<https://github.com/red/red/issues/5532#issuecomment-2277654933>

    On first look I agree with  `Lookup semantic should mirror that of select.`

