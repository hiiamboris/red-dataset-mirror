
#2001: 1.#NaN = 1.#NaN returns true when it should return false
================================================================================
Issue is closed, was reported by PeterWAWood and has 6 comment(s).
[status.tested] [status.resolved] [type.review]
<https://github.com/red/red/issues/2001>

```
red>> 1.#NaN = 1.#NaN
== true
```

Tests "special-equality 10" to "special-equality 14" are commented out in float-test.reds



Comments:
--------------------------------------------------------------------------------

On 2016-06-13T02:35:38Z, qtxie, commented:
<https://github.com/red/red/issues/2001#issuecomment-225478228>

    In Red,  the `=` operation for float! means `almost-equal`, so we have this:
    
    ```
    red>> 1.000000000000001 = 1.0000000000000002
    == true
    red>> 1.000000000000001 == 1.0000000000000002
    == false
    ```
    
    With this, we already break the rules for comparing two float! in [IEEE-754](https://en.wikipedia.org/wiki/IEEE_floating_point) standard. I think it ok to let `1.#NaN = 1.#NaN` return true.
    
    We can still get `false` if we do a `strict-equal` comparation.
    
    ```
    red>> 1.#NaN == 1.#NaN
    == false
    ```

--------------------------------------------------------------------------------

On 2016-06-13T03:00:47Z, PeterWAWood, commented:
<https://github.com/red/red/issues/2001#issuecomment-225480389>

    There is a conceptual difference between comparing two numbers that are close to each other and comparing two not numbers. You can get "strange" results like this:
    
    ```
    red>> equal? sin -1.0e450 cos -1.0e450
    == true
    ```
    
    JavaScript, Python and Ruby all treat NaN <> NaN

--------------------------------------------------------------------------------

On 2016-06-17T09:57:03Z, qtxie, commented:
<https://github.com/red/red/issues/2001#issuecomment-226729946>

    In current implementation, it should return false. Becuase issue #847 , now the result depends on platform.

