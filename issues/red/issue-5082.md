
#5082: lexer hangs trying to transcode "1.79769313486232e308"
================================================================================
Issue is closed, was reported by gurzgri and has 2 comment(s).
[status.built] [type.bug] [test.written]
<https://github.com/red/red/issues/5082>

**Describe the bug**
`transcode "1.79769313486232e308"` (or typing `1.79769313486232e308` in the console) hangs Red

**Expected behavior**
should load value (with less precision than given) as 1.7976931348623e308 or report it as invalid float syntax

**Platform version**
Red 0.6.4 for Windows built 19-Feb-2022/3:17:54+01:00 commit #abb5641


Comments:
--------------------------------------------------------------------------------

On 2022-02-19T13:59:33Z, dockimbel, commented:
<https://github.com/red/red/issues/5082#issuecomment-1046024092>

    It hangs in `dtoa/to-float` called there: https://github.com/red/red/blob/master/runtime/lexer.reds#L1707
    
    @qtxie That one is for you.

