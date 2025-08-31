
#3033: tab-completion on an unset word causes error and console exit
================================================================================
Issue is closed, was reported by dander and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3033>

All that should be necessary to reproduce is to type an undefined word, slash, then press <tab>.

```
>> foo/*** Script Error: w1 needs a value
*** Where: set
*** Stack: ask red-complete-input red-complete-path
```


