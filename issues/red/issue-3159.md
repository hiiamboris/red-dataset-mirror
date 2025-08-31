
#3159: Uncorrect result when `find/skip` vector! with 0 and negative numbers
================================================================================
Issue is closed, was reported by WayneCui and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3159>

### Expected behavior
### Actual behavior
This statement just block the console:
```
find/skip make vector! [1 4 4 4 5 6] 4 0
```
and for negative number:
```
>> a: find/skip make vector! [1 4 4 4 5 6] 4 -1
== make vector! [4 0 11 35 5 0 11 37 6 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0...
>> a
== make vector! [4 0 11 35 5 0 11 37 6 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0...
>> length? a
== 6
```
### Steps to reproduce the problem
### Red version and build date, operating system with version.
Red 0.6.3 for Linux and automated builds red-20dec17-9ad56e4
Ubuntu 16.04 LTS, x64


Comments:
--------------------------------------------------------------------------------

On 2018-01-27T23:14:59Z, endo64, commented:
<https://github.com/red/red/issues/3159#issuecomment-361023352>

    This commit causes below issue:
    ```
    >> find "abc" complement charset " "
    == none
    ```

