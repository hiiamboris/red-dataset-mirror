
#353: Windows PE backend introduces randomness
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 14 comment(s).
[status.reviewed] [Red/System]
<https://github.com/red/red/issues/353>

Builds for the Windows and MSDOS targets are different on each build, for no apparent reason, without Red or any code having changed. There must be uninitialised values going into the build. Taking a guess, I would say it's probably the padding for the 4 KB pages that PE uses.



Comments:
--------------------------------------------------------------------------------

On 2012-12-27T14:33:41Z, dockimbel, commented:
<https://github.com/red/red/issues/353#issuecomment-11708958>

    The variable part of the produced PE executable is the timestamp field in PE header. See this [SO entry](http://stackoverflow.com/questions/5795270/keep-exe-timestamp-from-changing).

--------------------------------------------------------------------------------

On 2012-12-30T14:39:59Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/353#issuecomment-11765066>

    That's rather awkward. Would it be problematic to implement an option to have a fixed timestamp, for example for the purpose of my incremental builds? I've thought about detecting real changes differently, but it would be laborious and seems like fixing a problem that shouldn't exist.

--------------------------------------------------------------------------------

On 2013-01-06T11:00:34Z, dockimbel, commented:
<https://github.com/red/red/issues/353#issuecomment-11926974>

    If you use a checksum to compare the changes, you just need to skip the PE header (skip 255 bytes) and it will work fine. Isn't that the simplest solution?

--------------------------------------------------------------------------------

On 2013-01-14T00:16:18Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/353#issuecomment-12203296>

    I'm letting Fossil handle the versioning, so the problem is that I can't hook into it. The laborious part I'm talking about would be to take over change detection from Fossil and basically reimplement it, feeding Fossil single files to check in.

--------------------------------------------------------------------------------

On 2013-01-14T01:25:21Z, earl, commented:
<https://github.com/red/red/issues/353#issuecomment-12204157>

    If you can't hook into Fossil's change detection, you could just fix up the binaries before Fossil gets involved. For `.exe`, just overwrite the PE timestamp in the binaries, after you built them. The timestamp is at bytes 137-140 (counting from 1), so the following R3 snippet will do:
    
    ``` rebol
    zero-red-pe-timestamp: func [filename [file!]] [
        write filename head change at read filename 137 #{00000000}
    ]
    ```

--------------------------------------------------------------------------------

On 2013-01-14T23:32:15Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/353#issuecomment-12245999>

    Thanks for the tip. I may use that temporarily, but I would still like to have a compiler option for it.

--------------------------------------------------------------------------------

On 2013-01-15T00:11:43Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/353#issuecomment-12247227>

    I've added it to my build script, where it increased complexity considerably, also due to compensating differences between R2 and R3. We'll see if there are complications.

