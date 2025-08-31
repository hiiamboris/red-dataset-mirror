
#4904: Missing syntax error on type when compiling
================================================================================
Issue is closed, was reported by zwortex and has 4 comment(s).
[status.deferred] [type.review]
<https://github.com/red/red/issues/4904>

**Before submitting**
https://gitter.im/red/bugs?at=60a2c27cc12aec4aa2cf1b81

**Describe the bug**
When running the following script in interpretation mode, an error is rightly triggered on boolean!, as it is an unknown type.

```
Red []
f: function [ v [integer!] return: [boolean!] ][
   print "Here"
   all [
       v == 1
       v == 2
   ]
]
f 3
print "There"
```

Shows:
```
*** Script Error: boolean! has no value
*** Where: f
*** Stack: f
```

When compiled (-c) however, the script is accepted producing the following output :
```
Here
There
```

**Expected behavior**
Consistency of behaviour

**Platform version**
Red 0.6.4 for Windows built 16-May-2021/15:45:17+02:00  commit #0fac62e



Comments:
--------------------------------------------------------------------------------

On 2021-05-18T10:20:05Z, hiiamboris, commented:
<https://github.com/red/red/issues/4904#issuecomment-843048249>

    Related: https://github.com/red/red/issues/3285

--------------------------------------------------------------------------------

On 2021-07-02T20:43:15Z, dockimbel, commented:
<https://github.com/red/red/issues/4904#issuecomment-873247368>

    `return:` field in Red is for now only for documentation purpose, it is not yet enforced (returned value types are not checked against such specification). So consider this field as a work in progress for now.

