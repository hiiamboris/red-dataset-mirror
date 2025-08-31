
#1045: Don't use multiple assignment on multiple lines
================================================================================
Issue is closed, was reported by iArnold and has 10 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/1045>

gvalue1:
gvalue2:
gvalue3: false

a: func [
/value1
/value2
/value3
][
gvalue1: value1
gvalue2: value2
gvalue3: value3
]
a
Now the program crashes because the gvalue's 1 and 2 were not set to false.



Comments:
--------------------------------------------------------------------------------

On 2015-02-25T20:34:09Z, iArnold, commented:
<https://github.com/red/red/issues/1045#issuecomment-76050224>

    Oh forgot to say that change it to
    gvalue1: false
    gvalue2: false
    gvalue3: false 
    and it works ok. (I did not check gvalue1: gvalue2: gvalue3: false on 1 line but I am rather convinced that that should work too).

--------------------------------------------------------------------------------

On 2015-02-26T09:34:39Z, dockimbel, commented:
<https://github.com/red/red/issues/1045#issuecomment-76147696>

    Tested with compiler:
    
    ```
    Red []
    
    gvalue1:
    gvalue2:
    gvalue3: false
    
    a: func [
        /value1
        /value2
        /value3
    ][
        gvalue1: value1
        gvalue2: value2
        gvalue3: value3
    ]
    a
    ```
    
    No errors.
    
    Tested with interpreter:
    
    ```
    Red []
    
    do [
        gvalue1:
        gvalue2:
        gvalue3: false
    
        a: func [
            /value1
            /value2
            /value3
        ][
            gvalue1: value1
            gvalue2: value2
            gvalue3: value3
        ]
        a
    ]
    ```
    
    No errors.

--------------------------------------------------------------------------------

On 2015-02-26T14:01:56Z, iArnold, commented:
<https://github.com/red/red/issues/1045#issuecomment-76182273>

    Parhaps this issue had to do with the fact I discovered that I can not compile the same program twice in the same Rebol Console. (First time ok generating exe, then second directly after generating some ts___ error. Hope your fix earlier today handles this fenomena.

--------------------------------------------------------------------------------

On 2015-02-27T03:16:06Z, dockimbel, commented:
<https://github.com/red/red/issues/1045#issuecomment-76324014>

    The compiler was keeping some data related to type-checking in an internal cache that was not cleaned up a for new compilation. But I fail to see how it could be related to this ticket...

--------------------------------------------------------------------------------

On 2015-02-27T16:10:48Z, iArnold, commented:
<https://github.com/red/red/issues/1045#issuecomment-76419759>

    It could have been that I compiled the program with this code after having compiled some other program, in fact using a dirty Rebol console, leading me to think this was an issue too. But it is working ok now, so all ready for the new release here!

