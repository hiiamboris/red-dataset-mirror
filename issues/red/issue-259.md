
#259: Function pointer spec doesn't allow function spec as argument
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 12 comment(s).
[status.reviewed] [Red/System]
<https://github.com/red/red/issues/259>

```
Red/System []

#import ["x.so" cdecl [
    f: "f" [
        f [function! []]
    ]
]]

g: as function! [
    f [function! []]
] 1
```

**\* Compilation Error: invalid definition for function -: [function! []] 
**\* at line: 9 
**\* near: [as function! [
        f [function! []]
    ] 1 
]



Comments:
--------------------------------------------------------------------------------

On 2012-09-24T12:51:23Z, dockimbel, commented:
<https://github.com/red/red/issues/259#issuecomment-8817635>

    You can't pass function! pointer as argument, function! is not a first class type in Red/System.

--------------------------------------------------------------------------------

On 2012-09-24T14:21:26Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/259#issuecomment-8820287>

    Surely we can pass function pointers, that's how callbacks work. They can be specified in #import's but not in the equivalent function pointer specification. Watch the error line number. It's an inconsistency in Red/System.

--------------------------------------------------------------------------------

On 2012-09-24T17:48:04Z, dockimbel, commented:
<https://github.com/red/red/issues/259#issuecomment-8827679>

    I will have a look at the implementation cost, if it's too high or if it opens up doors for more "inconsistencies" to be fixed, it will have to wait for Red/System v2. I want to stop adding features to Red/System now in order to save maximum time for Red (unless a feature is required for Red's implementation).

--------------------------------------------------------------------------------

On 2012-09-24T20:26:15Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/259#issuecomment-8833329>

    Waiting is fine. This is no blocker, I just want to record it before I forget.

--------------------------------------------------------------------------------

On 2012-10-25T17:44:41Z, dockimbel, commented:
<https://github.com/red/red/issues/259#issuecomment-9786961>

    No time so far to work or even analyze this topic deeper. I'm leaving it open as we might be able to process it at some point before Red/System v2 begins (else it will be in Red/System v2).

--------------------------------------------------------------------------------

On 2013-05-05T12:31:00Z, PeterWAWood, commented:
<https://github.com/red/red/issues/259#issuecomment-17451040>

    https://github.com/dockimbel/Red/issues/259

