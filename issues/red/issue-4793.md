
#4793: `checksum` returns junk on WSL
================================================================================
Issue is closed, was reported by hiiamboris and has 50 comment(s).
[type.bug] [status.resolved]
<https://github.com/red/red/issues/4793>

**Describe the bug**

Most checksum algorithms return the same junk value, except for `tcp` and `adler32`. It is also different between console runs:
```
>> checksum {hello} 'sha1
== #{009BF50800000000A1754085AE292DC591CFC06B}
>> checksum {world} 'sha1
== #{009BF50800000000A1754085AE292DC591CFC06B}
>> checksum {wtf??} 'sha1
== #{009BF50800000000A1754085AE292DC591CFC06B}
>> mold/flat checksum {hello} 'sha256
== {#{009BF50800000000A1754085AE292DC591CFC06B18941D7A94729F7E5187978C}}
>> mold/flat checksum {world} 'sha256
== {#{009BF50800000000A1754085AE292DC591CFC06B18941D7A94729F7E5187978C}}
>> mold/flat checksum {wtf??} 'sha256
== {#{009BF50800000000A1754085AE292DC591CFC06B18941D7A94729F7E5187978C}}
>> mold/flat checksum {wtf??} 'md5
== "#{009BF50800000000A1754085AE292DC5}"
>> mold/flat checksum {1 1} 'md5
== "#{009BF50800000000A1754085AE292DC5}"
>> mold/flat checksum {1 1} 'sha384
== {#{009BF50800000000A1754085AE292DC591CFC06B18941D7A94729F7E5187978CD5889E6CC200977A6DAB912698E2E315}}
>> mold/flat checksum {mumbo jumbo} 'sha384
== {#{009BF50800000000A1754085AE292DC591CFC06B18941D7A94729F7E5187978CD5889E6CC200977A6DAB912698E2E315}}
>> mold/flat checksum {mumbo jumbo} 'sha512
== {#{009BF50800000000A1754085AE292DC591CFC06B18941D7A94729F7E5187978CD5889E6CC200977A6DAB912698E2E3150D846B484064E3D9F4D99338B33E0258}}
>> mold/flat checksum {ok nevermind} 'sha512
== {#{009BF50800000000A1754085AE292DC591CFC06B18941D7A94729F7E5187978CD5889E6CC200977A6DAB912698E2E3150D846B484064E3D9F4D99338B33E0258}}
>> mold/flat checksum {ok nevermind} 'tcp
== "51567"
>> mold/flat checksum {?} 'tcp
== "65472"
>> mold/flat checksum {this one ok?} 'tcp
== "1953"
>> mold/flat checksum {nowai} 'adler32
== "108462623"
>> mold/flat checksum {who's next} 'adler32
== "343802824"
```

**To reproduce**
```
checksum {hello} 'sha1
checksum {world} 'sha1
checksum {wtf??} 'sha1
mold/flat checksum {hello} 'sha256
mold/flat checksum {world} 'sha256
mold/flat checksum {wtf??} 'sha256
mold/flat checksum {wtf??} 'md5
mold/flat checksum {1 1} 'md5
mold/flat checksum {1 1} 'sha384
mold/flat checksum {mumbo jumbo} 'sha384
mold/flat checksum {mumbo jumbo} 'sha512
mold/flat checksum {ok nevermind} 'sha512
mold/flat checksum {ok nevermind} 'tcp
mold/flat checksum {?} 'tcp
mold/flat checksum {this one ok?} 'tcp
mold/flat checksum {nowai} 'adler32
mold/flat checksum {who's next} 'adler32
```

**Expected behavior**
```
>> checksum {hello} 'sha1
== #{AAF4C61DDCC5E8A2DABEDE0F3B482CD9AEA9434D}
>> checksum {world} 'sha1
== #{7C211433F02071597741E6FF5A8EA34789ABBF43}
>> checksum {wtf??} 'sha1
== #{9E1D3DCE2A417565AD464780878029DB49BC7979}
>> mold/flat checksum {hello} 'sha256
== {#^{2CF24DBA5FB0A30E26E83B2AC5B9E29E1B161E5C1FA7425E73043362938B9...
>> mold/flat checksum {world} 'sha256
== {#^{486EA46224D1BB4FB680F34F7C9AD96A8F24EC88BE73EA8E5A6C65260E9CB...
>> mold/flat checksum {wtf??} 'sha256
== {#^{84339F5ED7F9BC6507E2C572AFE390E3EDF24524877A1154FD60D07089B35...
>> mold/flat checksum {wtf??} 'md5
== "#{940EC80B200E6F3D7706EC666B9CA6EF}"
>> mold/flat checksum {1 1} 'md5
== "#{75C124FAE7A8B8B89183D4DE196613B3}"
>> mold/flat checksum {1 1} 'sha384
== {#^{EBDB1EA5E27295765FDE8F63016EF37D4C18F1EAC51A534C79D3888836126...
>> mold/flat checksum {mumbo jumbo} 'sha384
== {#^{F7148D2196DB221D18123BDE480A9AEC4AAE021AD4D61FDB671160702CBEA...
>> mold/flat checksum {mumbo jumbo} 'sha512
== {#^{70D13BBC3B679B5AF10B895B0C6C4091FCC76755FBD03D5516F108DCC7420...
>> mold/flat checksum {ok nevermind} 'sha512
== {#^{6C1609BEC178F962937D7D298578B0A0C2E1CF96DFC12480A63A5889EBE8B...
>> mold/flat checksum {ok nevermind} 'tcp
== "51567"
>> mold/flat checksum {?} 'tcp
== "65472"
>> mold/flat checksum {this one ok?} 'tcp
== "1953"
>> mold/flat checksum {nowai} 'adler32
== "108462623"
>> mold/flat checksum {who's next} 'adler32
== "343802824"
```

