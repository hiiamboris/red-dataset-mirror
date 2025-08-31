
#5493: view in 0.65 : word result is not local 
================================================================================
Issue is closed, was reported by Olivier4LP and has 0 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/5493>

Hi, in 0.65 version of red-view the view function use a word result which is not specified as local

to reproduce the issue which can be annoying for lovers of result variable
`result: 5 
view [title "Test View"] 
result`

*** Script Error: result has no value
*** Where: catch
*** Near : result
*** Stack:   


