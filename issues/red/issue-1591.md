
#1591: Backspace not deleting characters when Tab completion has been used
================================================================================
Issue is closed, was reported by mydoghasworms and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1591>

This is happening on Windows (10). I am using the latest automated build (red-04feb16-544aaa9).

To reproduce the problem:

Open Red console. Type 'a' and press TAB, which shows list of completions. Now hit Backspace to try and delete the 'a' on the prompt. The character is not being deleted.

You have to finish the statement and execute it before you can delete characters again.



Comments:
--------------------------------------------------------------------------------

On 2016-02-05T08:27:05Z, mydoghasworms, commented:
<https://github.com/red/red/issues/1591#issuecomment-180247991>

    Thanks, it is working now :+1: 

