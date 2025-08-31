
#4703: Red filesystem access is buggy on mounted Windows drives on WSL2
================================================================================
Issue is closed, was reported by hiiamboris and has 22 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/4703>

**Describe the bug**

This bug involves Ubuntu Linux set up in WSL2 running on a W10 host.
[WSL2](https://docs.microsoft.com/en-us/windows/wsl/install-win10) mounts Windows drives automatically as `/mnt/c`, `/mnt/d` and so on, and one is able to work with host's files.

1. `read` on directories always returns an empty block. Try `ls %/mnt/c` or `ls %/mnt/c/Windows`, etc.
2. `read` on files returns junk bytes:
```
>> write %tmp "junk"
>> read %tmp
== {junk^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@...
```
There may be more bugs, I didn't test extensively because this is unusable.
I can't tell if it's a bug in Red or in WSL2 itself, but bash & every other tool works perfectly, so... you get it.

**To reproduce**

Assuming you have the VM set up, just run the above commands in console

**Expected behavior**

Working file access.

**Platform version**
```
Red 0.6.4 for Linux built 16-Oct-2020/21:35:47+03:00 commit #df54dcd
```
Every other mount point I've tested works fine. Just Windows (NTFS) drives that produce the glitch. This is the mtab contents, if it can tell anything (last 2 lines):
```
/dev/sdb / ext4 rw,relatime,discard,errors=remount-ro,data=ordered 0 0
tmpfs /mnt/wsl tmpfs rw,relatime 0 0
tools /init 9p ro,dirsync,relatime,aname=tools;fmask=022,loose,access=client,trans=fd,rfd=6,wfd=6 0 0
none /dev devtmpfs rw,nosuid,relatime,size=6469972k,nr_inodes=1617493,mode=755 0 0
sysfs /sys sysfs rw,nosuid,nodev,noexec,noatime 0 0
proc /proc proc rw,nosuid,nodev,noexec,noatime 0 0
devpts /dev/pts devpts rw,nosuid,noexec,noatime,gid=5,mode=620,ptmxmode=000 0 0
none /run tmpfs rw,nosuid,noexec,noatime,mode=755 0 0
none /run/lock tmpfs rw,nosuid,nodev,noexec,noatime 0 0
none /run/shm tmpfs rw,nosuid,nodev,noatime 0 0
none /run/user tmpfs rw,nosuid,nodev,noexec,noatime,mode=755 0 0
binfmt_misc /proc/sys/fs/binfmt_misc binfmt_misc rw,relatime 0 0
tmpfs /sys/fs/cgroup tmpfs rw,nosuid,nodev,noexec,relatime,mode=755 0 0
cgroup2 /sys/fs/cgroup/unified cgroup2 rw,nosuid,nodev,noexec,relatime,nsdelegate 0 0
cgroup /sys/fs/cgroup/cpuset cgroup rw,nosuid,nodev,noexec,relatime,cpuset 0 0
cgroup /sys/fs/cgroup/cpu cgroup rw,nosuid,nodev,noexec,relatime,cpu 0 0
cgroup /sys/fs/cgroup/cpuacct cgroup rw,nosuid,nodev,noexec,relatime,cpuacct 0 0
cgroup /sys/fs/cgroup/blkio cgroup rw,nosuid,nodev,noexec,relatime,blkio 0 0
cgroup /sys/fs/cgroup/memory cgroup rw,nosuid,nodev,noexec,relatime,memory 0 0
cgroup /sys/fs/cgroup/devices cgroup rw,nosuid,nodev,noexec,relatime,devices 0 0
cgroup /sys/fs/cgroup/freezer cgroup rw,nosuid,nodev,noexec,relatime,freezer 0 0
cgroup /sys/fs/cgroup/net_cls cgroup rw,nosuid,nodev,noexec,relatime,net_cls 0 0
cgroup /sys/fs/cgroup/perf_event cgroup rw,nosuid,nodev,noexec,relatime,perf_event 0 0
cgroup /sys/fs/cgroup/net_prio cgroup rw,nosuid,nodev,noexec,relatime,net_prio 0 0
cgroup /sys/fs/cgroup/hugetlb cgroup rw,nosuid,nodev,noexec,relatime,hugetlb 0 0
cgroup /sys/fs/cgroup/pids cgroup rw,nosuid,nodev,noexec,relatime,pids 0 0
cgroup /sys/fs/cgroup/rdma cgroup rw,nosuid,nodev,noexec,relatime,rdma 0 0
C:\134 /mnt/c 9p rw,dirsync,noatime,aname=drvfs;path=C:\;uid=1000;gid=1000;symlinkroot=/mnt/,mmap,access=client,msize=65536,trans=fd,rfd=8,wfd=8 0 0
D:\134 /mnt/d 9p rw,dirsync,noatime,aname=drvfs;path=D:\;uid=1000;gid=1000;symlinkroot=/mnt/,mmap,access=client,msize=65536,trans=fd,rfd=8,wfd=8 0 0
```



Comments:
--------------------------------------------------------------------------------

On 2020-11-06T07:53:06Z, bitbegin, commented:
<https://github.com/red/red/issues/4703#issuecomment-722933964>

    opened an issue: https://github.com/microsoft/WSL/issues/6203

--------------------------------------------------------------------------------

On 2020-11-11T15:00:42Z, hiiamboris, commented:
<https://github.com/red/red/issues/4703#issuecomment-725472366>

    As `fstat64` seems to be free of this bug, we should be able to use it in place of `fstat` as a workaround.

--------------------------------------------------------------------------------

On 2020-11-12T02:44:12Z, bitbegin, commented:
<https://github.com/red/red/issues/4703#issuecomment-725792646>

    but not all linux/bsd distributions have __fxstat64 (simple-io actually used)

--------------------------------------------------------------------------------

On 2020-11-12T15:27:10Z, hiiamboris, commented:
<https://github.com/red/red/issues/4703#issuecomment-726148611>

    Crap. What about loading the library at runtime and switching to fstat64 only where it's available?

--------------------------------------------------------------------------------

On 2020-11-12T18:10:18Z, greggirwin, commented:
<https://github.com/red/red/issues/4703#issuecomment-726247477>

    Do we know how many major distros don't have fstat64? 

--------------------------------------------------------------------------------

On 2020-11-13T01:19:55Z, qtxie, commented:
<https://github.com/red/red/issues/4703#issuecomment-726445289>

    I cannot use WLS2 on my Win10 (incompatible with my VMWare). @hiiamboris If using `__fxstat64` in simple-io works for you, we can use it.

--------------------------------------------------------------------------------

On 2020-11-13T03:42:42Z, qtxie, commented:
<https://github.com/red/red/issues/4703#issuecomment-726489140>

    From what I understand, `__fxstat64` will give us the right size, right? @bitbegin Which Linux distro doesn't have this function?
    In therealkenc's comment in microsoft/WSL#6203, we can see that `fstat` calls `fstat64` internally. I suspects that the `stat` structure passed to fstat is wrong. IIRC, the `stat` structure is a mess on Linux. The function `__fxstat` used on simple-io needs a `stat64` structure even the document says it's expect a `stat` structure.

--------------------------------------------------------------------------------

On 2020-11-13T06:37:52Z, bitbegin, commented:
<https://github.com/red/red/issues/4703#issuecomment-726554264>

    
    ![图片](https://user-images.githubusercontent.com/4469745/99137465-ffcb5480-2665-11eb-8164-5617cff2ca4c.png)
    
    stat! header is ok, just the size not right

--------------------------------------------------------------------------------

On 2020-11-13T19:28:32Z, hiiamboris, commented:
<https://github.com/red/red/issues/4703#issuecomment-726989377>

    @bitbegin 's `lseek` solution works for me for `read %file`
    However `read %.` still returns an empty list. If `readdir` is buggy as well, is there an alternative?

--------------------------------------------------------------------------------

On 2020-11-14T01:54:51Z, bitbegin, commented:
<https://github.com/red/red/issues/4703#issuecomment-727119401>

    https://bugzilla.kernel.org/show_bug.cgi?id=205957

--------------------------------------------------------------------------------

On 2020-11-14T18:19:31Z, hiiamboris, commented:
<https://github.com/red/red/issues/4703#issuecomment-727246027>

    @qtxie same is true for your fix

