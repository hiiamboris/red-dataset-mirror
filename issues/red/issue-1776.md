
#1776: Issue with console when using `view [window]`
================================================================================
Issue is closed, was reported by ghost and has 2 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/1776>

1) Start the red console.
2) Type `view [window]` 
3) Press ENTER.
=> Two windows open up. One at the Center of the Screen (Lets call it A). Another at the top of the screen (Lets call it B).

Now, if you close the window B.
=>  

```
*** Runtime Error 1: access violation
*** at: 928059ADh
```

If **INSTEAD OF** window B, you close window A 
=>  You get a blinking cursor in the console. But no `red>>` prompt. So you are unable to do anything in the console. You need to close and reopen the console if you want to use Red.



Comments:
--------------------------------------------------------------------------------

On 2016-04-01T10:45:25Z, dockimbel, commented:
<https://github.com/red/red/issues/1776#issuecomment-204345393>

    Good catch, we need to forbid the `window` keyword from usage in VID, as the container is automatically created anyway.

