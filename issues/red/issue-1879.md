
#1879: Area face does not scroll
================================================================================
Issue is closed, was reported by meijeru and has 8 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1879>

The documentation leads me to believe that text in an `area` face is scrolled if longer than the face can display (in any case if `wrap?` is set). However the following test program does not give scrolling:

```
Red [ ]
win: layout [long-text: area 200x100 wrap font-size: 36]
long-string: make string! 100
insert/dup long-string #"X" 100
long-text/text: long-string
view win
```



Comments:
--------------------------------------------------------------------------------

On 2016-05-05T04:04:01Z, dockimbel, commented:
<https://github.com/red/red/issues/1879#issuecomment-217072695>

    The documentation says about `area`: _A vertical scroll-bar can appear if all lines of text cannot be visible in the area (might be controlled by a flags option in the future)._ Is that what you are referring to?
    
    If that's the case, then this ticket is a duplicate of #1797.

--------------------------------------------------------------------------------

On 2016-05-05T08:11:43Z, meijeru, commented:
<https://github.com/red/red/issues/1879#issuecomment-217100025>

    Sorry for duplicating issues, but with the considerable number of tickets that are still on your plate, it is perhaps inevitable that we report issues without having checked thoroughly whether they have already been reported. As far as I am concerned you may as well close duplicates, so as to at least diminish the number of tickets that way...

--------------------------------------------------------------------------------

On 2016-05-05T08:44:11Z, dockimbel, commented:
<https://github.com/red/red/issues/1879#issuecomment-217104625>

    No worries, duplicates are a common thing in bugtracking systems despite the good will of reporters.

--------------------------------------------------------------------------------

On 2016-05-06T11:01:48Z, dockimbel, commented:
<https://github.com/red/red/issues/1879#issuecomment-217411752>

    I need to correct my comments above as I confused "scrolling" with "scrollbars". Your request and this ticket are legitimate and not duplicate of #1797.

