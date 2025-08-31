
#3330: Rich text does not take new-lines into account
================================================================================
Issue is closed, was reported by meijeru and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3330>

### Expected behavior

Making a multi-line text bold should make all letters bold
### Actual behavior

As many letters at the end are not made bold as there are newlines in the text
### Steps to reproduce the problem

`view [rich-text data [b "abc^/def^/ghi" /b] ]`

The last two letters are not bold, corresponding to two newlines
### Red and platform version
```
Red 0.6.3 for Windows built 11-Apr-2018/14:56:31+02:00 commit #9b085fa
on Windows 10
```


