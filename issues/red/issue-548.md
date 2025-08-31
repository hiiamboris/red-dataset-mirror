
#548: Double #include checking broken on encapped builds
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 6 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/548>

This leads to double inclusion of common.reds:

```
Red/System []

#include %common/common.reds
#include %C-library/ANSI.reds
```

-=== Red Compiler 0.4.0 ===- 

Compiling to native code...
**\* Compilation Error: alias name already defined as: [struct! [
        low [byte!] 
        high [byte!]
    ]] 
**\* in file: %common.reds 
**\* at line: 39 
**\* near: [
    integer16-reference!: alias struct! [
        low [byte!] 
        high [byte!]
    ] 
    integer64-reference!: alias struct! [
        low [integer!] 
        high [integer!]
    ]
]



Comments:
--------------------------------------------------------------------------------

On 2013-10-09T03:44:36Z, kealist, commented:
<https://github.com/red/red/issues/548#issuecomment-25944872>

    https://github.com/red/red/blob/master/red-system/loader.r#L60
    
    Re: line 60, I am not sure why that line is there in the first place or what it's doing (other than appending 'NONE at the beginning of the filename that it checks with the INCLUDE-LIST. which seems to be why it detects it as different).   Removing that line seems to resolve the issue as far as I can tell (SDL examples now compile with encapped red), and I will submit a pull request to change it.  

--------------------------------------------------------------------------------

On 2013-10-11T13:12:54Z, kealist, commented:
<https://github.com/red/red/issues/548#issuecomment-26135675>

    Change:
    
    ```
    if all [encap? encap-fs/base] [file: join encap-fs/base file]
    ```
    
    https://github.com/red/red/blob/master/red-system/loader.r#L60

--------------------------------------------------------------------------------

On 2013-10-14T03:10:05Z, kealist, commented:
<https://github.com/red/red/issues/548#issuecomment-26233656>

    Implemented and tested.  See:  https://github.com/red/red/pull/550

