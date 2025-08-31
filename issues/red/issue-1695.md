
#1695: Latest binaries with a fixed name, e.g. http://static.red-lang.org/dl/auto/linux/red-latest
================================================================================
Issue is closed, was reported by xaduha and has 16 comment(s).
[status.built] [type.wish]
<https://github.com/red/red/issues/1695>

Or http://static.red-lang.org/dl/auto/linux/red-master

So people can use a simple update script without visiting or grepping the site.



Comments:
--------------------------------------------------------------------------------

On 2016-03-10T11:00:15Z, ghost, commented:
<https://github.com/red/red/issues/1695#issuecomment-194791815>

    But then `red --version` output should be in the format `x.y.z commit-hash` as the commit hash helps in finding regressions.

--------------------------------------------------------------------------------

On 2016-03-10T11:27:51Z, ghost, commented:
<https://github.com/red/red/issues/1695#issuecomment-194800203>

    Or you could use `modified? http://static.red-lang.org/download.html` and `parse` to check for any new updates which can then be downloaded. (`modified?` works fine on Rebol2, i dunno if it is implemented in Red yet)

--------------------------------------------------------------------------------

On 2016-03-10T13:10:49Z, xaduha, commented:
<https://github.com/red/red/issues/1695#issuecomment-194834999>

    I wasn't thinking that far, isn't for me to decide. People can just download latest version and then say if they are still having a problem. But the main weapon against regressions are automated tests.

--------------------------------------------------------------------------------

On 2016-03-11T04:24:02Z, ghost, commented:
<https://github.com/red/red/issues/1695#issuecomment-195173026>

    @xaduha 
    I have a rebol2 script nearly ready to auto-download the latest red binaries. It just needs a bit more tweaking. Will upload it in a day or two.
    [It is not an example of good programming or good Rebol :wink: I have been procrastinating learning Rebol, so my coding skills are non-existent]

--------------------------------------------------------------------------------

On 2016-03-11T04:45:29Z, dockimbel, commented:
<https://github.com/red/red/issues/1695#issuecomment-195181644>

    @nc-x Good news! Don't worry about it, if you publish it as a gist, others can improve it easily.

--------------------------------------------------------------------------------

On 2016-03-12T03:04:37Z, ghost, commented:
<https://github.com/red/red/issues/1695#issuecomment-195646896>

    @dockimbel @xaduha 
    https://gist.github.com/nc-x/041f3db0c660323b8687
    
    Works for me on my Windows pc. Should work on Linux and OSX also.
    Let me know if I messed up with something :wink:

--------------------------------------------------------------------------------

On 2016-03-12T14:58:27Z, xaduha, commented:
<https://github.com/red/red/issues/1695#issuecomment-195753373>

    To me it seems like a solution at the wrong level. Sure, dockimbel has better things to do, but a proper way is to solve it on the server-side or during deployment. A redirect, a symlink or just a plain old copy.

--------------------------------------------------------------------------------

On 2016-03-16T05:15:18Z, dockimbel, commented:
<https://github.com/red/red/issues/1695#issuecomment-197157295>

    The latest auto-builds are now available at these URLs: [Windows](http://static.red-lang.org/dl/auto/win/red-latest.exe), [Linux](http://static.red-lang.org/dl/auto/linux/red-latest), [MacOSX](http://static.red-lang.org/dl/auto/mac/red-latest).