**Platform version**
```
Red 0.6.4 for Linux built 19-Dec-2020/15:56:50+03:00 commit #d082313
Ubuntu 18 on WSL2
```



Comments:
--------------------------------------------------------------------------------

On 2021-01-07T20:38:01Z, hiiamboris, commented:
<https://github.com/red/red/issues/4793#issuecomment-756369824>

    ~~I'm surprised this isn't caught by tests. Could be WSL-specific bug.~~
    Positive. WSL-only. I guess that makes all kernel socket access buggy.

--------------------------------------------------------------------------------

On 2021-01-07T23:18:19Z, greggirwin, commented:
<https://github.com/red/red/issues/4793#issuecomment-756444902>

    Thanks for narrowing it down to WSL. :+1:

--------------------------------------------------------------------------------

On 2021-01-14T08:00:12Z, qtxie, commented:
<https://github.com/red/red/issues/4793#issuecomment-760002618>

    Maybe we should create a new target `WSL` in `system/config.r`.

--------------------------------------------------------------------------------

On 2021-01-14T14:28:48Z, hiiamboris, commented:
<https://github.com/red/red/issues/4793#issuecomment-760231225>

    can we trace it to a bug in WSL?

--------------------------------------------------------------------------------

On 2021-01-14T17:13:23Z, greggirwin, commented:
<https://github.com/red/red/issues/4793#issuecomment-760335762>

    If you run the entire test suite against WSL, are there other failures, or is this an isolated case? If it's widespread, a new target makes sense. If it's a bug we can narrow down, a fix is enough.

--------------------------------------------------------------------------------

On 2021-01-14T17:53:29Z, hiiamboris, commented:
<https://github.com/red/red/issues/4793#issuecomment-760359297>

    The whole point of WSL2 as I understand it is to run any software that runs on Ubuntu, unmodified. So new target doesn't make sense to me. I'll run the tests though. I wanted in fact, just forgot, so thanks for reminder ;)

--------------------------------------------------------------------------------

