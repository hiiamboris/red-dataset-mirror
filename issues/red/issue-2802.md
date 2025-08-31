
#2802: Wish: get the list of fonts on the OS.
================================================================================
Issue is closed, was reported by JenniferLee520 and has 16 comment(s).
[status.deferred] [type.wish]
<https://github.com/red/red/issues/2802>

I would like to get the list of fonts which are installed on the OS.


Comments:
--------------------------------------------------------------------------------

On 2017-06-13T07:55:15Z, meijeru, commented:
<https://github.com/red/red/issues/2802#issuecomment-308037329>

    I second the wish. I know that there is, at least on Windows, a facility to get the list, even with criteria (e.g. "give me the list of fonts that have a certain Unicode subrange implemented").

--------------------------------------------------------------------------------

On 2017-06-18T11:56:21Z, dockimbel, commented:
<https://github.com/red/red/issues/2802#issuecomment-309273172>

    We should implement that using a port!, so it is deferred to a later release (at least 0.7.x or later).

--------------------------------------------------------------------------------

On 2017-06-18T15:35:02Z, meijeru, commented:
<https://github.com/red/red/issues/2802#issuecomment-309284723>

    What is so specific about this wish that it should use a port? I associate ports with I/O...

--------------------------------------------------------------------------------

On 2017-06-18T21:28:46Z, greggirwin, commented:
<https://github.com/red/red/issues/2802#issuecomment-309304136>

    If someone could collect API info and such, that would be great. I can't speak to current OSs, but Carl Read and I did something like this for TTFs on Win and Amiga, back in 2002. At that time, we had to read the OS font dir and parse the %.ttf files directly to get their info. I think this is where ports, or at least full I/O come into play. The structures are C level, or were then, so you had to read and cast ushort vals and the like. Surprisingly, aside from a font path issue, the old code still works on Windows (under R2).
    
    It may be better, at least as a first step, to make the standard OS font requestor available. We could always make the other available as a module. 

--------------------------------------------------------------------------------

On 2017-06-19T01:48:54Z, dockimbel, commented:
<https://github.com/red/red/issues/2802#issuecomment-309319803>

    @greggirwin `request-font` is implemented already.

--------------------------------------------------------------------------------

On 2017-06-19T01:54:24Z, dockimbel, commented:
<https://github.com/red/red/issues/2802#issuecomment-309320426>

    >  I associate ports with I/O...
    
    Ports are a higher-level abstraction of I/O, not limited to disk/networking.

--------------------------------------------------------------------------------

On 2017-06-19T02:41:35Z, greggirwin, commented:
<https://github.com/red/red/issues/2802#issuecomment-309325427>

    So it is. Should have checked.

--------------------------------------------------------------------------------

On 2018-04-25T06:19:38Z, PeterWAWood, commented:
<https://github.com/red/red/issues/2802#issuecomment-384172906>

    Following the introduction of the [Red REP repository for enhancements and wishes](https://gitter.im/red/red?at=5adfeed527c509a7744a3dc8), this issue is being closed.
    
    If you believe that your wish is still valid, please open a new issue for it in the new [red/REP repo](https://github.com/red/REP). It would help if you could include a link to this issue when opening an issue in the REP repository.

