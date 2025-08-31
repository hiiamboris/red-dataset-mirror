
#5182: Write does not save the content of objects
================================================================================
Issue is closed, was reported by GiuseppeChillemi and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/5182>

If I store an object to a file using `write` I obtain an empty `make object! [ ]` inside the file. 
Try:

```
write %testwrite.txt make object! [a: 22 b: [hello]]
```

**Platform version**
Red 0.6.4 for Windows built 3-Aug-2022/14:10:46



