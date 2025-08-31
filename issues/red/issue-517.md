
#517: WISH: ROUTINE accepts parameters of ANY-TYPE (ie. parameter type declaration missing)
================================================================================
Issue is closed, was reported by JerryTsai and has 0 comment(s).
[status.built] [status.tested] [type.wish]
<https://github.com/red/red/issues/517>

Red []

Serialize: routine [ 
    value       ; <==== COMPILE DOES NOT ALLOW ANY-TYPE HERE  
    return: [integer!]
] [
    ; No matter what datatype it is, dump it's 16-byte Red-Cell! into a File
    ; ...
    return 0
]

Serialize 1 
Serialize true
Serialize "Jerry"



