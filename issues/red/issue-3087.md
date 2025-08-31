
#3087: Console size is not defined when script starts (Linux)
================================================================================
Issue is closed, was reported by guaracy and has 0 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/3087>

### Expected behavior

system/console/size must contains a pair with number of columns and lines of the terminal

### Actual behavior

a pair of zeroes

### Steps to reproduce the problem

```
Red []
print system/console/size
ask "Press enter"
print system/console/size
```
> 0x0
Press enter
90x30

- after press enter, system/console/size is correctly updated

### Red version and build date, operating system with version.

```
>> about
Red for Linux version 0.6.3 built 23-Oct-2017/16:04:48-02:00
```



