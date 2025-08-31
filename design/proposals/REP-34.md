
#34: WISH: Image coordinate systems reboot
================================================================================
Issue is open, was reported by hiiamboris and has 2 comment(s).
<https://github.com/red/REP/issues/34>

https://github.com/red/red/wiki/[PROP]-Image-coordinate-systems-reboot-idea

I drafted this as a wiki page, as a basis for discussion and as a source of info on the current image coordinate systems implementation. Once a consensus will be found it may turn into a REP, which I'm willing to implement.

I would like everyone concerned with graphics to speak his mind here.



Comments:
--------------------------------------------------------------------------------

On 2019-06-08T20:31:23Z, dumblob, commented:
<https://github.com/red/REP/issues/34#issuecomment-500160582>

    After reading the wiki page I have to say I wasn't aware of nearly any of the issues, so I can't directly comment on that.
    
    But I can say one thing - [GIMP](https://www.gimp.org/ ) has since its very beginning first class support for a Lisp interface to nearly any part of GIMP itself. And after seeing some of them I'm almost sure GIMP devs faced similar challenges when designing these interfaces as is this coordinate system issue. So it's worth looking at their Lisp interfaces (they shall exist basically for every single operation GIMP supports).
    
    Also (in a broader context of GUIs and UIs) don't try to reinvent the wheel (i.e. reimplement everything from scratch for all platforms Red supports) and look at all the many backends provided e.g. by the great Nuklear single header library https://github.com/vurtun/nuklear/tree/master/demo .

