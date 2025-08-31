
#4992: Header of the main script gets ignored, replaced by irrelevant stuff
================================================================================
Issue is open, was reported by hiiamboris and has 6 comment(s).
[type.review]
<https://github.com/red/red/issues/4992>

**Describe the bug**

This mess is ruining my CLI tests:
1. Header of the main script is empty
2. Every new included module overrides the header

**To reproduce**

`1.red`:
```
Red [title: "Main script"]
? system/script/header
#include %2.red
#include %3.red
? system/script/header
```

`2.red`:
```
Red [title: "Included module"]
```

`3.red`:
```
Red [title: "Another ncluded module"]
```

`red --cli 1.red`:
```
SYSTEM/SCRIPT/HEADER is a none! value: none
SYSTEM/SCRIPT/HEADER is an object! with the following words and values:
     Title    string!       "Another included module"
     Name     none!         none
     Type     none!         none
     Version  none!         none
     Date     none!         none
     File     none!         none
     Home     none!         none
     Author   none!         none
     Tabs     none!         none
     Needs    none!         none
     License  none!         none
     Note     none!         none
     History  none!         none
```


**Expected behavior**

1. Stack of header values:
   - during evaluation of included file, it's own header should take priority
   - after it's included, parent header should be restored
2. Header should be set from the original script
3. `system/script/header` should never be `none` when a script is provided, as it's mandatory for a Red script, and `none` complicates access to the header. Can be `none` in plain console.

**Platform version**
```
Red 0.6.4 for Windows built 7-Oct-2021/14:56:13+03:00  commit #7218fb4
```



Comments:
--------------------------------------------------------------------------------

On 2021-11-06T15:52:27Z, hiiamboris, commented:
<https://github.com/red/red/issues/4992#issuecomment-962470937>

    Some implementation details from R2...
    `1.r`: `REBOL [title: "main"] h: system/script/header do %2.r`
    `2.r`: `REBOL [title: "included"] ? h ? system/script/header`
    ```
    >> do %1.r
    Script: "main" (none)
    Script: "included" (none)
    H is an object of value:
       Title           string!   "main"
       Date            none!     none
       Name            none!     none
       Version         none!     none
       File            none!     none
       Home            none!     none
       Author          none!     none
       Owner           none!     none
       Rights          none!     none
       Needs           none!     none
       Tabs            none!     none
       Usage           none!     none
       Purpose         none!     none
       Comment         none!     none
       History         none!     none
       Language        none!     none
       Type            none!     none
       Content         none!     none
    
    SYSTEM/SCRIPT/HEADER is an object of value:
       Title           string!   "included"
       Date            none!     none
       Name            none!     none
       Version         none!     none
       File            none!     none
       Home            none!     none
       Author          none!     none
       Owner           none!     none
       Rights          none!     none
       Needs           none!     none
       Tabs            none!     none
       Usage           none!     none
       Purpose         none!     none
       Comment         none!     none
       History         none!     none
       Language        none!     none
       Type            none!     none
       Content         none!     none
    
    ```
    What this means is that R2 stored the object itself in `do`.
    This makes it possible to store headers of all files during inclusion.
    
    An alternative way would be to store a copy of it, and `set system/script/header old-header` to restore it. This makes links (e.g. `hdr: system/script/header` and later usage of `hdr`) always refer to the up to date header object, no matter where they are accessed from.
    
    I think both approaches make sense, and have no preferences.

--------------------------------------------------------------------------------

On 2021-11-07T16:18:33Z, hiiamboris, commented:
<https://github.com/red/red/issues/4992#issuecomment-962639533>

    Following fields are missing in Red by the way compared to R2:
    ```
       Rights    
       Usage     
       Purpose   
       Comment   
       Language  
       Content   
       Owner     
    ```
    Rights, Usage and Purpose are important.

--------------------------------------------------------------------------------

On 2023-01-28T10:05:17Z, luce80, commented:
<https://github.com/red/red/issues/4992#issuecomment-1407364394>

    My proposal:
    ```
    system/script: make object! [
    	source: [...source code with header...]
    	header: source/1 ; useful to have it apart
    	title: select in header 'title ; useful to have it apart and for search purposes
    	; id: ? ; short unigue id useful for search purposes
    	scripts: [...list of `system/script` of "loaded" AKA (to be) `do`ne scripts...]
    	parent: none ; `none` for "main" script or `system/script` for a "loaded" script
    ]
    ```
    This way if `system/script/parent = none` I known I am the "main" script othewise I know I am a "module", and I can navigate all dependencies.
    
    
    
    P.S. *only* 8 years for this issue to appear and *only* another year for it to be reviewed...very low priority...

