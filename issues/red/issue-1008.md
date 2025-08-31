
#1008: Unnecessary white-line when printing object ...
================================================================================
Issue is closed, was reported by pekr and has 0 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/1008>

red>> print mold o
make object! [
a: 1
]
red>> print o

a: 1

When printing 'o object above, there is an empty line first, which should not be there. Just a cosmetic issue though :-) 



