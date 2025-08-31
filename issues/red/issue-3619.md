
#3619: access violation on probing of EVENT/PICKED from incorrectly specified MENU facet
================================================================================
Issue is closed, was reported by 9214 and has 6 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/3619>

**Describe the bug**

Title.

**To reproduce**
Examine one of the following snippets:
```red
view [
    panel
        with [menu: ["a"]]
        on-menu [probe event/picked]
]
```
```red
view/options [
    on-menu [probe event/picked]
][
    menu: ["a"]
]
```

In both cases, `menu` block is incorrectly specified - `string!` should be followed by menu element ID in the form of `word!` value. In both cases, after clicking on `a` menu entry, I experience a crash:
```
*** Runtime Error 1: access violation
*** at: 0042F984h
```

**Expected behavior**

I would expect `event/picked` to be set either to `none` or to `unset` value. Perhaps View engine should do a preliminary check of menu block format.

**Platform version (please complete the following information):**
```
Red 0.6.4 for Windows built 28-Nov-2018/6:34:42+05:00 commit #d463f89
```


Comments:
--------------------------------------------------------------------------------

On 2018-11-30T12:28:21Z, endo64, commented:
<https://github.com/red/red/issues/3619#issuecomment-443189356>

    No crash on my W10 for both CLI & GUI, `Red 0.6.4 for Windows built 24-Nov-2018/4:38:06+03:00 commit #3b0a577`

--------------------------------------------------------------------------------

On 2018-12-11T15:57:33Z, dockimbel, commented:
<https://github.com/red/red/issues/3619#issuecomment-446254580>

    No crash on W10 here either, but `event/picked` returns invalid results.
    
    I can reproduce the crash when compiling the script.

--------------------------------------------------------------------------------

On 2018-12-11T16:23:00Z, dockimbel, commented:
<https://github.com/red/red/issues/3619#issuecomment-446264876>

    @qtxie Please implement for macOS the same fix as I did for Windows backend.

