
#4929: repeated prin messes up output
================================================================================
Issue is closed, was reported by meijeru and has 12 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/4929>

Run the following small program:
```
Red [ ] print "do print"
repeat n 3 [prin " " prin n] print ""
```
It outputs:
```
do print
 1 2 3
```
as it should
Now comment `print "do print"` and run again
The output is:
```
 1 12 1 123
```
The same error when the looping construct is `loop`. Note that calling `prin` several times without looping gives correct results.



Comments:
--------------------------------------------------------------------------------

On 2021-07-13T07:41:28Z, hiiamboris, commented:
<https://github.com/red/red/issues/4929#issuecomment-878855443>

    Related: https://github.com/red/red/issues/2986 https://github.com/red/red/issues/2679
    Now closed: https://github.com/red/red/issues/4313 https://github.com/red/red/issues/4521 https://github.com/red/red/issues/4742
    
    These print issues seem to never end, highlighting a problem with GUI console design.

--------------------------------------------------------------------------------

On 2021-07-13T10:31:53Z, meijeru, commented:
<https://github.com/red/red/issues/4929#issuecomment-878973702>

    In this case, it looks like a buffer is not correctly addressed ?!? 

--------------------------------------------------------------------------------

On 2021-07-14T07:21:50Z, meijeru, commented:
<https://github.com/red/red/issues/4929#issuecomment-879659417>

    That was quick! What does this do to the other issues mentions by @hiiamboris?

--------------------------------------------------------------------------------

On 2021-07-14T08:59:36Z, qtxie, commented:
<https://github.com/red/red/issues/4929#issuecomment-879721738>

    For #2986, we need to support [ANSI escape code](https://en.wikipedia.org/wiki/ANSI_escape_code) in the gui-console.
    Fixed #2679 in the gui-console.

--------------------------------------------------------------------------------

On 2021-07-14T10:03:14Z, hiiamboris, commented:
<https://github.com/red/red/issues/4929#issuecomment-879763411>

    > For #2986, we need to support ANSI escape code in the gui-console.
    
    Why can't GUI console handle CR char directly?

--------------------------------------------------------------------------------

On 2021-07-14T12:32:24Z, qtxie, commented:
<https://github.com/red/red/issues/4929#issuecomment-879851803>

    > > For #2986, we need to support ANSI escape code in the gui-console.
    > 
    > Why can't GUI console handle CR char directly?
    
    `prin` and `print` treat the string as it is for now, not process it character by character. So we need to rewrite the `prin` function to be able to handle any control code in the string.

