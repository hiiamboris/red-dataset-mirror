
#1431: Accessing bytes in c-Strings with variable index
================================================================================
Issue is closed, was reported by menzel and has 2 comment(s).
<https://github.com/red/red/issues/1431>

The following code:
    foo: "a string"
    c: 3
    print foo/c

produces the following error:
    **\* Script error: word type not allowed here
    **\* Where print

It works with a fixed value:
    print foo/3

As far as I can see it should work. At least the language specification tells about the feature:
http://static.red-lang.org/red-system-specs.html#section-4.6



Comments:
--------------------------------------------------------------------------------

On 2015-11-11T14:44:11Z, Oldes, commented:
<https://github.com/red/red/issues/1431#issuecomment-155800836>

    The mentioned documentation is for _Red/System_.
    Above is correct behaviour, like in REBOL:
    
    ```
    >> foo: "a string"
    == "a string"
    >> c: 3
    == 3
    >> print foo/c
    ** Script Error: Invalid path value: c
    ** Near: print foo/c
    >> print foo/(c)
    s
    >> print foo/:c
    s
    >>
    ```
    
    it's in Red:
    
    ```
    red>> foo: "a string"
    == "a string"
    red>> c: 3
    == 3
    red>> foo/:c
    == #"s"
    red>> foo/(c)
    == #"s"
    ```

