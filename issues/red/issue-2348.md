
#2348: Wrong error description on empty string conversion
================================================================================
Issue is closed, was reported by x8x and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2348>

```rebol
  to float! "" 
*** Script Error: cannot MAKE/TO float! from: float!
*** Where: to
  to integer! ""
*** Script Error: cannot MAKE/TO integer! from: integer!
*** Where: to

```


