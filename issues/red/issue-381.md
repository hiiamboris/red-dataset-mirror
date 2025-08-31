
#381: #system-global doesn't detect equal #include paths
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 2 comment(s).
[status.built] [status.tested] [type.bug] [Red/System]
<https://github.com/red/red/issues/381>

This is a blocker for including multiple or even just stacked Red/System bindings into one Red program. Not sure how related this is to #252.

```
Red []

#system-global [
    #include %../../common/common.reds
    #include %../../../Red/common/common.reds
]
```

Compiling to native code... 

```
*** Compilation Error: alias name already defined as: [struct! [
        low [integer!] 
        high [integer!]
    ]] 
*** in file: %Red/common/common.reds 
*** at line: 38 
*** near: [
    integer64-reference!: alias struct! [
        low [integer!] 
        high [integer!]
    ] 
    handle!: alias struct! [dummy [integer!]]
]
```



Comments:
--------------------------------------------------------------------------------

On 2013-01-13T11:04:25Z, dockimbel, commented:
<https://github.com/red/red/issues/381#issuecomment-12192260>

    Issue related to #277, which is problematic to fix currently. I am looking again at it to see if there is a possible short-term solution.

