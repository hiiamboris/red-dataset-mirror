
#76: unexpected result of "complex" expression
================================================================================
Issue is closed, was reported by earl and has 8 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/76>

The following simple program leads to an unexpected result:

``` rebol
Red/System []
a: "0"
a/1: a/1 + (2 * 2)
print a
```

I'd expect `4` as output, but `@` is printed instead. For other expressions, the results vary (using `2 * 3` leads to `0` being printed, for example).



Comments:
--------------------------------------------------------------------------------

On 2011-06-05T18:49:07Z, meijeru, commented:
<https://github.com/red/red/issues/76#issuecomment-1305530>

    I get `D` as output for the same program, indicating perhaps that the result is arbitrary.

--------------------------------------------------------------------------------

On 2011-06-05T19:12:01Z, dockimbel, commented:
<https://github.com/red/red/issues/76#issuecomment-1305611>

    The cause is an obsolete handling for complex expressions involving operators (not fully taking into account the possible combinations between nested calls and path accesses).

--------------------------------------------------------------------------------

On 2011-06-05T19:45:57Z, dockimbel, commented:
<https://github.com/red/red/issues/76#issuecomment-1305758>

    Tested OK.
    
    Following code:
    
    ```
    a: "0"
    a/1: 2 * 2 + a/1
    print a
    
    a: "0"
    a/1: (2 * 2) + a/1
    print a
    
    a: "0"
    a/1: a/1 + (2 * 2)
    print a
    
    a: "0"
    a/1: a/1 + ((2 * 2) - 1)
    print a
    ```
    
    will output
    
    ```
    4
    4
    4
    3
    ```

--------------------------------------------------------------------------------

On 2011-06-05T19:49:33Z, dockimbel, commented:
<https://github.com/red/red/issues/76#issuecomment-1305769>

    I gave up on using the ```  rebol marker for the above code, github was formatting it as expected in the preview, but once posted and edited again, no way to make it work correctly (I was getting a corrupted output)...:-(

