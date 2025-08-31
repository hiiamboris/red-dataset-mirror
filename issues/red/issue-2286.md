
#2286: Compilation error when the script is on the desktop on Windows XP
================================================================================
Issue is closed, was reported by StephaneVeneri and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2286>

With the simple script:

```
Red []
print "Bonjour"
```

C:\Documents and Settings\Administrateur\Bureau\red>red-23oct16-6db8fef.exe -c script.red

Result:

```
-=== Red Compiler 0.6.1 ===-

Compiling C:\Documents and Settings\Administrateur\Bureau\red\script.red ...
...using libRedRT built on 23-Oct-2016/13:56:45+2:00
...compilation time : 16 ms

Target: MSDOS

Compiling to native code...
*** Loading Error: file access error: %Documents
*** in file: %/C/Documents%20and%20Settings/Administrateur/Bureau/red/script.red
*** at line: 1
```

Works fine if the script is in the folder C:\red



Comments:
--------------------------------------------------------------------------------

On 2016-10-23T15:46:28Z, meijeru, commented:
<https://github.com/red/red/issues/2286#issuecomment-255595864>

    Looks like a filename with spaces is giving trouble ?!?

--------------------------------------------------------------------------------

On 2016-12-27T07:56:16Z, ghost, commented:
<https://github.com/red/red/issues/2286#issuecomment-269287712>

    If the path or filename contains spaces, compiling in release mode ( `red-latest.exe -c -r script.red` ) works fine. 
    But if we use libredRT ( `red-latest.exe -c script.red` ) then we get the above error if spaces are present.

