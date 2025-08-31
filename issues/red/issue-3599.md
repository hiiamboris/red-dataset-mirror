
#3599: about crashes cli console under FreeBSD
================================================================================
Issue is open, was reported by PeterWAWood and has 4 comment(s).
[type.bug]
<https://github.com/red/red/issues/3599>

**Describe the bug**
Evaluating `about` in the Red CLI compiled for FreeBSD crashes the console with an access violation.

<img width="344" alt="about" src="https://user-images.githubusercontent.com/697434/48764137-c87d7380-ece9-11e8-9919-094fd60d9f5c.png">

**To Reproduce**
Type "about" in the red cli console and press the Enter key

**Expected behavior**
The console responds with a message showing:
   Red 0.6.3 for freeBSD built 3-Oct-2018/15:18:52+08:00

**Platform version:**
Git:
commit df750dff6012bae33b86fb4a8721ae8429f7d7aa (HEAD -> master, upstream/master)
Author: qtxie <xqtxyz@gmail.com>
Date:   Tue Nov 20 11:37:21 2018 +0800
Compilation on macOS
`rebol -qws red.r -r -t FreeBSD -o freeBSD-red-cli environment/console/CLI/console.red`
Run on FreeBSD: `11.0-RELEASE-p1` 



Comments:
--------------------------------------------------------------------------------

On 2020-10-21T07:14:10Z, litew, commented:
<https://github.com/red/red/issues/3599#issuecomment-713361565>

    Compiled latest (#[65dc5e9](https://github.com/red/red/commit/65dc5e96b7f52344dd7a26083dbbc2f4378e5f31)) cli-console in debug-mode on `FreeBSD 12.1-RELEASE r354233 GENERIC  i386`:
    
    `do/args %red.r "-t FreeBSD -d %environment/console/CLI/console.red"`
    
    ```
    $ ./console
    --== Red 0.6.4 ==--
    Type HELP for starting information.
    
    >> about
    
    *** Runtime Error 98: assertion failed
    *** in file: /usr/home/nemo/red/runtime/hashtable.reds
    *** at line: 269
    ***
    ***   stack: red/murmur3-x86-32 00000062h 134676338
    ***   stack: red/murmur3-x86-32 28C2B100h 0
    ***   stack: red/_hashtable/put-symbol 28C3F864h 289F7484h 0 false
    ***   stack: red/symbol/make 289F7484h
    ***   stack: red/__get-OS-info
    ***   stack: os-info
    ***   stack: about 28C38200h
    ***   stack: red/_function/call 28D5AE44h 28C38200h
    ***   stack: red/interpreter/eval-code 28C56518h 28EB44B0h 28EB44B0h false 00000000h 00000000h 28C56518h
    ***   stack: red/interpreter/eval-expression 28EB44B0h 28EB44B0h false false false
    ***   stack: red/interpreter/eval 28D5AE24h true
    ***   stack: red/natives/catch* true 1
    ***   stack: ctx||468~try-do 28C37628h
    ***   stack: ctx||468~do-command 28C37628h
    ***   stack: ctx||468~eval-command 28C37628h
    ***   stack: ctx||468~run 28C37628h
    ***   stack: ctx||468~launch 28C37628h
    ***   stack: ctx||487~launch 28C370D4h
    ***   stack: ***_start
    ```
    
    https://github.com/red/red/blob/65dc5e96b7f52344dd7a26083dbbc2f4378e5f31/runtime/hashtable.reds#L262-L270

--------------------------------------------------------------------------------

On 2020-10-21T22:07:28Z, vazub, commented:
<https://github.com/red/red/issues/3599#issuecomment-713904640>

    I had the same issue when porting to NetBSD and fixed it here - https://github.com/red/red/pull/4656/files#diff-665679a0fba437fce2ceda99ce317c430369da68c40ddce3b696bcee87d3e223. Would probably be a simple copy-paste adjustment for FreeBSD as well, with minor changes.

