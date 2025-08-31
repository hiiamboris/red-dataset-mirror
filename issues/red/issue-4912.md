
#4912: Clickable Help Hyperlinks 
================================================================================
Issue is closed, was reported by GiuseppeChillemi and has 6 comment(s).
[status.dismissed] [type.wish]
<https://github.com/red/red/issues/4912>

   While learning Red and Rebol, I have always felt the needing to go deeper when reading the printout of `Help` output, with insights on the command and on the topic. It would be nice if `Help` would output clickable hyperlinks when printing spec strings that contain web addresses, so they can point to wiki pages with complete documentation, examples, courses.

Example:

```
aname: func [
   {This function does <this>. 
      For additional documentation go to: 
       HTTPS://github/docs/extended/aname
    }
   arg {This arg does <that>. 
      For examples go to: HTTPS://github/docs/extended/aname/arg}
]
[
   ...somecode...
]
```

There is already some code written by Toomas Voglaid @toomasv which makes hyperlinks clickable on the console. You will 2 demos in the following thread:

[Gitter Thread](https://gitter.im/red/red?at=60c306e987848634af1418c9)




Comments:
--------------------------------------------------------------------------------

On 2021-07-02T20:13:48Z, dockimbel, commented:
<https://github.com/red/red/issues/4912#issuecomment-873235331>

    We will not store hyperlinks in docstrings. Docstrings are meant to be minimal descriptions. Moreover, such links could be created automatically, so it would be a waste of space to store them.

--------------------------------------------------------------------------------

On 2021-07-02T20:57:10Z, greggirwin, commented:
<https://github.com/red/red/issues/4912#issuecomment-873252711>

    @GiuseppeChillemi one of the key issues is that hyperlinks make help not self-contained anymore. Once we link to online resources we have to ensure that those resources are always available and never change. There are ways to mitigate this, but it will be better to have tools that understand and index functions which support richer functionality.

--------------------------------------------------------------------------------

On 2021-07-02T21:03:46Z, hiiamboris, commented:
<https://github.com/red/red/issues/4912#issuecomment-873255306>

    I think this wish was more about GUI console syntax understanding capabilities than docstring format. I can understand unclickable links smell of ancient linux terminals and can be a nuisance.

