
#3227: segfault on TO FLOAT! applied to empty string
================================================================================
Issue is closed, was reported by 9214 and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3227>

### Expected behavior
Something meaningful.
### Actual behavior
Segmentation fault.
### Steps to reproduce the problem
```Red
>> to float! ""
Segmentation fault
```
### Red version and build date, operating system with version.
same on Windows.
```Red
>> about
Red for Linux version 0.6.3 built 18-Feb-2018/17:02:40+05:00
```



Comments:
--------------------------------------------------------------------------------

On 2018-02-18T12:08:47Z, PeterWAWood, commented:
<https://github.com/red/red/issues/3227#issuecomment-366511441>

    `to float! ""` hangs under macOS both in the terminal and a compiled executable.

--------------------------------------------------------------------------------

On 2018-02-18T19:44:20Z, Ivo-Balbaert, commented:
<https://github.com/red/red/issues/3227#issuecomment-366541732>

    On Windows 10 and Ubuntu 16.04
    from inside the Red console, or compiled  ( Red 0.6.3)
    to float! ""
    results in 
    *** Script Error: cannot MAKE/TO float! from: ""
    I get no segmentation fault
    This seems perfectly appropriate result to me.

