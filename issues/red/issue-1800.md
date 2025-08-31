
#1800: system/utils/encap-fs.r set of set-word
================================================================================
Issue is closed, was reported by btiffin and has 2 comment(s).
[status.built] [type.review]
<https://github.com/red/red/issues/1800>

Line 91 in encap-fs.r ( cloned trunk Apr 8th, 2016, using REBOL/Pro 2.5.6.4.2) _and yes the build requires a few other changes, (lack of `unless` being one)_.

```
set 'load-cache set 'load-cache-binary: :load
```

*\* Syntax Error: Invalid word -- 'load-cache-binary:
*\* Near: (line 91) set 'load-cache set 'load-cache-binary: :load

Fixed locally by removing colon at end of `load-cache-binary:`

Along with that, generated build/bin/red actually fails, but I'm going to write that off as an SDK 2.5.6.4.2 and/or a 64bit build machine issue, and just wait longer for GNU/Linux Red releases.  Although patience is not a virtue, at all.  _Early bird gets the worm; late mouse gets the cheese._  :-)

```
prompt$ cd build/bin
prompt$ ./red
** Syntax Error: Invalid path -- error/
** Near: (line 143) system/error/(err/type)/type #":"
Aborted
```



Comments:
--------------------------------------------------------------------------------

On 2016-04-08T18:34:52Z, dockimbel, commented:
<https://github.com/red/red/issues/1800#issuecomment-207549705>

    Brian, thank you for spotting that typo in %encap-fs.r. If you are willing to make a Pull Request for fixing it, I would be glad to accept it.
    
    For the second point, it seems that Rebol 2.5.6 does not handle parens in paths. You can try by replacing `(err/type)` by a word.

