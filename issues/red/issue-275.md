
#275: runtime error 11: float stack check
================================================================================
Issue is closed, was reported by nicolas42 and has 2 comment(s).
[status.built] [status.tested] [type.bug] [Red/System]
<https://github.com/red/red/issues/275>

red/system []

a: 600851475143.0 ;prime number
i: 2.0

while [i \* i <= a][
    if a // i = 0.0 [
        a: a / i
    ]
    i: i + 1.0
]

print a

;runtime error 11: float stack check
;at 00401AF4h

windows 7 IA-32



Comments:
--------------------------------------------------------------------------------

On 2012-10-11T16:55:18Z, dockimbel, commented:
<https://github.com/red/red/issues/275#issuecomment-9348840>

    Modulus/remainder operators were not debugged at all for floats, sorry for that.

