
#1189: Source file structure: some puzzlements
================================================================================
Issue is closed, was reported by meijeru and has 6 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/1189>

I have improved my indexing and analysis of the Red compiler suite, see [this Google groups thread](https://groups.google.com/forum/?hl=en#!topic/red-lang/X-OsmUDAxkI). In this and some following issues I will raise questions arising from that effort.

The sources contain a file `%build/includes.r` which writes information about the source files to be used onto a file called `%build/bin/sources.r`. In the list of files which is the argument of `set-cache`, the file `%runtime/stack.reds` occurs twice. Is that needed? On the other hand, the source files which are in `%runtime/devices/console` do _not_ occur in that list. They seem to be duplicates of the files in `%environment/console`. What are the plans here?



Comments:
--------------------------------------------------------------------------------

On 2015-05-31T09:25:29Z, meijeru, commented:
<https://github.com/red/red/issues/1189#issuecomment-107149383>

    Further to my remark about console handling, the two sets of files turn out to be subtly different. See e.g. in `%win32.reds` the list of `#defines`.

--------------------------------------------------------------------------------

On 2015-05-31T13:46:39Z, dockimbel, commented:
<https://github.com/red/red/issues/1189#issuecomment-107185361>

    Good catch. It is more probably the result of a bad merge with a development branch.

--------------------------------------------------------------------------------

On 2015-06-01T05:29:27Z, dockimbel, commented:
<https://github.com/red/red/issues/1189#issuecomment-107312391>

    Files in `%runtime/devices/console` are leftover from a previous merge operation. They are removed now.

