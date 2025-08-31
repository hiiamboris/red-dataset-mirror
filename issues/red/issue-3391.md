
#3391: image copy/part func error
================================================================================
Issue is closed, was reported by hyzwhu and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3391>

### Expected behavior
```text
>> x: make image! [4x4]
== make image! [4x4 #{
    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
>> b: copy/part at x 0 10
```
then the gui-console will run correctly
### Actual behavior
after running these code,the gui-console crush
### Steps to reproduce the problem
above code 
### Red and platform version
```text
Red 0.6.3 for Windows built 13-May-2018/9:40:57+08:00
```



Comments:
--------------------------------------------------------------------------------

On 2018-05-18T13:24:50Z, meijeru, commented:
<https://github.com/red/red/issues/3391#issuecomment-390205837>

    It even crashes with `copy/part x 10`, and with an older version (27-Apr)

