
#4571: crash of Rebol toolchain
================================================================================
Issue is open, was reported by 9214 and has 2 comment(s).
[status.deferred] [type.compiler]
<https://github.com/red/red/issues/4571>

**Describe the bug**
Among the numerous Heisenbugs and issues with Rebol2 tooclhain that I encountered in my lifetime, this is the one that I managed to consistently reproduce.

**To reproduce**
1. Open Rebol/View console session;
1. Attempt to [compile](https://github.com/red/red#running-red-from-the-sources-for-contributors) the script below using Red command-line front-end:
    ```red
    Red [] ///: :- 0 /// 0
    ```
1. Receive an error message:
    ```red
    *** Red Compiler Internal Error: Syntax Error : Invalid path -- ops/
    *** Where: none
    *** Near:  {^V^@^@^@V}
    ```
1. Retry step 2;
1. Observe the crash:
   <img src="https://user-images.githubusercontent.com/15716466/87178991-4d156f00-c2de-11ea-9755-d98671fe5364.png" width="500">

**Expected behavior**
Successful compilation. The reason for the original error message is probably compiler not being able to handle `///` syntax.

**Platform version**
 a1d1495, W10.
```red
>> rebol/version
== 2.7.8.3.1
```


Comments:
--------------------------------------------------------------------------------

On 2020-10-27T14:34:27Z, dockimbel, commented:
<https://github.com/red/red/issues/4571#issuecomment-717287106>

    There is nothing we can do for now about it until R2 gets an update to fix that bug, or until we drop R2 dependency.

