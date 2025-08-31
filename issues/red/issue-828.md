
#828: Color in console
================================================================================
Issue is closed, was reported by Oldes and has 18 comment(s).
[status.dismissed] [type.wish]
<https://github.com/red/red/issues/828>

Hello, do we want to add support for colors in console?

If so, what about using standard ANSI escape codes and on Windows convert these codes in the `print*` functions into system calls. Or any other possible cross-platform solution?



Comments:
--------------------------------------------------------------------------------

On 2014-05-23T11:32:50Z, qtxie, commented:
<https://github.com/red/red/issues/828#issuecomment-43998560>

    Adding `coloring print` beyond the scope of Red language itself, so we'd better not add it in the `print*` function. Maybe we can have a `print-color` function and include it as a library.
    
    The Red console will be just enough for normal use. If anyone want a better console (e.g. coloring, plotting), they can find/create a third-party one. But if add colors in console don't add too many codes, we'll happy to include it. ;-)
    
    By the way, I also want to create an IRed shell, using the [IPython](http://ipython.org) kernel. The [notebook](http://ipython.org/notebook.html) is very cool. We already have ZeroMQ binding, so the work left is to figure out the message protocol and there are some projects we can learn from.(e.g. [IJulia](http://nbviewer.ipython.org/url/jdj.mit.edu/~stevenj/IJulia%20Preview.ipynb))

--------------------------------------------------------------------------------

On 2014-05-23T12:04:10Z, Oldes, commented:
<https://github.com/red/red/issues/828#issuecomment-44001172>

    The thing is, that if you do `print "^[[31;1mHello"` in almost all OSes except Windows, you will get color text. On Windows just something strange. So why not to add the basic functionality into Windows `print*` as well? It's not that difficult.

--------------------------------------------------------------------------------

On 2014-05-23T12:06:24Z, Oldes, commented:
<https://github.com/red/red/issues/828#issuecomment-44001338>

    If we wanted to have `print-color`, we could use something better, than prehistoric ANSI notation:) Just don't know what at this moment.

--------------------------------------------------------------------------------

On 2014-05-23T21:45:45Z, JacobGood1, commented:
<https://github.com/red/red/issues/828#issuecomment-44064099>

    I like the way you are thinking qtxie, IRed would be very cool.

--------------------------------------------------------------------------------

On 2014-06-10T07:25:45Z, dockimbel, commented:
<https://github.com/red/red/issues/828#issuecomment-45581717>

    Agreed with @qtxie. The Red console is not a unique product, we will have many different kind of consoles. For the one that will be included by default into Red and Red apps, we want it to be fully cross-platform while staying as lightweight as possible.
    
    And yes, we don't want to rely on prehistoric technologies like ANSI notation. ;-)

--------------------------------------------------------------------------------

On 2014-06-10T07:42:36Z, Oldes, commented:
<https://github.com/red/red/issues/828#issuecomment-45582930>

    Actually I still believe, that modifying just a few `print` functions (or maybe just one) in `platform/win32.reds` to mimic ANSI as it's supported on the rest of OSes is the easiest and lightweight cross-platform way.

--------------------------------------------------------------------------------

On 2014-06-10T19:09:47Z, Oldes, commented:
<https://github.com/red/red/issues/828#issuecomment-45657881>

    Ok, I have first test version working, so far just for Latin1 input and without correct color mapping. https://github.com/Oldes/Red/commit/571dc45fda2b6fd69cffc2a0c64a38b4ff7358b8

--------------------------------------------------------------------------------

On 2014-06-11T20:22:40Z, Oldes, commented:
<https://github.com/red/red/issues/828#issuecomment-45794538>

    So here it is in almost finished state: https://github.com/Oldes/Red/pull/1, missing just erase line command and modes, which seems not to be useful these days.

--------------------------------------------------------------------------------

On 2014-07-02T20:40:40Z, Oldes, commented:
<https://github.com/red/red/issues/828#issuecomment-47833105>

    ![Screen](https://raw.githubusercontent.com/Oldes/Red/media/red-screen-01.png)
    This is from my master branch... it's just quickly colorized using ANSI codes.

