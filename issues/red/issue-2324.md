
#2324: to char! <binary> takes the first byte only
================================================================================
Issue is closed, was reported by meijeru and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2324>

In Red, characters are up to 16 bits wide, thus either one takes two bytes, or one does UTF-8 decoding. The latter is consistent with the `to binary! <char>` conversion as implemented already.


