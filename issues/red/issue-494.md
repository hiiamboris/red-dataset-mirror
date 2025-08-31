
#494: unicode/load-utf8-buffer corrupts memory
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 10 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/494>

I'm having memory corrupted when I call load-utf8-buffer with a pre-existing string (similar to what load-utf8-stream does). When load-utf8-buffer allocates a new series, it sort of ensures it's long enough to hold the output. Also, most processing branches expand the series when necessary, but not all. The simplest case says this:

```
assert buf1 <= end          ;-- should not happen if we're good
```

This is not the case when using a pre-existing series.

Further, it claims that it can be used in streaming mode, but it does not examine or reset the flags of an existing series, rather it assumes it's Latin1 type.

Here's a case apparently corrupting code memory:

```
Red []

r: routine [
    from    [string!]
    to      [string!]
][
    to/header: TYPE_STRING
    to/head: 0
    unicode/load-utf8-buffer
        as-c-string string/rs-head from  string/rs-length? from
        GET_BUFFER (to)  null
    to/cache: null
]
r from: "0123456789abcdefghijklmnopqrstuvwxyz"  to: ""
print [from to]
```

**\* Runtime Error 1: access violation
**\* at: 08066E79h



Comments:
--------------------------------------------------------------------------------

On 2013-07-08T18:22:52Z, dockimbel, commented:
<https://github.com/red/red/issues/494#issuecomment-20625560>

    The `load-utf8-stream` function is a work in progress, it is not used yet in the codebase, so was never tested. I will give it a deeper look in a couple of weeks, after the devcon.

--------------------------------------------------------------------------------

On 2013-07-08T18:47:39Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/494#issuecomment-20627191>

    The only thing needed to fix the immediate problem is to add series expansion to the code branch above. That's what currently corrupts my 0MQ binding.

--------------------------------------------------------------------------------

On 2013-07-08T18:53:00Z, dockimbel, commented:
<https://github.com/red/red/issues/494#issuecomment-20627541>

    If you provide me a simple test case (without any binding involved), I'll give it a look tonight.

--------------------------------------------------------------------------------

On 2013-07-08T21:27:10Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/494#issuecomment-20637357>

    Added a case. It's hard to reproduce the data corruption from my program, so this one just crashes.

--------------------------------------------------------------------------------

On 2016-09-13T04:42:26Z, rebolek, commented:
<https://github.com/red/red/issues/494#issuecomment-246572062>

    Under 0.6.1 I can’t compile the example with this strange error:
    
    ```
    Compiling E:\Code\red-bugs\test.red ...
    *** Compilation Error: expected a block for IF-BODY instead of word! value
    *** in file: %/E/Code/red-bugs/test.red
    *** near: [binary! hex [as-color bin/1 bin/2 bin/3]]
    ```

