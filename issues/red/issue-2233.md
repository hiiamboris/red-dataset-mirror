
#2233: Non strict comparison of two map!s with different case keys returns FALSE
================================================================================
Issue is closed, was reported by rebolek and has 6 comment(s).
[status.tested] [type.bug] [status.resolved]
<https://github.com/red/red/issues/2233>

I would expect TRUE in case like this:

```
red>> equal? #(a 1 A 2) #(a 1 A 2)
== false
```



Comments:
--------------------------------------------------------------------------------

On 2016-09-21T07:37:59Z, qtxie, commented:
<https://github.com/red/red/issues/2233#issuecomment-248535017>

    This should return TRUE?
    
    ```
    >> equal? #(abc 1 aBc 2 abC 3) #(abc 2 ABC 1 Abc 3)
    == true
    ```

--------------------------------------------------------------------------------

On 2016-09-21T08:52:17Z, rebolek, commented:
<https://github.com/red/red/issues/2233#issuecomment-248550743>

    This is good question. My gut feeling is that no, it should return FALSE.

--------------------------------------------------------------------------------

On 2016-09-21T10:19:33Z, qtxie, commented:
<https://github.com/red/red/issues/2233#issuecomment-248570531>

    Now the following comparison will return TRUE:
    
    ```
    red>> equal? #(a 1 A 2) #(a 1 A 2)
    == true
    red>> equal? #(a 1 A 2) #(A 1 a 2)
    == true
    red>> equal? #(a 1 b 2) #(b 2 a 1)
    == true
    red>> equal? #(abc 1 aBc 2 abC 3) #(abc 2 ABC 1 Abc 3)
    == true
    ```

