
#829: `Zero` byte in string interrupts print 
================================================================================
Issue is closed, was reported by Oldes and has 6 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/829>

Is this what we want?
Red:

```
red>> print "a^@b"
a
```

REBOL:

```
>> print "a^@b"
a b
```



Comments:
--------------------------------------------------------------------------------

On 2014-05-23T07:36:48Z, Oldes, commented:
<https://github.com/red/red/issues/829#issuecomment-43979599>

    It's still possible to use:
    
    ```
    red>> probe "a^@b"
    "a^@b"
    == "a^@b"
    ```
    
    So I'm probably fine with current behavior.

--------------------------------------------------------------------------------

On 2014-06-12T07:21:15Z, dockimbel, commented:
<https://github.com/red/red/issues/829#issuecomment-45837305>

    We should go through this (minor) issue when the console device will be properly implemented.

--------------------------------------------------------------------------------

On 2016-02-06T18:57:31Z, dockimbel, commented:
<https://github.com/red/red/issues/829#issuecomment-180838056>

    Works fine now in both CLI and GUI consoles.

