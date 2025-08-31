
#2400: checksum crashes of file! type
================================================================================
Issue is closed, was reported by jvargas and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2400>

Red 0.6.1 on windows crashes when running checksum on files, and it fails on OSX.

    red>> data: {Hello World}
    == "Hello World"
    red>> write %testfile.txt data
    red>> checksum data 'md5
    == #{B10A8DB164E0754105B7A99BE72E3FE5}
    red>> checksum %testfile.txt 'md5

**CRASH**


Comments:
--------------------------------------------------------------------------------

On 2017-01-05T08:37:45Z, geekyi, commented:
<https://github.com/red/red/issues/2400#issuecomment-270591054>

    It works on windows with latest automated build, but isn't implemented for [files](https://github.com/red/red/blob/649c433cc160aa01d45ebe86672659599298206f/runtime/natives.reds#L2087)
    
    Maybe you can try to implement yourself? ;)
    I think you need to add a condition for `TYPE_PATH` there

--------------------------------------------------------------------------------

On 2017-02-12T03:16:49Z, qtxie, commented:
<https://github.com/red/red/issues/2400#issuecomment-279193652>

    Fixed in master branch.

