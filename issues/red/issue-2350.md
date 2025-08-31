
#2350: Can't view base with draw that has image!
================================================================================
Issue is closed, was reported by ifgem and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2350>

View: 
```
test: make image! 10x10
r: compose [image (test)]
view [base draw r]
*** Script Error: PARSE - input must be of any-block! type: make image! [100x100 #{
FFFF...
}
*** Where: parse
```
Draw:
```
test: make image! 10x10
r: compose [image (test)]
draw make image! 200x200 r
```


