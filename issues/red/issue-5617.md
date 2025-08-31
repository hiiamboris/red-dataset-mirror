
#5617: Red issue with libcrypt on Raspberry Pi Bookworm 32-bit
================================================================================
Issue is open, was reported by PeterWAWood and has 2 comment(s).
<https://github.com/red/red/issues/5617>

**Describe the bug**
I downloaded Red (both CLI and View) onto a Raspberry Pi running a 32-bit version of Pi OS Bookworm.

Both failed as Red as [libcrypto.so](http://libcrypto.so/).1.1 is not installed by default in this version of Pi OS.

pi@picode32:~/Desktop $ ./red-cli-066
./red-cli-066: error while loading shared libraries: libcrypto.so.1.1: cannot open shared object file: No such file or directory

**To reproduce**
1. Install a fresh copy of Pi OS Bookworm 32-bit on a Raspberry Pi
2. Download red-view-066, give it executable permission
3. Run red-view-066
4. Red will not start
5. Repeat steps 3 & 4 with red-cli-066

**Expected behavior**
Red runs.


**Workaround**
I worked around the issue by getting an pre-compiled version of [libcrypto.so](http://libcrypto.so/).1.1 from [Wolfram](https://amoeba.wolfram.com/index.php/s/mHR5Hq7MN4yy9Ws).

I copied the lib into /usr/lib/arm-linux-gnueabihf

Both the CLI and View versions of Red now run.

**Platform version**
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.6 ahead: 0 date: 19-Mar-2025/13:09:25 commit: #6942c7a021253150c3e3cf90428305892340db03 ]
PLATFORM: [ name: "Raspbian GNU/Linux 12 (bookworm)" OS: 'Linux arch: 'aarch64 version: 6.12.25 build: {#1 SMP PREEMPT Debian 1:6.12.25-1+rpt1 (2025-04-30)} ]
--------------------------------------------
NOTE: All though the processor is 64-bit, the OS is a 32-bit version.


Comments:
--------------------------------------------------------------------------------

On 2025-06-05T06:44:03Z, qtxie, commented:
<https://github.com/red/red/issues/5617#issuecomment-2942960312>

    A better workaround, create a symbol link to `/usr/lib/arm-linux-gnueabihf/libcrypto.so.3`.
    ```
    sudo ln -s /lib/arm-linux-gnueabihf/libcrypto.so.3 /lib/arm-linux-gnueabihf/libcrypto.so.1.1
    ```

