
#616: Appending a block! to a string! has inconsistent results
================================================================================
Issue is closed, was reported by kealist and has 4 comment(s).
[type.bug] [status.reviewed]
<https://github.com/red/red/issues/616>

This may be related to #604, but because of the lack of control characters I am uncertain.   I'm not sure what they expected result should be (maybe forming the elements of the block?), but this is not good.

```
e: copy ""
f: [b_c c_d]
append e f
print e
;>>b_c_   BAD

a: copy ""
c: [glp_set_prob_name glp_get_prob_name]
append a c
print a
;>>glgl  BAD

b: copy ""
d: load "glp_set_prob_name glp_get_prob_name"
append b d
print b
;>>glgl   BAD

g: copy ""
h: [bc cd]
append g h
print g
;>>bccd  MAKES SENSE
```



Comments:
--------------------------------------------------------------------------------

On 2013-12-17T07:40:59Z, qtxie, commented:
<https://github.com/red/red/issues/616#issuecomment-30731588>

    @kealist This bug related to #599 

--------------------------------------------------------------------------------

On 2013-12-19T14:17:28Z, kealist, commented:
<https://github.com/red/red/issues/616#issuecomment-30931279>

    This seems to be resolved along with #599 

