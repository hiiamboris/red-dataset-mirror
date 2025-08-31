
#1102: MacOSX: Missing .dylib option in /red/red.r
================================================================================
Issue is closed, was reported by x8x and has 4 comment(s).
[status.built] [type.bug]
<https://github.com/red/red/issues/1102>

red.r line 189:
filename: append temp-dir/:basename pick [%.dll %.so] Windows?

% red
Pre-compiling compression library...
**\* Driver Internal Error: Script Error : Library error: dlopen(/tmp/red/crush-2015-4-21-41408**.so**, 1): image not found 
**\* Where: build-compress-lib 
**\* Near:  [crush-lib: load/library filename 
crush-compress: make
]

  % ls /tmp/red/
-rwxr--r--   1 user  wheel    20K Apr 21 12:01 crush-2015-4-21-41408**.dylib**



Comments:
--------------------------------------------------------------------------------

On 2015-04-21T08:08:14Z, dockimbel, commented:
<https://github.com/red/red/issues/1102#issuecomment-94694827>

    Please confirm if that fix works well for you.

--------------------------------------------------------------------------------

On 2015-04-21T08:11:58Z, x8x, commented:
<https://github.com/red/red/issues/1102#issuecomment-94697246>

    Fixed thx 8-)

