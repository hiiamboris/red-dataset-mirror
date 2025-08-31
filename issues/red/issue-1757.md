
#1757: Wish: Display the time when compiling a program
================================================================================
Issue is closed, was reported by iArnold and has 20 comment(s).
[status.dismissed] [type.wish]
<https://github.com/red/red/issues/1757>

Not only the dt how long compilation takes but also begin or end time of compilation.



Comments:
--------------------------------------------------------------------------------

On 2016-03-31T14:57:27Z, dockimbel, commented:
<https://github.com/red/red/issues/1757#issuecomment-203975331>

    What is it needed for? Typical compilation time are done in less than a minute, what do Red users gain from having the starting and ending timestamps displayed on every compilation?

--------------------------------------------------------------------------------

On 2016-03-31T20:28:37Z, iArnold, commented:
<https://github.com/red/red/issues/1757#issuecomment-204112480>

    I have submitted a PR to add the date time for finish time of compilation. Because Rebol console does not display the date time I cannot compare the time of last compilation with the creation time of the executable. Because I often do compilations in between other stuff that is to be done, I want to be able to check if I already compiled last version of the program. There are other scenarios where having this feature is nice to have.

--------------------------------------------------------------------------------

On 2016-04-01T04:07:15Z, dockimbel, commented:
<https://github.com/red/red/issues/1757#issuecomment-204240306>

    You can easily overload the Rebol prompt to display time (or date/time) if that's what you need:
    
    ```
    >> system/console/prompt: [reform [now/time ">> "]]
    == [reform [now/time ">> "]]
    12:06:04 >>
    ```

--------------------------------------------------------------------------------

On 2016-04-01T05:46:11Z, iArnold, commented:
<https://github.com/red/red/issues/1757#issuecomment-204255734>

    I would have to do that every time I start a new console? Besides I like the prompt as ">>" keeps my compilation strings fit on 1 line. I could try and keep it on one existing output line.

--------------------------------------------------------------------------------

On 2016-04-01T11:04:25Z, dockimbel, commented:
<https://github.com/red/red/issues/1757#issuecomment-204349674>

    Rebol supports auto-loading a `user.r` script for such definition.
    
    You didn't give any good reply to the main question: "What do Red users gain from having the starting and ending timestamps displayed on every compilation?"

--------------------------------------------------------------------------------

On 2016-04-01T11:38:09Z, iArnold, commented:
<https://github.com/red/red/issues/1757#issuecomment-204358528>

    Start and end times both are too much. The ending time is close to the real save time of the executable. In this way everybody instantly can verify that the executable is the one generated from the last compiling. Not one from an earlier compilation where you forgot to copy the program from the red folder to the folder from where to execute the program from. It is just very convenient and adds little to no overhead. 
    This is how I made it look now:
    
    > > rc %../xiangqi-master/xiangqi/xiangqi-board.red
    
    -=== Red Compiler 0.6.0 ===-
    
    Compiling /C/.../project/xiangqi-master/xiangqi/xiangqi-board.red ...
    ...compilation time : 2397 ms
    
    Compiling to native code...
    ...compilation time : 49199 ms
    ...linking time     : 496 ms
    ...output file size : 779776 bytes ...output file saved : 1-Apr-2016 13:34:31
    ...output file      : C:...\project\red-master\xiangqi-board.exe
    
    > > No extra lines used. And every new Red user can have it for free without having to adjust R2 program, just focus on Red.

--------------------------------------------------------------------------------

On 2016-04-04T08:19:54Z, iArnold, commented:
<https://github.com/red/red/issues/1757#issuecomment-205187471>

    And I can check if I compiled my source after the latest save!

--------------------------------------------------------------------------------

On 2017-02-16T19:27:59Z, iArnold, commented:
<https://github.com/red/red/issues/1757#issuecomment-280432895>

    Do not forget to reject https://github.com/red/red/pull/1767 if my presence still raises those 'Anger Management' feelings for you. Are you really that mad at me?

--------------------------------------------------------------------------------

On 2017-02-16T21:43:36Z, maximvl, commented:
<https://github.com/red/red/issues/1757#issuecomment-280470792>

    @iArnold Your change affects every user and your goal seems to be selfish, sounds like you had bad experience with copying not up-to-date binaries, but this is not common case for everybody and accepting such changes can get code and project out of control. I think this is what @dockimbel had in mind.

--------------------------------------------------------------------------------

On 2017-02-17T07:55:05Z, iArnold, commented:
<https://github.com/red/red/issues/1757#issuecomment-280580245>

    @maximvl Aren't all wishes a bit selfish? Lets wait and see other developers experience similar inconvenience we could have easily prevented with this change. 
    I see plenty of changes passing that have less practical use for the common use. All I am asking for is to display a time (not even asking for a date! here ;-) ) something that is already IN the box, and I get redirected to a solution that is an outside dependency on the user.r file that will become obsolete when Red will be bootstrapped. 
    To prevent further pollution of this thread, and not bother others involved, I suppose we better continue the discussion on our gitter channel.

