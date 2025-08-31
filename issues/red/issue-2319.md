
#2319: Add x86_64 to Cross-compilation targets that already support x86
================================================================================
Issue is closed, was reported by moscati and has 6 comment(s).
[status.dismissed] [type.alien]
<https://github.com/red/red/issues/2319>




Comments:
--------------------------------------------------------------------------------

On 2016-11-15T15:32:30Z, dockimbel, commented:
<https://github.com/red/red/issues/2319#issuecomment-260673243>

    We don't have yet support for 64-bit targets, therefore we cannot "add" something that does not exist.

--------------------------------------------------------------------------------

On 2016-11-15T16:27:19Z, moscati, commented:
<https://github.com/red/red/issues/2319#issuecomment-260690299>

    If you had, you would need to add. Anyway I wanted to help in implementing 64-bit targets but I understand I need Rebol SDK for the red build process and I can't get it

--------------------------------------------------------------------------------

On 2016-11-15T16:57:08Z, dockimbel, commented:
<https://github.com/red/red/issues/2319#issuecomment-260699309>

    Implementing 64-bit support is not something doable by a newcomer, you need a deep understanding of the Red codebase, the Red language and its implementation, the Red/System language and the Red toolchain (not mentioning deep awareness of 32 vs 64-bit intricacies). If you want to help, you might want first to gain knowledge about all that before diving into deep and complex topics like 64-bit support. You can start by submitting PRs for tickets marked with "contribution" tag here that are recommended for first code incursions.
    
    You don't need Rebol SDK nor do you need to build a Red executable. The build process is just a convenient way to deliver the Red toolchain to regular users, it is not needed to run Red from sources. See "Running Red from the sources" section in [README](https://github.com/red/red/blob/master/README.md).

