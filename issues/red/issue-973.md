
#973: Repeat not repeating
================================================================================
Issue is closed, was reported by kealist and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/973>

I have been experiencing trouble with repeat working properly:

```
a: func [] [
    repeat i 2 [i]
]
repeat j 2 [print a]
```

This is the smallest case I have been able to isolate.  I would expect that it would print "2" twice, but it only does one time



Comments:
--------------------------------------------------------------------------------

On 2014-11-04T21:36:46Z, kealist, commented:
<https://github.com/red/red/issues/973#issuecomment-61719032>

    ```
    repeat j 2 [
        print [repeat i 2 [i]]
    ]
    ```
    
    gives the expected result though

