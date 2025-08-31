
#4430: Unchecked error output length from DRAW
================================================================================
Issue is closed, was reported by hiiamboris and has 20 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/4430>

**Describe the bug**

```
>> draw 10x10 append/dup [] none 10000
*** Script Error: invalid Draw dialect input at: [none none none none none none none
none none none none none none none none none none none none none none none none none
none none none none none none none none none none none none none none none none none
none none none none none none none none none none none none none none none none none
none none none none none none none none none none none none none none none none none
none none none none none none none none none none none none none none none none none
none none none none none none none none none none none none none none none none none

(hundreds of lines of spam)
```

**Expected behavior**

Limit it to 100 chars or so.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 18-Mar-2020/14:57:39+03:00 commit #101a64f
```



Comments:
--------------------------------------------------------------------------------

On 2020-05-06T20:22:23Z, hiiamboris, commented:
<https://github.com/red/red/issues/4430#issuecomment-624869786>

    Previously found in `react` https://github.com/red/red/issues/3713
    Could be more mines like this?

--------------------------------------------------------------------------------

On 2020-05-22T13:45:19Z, hiiamboris, commented:
<https://github.com/red/red/issues/4430#issuecomment-632698003>

    Should be reopened:
    `draw 10x10 compose [junk (make image! 1000x1000)]`
    ```
    *** Script Error: invalid Draw dialect input at: [junk make image! [1000x1000 #{FFFFFFFFFFFFF
    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
    ...
    (GUI console becomes unresponsive after this)
    ```

--------------------------------------------------------------------------------

On 2020-05-23T02:47:40Z, qtxie, commented:
<https://github.com/red/red/issues/4430#issuecomment-632974240>

    The second case is not a DRAW issue. It's caused by no limitation of the error output. Try this in the console:
    ```
     throw make image! 1000x1000 
    ```

--------------------------------------------------------------------------------

On 2020-05-23T08:42:24Z, hiiamboris, commented:
<https://github.com/red/red/issues/4430#issuecomment-633008346>

    Cool! Let's fix that one too ;)

--------------------------------------------------------------------------------

On 2020-05-29T07:44:22Z, qtxie, commented:
<https://github.com/red/red/issues/4430#issuecomment-635817298>

    ```
    draw 10x10 compose [junk (make image! 1000x1000)]
    ```
    Now I think it's GUI console's issue. CLI console works fine.

--------------------------------------------------------------------------------

On 2021-09-29T08:11:18Z, hiiamboris, commented:
<https://github.com/red/red/issues/4430#issuecomment-929942870>

    @qtxie I'm still getting that huge output in CLI console (build `Red 0.6.4 for Windows built 18-Sep-2021/18:49:23+03:00  commit #5d45a0e`), even though it manages to do it fast.
    
    But 90000 chars is still wrong IMO. Why would we ever want to see this spam?
    
    I propose the following output:
    ```
    *** Script Error: invalid Draw dialect input at: [junk make image! [1000x1000 #{...}}]]
    *** Where: draw-image
    *** Stack: reddo draw
    ```
    I.e. hiding the image pixels.
    OTOH that will likely only fix one scenario. And I will test it with a huge block and reopen ;) 
    There must be /part missing somewhere, which is the main issue.

--------------------------------------------------------------------------------

On 2021-09-29T08:27:36Z, qtxie, commented:
<https://github.com/red/red/issues/4430#issuecomment-929955915>

    So what you want is some kind of smart mold for Red values. Depends on what the error throws. You may want to see the values in a block if throw error. 
    
    In the console side, it cannot do much. The input of the console is just a string, which taken from `print`. The console will do it best to print as much as it's capable.

--------------------------------------------------------------------------------

On 2021-09-29T08:33:22Z, qtxie, commented:
<https://github.com/red/red/issues/4430#issuecomment-929960325>

    Where we can improve is here: https://github.com/red/red/blob/master/runtime/datatypes/error.reds#L365-L373
    
    We can mold the value more smart instead of concatenate all the contents.

--------------------------------------------------------------------------------

On 2021-09-29T08:36:00Z, hiiamboris, commented:
<https://github.com/red/red/issues/4430#issuecomment-929962250>

    > some kind of smart mold for Red values
    
    I actually just thought about it. We have precedents for concise and as human-readable as possible molding:
    - in error messages
    - in [reactivity](https://github.com/red/red/blob/8df923bc476f381a62c8e56a37412223e3de0993/environment/reactivity.red#L192)
    - in [tracing output](https://gitlab.com/hiiamboris/red-mezz-warehouse/-/blob/ad8db15a4137aca1cc6222d45c4466ead3b89a77/show-deep-trace.red#L19)
    - if we want to inspect objects inside a table GUI
    
    But this feature needs to be designed first and let's leave it for later. From error messages I only demand that they fit into 3-5 lines on the screen. I agree it's not a console problem.

--------------------------------------------------------------------------------

On 2021-09-29T08:37:58Z, hiiamboris, commented:
<https://github.com/red/red/issues/4430#issuecomment-929963670>

    > 
    > 
    > Where we can improve is here: https://github.com/red/red/blob/master/runtime/datatypes/error.reds#L365-L373
    > 
    > We can mold the value more smart instead of concatenate all the contents.
    
    Yeah maybe we can pass /part to string/concatenate?

