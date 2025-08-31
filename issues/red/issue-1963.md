
#1963: GUI console error when passing a red file path with space on Windows 
================================================================================
Issue is closed, was reported by StephaneVeneri and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1963>

`C:\Users\xxx\Desktop>red-03jun16-ff56bf2.exe --cli "New folder\test.red"`
Works, but
`C:\Users\xxx\Desktop>red-03jun16-ff56bf2.exe "New folder\test.red"`
Displays this message on Gui console:

```
*** Error: cannot access argument file
--== Red 0.6.0 ==-- 
Type HELP for starting information. 

red>> 
```



Comments:
--------------------------------------------------------------------------------

On 2016-06-17T09:03:01Z, DideC, commented:
<https://github.com/red/red/issues/1963#issuecomment-226718386>

    Probably related: I use textpad and I have defined external tools. For Red, I have specified the program to run (l:\path\to\red.exe) the argument to pass to the program ($file) and the folder to start in ($fileDir) and I have the same problem. It used to work.
    Should be equal to the following cmd:
    
    ```
      c:
      cd red\script\test
      c:\red\red.exe myscript.red
    ```

