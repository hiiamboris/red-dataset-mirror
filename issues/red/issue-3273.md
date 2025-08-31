
#3273: WHILE [CONTINUE] crashes Red
================================================================================
Issue is closed, was reported by rebolek and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3273>

### Expected behavior

This code shouldn't crash:

```
while [continue][print "hi!"]
```

(I'm not actually sure, what it should do, but crash it isn't for certain).

### Actual behavior

It crashes  Red without any error message.

### Steps to reproduce the problem

Run the above code in console.

### Red version and build date, operating system with version.

Red build from latest sources:

```
>> probe system/build
make object! [
    date: 22-Mar-2018/10:29:16+01:00
    config: make object! [
        config-name: 'Linux
        OS: 'Linux
```


Comments:
--------------------------------------------------------------------------------

On 2018-03-22T12:18:39Z, 9214, commented:
<https://github.com/red/red/issues/3273#issuecomment-375284207>

    so as `while [break][]`

