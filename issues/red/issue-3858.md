
#3858: Unexpected output when executing the read method
================================================================================
Issue is closed, was reported by jefurry and has 10 comment(s).
[status.built] [type.bug]
<https://github.com/red/red/issues/3858>

**Describe the bug**
Unexpected output when executing the `read` method.
```
>> do [read https://www.not-found-site.com]
ERROR: Couldn't resolve host name
*** Access Error: cannot connect: https://www.not-found-site.com reason: timeout
*** Where: read
*** Stack:

>> try [read https://www.not-found-site.com]
ERROR: Couldn't resolve host name
*** Access Error: cannot connect: https://www.not-found-site.com reason: timeout
*** Where: read
*** Stack:

>>
>> error? try [read https://www.not-found-site.com]
ERROR: Couldn't resolve host name
== true
```

**Expected behavior**
```
>> do [read https://www.not-found-site.com]
*** Access Error: cannot connect: https://www.not-found-site.com reason: timeout
*** Where: read
*** Stack:

>> try [read https://www.not-found-site.com]
*** Access Error: cannot connect: https://www.not-found-site.com reason: timeout
*** Where: read
*** Stack:

>>
>> error? try [read https://www.not-found-site.com]
== true
```

**Platform version**
```
>> about
Red 0.6.4 for macOS built 22-Nov-2018/8:40:38+08:00 commit #755eb94
```



Comments:
--------------------------------------------------------------------------------

On 2019-04-22T18:47:35Z, 9214, commented:
<https://github.com/red/red/issues/3858#issuecomment-485510365>

    @jefurry please try to reproduce this with [latest](https://static.red-lang.org/dl/auto/mac/red-latest) build. Everything works as expected for me on W10, so it might be something macOS-specific.
    
    Edit: yep, that's a [`libcurl` error](https://github.com/red/red/blob/master/runtime/simple-io.reds#L1918) reported by a debugging (?) print.

--------------------------------------------------------------------------------

On 2019-04-22T18:55:21Z, jefurry, commented:
<https://github.com/red/red/issues/3858#issuecomment-485512758>

    @9214 Thank you for your reply, but the problem remains.
    
    ```
    $ ./red-22apr19-9ac4430f
    Compiling compression library...
    Compiling Red console...
    --== Red 0.6.4 ==--
    Type HELP for starting information.
    
    >> about
    Red 0.6.4 for macOS built 23-Apr-2019/0:40:30+08:00 commit #9ac4430
    
    >> do [read https://www.not-found-site.com]
    ERROR: Failure when receiving data from the peer
    *** Access Error: cannot connect: https://www.not-found-site.com reason: timeout
    *** Where: read
    *** Stack:
    
    >> try [read https://www.not-found-site.com]
    ERROR: Failure when receiving data from the peer
    *** Access Error: cannot connect: https://www.not-found-site.com reason: timeout
    *** Where: read
    *** Stack:
    
    >> error? try [read https://www.not-found-site.com]
    ERROR: Failure when receiving data from the peer
    == true
    >>
    ```

--------------------------------------------------------------------------------

On 2019-04-22T20:24:59Z, jefurry, commented:
<https://github.com/red/red/issues/3858#issuecomment-485540073>

    @9214  How to set the network timeout of the `read/write` method?
    
    ```
    >> ? read
    USAGE:
         READ source
    
    DESCRIPTION:
         Reads from a file, URL, or other port.
         READ is an action! value.
    
    ARGUMENTS:
         source       [file! url!]
    
    REFINEMENTS:
         /part        => Partial read a given number of units (source relative).
            length       [number!]
         /seek        => Read from a specific position (source relative).
            index        [number!]
         /binary      => Preserves contents exactly.
         /lines       => Convert to block of strings.
         /info        =>
         /as          => Read with the specified encoding, default is 'UTF-8.
            encoding     [word!]
    ```
    
    ```
    >> ? write
    USAGE:
         WRITE destination data
    
    DESCRIPTION:
         Writes to a file, URL, or other port.
         WRITE is an action! value.
    
    ARGUMENTS:
         destination  [file! url!]
         data         [any-type!]
    
    REFINEMENTS:
         /binary      => Preserves contents exactly.
         /lines       => Write each value in a block as a separate line.
         /info        =>
         /append      => Write data at end of file.
         /part        => Partial write a given number of units.
            length       [number!]
         /seek        => Write at a specific position.
            index        [number!]
         /allow       => Specifies protection attributes.
            access       [block!]
         /as          => Write with the specified encoding, default is 'UTF-8.
            encoding     [word!]
    ```

--------------------------------------------------------------------------------

On 2019-04-23T04:20:46Z, greggirwin, commented:
<https://github.com/red/red/issues/3858#issuecomment-485637941>

    @jefurry you can't set the timeout currently. Red has only basic I/O in place, with full I/O to come in 0.7.0.

--------------------------------------------------------------------------------

On 2019-04-23T08:25:59Z, 9214, commented:
<https://github.com/red/red/issues/3858#issuecomment-485695647>

    @jefurry FYI, we have a dedicated [chat room](https://gitter.im/red/help) where you can ask for help, if you need one.

