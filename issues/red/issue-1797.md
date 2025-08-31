
#1797: No vertical scrollbar on area
================================================================================
Issue is closed, was reported by iArnold and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1797>

```
multi-line-text: copy {
Hi

This

is

multiline

input
}
multi-line-text: replace/all multi-line-text "^/" "^M^/" ;replace LF by CRLF

; View ------------------
view [
    preview-area: area 200x200
    btn-fill: button "fill" [preview-area/text: multi-line-text]
    btn-fill: button "fill EXPAND" [preview-area/text: append preview-area/text multi-line-text]
    btn-empty: button "empty" [preview-area/text: copy "" ]
]
```



Comments:
--------------------------------------------------------------------------------

On 2016-04-08T14:21:15Z, iArnold, commented:
<https://github.com/red/red/issues/1797#issuecomment-207450560>

    This bug is also responsible for not being able to copy paste larger texts to the livecode area?

