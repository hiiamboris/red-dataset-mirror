
#2260: Opening ~20 MB file crashes Red under OSX
================================================================================
Issue is closed, was reported by rebolek and has 4 comment(s).
<https://github.com/red/red/issues/2260>

I have [this file](http://www.qyz.cz/red/messages.red) that is full of messages from Gitter’s Red/Red channel. I am able to load it under W7, but under OSX, I got `*** Runtime Error 1: access violation`.



Comments:
--------------------------------------------------------------------------------

On 2016-11-16T02:15:45Z, qtxie, commented:
<https://github.com/red/red/issues/2260#issuecomment-260833770>

    It works fine on my Mac OSX 10.9 VM.
    
    But it consumes a bit more than 500MB memory on both platforms. :astonished: 

--------------------------------------------------------------------------------

On 2016-11-16T14:23:31Z, rebolek, commented:
<https://github.com/red/red/issues/2260#issuecomment-260959084>

    I can confirm that it’s possible to load the file now. Must have been fixed with some commit in the last month. Yes, it takes lot of memory, it’s a LOT of `map!`s 😈 