On 2021-01-14T20:05:02Z, hiiamboris, commented:
<https://github.com/red/red/issues/4793#issuecomment-760445306>

    Update: everything in the test suite succeeds on WSL except the `checksum-test` and some dylib test (possibly because I'm using 2.7.8 Rebol):
    ```
    /home/test/red-master/quick-test/runnable/dylib-auto-test: error while loading shared libraries: libtest-dll1.dll: cannot open shared object file: No such file or directory
    ** - dylib-auto***************************************0 / 1 **
    ```

--------------------------------------------------------------------------------

On 2021-01-14T21:44:21Z, greggirwin, commented:
<https://github.com/red/red/issues/4793#issuecomment-760495568>

    Thanks for testing.

--------------------------------------------------------------------------------

On 2021-01-27T16:23:37Z, dockimbel, commented:
<https://github.com/red/red/issues/4793#issuecomment-768402452>

    I've removed the "priority.high" tag as WSL is not a high priority environment for now. WSL seems handy (no need to fire a virtualized Linux image), but only if it's 100% reliable for running our Linux executables.
    
    @hiiamboris Could you track down the root cause of this issue? Could it be a lack of proper encryption support through WSL?

--------------------------------------------------------------------------------

On 2021-01-27T16:25:19Z, hiiamboris, commented:
<https://github.com/red/red/issues/4793#issuecomment-768403545>

    > WSL is not a high priority environment for now.
    
    WSL just saves me a lot of time, so if you guys aren't going to look into this, I will have to ;)
    
    > Could you track down the root cause of this issue?
    
    OK.

--------------------------------------------------------------------------------

On 2021-01-27T19:01:11Z, hiiamboris, commented:
<https://github.com/red/red/issues/4793#issuecomment-768502979>

    > Let's watch this [microsoft/WSL2-Linux-Kernel#241](https://github.com/microsoft/WSL2-Linux-Kernel/issues/241) ;)

--------------------------------------------------------------------------------

On 2021-01-30T22:59:17Z, hiiamboris, commented:
<https://github.com/red/red/issues/4793#issuecomment-770293556>

    Looks like morons just nuked the whole 'issues' repo altogether.
    Guess that's one way of getting rid of bugs. No bug reports = no problem :D
    
    Well anyway they were totally not helpful. Issue is they compile kernel without `something_HASH_USER=yes` so their kernel does not support that. I tried GCC 9 and 10, kernel version 5 and 4, nothing compiles. Only tortured the battery for 3 days.
    And even if it did compile, it would have benefited only me, but we want this to work on any WSL VM, so...
    The proper solution would be to follow the TODO marker in one of the lines:
    https://github.com/red/red/blob/416090f3bde631cbb62f5213cf71900460cd805f/runtime/crypto.reds#L640
    We should not rely on kernel build options.

--------------------------------------------------------------------------------

On 2021-02-02T08:15:51Z, qtxie, commented:
<https://github.com/red/red/issues/4793#issuecomment-771453755>

    I guess LIBCRYPTO is always available on modern Linux Distros. I'm OK to rely on it on Non-Windows platforms.

--------------------------------------------------------------------------------

On 2021-09-27T01:18:25Z, qtxie, commented:
<https://github.com/red/red/issues/4793#issuecomment-927428723>

    @hiiamboris Did you make it work by using LIBCRYPTO on WSL?

--------------------------------------------------------------------------------

On 2021-09-27T07:28:34Z, hiiamboris, commented:
<https://github.com/red/red/issues/4793#issuecomment-927605506>

    No, switched to other tasks..

--------------------------------------------------------------------------------

On 2021-10-17T03:54:01Z, qtxie, commented:
<https://github.com/red/red/issues/4793#issuecomment-945044620>

    Seems MS fixed it. It works fine on WSL2 Ubuntu 20.04, Windows 11 Ver 10.0.22000.258.
    ```
    qt@DESKTOP-M49UILA:~$ uname -a
    Linux DESKTOP-M49UILA 5.10.60.1-microsoft-standard-WSL2 #1 SMP Wed Aug 25 23:20:18 UTC 2021 x86_64 x86_64 x86_64 GNU/Linux
    qt@DESKTOP-M49UILA:~$ lsb_release -a
    No LSB modules are available.
    Distributor ID: Ubuntu
    Description:    Ubuntu 20.04 LTS
    Release:        20.04
    Codename:       focal
    ```

--------------------------------------------------------------------------------

On 2021-10-17T07:44:22Z, hiiamboris, commented:
<https://github.com/red/red/issues/4793#issuecomment-945066723>

    Yes, thanks! Updates following https://github.com/microsoft/WSL/issues/5650#issuecomment-765825503

--------------------------------------------------------------------------------

On 2021-10-17T07:46:34Z, hiiamboris, commented:
<https://github.com/red/red/issues/4793#issuecomment-945066945>

    Are we planning to switch to libcrypto for more robustness, or closing this for now?

--------------------------------------------------------------------------------

On 2021-10-17T08:09:42Z, qtxie, commented:
<https://github.com/red/red/issues/4793#issuecomment-945070231>

    No plan for now.

--------------------------------------------------------------------------------

On 2023-06-28T21:53:15Z, hiiamboris, commented:
<https://github.com/red/red/issues/4793#issuecomment-1612154888>

    There is a report on Gitter (red/welcome, 28 June 2023, can't get a working link in this piece of crap) that docker containers (the only reasonable way to run Red on Mac) have the same kernel issue. Should this be reason enough to switch to libcrypto?

--------------------------------------------------------------------------------

On 2023-06-29T01:06:47Z, qtxie, commented:
<https://github.com/red/red/issues/4793#issuecomment-1612292946>

    @hiiamboris We do use libcrypto on macOS.

--------------------------------------------------------------------------------

On 2023-06-29T07:12:00Z, hiiamboris, commented:
<https://github.com/red/red/issues/4793#issuecomment-1612533472>

    But docker runs Linux.

--------------------------------------------------------------------------------

On 2023-06-29T09:29:52Z, qtxie, commented:
<https://github.com/red/red/issues/4793#issuecomment-1612705982>

    @hiiamboris  Ok. It runs on Linux on macOS host. I'm fine to switch to libcrypto. But one issue is that the name of the libcrypto are different among Linux distros.

--------------------------------------------------------------------------------

On 2023-06-29T09:34:45Z, hiiamboris, commented:
<https://github.com/red/red/issues/4793#issuecomment-1612712538>

    So need dynamic loading?

--------------------------------------------------------------------------------

On 2023-06-29T10:47:48Z, hiiamboris, commented:
<https://github.com/red/red/issues/4793#issuecomment-1612864599>

    Docker update solved it as reported, so until anyone reports the same bug on a cloud server, it's no priority.

