
#2231: function 'to-red-file' does not return value when the program is compiled.
================================================================================
Issue is closed, was reported by koba-yu and has 0 comment(s).
[type.bug] [status.reviewed]
<https://github.com/red/red/issues/2231>

The function 'to-red-file' works in Gui Console but it does not return value when the program is compiled. 
I made a sample code like below.

```
path: %"C:\temp"
write %"/C/temp/test.txt" to-red-file path
```

Then I execute it by Gui Console and by compiled executable.
The output of result file is below.

By Gui Console,

> %/C/temp

By compiled executable,

> %""

It seems the function does not return value when compiled.



