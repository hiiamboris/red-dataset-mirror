
#764: Strange behavior for some variable names in functions
================================================================================
Issue is closed, was reported by WayneCui and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/764>

1. os

```
>>f: function[][os: 1] f
== 1

;both in linux and windows
>>f: function[][os: 1 print os] f
*** Error: word has no value!
unset

;only in linux, not in windows
>>f: function[os][print os] f 1
*** Error: word has no value!

;only in linux, not in windows
>>f: function[os][os] f 1
*** Error: word has no value!

>>f:func[][os: 1] f
== 1

>>f: func[][os: 1 print os] f
==1

;both in linux and windows
>>f: func[os][print os] f 1
*** Error: word has no value!
unset

;both in linux and windows
>>f: func[os][os] f 1
*** Error: word has no value!

;both in linux and windows
>>f: has [os][os: 1] f
== 1
>>os
== 1

;both in linux and windows
>>f: has [os][os: 1 print os] f
1
>>os
== 1

>>f: does [os: 1] f
== 1
>>f: does [os: 1 print os] f
1
```



Comments:
--------------------------------------------------------------------------------

On 2014-04-06T17:32:30Z, dockimbel, commented:
<https://github.com/red/red/issues/764#issuecomment-39674355>

    It looks like a regression in local context handling.

