
#4932: Diagrammar crash on linux under wine
================================================================================
Issue is open, was reported by mingodad and has 24 comment(s).
[type.wish]
<https://github.com/red/red/issues/4932>

I just downloaded `Diagrammar` and I understand that it's a `windows` application but unless it's doing something very `windows` specific I'm wondering if would not be too difficult to make it work under wine ?

I'm using ubuntu 18.04 and wine for win32/win64
```
wine --version
wine-3.0 (Ubuntu 3.0-1ubuntu1)
```
Output:
```
wine DiaGrammar.exe 

*** Runtime Error 1: access violation
*** at: 00548C04h
```
windebg output:
```
 winedbg DiaGrammar.exe 
WineDbg starting on pid 0029
0x7b4634b3: movl	0xffffff24(%ebp),%esi
Wine-dbg>c
Unhandled exception: page fault on read access to 0x00000000 in 32-bit code (0x00548c04).
Register dump:
 CS:0023 SS:002b DS:002b ES:002b FS:006b GS:0063
 EIP:00548c04 ESP:0033fde4 EBP:0033fe20 EFLAGS:00210246(  R- --  I  Z- -P- )
 EAX:00000000 EBX:7b637e18 ECX:0033fdd8 EDX:00182980
 ESI:00547bb1 EDI:00000500
Stack dump:
0x0033fde4:  00b50394 0033fe38 00000021 00000000
0x0033fdf4:  0033fe18 0044adc9 001829bc 00000001
0x0033fe04:  00000000 005f406c 7ee3c640 00000000
0x0033fe14:  00182980 00000000 00000000 0033fe4c
0x0033fe24:  00548851 7b4556b0 f78b1840 00000000
0x0033fe34:  7b410000 0017cc90 00000000 005f406c
000d: sel=006f base=00000000 limit=00000000 32-bit r-x
Backtrace:
=>0 0x00548c04 in diagrammar (+0x148c04) (0x0033fe20)
  1 0x00548851 in diagrammar (+0x148850) (0x0033fe4c)
  2 0x0055e307 in diagrammar (+0x15e306) (0x0033fe64)
  3 0x004cbddf in diagrammar (+0xcbdde) (0x0033fea4)
  4 0x0041ce97 in diagrammar (+0x1ce96) (0x0033feb8)
0x00548c04: movl	0x0(%eax),%eax
```



Comments:
--------------------------------------------------------------------------------

On 2021-07-17T17:01:11Z, greggirwin, commented:
<https://github.com/red/red/issues/4932#issuecomment-881927404>

    Thanks for the report @mingodad.

--------------------------------------------------------------------------------

On 2021-07-17T17:03:55Z, greggirwin, commented:
<https://github.com/red/red/issues/4932#issuecomment-881927828>

    @qtxie let me know if there's anything @toomasv or I can do to help debug. @hiiamboris might already have wine set up as well.

--------------------------------------------------------------------------------

On 2021-07-17T17:40:54Z, hiiamboris, commented:
<https://github.com/red/red/issues/4932#issuecomment-881933107>

    I don't have sources. Can't help :)

--------------------------------------------------------------------------------

On 2021-07-17T18:10:37Z, greggirwin, commented:
<https://github.com/red/red/issues/4932#issuecomment-881937900>

    Let me see what I can do about that. ;^)

--------------------------------------------------------------------------------

On 2021-07-18T14:26:23Z, qtxie, commented:
<https://github.com/red/red/issues/4932#issuecomment-882065129>

    Maybe we use some Direct2D feature which is not supported on wine.

--------------------------------------------------------------------------------

On 2021-07-18T15:22:35Z, mingodad, commented:
<https://github.com/red/red/issues/4932#issuecomment-882073610>

    https://www.ghacks.net/2018/01/18/wine-3-0-with-direct3d-10-and-11-support/

--------------------------------------------------------------------------------

On 2021-07-18T19:35:30Z, hiiamboris, commented:
<https://github.com/red/red/issues/4932#issuecomment-882106756>

    On a VM I get this from the GUI console:
    ```
    > wine gui-console.exe
    *** Runtime Error 1: access violation
    *** in file: /D/devel/red/red-src/red/modules/view/backends/windows/direct2d.reds
    *** at line: 2163
    ***
    ***   stack: gui/create-text-format 00000001h 0050F498h
    ***   stack: win32-startup-ctx/exception-filter 0033F744h
    ```
    So I guess I don't even need to compile DG.
    ```

--------------------------------------------------------------------------------

On 2021-07-18T20:14:26Z, hiiamboris, commented:
<https://github.com/red/red/issues/4932#issuecomment-882111217>

    I tried compiling using an older pre-D2D build but what ultimately crashes it (on the same `create-text-format` call) is usage of rich-text, which is D2D-based anyway, and imperative for DG operation.

--------------------------------------------------------------------------------

On 2021-07-19T00:36:31Z, greggirwin, commented:
<https://github.com/red/red/issues/4932#issuecomment-882144438>

    Thanks for digging in @hiiamboris!

--------------------------------------------------------------------------------

On 2021-07-19T02:16:02Z, qtxie, commented:
<https://github.com/red/red/issues/4932#issuecomment-882180235>

    I don't think we can fix it easily.
    ```
    ~$ wine --version
    wine-6.12 (Staging)
    
    ~$ wine gui-console.exe 
    002c:fixme:winediag:LdrInitializeThunk wine-staging 6.12 is a testing version containing experimental patches.
    002c:fixme:winediag:LdrInitializeThunk Please mention your exact version when filing bug reports on winehq.org.
    dwrite-factory: 01E690C8
    00fc:fixme:ntdll:NtQuerySystemInformation info_class SYSTEM_PERFORMANCE_INFORMATION
    00fc:fixme:dxgi:DXGID3D10CreateDevice Ignoring flags 0x21.
    00fc:fixme:winediag:wined3d_select_feature_level None of the requested D3D feature levels is supported on this GPU with the current shader backend.
    
    *** Runtime Error 98: assertion failed
    *** in file: /D/EE/QW/red/modules/view/backends/windows/direct2d.reds
    *** at line: 1767
    ***
    ***   stack: gui/DX-create-dev
    ***   stack: gui/DX-create-dev
    ***   stack: gui/DX-init
    ***   stack: gui/init
    ***   stack: ctx||445~init 0276ABB8h
    ```

--------------------------------------------------------------------------------

On 2021-07-19T02:27:05Z, greggirwin, commented:
<https://github.com/red/red/issues/4932#issuecomment-882184776>

    If it's because it's an experimental version of Wine, no need for us to fix it. Good to note though.

--------------------------------------------------------------------------------

On 2021-07-19T02:28:37Z, greggirwin, commented:
<https://github.com/red/red/issues/4932#issuecomment-882185294>

    And if @mingodad has a problem because his Wine is old, that's also not a high priority. If we can't run at all on Wine when using rich-text, let's note that and defer it for now.

