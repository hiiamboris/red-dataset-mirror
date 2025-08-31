
#2356: Support shell scripting (i.e. `#!/usr/bin/env red`)
================================================================================
Issue is closed, was reported by typeless and has 24 comment(s).
[status.resolved] [type.review]
<https://github.com/red/red/issues/2356>

I tried to write a script on MacOSX as follows
```
#!/usr/bin/env red

print "hello world\n"
```
But it outputs
```
** Script Error: Invalid compressed data - problem: -3
** Near: script: decapsulate 
if none? script
```

Maybe this is not supported yet?

I don't know much about the language but I think scripting, which accounts for a good portion of my daily job, would be a nice start point for exploring it. 



Comments:
--------------------------------------------------------------------------------

On 2016-12-04T08:25:31Z, ghost, commented:
<https://github.com/red/red/issues/2356#issuecomment-264690961>

    I don't know whether it is supported or not.
      
    But you are not using the red header in the code..
    Try this instead -
    ```
    #!/usr/bin/env red
    Red []
    print "hello world\n"
    ```

--------------------------------------------------------------------------------

On 2016-12-04T11:31:12Z, typeless, commented:
<https://github.com/red/red/issues/2356#issuecomment-264698444>

    @nc-x 
    
    Thanks for your reply. 
    
    It doesn't work with the header either.

--------------------------------------------------------------------------------

On 2016-12-04T12:09:28Z, geekyi, commented:
<https://github.com/red/red/issues/2356#issuecomment-264700190>

    Oh wait, you actually have `red Red []` (it is what the interpreter interprets as)
    Try:
    ```
    #!/usr/bin/env red
    []
    print "hello world\n"
    ```

--------------------------------------------------------------------------------

On 2016-12-04T12:58:38Z, ghost, commented:
<https://github.com/red/red/issues/2356#issuecomment-264702504>

    @geekyi 
    I may be wrong but since the compiler and interpreter just ignore anything before `Red []` so `red Red []` should not be a problem (someone needs to check it)?
    
    @typeless 
    Try the solution at the end of https://github.com/red/red/issues/543 , maybe it works.
    Also check whether you are able to run the Red Console (interpreter) and compiler or does it also show some error.
    
    I will let someone with UNIX answer this now.

--------------------------------------------------------------------------------

On 2016-12-04T13:45:20Z, geekyi, commented:
<https://github.com/red/red/issues/2356#issuecomment-264704792>

    @nc-x Yeah, `red Red[]` works as a valid program. `Red Red[]` is invalid. Other combinations give mixed results

--------------------------------------------------------------------------------

On 2016-12-04T16:11:00Z, geekyi, commented:
<https://github.com/red/red/issues/2356#issuecomment-264712693>

    >Invalid compressed data - problem: -3
    
    @typeless that's a really strange error, it's commented out in the code since a long time??:
    https://github.com/red/red/commit/448a7264bdc257ebb7bf197b084a20142b5311f6#diff-12bb3846a732df68864adba72da97ed1R109
    
    (On second thought, this might actually be rebol code)
    Which build are you using? Does the red binary work on it's own?
    
    Probably a path issue as nc-x has pointed out. Try using the full path to red binary.
    See also #1547

--------------------------------------------------------------------------------

On 2016-12-04T16:16:49Z, ghost, commented:
<https://github.com/red/red/issues/2356#issuecomment-264713030>

    Yep, that's the workaround. See here - https://gitter.im/red/red?at=56f80fc276b6f9de194ba1e6

--------------------------------------------------------------------------------

On 2016-12-05T01:19:57Z, dockimbel, commented:
<https://github.com/red/red/issues/2356#issuecomment-264748066>

    The `Invalid compressed data - problem: -3` is an error from Rebol "decapper", in charge of decompressing the embedded payload (the Red toolchain source code) in memory, before running it. The common workaround for that, is to wrap `red` executable in a shell script, which could be used as a substitute:
    ```
    #!/bin/bash
    red $@
    ```
    OTOH, you can use the precompiled console (located in `.red/` folder), to run Red scripts in interpreted mode. That binary should work fine when directly invoked from a shebang line.

--------------------------------------------------------------------------------

On 2016-12-05T01:54:51Z, typeless, commented:
<https://github.com/red/red/issues/2356#issuecomment-264751129>

    @geekyi @nc-x @dockimbel Thanks for your supports.
    
    I tried the 'wrapper' way and change my script as follows
    ```
    #!/usr/bin/env red
    
    Red []
    
    print "hello world\n"
    ``` 
    And it outputs
    ```
    *** Error: not a Red program!
    ```
    Maybe I missed something.
    
    I'll leave this open and look forward to the feature being fully implemented. This is not an urgent issue by any means so please take your time.

--------------------------------------------------------------------------------

On 2016-12-05T16:19:13Z, geekyi, commented:
<https://github.com/red/red/issues/2356#issuecomment-264898400>

    @typeless now try the workaround I mentioned in https://github.com/red/red/issues/2356#issuecomment-264700190
    Should probably open a separate bug for this?

--------------------------------------------------------------------------------

On 2016-12-06T02:15:44Z, typeless, commented:
<https://github.com/red/red/issues/2356#issuecomment-265040922>

    > @typeless now try the workaround I mentioned in #2356 (comment)
    Should probably open a separate bug for this?
    
    @geekyi  I don't have access to my MacOSX machine right now. I'll follow your advice once I am back home.

--------------------------------------------------------------------------------

On 2016-12-06T14:27:37Z, typeless, commented:
<https://github.com/red/red/issues/2356#issuecomment-265162701>

    >@typeless now try the workaround I mentioned in #2356 (comment)
    Should probably open a separate bug for this?
    
    @geekyi It works!
    
    Now the remaining problem is the [`call`](http://www.rebol.com/docs/shell.html) function seems not supported yet.

