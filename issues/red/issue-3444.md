
#3444: User errors receive code 600 instead of 800
================================================================================
Issue is closed, was reported by meijeru and has 6 comment(s).
[status.built] [type.bug]
<https://github.com/red/red/issues/3444>

### Expected behavior

`e: make error! "abc"` should have `e/code = 800` since `system/catalog/errors/user/code = 800`

### Actual behavior
```
>> probe make error! "abc"
make error! [
    code: 600
    type: 'user
    ....
```
### Steps to reproduce the problem
execute above code
### Red and platform version
```
presumably all, tested on W10
```


Comments:
--------------------------------------------------------------------------------

On 2018-06-24T22:34:06Z, nedzadarek, commented:
<https://github.com/red/red/issues/3444#issuecomment-399793226>

    I can confirm on Win 8.1 64b `Red for Windows version 0.6.3 built 26-Mar-2018/1:14:22+02:00` and `cli` `Red 0.6.3 for Windows built 18-Jun-2018/15:11:17+02:00 commit #6753157`.

--------------------------------------------------------------------------------

On 2018-07-18T07:45:57Z, bitbegin, commented:
<https://github.com/red/red/issues/3444#issuecomment-405841146>

    good catch!

--------------------------------------------------------------------------------

On 2018-07-18T19:59:58Z, greggirwin, commented:
<https://github.com/red/red/issues/3444#issuecomment-406055564>

    With that merged, it looks fixed to me. Thanks @bitbegin !

