
#3399: libcurl.so.4: cannot open shared object file: No such file or directory
================================================================================
Issue is closed, was reported by s0kil and has 8 comment(s).
<https://github.com/red/red/issues/3399>

Downloaded red-063
```
sudo apt-get install ia32-libs libc6-i386 libcurl3
chmod u+x red-063
./red-063
```

Output:
```
/home/user/.red/console-2017-8-3-49893: error while loading shared libraries: libcurl.so.4: cannot open shared object file: No such file or directory
```

OS Info:
```
RELEASE=18.3
CODENAME=sylvia
EDITION="Cinnamon 64-bit"
DESCRIPTION="Linux Mint 18.3 Sylvia"
DESKTOP=Gnome
TOOLKIT=GTK
GRUB_TITLE=Linux Mint 18.3 Cinnamon 64-bit
```

Solution:
```
sudo apt-get install libcurl3:i386
```


Comments:
--------------------------------------------------------------------------------

On 2018-11-26T18:48:04Z, greggirwin, commented:
<https://github.com/red/red/issues/3399#issuecomment-441752317>

    There is no 64-bit version of Red at this time. You need to install the 32-bit libs for your OS.

--------------------------------------------------------------------------------

On 2021-11-15T15:21:41Z, NewSunSEO, commented:
<https://github.com/red/red/issues/3399#issuecomment-969017303>

    Hello, I am having a similar issue.  I tried - sudo apt-get install libcurl3:i386
    
    But it did not work for me.  
    
    cryptovibe@ubuntu:~/Desktop/miner$ sudo apt-get install libcurl3:i386
    [sudo] password for cryptovibe: 
    Reading package lists... Done
    Building dependency tree       
    Reading state information... Done
    E: Unable to locate package libcurl3:i386
    
    Thank you anyone who see's this & tries to help.

--------------------------------------------------------------------------------

On 2021-11-15T15:32:07Z, hiiamboris, commented:
<https://github.com/red/red/issues/3399#issuecomment-969027955>

    @NewSunSEO have you tried looking at the [download page](https://www.red-lang.org/p/download.html)?
    ![](https://i.gyazo.com/948597260412b8a80a695209d4b3abda.png)
    (note `libcurl4:i386`)

--------------------------------------------------------------------------------

On 2021-11-15T15:36:00Z, NewSunSEO, commented:
<https://github.com/red/red/issues/3399#issuecomment-969031662>

    I just installed ubuntu-20.04.3-desktop-amd64.  I'm completely new to Linux, but I wanted to compare Linux with Windows 10 for some CPU mining.  I barely know anything about Linux yet.  I'm looking at this now.  
    
    Thank you!

