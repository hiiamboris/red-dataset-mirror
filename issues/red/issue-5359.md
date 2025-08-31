
#5359: red-view binaries do not work on MacOS 13.4 Ventura
================================================================================
Issue is closed, was reported by rozek and has 10 comment(s).
<https://github.com/red/red/issues/5359>

**Describe the bug**

well, the title already states it: both the precompiled binary for [CLI Red](https://static.red-lang.org/dl/auto/mac/red-31jul23-40096dd12) and [GUI Red](https://static.red-lang.org/dl/auto/mac/red-view-31jul23-40096dd12.zip) do not work on my Macbook Air M2 running MacOS 13.4 Ventura


Comments:
--------------------------------------------------------------------------------

On 2023-08-01T07:14:24Z, greggirwin, commented:
<https://github.com/red/red/issues/5359#issuecomment-1659707757>

    Not a bug. Red is still 32-bit only.

--------------------------------------------------------------------------------

On 2023-08-01T07:20:26Z, rozek, commented:
<https://github.com/red/red/issues/5359#issuecomment-1659716007>

    well, this means that I will not be able to run RED on a modern Mac at all?
    
    Because of the message `bad CPU type in executable` I tried to install Rosetta 2 (softwareupdate --install-rosettav`) but RED still refused to start...

--------------------------------------------------------------------------------

On 2023-08-01T07:43:32Z, rozek, commented:
<https://github.com/red/red/issues/5359#issuecomment-1659748480>

    For those who stumble across this issue, here is what I already tried (after installing Rosetta 2, see above)
    
    * install [Homebrew](https://brew.sh/index_de)
    * install [WINE](https://wiki.winehq.org/MacOS)
    * keep in mind that you have to use `wine64` rather than `wine`
    * start a Windows(!) executable for Rebol or RED, e.g. using `wine64 start /unix "$HOME/<path-to-your-.exe-file>"`
    
    Unfortunately, I did not fully succeed yet

--------------------------------------------------------------------------------

On 2023-08-01T08:32:27Z, hiiamboris, commented:
<https://github.com/red/red/issues/5359#issuecomment-1659830371>

    Dude, there's this "search" thing in Github issues :)
    Which reveals https://github.com/red/red/issues/5087 https://github.com/red/red/issues/4889 https://github.com/red/red/issues/4359 https://github.com/red/red/issues/4491 https://github.com/red/red/issues/4216 https://github.com/red/red/issues/4652
    With https://github.com/red/red/issues/4652 having the info you're looking for.

--------------------------------------------------------------------------------

On 2023-08-01T08:46:25Z, rozek, commented:
<https://github.com/red/red/issues/5359#issuecomment-1659855223>

    damn...I did not remove the "is:open" filter from the search field - and ignored the "# closed" hint.
    
    Sorry!

