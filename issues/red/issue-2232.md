
#2232: Get-word! value at end of block or paren corrupts compiler's stack
================================================================================
Issue is closed, was reported by rebolek and has 6 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/2232>

This is same error as #1865 (that is fixed for interpreter), but for compiler (where it is still a bug):

Source code:

```
Red []

print "Expected: ok"
probe (a: 'ok 1 :a)

print "Expected: ok"
probe (a: 'ok 1 + 1 :a)

print "Expected: ok"
probe (a: 'ok 1 + 1 probe :a)
```

Compiled output:

```
E:\Code\red (master)
λ test
Expected: ok
ok
Expected: ok
2
Expected: ok
ok
2
```



Comments:
--------------------------------------------------------------------------------

On 2018-12-05T13:20:52Z, hiiamboris, commented:
<https://github.com/red/red/issues/2232#issuecomment-444482707>

    The fix is incomplete. Compiling this:
    ```
    Red []
    
    print "case 1"
    probe equal? 'ok (a: 'ok 1 + 1 :a)
    
    print "case 2"
    probe equal? 'ok probe (a: 'ok 1 + 1 :a)
    ```
    Gives out:
    ```
    case 1
    false
    case 2
    ok
    true
    ```
    while the only difference is `probe`

--------------------------------------------------------------------------------

On 2019-03-09T19:03:21Z, hiiamboris, commented:
<https://github.com/red/red/issues/2232#issuecomment-471212164>

    Found more. Affects the interpreter only. Compiled output is `0 0 0 0`
    ```
    >> n: func [/a][100]
    == func [/a][100]
    >> n - (0 n/a)
    == 0
    >> n - (x: 0 n)
    == 0
    >> n - (x: 0 n/a)
    == 100
    >> n - (x: 123 n/a)
    == -23
    ```

--------------------------------------------------------------------------------

On 2019-03-12T19:12:43Z, greggirwin, commented:
<https://github.com/red/red/issues/2232#issuecomment-472142293>

    ```
    >> n - (x: 0 123 n/a)
    == 0
    >> n - (x: 0 n/a n/a)
    == 0
    ```
    Fun stuff. :^)

