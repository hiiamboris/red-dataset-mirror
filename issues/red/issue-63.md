
#63: when comparing bytes, sign is extended
================================================================================
Issue is closed, was reported by meijeru and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/63>

Comparing a byte with an integer or another byte, the sign is apparently  extended, leading to problems for charaters beyond ~ or #"^(7E)". Thus: #"á" < 0 is true. The second half of the ASCII table is forbidden for variable names, but should it also be forbidden in character strings and thus in bytes? 



Comments:
--------------------------------------------------------------------------------

On 2011-05-30T00:54:16Z, PeterWAWood, commented:
<https://github.com/red/red/issues/63#issuecomment-1259252>

    A few comments:
    
    Red/System source should be utf-8 encoded. "á" is an invalid byte! literal as it is the two characters C3 A1. The compiler should either raise a compilation error or truncate the byte! to, I would guess, C3 with a warning message.
    
    Your source must not be utf-8 encoded as currently, the compiler crashes when encountering "á" encoded with utf-8. (I will write a test for this separately). I'm guessing that in the encoding you have used for your source that "á" is E1. I believe that #"^(E1)" is a valid literal value for a byte! and inside a c-string! Though it is not a valid in utf-8.
    
    #"^(E1)" < 0 returns true as does #"^(10)" < 17 (see issue 64). I will add this case to the tests submitted with issue 64.

--------------------------------------------------------------------------------

On 2011-05-31T17:16:16Z, dockimbel, commented:
<https://github.com/red/red/issues/63#issuecomment-1268573>

    Tested OK.

