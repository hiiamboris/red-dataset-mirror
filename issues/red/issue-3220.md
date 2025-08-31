
#3220: View/no-wait does not display window under MacOS
================================================================================
Issue is closed, was reported by PeterWAWood and has 2 comment(s).
[status.built] [type.bug] [GUI]
<https://github.com/red/red/issues/3220>

### Expected behavior
 `view/no-wait [button "quit" [unview]]` displays a window with a quit button in it.
### Actual behavior
A window face is returned but not displayed.
```text
>> view/no-wait [button "quit" [unview]]
== make object! [
    type: 'window
    offset: 678x426
    size: 84x...
>> 
```
### Steps to reproduce the problem
See above.
### Red version and build date, operating system with version.
```text
>> system/build
== make object! [
    date: 5-Feb-2018/10:07:10+08:00
    config: make object!
$ git show 
commit 5cfbe25b6c96d6aab09f553264642c338d40c1bb (HEAD -> master, upstream/master)
```


Comments:
--------------------------------------------------------------------------------

On 2018-04-25T07:46:23Z, qtxie, commented:
<https://github.com/red/red/issues/3220#issuecomment-384191815>

    Seems it works now in the gui console. 

