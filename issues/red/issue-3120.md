
#3120: VID: style error in tab-panel
================================================================================
Issue is closed, was reported by gltewalt and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3120>

### Expected behavior
`style` is applied inside tab-panel

### Actual behavior
```
*** Script Error: copy does not allow set-word! for its value argument
*** Where: copy
*** Stack: view layout layout  
```
### Steps to reproduce the problem
```
view [
  size 800x600
  origin 0x0 space 0x0
  tab-panel 800x600 [
    style fld: field 600   ;- error
    "Home " [ 
      backdrop crimson
      below
      space 0x0
      h4  "Enter  expression:" 
      fld
    ]
    "Help " [backdrop crimson ]
  ]
]
```

### Red version and build date, operating system with version.
Red for Windows version 0.6.3 built 21-Nov-2017/23:45:27-07:00



Comments:
--------------------------------------------------------------------------------

On 2017-11-30T10:25:33Z, dockimbel, commented:
<https://github.com/red/red/issues/3120#issuecomment-348146474>

    A proper error message will now be displayed in such case, as it's an [invalid syntax](https://doc.red-lang.org/en/vid.html#_tab_panel).

