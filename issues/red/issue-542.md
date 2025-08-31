
#542: Pre-compiled red.exe cannot find console.exe if there is space chars in path (on Windows XP)
================================================================================
Issue is closed, was reported by endo64 and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/542>

console.exe is created in "C:\Documents and Settings\All Users\Application Data\Red\" folder on Windows XP, red.exe cannot find it when used as "red.exe <script-file>" because of space characters in the path.

C:\Red>red.exe hello.red
'c:\documents' is not recognized as an internal or external command operable program or batch fie.



