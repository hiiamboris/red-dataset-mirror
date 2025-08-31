
#5568: Internal error in reactivity is triggered by an unset or non-existing field
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/5568>

**Describe the bug**

Having a reactor:
```
>> r: reactor [x: 0 unset 'x]
== make object! [
    x: unset
]
```
One can get weird error messages from reactivity:
```
>> react [r/x]
*** Script Error: obj needs a value
*** Where: set
*** Near : (found?: found? or identify-sources item)
*** Stack: react identify-sources 

>> react [r/y]
*** Script Error: obj needs a value
*** Where: set
*** Near : (found?: found? or identify-sources item)
*** Stack: react identify-sources 
```

(real world case - misspelled field names)

**To reproduce**

`r: reactor [x: 0 unset 'x] react [r/x r/y]`

**Expected behavior**

More user friendly error message from the reactivity lib.

**Platform version**
`Red 0.6.5 for Windows built 27-Nov-2024/7:13:19+07:00  commit #445c17c`


