
#669: string inserted by #version directive upsets syntax analysis 
================================================================================
Issue is closed, was reported by meijeru and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/669>

print type? #version >>> function
print #version >>> ?function?
a: #version print a >>> ?function?

I suspect that there is a problem with the order in wich the substitution is made vs. the overall analysis



