
#2575: Console freezes on macOS if shift & right-arrow or shift & left-arrow pressed.
================================================================================
Issue is closed, was reported by PeterWAWood and has 8 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2575>

The console under macOS freezes if either shift + left-arrow or shift + right-arrow are pressed.


Comments:
--------------------------------------------------------------------------------

On 2017-04-14T02:32:45Z, PeterWAWood, commented:
<https://github.com/red/red/issues/2575#issuecomment-294071069>

    The console no longer freezes when typing shift+right-arrow or shift+left-arrow.
    
    typing shift+left-arrow results in C being typed into the console
    typing shift+rigt-arrow results in D being typed into the console
    
    In 0.6.1, the Red console behaved normally (for a macOS terminal app). shift+left-arrow selecting the character to the left of the cursor (retaining previous selections). shift+right-arrow  selecting to the right of the cursor.

--------------------------------------------------------------------------------

On 2017-04-14T04:03:57Z, qtxie, commented:
<https://github.com/red/red/issues/2575#issuecomment-294080762>

    @PeterWAWood Strange... We haven't implement `shift+arrow` selecting in the CLI console, it should not work in any version (except the old one using libreadline).

--------------------------------------------------------------------------------

On 2017-04-14T07:35:39Z, PeterWAWood, commented:
<https://github.com/red/red/issues/2575#issuecomment-294108147>

    Perhaps my memory is failing me.

--------------------------------------------------------------------------------

On 2017-04-15T10:15:13Z, michaeldesu, commented:
<https://github.com/red/red/issues/2575#issuecomment-294284432>

    I concur with what Peter observed (C&D appearing in console view, which is better than crash, but ideally shouldn't show those chars). Seen in red-14apr17-3ff52f9.

