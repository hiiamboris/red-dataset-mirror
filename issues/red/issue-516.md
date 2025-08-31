
#516: Make Red CGI super friendly 
================================================================================
Issue is closed, was reported by PeterWAWood and has 12 comment(s).
[status.dismissed] [type.wish]
<https://github.com/red/red/issues/516>

Many CGI scripts require some form of "tidy up" after they have finished processing the client request, cleaning up file caches for instance. It would be a real plus for Red if it provided a means to easily close standard output so that the server will return the response to the client prior to the CGI script finishing execution.



Comments:
--------------------------------------------------------------------------------

On 2013-08-17T15:42:59Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/516#issuecomment-22814077>

    You may be able to use file descriptor 1 to do that through the C library binding, but it may not work on all systems.

--------------------------------------------------------------------------------

On 2013-09-20T11:54:38Z, dockimbel, commented:
<https://github.com/red/red/issues/516#issuecomment-24805268>

    _[...] so that the server will return the response to the client prior to the CGI script finishing execution._
    
    You assume that the server will return a response as soon as the pipe is closed, but it could rather well be that it would wait for the process to exit to return a response. Might need some online research about that to confirm the behavior of mainstream web servers.

--------------------------------------------------------------------------------

On 2013-09-21T00:42:02Z, PeterWAWood, commented:
<https://github.com/red/red/issues/516#issuecomment-24851762>

    This is where I started looking at flush: http://www.stevesouders.com/blog/2009/05/18/flushing-the-document-early/

--------------------------------------------------------------------------------

On 2013-09-24T00:47:27Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/516#issuecomment-24967441>

    That article is about flushing the output while only part of the web page is ready, not closing the output when the page is ready but the backend is still doing cleanup.
    
    On the other hand, for the Red I/O interface there's little difference: you can either use a file close or a file flush function.
    
    But the point is that your templating engine must be able to flush its output while it's still constructing the template. This has little to do with Red or its I/O interface to the platform. If I'm not mistaken, stdout is line buffered on most operating systems, so when you write the web page, it should be flushed automatically on each line. Even if that's not the case (perhaps it's only so for stderr), flushing it yourself only really makes sense if you can make your templating engine emit incomplete output.

--------------------------------------------------------------------------------

On 2014-04-26T22:52:09Z, dockimbel, commented:
<https://github.com/red/red/issues/516#issuecomment-41483385>

    I have not seen any convincing information online about having any gain by flushing the whole CGI output before the CGI process has exited. The real control on how much data and when it is sent to the client, is done by the web server, not the CGI, so there is low chance that flushing the whole output early (which in fact is at the end or almost end of CGI execution) will speed up the response to the client, as the web server may very well cache in memory the whole CGI response before sending it (in order to compress or encrypt it for example).
    
    Also, as Kaj pointed out, the potential gains from the article are for partial flushes only.

--------------------------------------------------------------------------------

On 2014-04-26T23:36:01Z, PeterWAWood, commented:
<https://github.com/red/red/issues/516#issuecomment-41484177>

    I don't think that you have understood my use case, I will give a better, real life example. I had a Rebol cgi-script running in production that:
    1. Moves an image to a cache
    2. Sends the URL of the image back to the browser
    3. Scans the cache to remove out of date images
    
    As there is no ability to flush the output in Rebol, the output was not sent to back to the browser until the cache clean up was finished.
    
    I have had to remove cache clean up due to the delay it imposes on returning the output to the browser and now have to run a batch program to clean up the cache.
    
    The cgi script is running under Cheyenne.

