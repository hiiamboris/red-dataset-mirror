
#2876: HAS doesn't copy 'vars' arg
================================================================================
Issue is closed, was reported by greggirwin and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2876>

```
>> s: [a] b: [1]
== [1]
>> f: has s b
== func [/local a][1]
>> ff: has s b
*** Script Error: duplicate variable specified: /local
*** Where: has
*** Stack: 
>> ?? f
f: func [/local /local a][1]
```


