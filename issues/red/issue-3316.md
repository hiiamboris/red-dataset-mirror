
#3316: GUI Console is missing input function
================================================================================
Issue is closed, was reported by gltewalt and has 0 comment(s).
[status.built] [status.tested] [GUI]
<https://github.com/red/red/issues/3316>

### Expected behavior
`input` waits for input
### Actual behavior
```
>> input
*** Script Error: input has no value
*** Where: catch
*** Stack:  
```
### Steps to reproduce the problem
Compile new GUI Console and attempt to use `input`
### Version (run `about` in the Red Console and paste the result here) also add OS version.
Red 0.6.3 for Windows built 3-Apr-2018/19:47:50 commit #ddacd32c
Win7 x64



