
#880: SWITCH passed as argument crashes on ARM
================================================================================
Issue is closed, was reported by dockimbel and has 8 comment(s).
[status.built] [status.tested] [type.bug] [Red/System]
<https://github.com/red/red/issues/880>

In Red/System on ARM backend, SWITCH passed to PRINT will crash.

```
print switch 1 [
    0 ["a"]
    1 ["b"]
    2 ["c"]
    3 ["d"]
]
```

will crash on ARM with following error:

```
*** Runtime Error 1: access violation
*** in file: libc.reds
*** at line: 123
```



Comments:
--------------------------------------------------------------------------------

On 2014-07-07T09:29:44Z, qtxie, commented:
<https://github.com/red/red/issues/880#issuecomment-48157696>

    Maybe it is the same reason that cause issue #877 

--------------------------------------------------------------------------------

On 2014-07-07T09:51:19Z, PeterWAWood, commented:
<https://github.com/red/red/issues/880#issuecomment-48159620>

    It doesn't crash 0.42 on Raspberry Pi:
    
    ```
    red>> print switch 1 [
    [   0 ["a"]
    [   1 ["b"]
    [   2 ["c"]
    [   3 ["d"]
    [   ]
    b
    red>> 
    '''
    ```

--------------------------------------------------------------------------------

On 2014-07-07T10:27:17Z, qtxie, commented:
<https://github.com/red/red/issues/880#issuecomment-48162694>

    @PeterWAWood Do you test it in Red/System?

--------------------------------------------------------------------------------

On 2014-07-07T11:05:25Z, PeterWAWood, commented:
<https://github.com/red/red/issues/880#issuecomment-48165607>

    @qtxie No in Red :-( I didn't read Nenad's report carefully enough, I'll see if I can run a test this evening using Red/System. Yes, I get the same access error:
    
    ```
    pi@raspberrypi:~/raspberryred$ ./test
    
    *** Runtime Error 1: access violation
    *** at: 00008740h
    pi@raspberrypi:~/raspberryred$ 
    ```

