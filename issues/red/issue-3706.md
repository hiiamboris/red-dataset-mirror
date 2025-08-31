
#3706: .deb wanted for debian/ubuntu
================================================================================
Issue is closed, was reported by nonlin-lin-chaos-order-etc-etal and has 12 comment(s).
<https://github.com/red/red/issues/3706>

**Describe the bug**

chmod a+x ~/Desktop/red/red-064 
Ok
./red
Compiling compression library...
Compiling Red console...
/home/user/.red/console-2018-11-22-8164: error while loading shared libraries: libcurl.so.4: cannot open shared object file: No such file or directory
Ok
lsb_release -a && uname -a
No LSB modules are available.
Distributor ID:	Ubuntu
Description:	Ubuntu 18.04.1 LTS
Release:	18.04
Codename:	bionic
Linux i7sn1 4.15.0-43-generic #46-Ubuntu SMP Thu Dec 6 14:45:28 UTC 2018 x86_64 x86_64 x86_64 GNU/Linux
Ok
echo $PS1
Ok\n
Ok




**To reproduce**
Steps to reproduce the behavior:
1. Download stable red version above;
2. chmod+x, run.

**Expected behavior**
1. Download .deb file for red
2. dpkg -i red.deb
3. red

**Platform version (please complete the following information)**
```
Red 0.6.4 for Linux built 22-Nov-2018/8:40:38+08:00 commit #755eb94
```



Comments:
--------------------------------------------------------------------------------

On 2019-01-05T11:08:17Z, endo64, commented:
<https://github.com/red/red/issues/3706#issuecomment-451646367>

    Did you try with libcurl4?
    
    `sudo apt-get install libcurl4`

--------------------------------------------------------------------------------

On 2019-01-05T14:03:09Z, Haxerking, commented:
<https://github.com/red/red/issues/3706#issuecomment-451658119>

    Currently i don't have laptop or any smart phone to access git hub dxc so
    I'm sorry .
    
    On Sat, Jan 5, 2019, 4:38 PM Semseddin Moldibi <notifications@github.com
    wrote:
    
    > Did you try with libcurl4?
    >
    > sudo apt-get install libcurl4
    >
    > —
    > You are receiving this because you are subscribed to this thread.
    > Reply to this email directly, view it on GitHub
    > <https://github.com/red/red/issues/3706#issuecomment-451646367>, or mute
    > the thread
    > <https://github.com/notifications/unsubscribe-auth/ArnDZ-tNgTBsF_uJEhjPVJ5HBmq6zYODks5vAIelgaJpZM4ZwTPz>
    > .
    >

--------------------------------------------------------------------------------

On 2019-01-05T14:24:57Z, 9214, commented:
<https://github.com/red/red/issues/3706#issuecomment-451659854>

    As stated on [download page](https://www.red-lang.org/p/download.html), `libcurl` and other supporting libraries are _temporal_ dependencies. With that in mind, I don't see a need to create `.deb` package for what is planned to be a single executable.
    
    OP's specific problem can be resolved by following instuctions on the said page and installing 4th version of `libcurl` instead of 3rd.
    
    @x8x 👆 have you got a chance to dig into this issue for Debian-based distros?

--------------------------------------------------------------------------------

On 2019-01-05T17:07:54Z, x8x, commented:
<https://github.com/red/red/issues/3706#issuecomment-451672484>

    @9214 The download page is updated, thought, have to ~verify the exact version where the change occurred and~ add Alpine Linux instructions.

--------------------------------------------------------------------------------

On 2019-01-05T22:38:51Z, nonlin-lin-chaos-order-etc-etal, commented:
<https://github.com/red/red/issues/3706#issuecomment-451697812>

    now after 2nd thought i came to a conclusion that .deb is a rubbish and bloat for rebol/red. trashcan

--------------------------------------------------------------------------------

On 2019-03-08T11:01:36Z, pierrechtux, commented:
<https://github.com/red/red/issues/3706#issuecomment-470890718>

    ?
    Oh well, `apt install rebol red` would be just so convenient for a daily use of these marvellous languages, that are just so useful and magical for daily GNU/Linux administration tasks, both on servers or on clients.
    
    Note that I'm not referring to `dpkg -i`, but to `apt` or similar (yum, etc.).
    
    The gain of popularity from the availability of such a package would be great, by spreading the word among the world of GNU/Linux sysops.
    
    At the moment, when you mention "Rebol" or "Red" to them (us), and they have to get an executable which ... sometimes doesn't run, it is most often a no-go.  Too bad.

