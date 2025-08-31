
#2974: Red REPL for macOS quit after inactivity
================================================================================
Issue is open, was reported by webcpu and has 18 comment(s).
[type.bug]
<https://github.com/red/red/issues/2974>

**Environment:**
Red: 0.6.3
OS: macOS 10.12.5

**Test Procedure:**
Run red and wait.

**Expected Result:**
Red REPL should not quit. Please note that hello is the current working directory name.
```
➜  hello red                                           
--== Red 0.6.3 ==-- 
                    Type HELP for starting information. 
                                                        
>> 
```

**Actual Result:**
Red REPL quit after inactivity. And there is a symbol '%'. I don't know where it comes from.
```
➜  hello red                                           
--== Red 0.6.3 ==-- 
                    Type HELP for starting information. 
                                                        
>> %                                                                                                                                                         
➜  hello red 
```


Comments:
--------------------------------------------------------------------------------

On 2017-08-15T03:07:33Z, dockimbel, commented:
<https://github.com/red/red/issues/2974#issuecomment-322365624>

    @unchartedworks 
    > OS: macOS
    
    Which macOS version?

--------------------------------------------------------------------------------

On 2017-08-15T07:36:53Z, webcpu, commented:
<https://github.com/red/red/issues/2974#issuecomment-322397699>

    10.12.5

--------------------------------------------------------------------------------

On 2017-08-15T08:13:06Z, webcpu, commented:
<https://github.com/red/red/issues/2974#issuecomment-322406561>

    I tried to measure how long Red REPL quit.
    `time red`
    However Red REPL doesn't quit. 
    And I can't reproduce this issue today, in spite of that I did reproduce this issue more than 10 times yesterday.

--------------------------------------------------------------------------------

On 2017-08-15T09:33:30Z, webcpu, commented:
<https://github.com/red/red/issues/2974#issuecomment-322423816>

    I reproduced it. It just takes much longer time.
    
    ```
    ➜  ~ time red
    --== Red 0.6.3 ==--
    Type HELP for starting information.
    
    >> red  0.12s user 0.02s system 0% cpu 1:33:54.54 total
                                                           %
    ```

--------------------------------------------------------------------------------

On 2017-08-15T12:56:46Z, davidxifeng, commented:
<https://github.com/red/red/issues/2974#issuecomment-322458771>

    I never met this issue on my mac mini & Macbook pro, with the latest macOS...

--------------------------------------------------------------------------------

On 2017-08-15T14:10:37Z, geekyi, commented:
<https://github.com/red/red/issues/2974#issuecomment-322477410>

    @unchartedworks can you check the memory at the beginning and near the end? `stats/info` if you can't do externally.
    
    Also, you don't happen to have a program which hibernates other idle programs, do you? :p 

--------------------------------------------------------------------------------

On 2017-08-15T14:15:02Z, webcpu, commented:
<https://github.com/red/red/issues/2974#issuecomment-322478904>

    @DavidFeng  @geekyi It happened many times today. My Mac never sleeps, and I am not aware of such program exists so far.  Red REPL is the only program quit after inactivity. ;)

--------------------------------------------------------------------------------

On 2017-08-16T06:34:34Z, webcpu, commented:
<https://github.com/red/red/issues/2974#issuecomment-322679548>

    The stats/info command isn't helpful. It's hard to catch the right timing to do it.

--------------------------------------------------------------------------------

On 2017-08-19T09:37:19Z, rebolek, commented:
<https://github.com/red/red/issues/2974#issuecomment-323512716>

    I haven't seen it quiting, but it hangs for me after inactivity sometimes.

