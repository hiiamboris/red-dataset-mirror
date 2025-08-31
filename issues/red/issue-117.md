
#117: not as-logic handle! remains a pointer
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/117>

```
handle: curl-new-session
either not as-logic handle [
```

Results in:

```
*** Compilation Error: EITHER requires a conditional expression  
*** expected: [logic!], found: [pointer! [byte!]] 
*** in file: %/users/administrator/Red/Red-cURL/examples/test.reds 
*** at:  [not as logic! session [
        print "No session"
```



Comments:
--------------------------------------------------------------------------------

On 2011-06-30T14:43:21Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/117#issuecomment-1475274>

    The same happens with integer!, and in IF, for example when used as UNTIL, so NOT AS LOGIC! is still generally broken.

