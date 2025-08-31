
#2951: `comment` should prevent its argument from execution.
================================================================================
Issue is closed, was reported by JenniferLee520 and has 0 comment(s).
[status.built] [status.tested] [type.wish]
<https://github.com/red/red/issues/2951>

The definition of comment is 
```Red
func [value][]
```
I would like it to be defined as
```Red
func ['value][]
```
So I can comment like this
```Red
comment to-do
```


