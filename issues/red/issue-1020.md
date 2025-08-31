
#1020: Console eats TAB character in a pasted input line
================================================================================
Issue is closed, was reported by dockimbel and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1020>

When pasting source code with TABs, they get filtered out by the new console.

Example:
Pasting `a:     123` will result in `a:123` in console.



