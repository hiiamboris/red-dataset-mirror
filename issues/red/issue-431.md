
#431: Unset! can be assigned using set-word and evaluation of word containing unset!
================================================================================
Issue is closed, was reported by PeterWAWood and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/431>

Both the complier and interpreter allow the unset! value to be assigned to a word by using the set-word. The compiled code does not generate a runtime error when a word containing unset! is evaluated.

Code

``` REBOL
Red[]
  val: print ""
  prin ["compiler type? val - "]  print type? val
  prin ["compiler type? :val - "] print type? :val

  do [
    prin ["interpreter type? val - "]  print type? val
    prin ["interpreter type? :val - "] print type? :val
  ]
```

Output

```
Schulz:Red peter$ ./test
compiler type? val - unset
compiler type? :val - unset
interpreter type? val - *** Error: word has no value!
unset
interpreter type? :val - unset
```



