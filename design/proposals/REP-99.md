
#99: `DELETE` should throw an error in case that it fails
================================================================================
Issue is open, was reported by Oldes and has 4 comment(s).
<https://github.com/red/REP/issues/99>

Although I consider as a nice change, that `delete %not-existing-file` now returns `false` instead throwing an error, I still believe, that it should throw an error, if the file exists and cannot be deleted (rights, locked..).

https://gitter.im/red/bugs?at=603278b347585464db91e088

Currently:
```red
>> delete %aaaa
== false
>> delete %/
== false
```
Expected:
```red
>> delete %aaaa
== false
>> delete %/bin/sh
** Access error: cannot delete: %/bin/sh
```
The error could also contain a reason, but I'm not sure if it's necessary.


Comments:
--------------------------------------------------------------------------------

On 2021-02-21T17:11:35Z, hiiamboris, commented:
<https://github.com/red/REP/issues/99#issuecomment-782890651>

    It would indeed be great if error shown a message from the OS. In the console we usually know what's happening but in a GUI program it's simply not nice to show dumb "no can't do" errors. With extra info, programmer will be able to deliver this info to the user.
    
    It's a bigger design question though, what I/O operations should provide more verbosity in errors.

--------------------------------------------------------------------------------

On 2021-02-21T17:13:36Z, Oldes, commented:
<https://github.com/red/REP/issues/99#issuecomment-782891035>

    Possible scenario where the change would be useful:
    * SCRIPT does some long processing (like compilation), where result is written into FILE
    * if the FILE is open by another process, SCRIPT fails to save result to this FILE, and the compilation time is wasted
    * so we may want to first try to delete the FILE before SCRIPT does its job,
    * but as there is `false` when FILE is locked and also when does not exists (which is ok), we must do additional check, if file exists. 

