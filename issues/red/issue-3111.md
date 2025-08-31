
#3111: take/part from not empty block with length of -1 causes access violation
================================================================================
Issue is closed, was reported by xqlab and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3111>

### Expected behavior
Return value of **[]**, **none** or **error message**
### Actual behavior
*** Runtime Error 1: access violation
### Steps to reproduce the problem
take/part [1] -1
### Red version and build date, operating system with version.
0.6.3  e.g. gui-console-2017-11-9-38328.exe Win7, Linux too


