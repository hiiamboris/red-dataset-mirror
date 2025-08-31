
#1845: REPL: ask doesn't ignore ANSI escape sequences when positioning cursor
================================================================================
Issue is closed, was reported by x8x and has 16 comment(s).
[status.built] [status.tested] [type.wish]
<https://github.com/red/red/issues/1845>

So I have this pretty function to colorise strings in terminal (MacOS and Linux):

``` rebol
colors: [black red green yellow blue magenta cyan white]
color: function [s f /bg b /space][
    s: form s
    if space [s: rejoin [{ } s { }]]
    t: none
    if t: find colors f [
        insert s rejoin [{^[[3} (index? t) - 1 {m}]
    ]
    if all [bg t: find colors b] [
        insert s rejoin [{^[[4} (index? t) - 1 {m}]
    ]
    if t [
        append s [{^[(B^[[m}]
    ]
    s
]
```

Here I colorise a string that I'm going to use with `ask`:
![screenshot](https://cloud.githubusercontent.com/assets/9579520/14768738/369e8832-0a74-11e6-9086-a196615d072f.png)
`ask` position the cursor at the size of `b` which include ANSI escapes instead of `a` size.

Not sure about the low level of this, rebol and r3 get it right.



Comments:
--------------------------------------------------------------------------------

On 2017-05-10T12:51:23Z, qtxie, commented:
<https://github.com/red/red/issues/1845#issuecomment-300472050>

    @x8x I push a fix for it.
    FYI, `^[(B` is not ANSI escape codes, it's VT100 escape codes. Anyway, I have supported it in order to fix this issue.

--------------------------------------------------------------------------------

On 2017-05-10T15:33:55Z, Oldes, commented:
<https://github.com/red/red/issues/1845#issuecomment-300521064>

    According this page http://hackipedia.org/Protocols/Terminal,%20DEC%20VT100/html/VT100%20Escape%20Codes.html
    
    `^[(B` is `Set United States G0 character set`
    
    I would not support it. Proper reset is `^[[0m`

--------------------------------------------------------------------------------

On 2017-05-10T15:35:16Z, Oldes, commented:
<https://github.com/red/red/issues/1845#issuecomment-300521515>

    Btw... I just today started work on the `process-ansi-sequence` in the `terminal` and you did it:)

--------------------------------------------------------------------------------

On 2017-05-10T15:40:08Z, Oldes, commented:
<https://github.com/red/red/issues/1845#issuecomment-300523120>

    although you have it in `input`, so there is still work to do to filter out escape sequences in `gui-console`.. or even better support them in `red-console`

--------------------------------------------------------------------------------

On 2017-05-10T17:45:03Z, Oldes, commented:
<https://github.com/red/red/issues/1845#issuecomment-300560181>

    @qtxie btw... just noticed that your change does not work on Windows.

--------------------------------------------------------------------------------

On 2017-05-11T09:00:59Z, x8x, commented:
<https://github.com/red/red/issues/1845#issuecomment-300728465>

    @Oldes Just curious what are you working on specifically? Not doing a red level curses by chances? 8-)

--------------------------------------------------------------------------------

On 2017-05-11T09:24:32Z, Oldes, commented:
<https://github.com/red/red/issues/1845#issuecomment-300734284>

    @x8x I'm not working on anything concrete... just playing with Red, trying to learn it myself and put little pieces together, so I could use it for real work one day.

--------------------------------------------------------------------------------

On 2017-05-11T10:50:12Z, x8x, commented:
<https://github.com/red/red/issues/1845#issuecomment-300753919>

    Thanks about the note on `^[(B` , looks like I had already fixed that but not updated the code here, so here is the latest one:
    ```red
    colors: [black red green yellow blue magenta cyan white]
    ;https://en.wikipedia.org/wiki/ANSI_escape_code
    color: function [s f /bg b /space][
    	o: clear {}
    	s: form s
    	if space [s: rejoin [{ } s { }]]
    	if t: find colors f [
    		append o join {3} (index? t) - 1
    	]
    	if all [bg t: find colors b] [
    		append o join {;4} (index? t) - 1
    	]
    	unless empty? o [
    		s: rejoin [{^[[} o {m} s {^[[m}]
    	]
    	s
    ]
    ```

