
#4095: quit-return does not impact return code of red binary
================================================================================
Issue is closed, was reported by iNode and has 18 comment(s).
[type.review] [status.wontfix]
<https://github.com/red/red/issues/4095>

**Chat discussion reference**
https://gitter.im/red/bugs?at=5dab1054714b8b05381f40a1

**Bug description**
It seems like `red` binary executes `console` for actual code evaluation but does not handle console's exit code properly, as result `quit` and `quit-return` calls do not affect actual return code of `red` binary.

At the moment red implementation always returns 0:
https://github.com/red/red/blob/15b13004d3263ad0a9182be6bcb851b77346f653/red.r#L510

**To reproduce**
Steps to reproduce the behaviour:
```
$ cat exit1.red
Red [Title: "Test quit-return" ]
quit-return 1
$ red exit1.red; echo $?
0
# expected return code is 1, but it's always 0
```

**Expected behavior**

Red binary return code corresponds to argument of `quit-return` or `quit` instead of hardcoded value.


**Platform version (please complete the following information)**
```
Red 0.6.4 for Linux built 19-Oct-2019/13:57:16+03:00 commit #15b1300
```



Comments:
--------------------------------------------------------------------------------

On 2021-04-06T08:38:12Z, loziniak, commented:
<https://github.com/red/red/issues/4095#issuecomment-813941412>

    Confirmed, error is still there.

--------------------------------------------------------------------------------

On 2021-04-06T09:35:42Z, loziniak, commented:
<https://github.com/red/red/issues/4095#issuecomment-813979298>

    @hiiamboris [suggested](https://gitter.im/red/bugs?at=5dab13094bc69e6b6601b19e), that it's by design, but although the [line he pointed at](https://github.com/red/red/blob/15b13004d3263ad0a9182be6bcb851b77346f653/red.r#L510) indeed returns status `0` at the end of the script, [`quit-return`'s implementation](https://github.com/red/red/blob/c5722b6efcd299c46df6469d14d23020bca40d95/environment/routines.red#L17) shows, that according to [Red/System specs](https://static.red-lang.org/red-system-specs.html#section-17.3), `quit` should exit immediately with right status, so end of the script should not even be reached.

--------------------------------------------------------------------------------

On 2021-04-06T10:02:28Z, hiiamboris, commented:
<https://github.com/red/red/issues/4095#issuecomment-813996180>

    @loziniak I suggest you pass the value of [this line](https://github.com/red/red/blob/15b13004d3263ad0a9182be6bcb851b77346f653/red.r#L504) to quit-return, test it PR the changes
    
    As for why end of script is reached, you should recall that `red` is an R2 wrapper that *calls* the Red console exe.

--------------------------------------------------------------------------------

On 2021-09-16T16:09:37Z, loziniak, commented:
<https://github.com/red/red/issues/4095#issuecomment-921037849>

    Note: it works only for console compiled from sources on Linux
    ```shell
    $ echo "Red [] quit/return 1" > ~/issue-4095.red
    $ git pull origin master
    $ echo 'Rebol [] do/args %red.r "-r -o console-new environment/console/CLI/console.red"' | ./rebol +q -s
    $ ./console-new  ~/issue-4095.red; echo $?
    1
    $ ./red-16sep21-391fe774f ~/issue-4095.red; echo $?
    Compiling compression library...
    Compiling Red console...
    Gtk-Message: 17:37:23.229: Failed to load module "xapp-gtk3-module"
    Gtk-Message: 17:37:23.229: Failed to load module "xapp-gtk3-module"
    0
    ```

--------------------------------------------------------------------------------

On 2021-09-16T16:40:22Z, hiiamboris, commented:
<https://github.com/red/red/issues/4095#issuecomment-921060020>

    But that always worked.

--------------------------------------------------------------------------------

On 2024-01-27T13:28:52Z, pepa65, commented:
<https://github.com/red/red/issues/4095#issuecomment-1913156690>

    About `Failed to load module "xapp-gtk3-module"`, is there a fix for that??

--------------------------------------------------------------------------------

On 2024-01-27T15:30:22Z, hiiamboris, commented:
<https://github.com/red/red/issues/4095#issuecomment-1913187258>

    @pepa65 tried [these ideas](https://devicetests.com/fix-failed-to-load-module-xapp-gtk3-module-error-ubuntu-2004) ?

--------------------------------------------------------------------------------

On 2024-01-27T15:42:06Z, pepa65, commented:
<https://github.com/red/red/issues/4095#issuecomment-1913189857>

    Thanks for the pointers. It seems the package `xapp` is broken on Linux Mint, the other xapp-related packages I have all installed. I will contact the distro maintainers.
    
    In actual fact, in Linux Mint, the gtk3-module is part of `libxapp1`, but there is no `i386` version of it...

--------------------------------------------------------------------------------

On 2025-04-10T18:26:06Z, dockimbel, commented:
<https://github.com/red/red/issues/4095#issuecomment-2794772265>

    The Red toolchain does not run the console anymore, so I'm closing this ticket.

