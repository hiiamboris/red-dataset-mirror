
#460: INSERT word, issue, or integer in string fails
================================================================================
Issue is closed, was reported by greggirwin and has 4 comment(s).
[type.bug] [status.resolved] [test.written]
<https://github.com/red/red/issues/460>

head insert "" 1
head insert "" 'a
head insert "" #abc

All the above crash. Using [] instead of "" works fine.



Comments:
--------------------------------------------------------------------------------

On 2013-04-05T07:01:55Z, dockimbel, commented:
<https://github.com/red/red/issues/460#issuecomment-15941692>

    I cannot reproduce the bug, it works fine here both from compiler and console:
    
    ```
    red>> head insert "" 1
    == "1"
    red>> head insert "" 'a
    == "a"
    red>> head insert "" #abc
    == "abc"
    ```

--------------------------------------------------------------------------------

On 2013-04-05T07:13:34Z, dockimbel, commented:
<https://github.com/red/red/issues/460#issuecomment-15941973>

    The commit for this feature wasn't pushed online, sorry.

