
#5468: Lit-Path and path are molded differently than word + lit-word on body-of object
================================================================================
Issue is open, was reported by GiuseppeChillemi and has 6 comment(s).
<https://github.com/red/red/issues/5468>


**Describe the bug**
As in Title


**To reproduce**
```
  make object! [
  a: 'x 
  b: quote 'y 
  c: 3 
  d: quote func []['hello] 
  e: 'x/y 
  f: quote 'x/qt 
  g: /ref
]

;--- Output:

make object! [
    a: 'x
    b: 'y
     c: 3
    d: func []['hello]
    e: x/y
    f: 'x/qt
    g: /ref
]
```
**Expected behavior**
A and B should be the same of E and F. They should bot appear as LIT- Version

**Platform version**
 ```
 RED: [ branch: "master" tag: #v0.6.4 ahead: 5087 date: 14-Jan-2024/8:37:32 commit: #7e50e5d36ac35668c5e8d43f15af804318af6570 ]
PLATFORM: [ name: "Windows 11" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 22621 ]
```


Comments:
--------------------------------------------------------------------------------

On 2024-01-16T11:44:37Z, dockimbel, commented:
<https://github.com/red/red/issues/5468#issuecomment-1893580631>

    This smells like a duplicate of an existing ticket...

--------------------------------------------------------------------------------

On 2024-01-16T12:00:01Z, hiiamboris, commented:
<https://github.com/red/red/issues/5468#issuecomment-1893602391>

    Related to https://github.com/red/red/issues/5140 but there it's about `body-of`/`to block!`, and here about `mold`.

--------------------------------------------------------------------------------

On 2024-01-26T13:51:20Z, meijeru, commented:
<https://github.com/red/red/issues/5468#issuecomment-1912101187>

    Relation to #3409??

