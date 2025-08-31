
#2306: append #{} [mold 1] (append/insert binary! block!) crashes the 0.61 console
================================================================================
Issue is closed, was reported by scureuil and has 0 comment(s).
[status.tested] [type.bug] [status.resolved]
<https://github.com/red/red/issues/2306>

Inserting/appending a block with words to a binary crashes the Red 0.61 console (Windows/OSX) and Red/View 0.61 console (Windows):

Theses work:

`append #{00} reduce [form 3]`
 == #{0033}

`append #{00} reduce [3 #"A"]`
== #{000341}

Theses crash:

`append #{00} [form 3]`

`append #{00} [form 3]`

`insert #{} [mold 1]`

> --== Red 0.6.1 ==-- 
> Type HELP for starting information. 
> 
> red>> append #{} [form 2]
> 
> *** Runtime Error 1: access violation
> *** at: 0001952Dh



