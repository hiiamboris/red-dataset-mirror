
#679: Red/System tool chain broken. Missing do-cache definition.
================================================================================
Issue is closed, was reported by ghost and has 8 comment(s).
[status.resolved] [Red/System]
<https://github.com/red/red/issues/679>

Starting over working on Red/System bindings, I tried to compile my curses and zlib examples from **system** directory.

```
>> do/args %rsc.r %library/zlib/examples/zlib-mem-example.reds
Script: "Red/System compiler wrapper" (none)
Script: "Red/System compiler" (none)
** Script Error: do-cache has no value
** Near: do-cache %system/utils/profiler.r 
profiler/active?: no 
do-cache
>>
```

**do-cache** definition from **system/utils/encap-fs.r** is missing.

I should be interested in working on **call** implementation for POSIX.
Bruno



Comments:
--------------------------------------------------------------------------------

On 2014-02-09T10:08:52Z, dockimbel, commented:
<https://github.com/red/red/issues/679#issuecomment-34570083>

    Hi Bruno,
    
    The %rsc.r front-end has been deprecated, its features have been merged into %red.r now. So the same frontend is now able to compile both Red and Red/System programs, see the new [README](https://github.com/red/red/blob/master/README.md).

--------------------------------------------------------------------------------

On 2014-02-09T10:12:10Z, PeterWAWood, commented:
<https://github.com/red/red/issues/679#issuecomment-34570137>

    Bruno
    
    Nenad has merged the Red/System compiler into the Red compiler so now you
    use red.r to compile both Red and Red/System programs. He has kept rsc.r
    around for a future possible use, with very small systems ifIremeber
    correctly.
    
    Regards
    
    Peter
    
    On Sunday, 9 February 2014, Bruno ANSELME notifications@github.com wrote:
    
    > Starting over working on Red/System bindings, I tried to compile my curses
    > and zlib examples from _system_ directory.
    > 
    > > > do/args %rsc.r %library/zlib/examples/zlib-mem-example.reds
    > > > Script: "Red/System compiler wrapper" (none)
    > > > Script: "Red/System compiler" (none)
    > > > *\* Script Error: do-cache has no value
    > > > *\* Near: do-cache %system/utils/profiler.r
    > > > profiler/active?: no
    > > > do-cache
    > 
    > _do-cache_ definition from _system/utils/encap-fs.r_ is missing.
    > 
    > I should be interested in working on _call_ implementation for POSIX.
    > Bruno
    > 
    > ## 
    > 
    > Reply to this email directly or view it on GitHubhttps://github.com/red/red/issues/679
    > .

--------------------------------------------------------------------------------

On 2014-02-09T10:18:52Z, ghost, commented:
<https://github.com/red/red/issues/679#issuecomment-34570244>

    Thank you both,
    
    ```
    do/args %red.r %system/library/zlib/examples/zlib-mem-example.reds
    ```
    
    works fine.
    I didn't use Red for 6 months.
    Bruno

--------------------------------------------------------------------------------

On 2014-02-09T11:50:07Z, dockimbel, commented:
<https://github.com/red/red/issues/679#issuecomment-34571891>

    Red is progressing fast, a lot happens in 6 months. ;-)

