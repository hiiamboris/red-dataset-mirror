
#2476: WISH: DIR should accept file! argument that is not a folder/directory
================================================================================
Issue is closed, was reported by meijeru and has 4 comment(s).
[type.wish] [status.contribution]
<https://github.com/red/red/issues/2476>

Currently, DIR or likewise LS, accepts an argument of type `file!` but only acts on it if that argument represents a directory/folder. In connection with the use of wildcards, it would be nice if a file argument that does not end in a `/` would also be accepted. Example:
```
red>> dir *.bat
*** Access Error: cannot open: %/C/Projects/Red/programs/*.bat/
*** Where: read
```
 The function adds the `/` itself...


Comments:
--------------------------------------------------------------------------------

On 2017-03-12T02:38:48Z, dockimbel, commented:
<https://github.com/red/red/issues/2476#issuecomment-285917078>

    `dir` and `ls` commands purpose in Red console is only to list a directory's content, that is why they expect a directory name as argument. We don't have any wildcard expansion support, nor we plan to add. Though, contributions are welcome for such feature.

--------------------------------------------------------------------------------

On 2018-04-25T05:08:30Z, PeterWAWood, commented:
<https://github.com/red/red/issues/2476#issuecomment-384162172>

    Following the introduction of the [Red REP repository for enhancements and wishes](https://gitter.im/red/red?at=5adfeed527c509a7744a3dc8), this issue is being closed.
    
    If you believe that your wish is still valid, please open a new issue for it in the new [red/REP repo](https://github.com/red/REP). It would help if you could include a link to this issue when opening an issue in the REP repository.

