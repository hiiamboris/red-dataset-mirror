
#2986: "prin CR" has different results on CLI console and GUI console
================================================================================
Issue is open, was reported by Blocode and has 6 comment(s).
[type.bug]
<https://github.com/red/red/issues/2986>

on CLI console:
```Red
>> prin 1 prin cr prin 2
2
```

on GUI console:
```Red
>> prin 1 prin cr prin 2
12
```
 


Comments:
--------------------------------------------------------------------------------

On 2019-05-20T18:16:13Z, hiiamboris, commented:
<https://github.com/red/red/issues/2986#issuecomment-494095623>

    Just an update - GUI console today:
    ```
    >> prin 1 prin cr prin 2
    1
    2
    ```

--------------------------------------------------------------------------------

On 2020-07-18T21:50:14Z, wallysilva, commented:
<https://github.com/red/red/issues/2986#issuecomment-660547465>

    Upadate - GUI console today:
    ```
    >> prin [ "hello" "world" ] 
    hello world
    
    >> prin [ "hello" lf "world" ]hello 
    world
    
    >> prin [ "hello" newline "world" ] hello 
    world
    
    >> prin [ "hello" lf "world" ] hello 
    world
    
    >> prin [ "hello" lf "world" ]hello 
    world
    
    >> about
    Red 0.6.4 for Windows built 17-Jul-2020/5:41:29-07:00 commit #7f2db9b
    ```

--------------------------------------------------------------------------------

On 2020-07-18T21:53:43Z, hiiamboris, commented:
<https://github.com/red/red/issues/2986#issuecomment-660547827>

    It also saves `prin [ "hello1" lf "hello2" ]hello1 ` in the history, so when you press Up, you get the wrong command :/

