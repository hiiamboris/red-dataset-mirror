
#5102: font-size 0 crashes Red
================================================================================
Issue is closed, was reported by mikeyaunish and has 0 comment(s).
[status.built] [type.bug] [GUI]
<https://github.com/red/red/issues/5102>

This code will crash Red, font-size 0 seems to be the culprit.

```view [
    button "layout with font-size 0" [
        the-vid-code: [base1: base "HELLO" font-color white font-size 0]
        either error? err: try/all [
            output-panel/pane: layout/only the-vid-code 
            true
        ][
            print "error"
        ][
            print "no-error"
        ]
    ]
    output-panel: panel 400x400
]
```


