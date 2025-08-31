
#2245: DO/NEXT always return new position
================================================================================
Issue is closed, was reported by dsunanda and has 2 comment(s).
[status.dismissed] [type.wish]
<https://github.com/red/red/issues/2245>

 aa: [1 / 0 2 + 2]
 do/next aa 'bb
**\* Math Error: attempt to divide by zero
**\* Where: /
probe bb
== [1 / 0 2 + 2]

In my ideal world, bb would be positioned at [2 + 2] so the script can note the error and still process the rest of the block.

R3, by the way, leaves the update block word (bb) unchanged on an error - rather than setting it to the head of the block. A very minor behavior difference :) 



Comments:
--------------------------------------------------------------------------------

On 2017-02-17T11:32:50Z, dockimbel, commented:
<https://github.com/red/red/issues/2245#issuecomment-280626832>

    A fix has been provided for the position word not to be set in case of error (so should work as in R3 now).
    
    For the feature request, that is not doable, once an error is encountered, it is not possible in the general case to determine where the erroneous expression ends, as the error is preventing from further accurate evaluation.

