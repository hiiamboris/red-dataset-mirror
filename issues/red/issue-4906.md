
#4906: File! does not escape semicolon on MOLD/SAVE
================================================================================
Issue is closed, was reported by rebolek and has 0 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/4906>

If you have a `file!` with a semicolon in name and `save` it, semicolon is not escaped and such file can’t be loaded back properly as everything after semicolon is ignored.

**To reproduce**

```
>> save %test reduce [to file! "semi;colon" 'ignored]
>> read %test
== "%semi;colon ignored"
>> load %test
== %semi
```

Note: `save/all` or `mold/all` works same.

**Expected behavior**

When semicolon is present in a `file!`, either use percent encoding so `;` will be encoded as `%3B`, or enclose whole filename in quotes, e.g.: `%"semi;colon"`.

**Platform version**

```
Red 0.6.4 for Linux built 13-May-2021/15:09:32
```



