
#3651: FOREACH on IMAGE! only picks first value
================================================================================
Issue is closed, was reported by WiseGenius and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3651>

`foreach` on `image!` repeatedly picks the first value only.

```
>> img: make image! 2x2
== make image! [2x2 #{FFFFFFFFFFFFFFFFFFFFFFFF}]
>> img/1: red
== 255.0.0
>> img/2: green
== 0.255.0
>> img/3: blue
== 0.0.255
>> img
== make image! [2x2 #{FF000000FF000000FFFFFFFF}]
>> foreach clr img [print clr]
255.0.0.0
255.0.0.0
255.0.0.0
255.0.0.0
```


Comments:
--------------------------------------------------------------------------------

On 2018-12-12T09:25:23Z, endo64, commented:
<https://github.com/red/red/issues/3651#issuecomment-446519466>

    Confirmed on Win10 x64. 
    `Red 0.6.4 for Windows built 11-Dec-2018/6:54:21+03:00 commit #ba12704`
    
    `forall` works as expected`
    
    ```
    >> forall img [probe first img]
    255.240.120.0
    0.255.0.0
    0.0.255.0
    255.255.255.0
    ```
    
    @WiseGenius still better to keep the issue template.

