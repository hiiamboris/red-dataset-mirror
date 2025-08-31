
#4728: Missing header field
================================================================================
Issue is closed, was reported by toomasv and has 6 comment(s).
[status.built] [status.tested] [type.wish]
<https://github.com/red/red/issues/4728>

Currently the following header fields propagate to the .rsrc header in the PE file:
`Title: Version: Company: Comments: Notes: Rights: Trademarks: Author: ProductName:`
Please add `ProductVersion` to these.


Comments:
--------------------------------------------------------------------------------

On 2020-11-18T19:21:41Z, greggirwin, commented:
<https://github.com/red/red/issues/4728#issuecomment-729899749>

    Note that Author maps to PrivateBuild in the PE version info. @dockimbel, not sure that makes sense. https://docs.microsoft.com/en-us/windows/win32/menurc/versioninfo-resource says 
    
    > VS_FF_PRIVATEBUILD | File was not built using standard release procedures.
    
    Maybe we don't map Author, as that's really more dev oriented. We could use PrivateBuild as a tag, e.g. for test releases, but I don't see a lot of value in that right now.
    

--------------------------------------------------------------------------------

On 2020-11-18T22:11:17Z, dockimbel, commented:
<https://github.com/red/red/issues/4728#issuecomment-729988845>

    I'll let @qtxie handle this as he wrote the code for .rsrc section support.

--------------------------------------------------------------------------------

On 2020-11-19T02:05:45Z, qtxie, commented:
<https://github.com/red/red/issues/4728#issuecomment-730077239>

    @greggirwin Looks like a wrong mapping, I'll remove it.

