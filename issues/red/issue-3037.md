
#3037: React is not working on face/parent/size
================================================================================
Issue is closed, was reported by qtxie and has 2 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/3037>

```
view/flags [base react [face/size: face/parent/size]][resize]
```


Comments:
--------------------------------------------------------------------------------

On 2017-09-18T10:22:32Z, dockimbel, commented:
<https://github.com/red/red/issues/3037#issuecomment-330180238>

    The window's size and offset are set in R/S code without calling the reactions checking function. So the checking needs to be done in a View's global handler.

