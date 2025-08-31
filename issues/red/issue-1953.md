
#1953: Livecode example bad behaviour in GUI-Console
================================================================================
Issue is closed, was reported by iArnold and has 4 comment(s).
[type.bug] [status.resolved]
<https://github.com/red/red/issues/1953>

Newest 6177 Red.
Compiled GUI-console then starting Livecode by copying 

``` Red
view [
    title "Red Livecoding"
    output: panel 400x600
    source: area 500x600 wrap font-name "Fixedsys" on-key-up [
        attempt [output/pane: layout/only load source/text]
    ]
]
```

Now try typing 
`button "Hi"`

Right after release of " the cursor jumps to the start of the input area and I see
`Hbutton "`
Cursor then also sticks to the start of the inputarea.



Comments:
--------------------------------------------------------------------------------

On 2016-06-17T10:39:16Z, dockimbel, commented:
<https://github.com/red/red/issues/1953#issuecomment-226737806>

    Cannot reproduce anymore, so it's considered fixed.

--------------------------------------------------------------------------------

On 2016-06-17T19:53:36Z, iArnold, commented:
<https://github.com/red/red/issues/1953#issuecomment-226866167>

    Affirmative. SBL solved by luck ;-P

