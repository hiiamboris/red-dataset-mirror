
#1723: When a filename ends with certain Chinese characters, READ won't work.
================================================================================
Issue is closed, was reported by JenniferLee520 and has 0 comment(s).
[status.built] [type.bug] [status.reviewed]
<https://github.com/red/red/issues/1723>

For example, when a file name ends in "贯" or "坜", READ won't work. in Windows, I get "Access error: cannot open: %中坜". In MacOSX, I get a weird return value, a block with the filename in it: [%中坜]. However, these files can read using other software without any problem.

I can give you the full Chinese character list which have this problem, if needed. There are many, many cases.

By the way. WRITE is totally fine with filename ends with these Chinese characters.



