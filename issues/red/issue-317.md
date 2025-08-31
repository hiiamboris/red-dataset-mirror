
#317: Setting a byte writes four bytes
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 2 comment(s).
[status.built] [status.tested] [type.bug] [Red/System]
<https://github.com/red/red/issues/317>

```
Red/System []

a: as-byte 1
b: as-byte 2
c: as-byte 3
d: as-byte 4
a: as-byte 0
print-wide [as-integer a  as-integer b  as-integer c  as-integer d  lf]
```

bash-4.0# ./test 
0 0 0 0



Comments:
--------------------------------------------------------------------------------

On 2012-11-26T02:41:26Z, PeterWAWood, commented:
<https://github.com/red/red/issues/317#issuecomment-10702781>

    The initialisation seems to be okay but the subsequent assignment seems to cause the problem as this program shows:
    
    Code
    
    ``` rebol
    Red/System []
    
    a: as byte! 1
    fill1: FFFFFFFFh
    b: as byte! 2
    fill2: FFFFFFFFh
    c: as byte! 3
    fill3: FFFFFFFFh
    d: as byte! 4
    fill4: FFFFFFFFh
    if 1 = (as integer! a) [print ["a ok" lf]]
    if 2 = (as integer! b) [print ["b ok" lf]]
    if 3 = (as integer! c) [print ["c ok" lf]]
    if 4 = (as integer! d) [print ["d ok" lf]]
    print ["fill1: " fill1 lf]
    print ["fill2: " fill2 lf]
    print ["fill3: " fill3 lf]
    print ["fill4: " fill4 lf]
    
    a: as byte! 0
    if 0 = (as integer! a) [print ["a ok" lf]]
    if 2 = (as integer! b) [print ["b ok" lf]]
    if 3 = (as integer! c) [print ["c ok" lf]]
    if 4 = (as integer! d) [print ["d ok" lf]]
    print ["fill1: " fill1 lf]
    print ["fill2: " fill2 lf]
    print ["fill3: " fill3 lf]
    print ["fill4: " fill4 lf]
    ```
    
    Output
    
    ```
    a ok
    b ok
    c ok
    d ok
    fill1: -1
    fill2: -1
    fill3: -1
    fill4: -1
    a ok
    b ok
    c ok
    d ok
    fill1: -16777216
    fill2: -1
    fill3: -1
    fill4: -1
    ```
    
    I'll add a test of two to cast-test.reds

