
#1965: Local get-word! on a function! type returns wrong address
================================================================================
Issue is closed, was reported by dockimbel and has 2 comment(s).
[status.built] [status.tested] [type.bug] [Red/System]
<https://github.com/red/red/issues/1965>

The following code should print three times the same value:

```
Red/System []

wndproc-cb!: alias function! [
    hWnd    [integer!]
    return: [integer!]
]

ext-class!: alias struct! [
    parent-proc [integer!]
]

ext-classes: as ext-class! allocate 5 * size? ext-class!

call-custom-proc: func [
    /local
        p    [ext-class!]
        proc [wndproc-cb!]
        z    [integer!]
][
    p: ext-classes
    proc: as wndproc-cb! p/parent-proc

    probe p/parent-proc
    probe as-integer :proc      
    z: as-integer :proc
    probe z
]

call-custom-proc
```

The ouput is:

```
2434568
1638240
1638240
```



Comments:
--------------------------------------------------------------------------------

On 2016-06-04T05:58:37Z, dockimbel, commented:
<https://github.com/red/red/issues/1965#issuecomment-223738689>

    `stack/encode` function is not safe as it emits 8-bit displacements only, so functions with lots of local variables can produce wrong addresses for local get-words.
    
    Also ARM's fix is missing for this issue.

