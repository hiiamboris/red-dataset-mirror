
#1742: read http:// does not work under wine
================================================================================
Issue is closed, was reported by xqlab and has 8 comment(s).
[status.reviewed] [type.review]
<https://github.com/red/red/issues/1742>

**gui console**

> red>> read http://google.com
> **\* Access error: cannot connect: http://google.com reason: timeout
> **\* Where: 

**linux console**

> ~/own/Red $ fixme:dwmapi:DwmIsCompositionEnabled 0x33fc84
> fixme:winhttp:winhttp_request_QueryInterface interface {06f29373-5c5a-4b54-b025-6ef1bf8abf0e} not implemented
> fixme:ole:CoCreateInstanceEx no instance created for interface {06f29373-5c5a-4b54-b025-6ef1bf8abf0e} of class {2087c2f4-2cef-4953-a8ab-66779b670495}, hres is 0x80004002



Comments:
--------------------------------------------------------------------------------

On 2016-03-29T08:54:02Z, xqlab, commented:
<https://github.com/red/red/issues/1742#issuecomment-202784027>

    It works after installing the winhttp.dll with winetricks. So this can be closed.
    
    Probably you have to download W2KSP4_EN.EXE manually from http://web.archive.org/web/20160129053851/http://download.microsoft.com/download/E/6/A/E6A04295-D2A8-40D0-A0C5-241BFECD095E/W2KSP4_EN.EXE before.

--------------------------------------------------------------------------------

On 2016-03-30T02:44:26Z, ghost, commented:
<https://github.com/red/red/issues/1742#issuecomment-203211923>

    Well, so many issues regarding Wine.
    A wiki page linked with readme.md with all the issues and fixes for Wine would be good. 

--------------------------------------------------------------------------------

On 2016-03-30T10:08:54Z, gour, commented:
<https://github.com/red/red/issues/1742#issuecomment-203363633>

    > Well, so many issues regarding Wine.
    
    Support for GTK will fix them all. ;)

--------------------------------------------------------------------------------

On 2016-03-30T10:14:00Z, dockimbel, commented:
<https://github.com/red/red/issues/1742#issuecomment-203366334>

    Indeed, as we aim at native GUI support on Linux, Wine support is very low priority (though the community is welcome to improve the support for it). ;-)

