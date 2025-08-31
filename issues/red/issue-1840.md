
#1840: PRIN not showing output until newline
================================================================================
Issue is closed, was reported by x8x and has 32 comment(s).
[status.reviewed] [type.review]
<https://github.com/red/red/issues/1840>

``` rebol
repeat n 10 [
    prin n
    wait 1
]
```

Above code will print `12345678910` after 10 seconds
instead of printing a number every second.



Comments:
--------------------------------------------------------------------------------

On 2016-04-23T04:34:14Z, x8x, commented:
<https://github.com/red/red/issues/1840#issuecomment-213662919>

    @qtxie not sure if `GUI` label refers to GUI-console, the problem is everywhere, compiled and non compiled scripts, REPL and not, Linux and MacOS. Thank you!

--------------------------------------------------------------------------------

On 2016-04-24T00:29:51Z, qtxie, commented:
<https://github.com/red/red/issues/1840#issuecomment-213857874>

    It works fine in CLI console on Windows. I'll try Linux and MacOS later.

--------------------------------------------------------------------------------

On 2016-05-09T08:12:44Z, ghost, commented:
<https://github.com/red/red/issues/1840#issuecomment-217802148>

    @qtxie Tested on Windows 8.1 GUI Console, got the same results as @x8x 
    
    > Above code will print 12345678910 after 10 seconds
    > instead of printing a number every second.
    
    On CLI console, I get the correct output as you got.

--------------------------------------------------------------------------------

On 2016-11-16T06:28:15Z, BrianOtto, commented:
<https://github.com/red/red/issues/1840#issuecomment-260865088>

    I am getting a similar issue when running the following example with **red --cli** on Windows 7.
    
    ```
    prin "Name: "
    name: input
    print ["Your name is" name]
    ```
    
    The "Name: " string is not displayed.
    
    However, if I add a newline to the string then it works, but this is not my desired behavior.
    
    ```
    prin "Name: ^/"
    ```

--------------------------------------------------------------------------------

On 2016-11-18T07:21:44Z, BrianOtto, commented:
<https://github.com/red/red/issues/1840#issuecomment-261465695>

    Here is another example of prin not working correctly. I am trying to write some cross-platform CLI apps, and it's becoming very difficult to get things to display properly.
    
    ```
    prin "123"
    wait 5
    prin "456"
    ```
    
    This works fine when running **red --cli** on Windows 7, but on Ubuntu 16.04.1 the "123" string doesn't display until after the 5 second wait is done.

--------------------------------------------------------------------------------

On 2016-11-18T07:47:51Z, meijeru, commented:
<https://github.com/red/red/issues/1840#issuecomment-261469167>

    Original example behaves wrongly on W10 as well.

--------------------------------------------------------------------------------

On 2016-11-18T11:55:27Z, qtxie, commented:
<https://github.com/red/red/issues/1840#issuecomment-261515231>

    @BrianOtto I pushed a fix for this issue, but using `input` still suppress the `prin`, needs more debug for it.
    As a workaround, you can use `ask`:
    
    ```
    name: ask "Name: "
    print ["Your name is" name]
    ```

--------------------------------------------------------------------------------

On 2016-11-18T18:24:12Z, x8x, commented:
<https://github.com/red/red/issues/1840#issuecomment-261603785>

    @qtxie Thanks for this! Good to have `prin` working :-)
    When you give a further look at prin/input, please also look if there is an easy fix for this https://github.com/red/red/issues/1845 .

--------------------------------------------------------------------------------

On 2016-11-18T22:34:27Z, BrianOtto, commented:
<https://github.com/red/red/issues/1840#issuecomment-261660022>

    @qtxie Awesome, thank you for fixing that so quickly!
    
    I can confirm the original example provided by @x8x and my 2nd one works in Ubuntu 16.04.1 now.
    
    Thank you for the workaround for my 1st example too. Using **ask** is working for me on Windows and Ubuntu :)

--------------------------------------------------------------------------------

On 2017-02-16T11:18:19Z, dockimbel, commented:
<https://github.com/red/red/issues/1840#issuecomment-280304045>

    It's still not working on the GUI console. It should be fixed definitely in 0.6.4 with the brand new GUI console engine.

--------------------------------------------------------------------------------

On 2018-06-21T11:14:17Z, endo64, commented:
<https://github.com/red/red/issues/1840#issuecomment-399067176>

    When `prin` followed by `input`, it does not output text, see [here](https://gitter.im/red/red/welcome?at=5b2b5d02ce3b0f268d347550),
    When using `ask` instead of `input` it works, see [here](https://gitter.im/red/red/welcome?at=5b2b5fe1ad21887018d0ce4d),
    This is interesting because `input` is simply calling `ask ""`.
    
    Also see #2679

--------------------------------------------------------------------------------

On 2018-06-21T12:05:07Z, hiiamboris, commented:
<https://github.com/red/red/issues/1840#issuecomment-399080374>

    @endo64 W7 x64 --cli:
    ```
    >> prin "123" ask "4"
    4_
    >> prin "123" input
    _
    ```
    GUI:
    ```
    >> prin "123" ask "4"
    123
    4_
    >> prin "123" input
    123
    _
    ```
    (`_` is to denote the caret position)
    Inserting `wait 1` before `input`/`ask` shows that it's the `input` that clears the line

--------------------------------------------------------------------------------

On 2018-06-22T03:00:26Z, qtxie, commented:
<https://github.com/red/red/issues/1840#issuecomment-399306035>

    Needs to wait for full I/O to support it.

--------------------------------------------------------------------------------

On 2019-03-20T16:42:25Z, greggirwin, commented:
<https://github.com/red/red/issues/1840#issuecomment-474922387>

    See comment in #2627.

--------------------------------------------------------------------------------

On 2019-03-21T09:33:16Z, hiiamboris, commented:
<https://github.com/red/red/issues/1840#issuecomment-475162361>

    @greggirwin what about https://github.com/red/red/issues/1840#issuecomment-399067176 ?

--------------------------------------------------------------------------------

On 2019-03-21T16:30:39Z, greggirwin, commented:
<https://github.com/red/red/issues/1840#issuecomment-475304184>

    @Endo64 noted it was a duplicate of this one, and we could close this ticket.

