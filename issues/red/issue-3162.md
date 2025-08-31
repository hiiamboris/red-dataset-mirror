
#3162: access violation on usage of CASE keyword (?) in PARSE rule
================================================================================
Issue is closed, was reported by 9214 and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3162>

### Expected behavior
None so far, was curious if `case` is an undocumented keyword :stuck_out_tongue: 
### Actual behavior
```Red
*** Runtime Error 1: access violation
*** at: F76D1FFCh
```
### Steps to reproduce the problem
```Red
parse [][case]
```
### Red version and build date, operating system with version.
same for Linux build
```Red
>> about
Red for Windows version 0.6.3 built 22-Dec-2017/23:01:35+05:00
```


