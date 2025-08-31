
#2814: `get-env` with `word!` argument does not work
================================================================================
Issue is closed, was reported by dander and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2814>

Here are some examples of current behavior on Windows 10:

```Red
>> env: 'temp
>> get-env env
== temp
```
```Red
>> env2: "temp"
== "temp"
>> get-env env2
== "C:\Users\davidan\AppData\Local\Temp"
>> get-env 'env2

*** Runtime Error 13: integer divide by zero
*** at: 0041A295h
```
```Red
>> get-env  'temp

*** Runtime Error 1: access violation
*** at: 0041A2CBh
```


Comments:
--------------------------------------------------------------------------------

On 2017-06-16T05:56:16Z, qtxie, commented:
<https://github.com/red/red/issues/2814#issuecomment-308940059>

    Should be fixed by this commit: 632c1a6b7de77b6bc6da6205fc157b86843fb549

