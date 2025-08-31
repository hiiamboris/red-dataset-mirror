
#2731: [macOS] the default working directory is not correct.
================================================================================
Issue is open, was reported by JenniferLee520 and has 0 comment(s).
[type.bug]
<https://github.com/red/red/issues/2731>

No matter where I put the "red-latest" executable file, after I execute it by double-clicking it, the default working path is always the user home path. This issue only happens on macOS. Windows doesn't have this problem. 

```Red
--== Red 0.6.2 ==-- 
Type HELP for starting information. 

>> pwd
%/Users/jenniferlee/
>> 
```


