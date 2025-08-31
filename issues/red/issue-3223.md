
#3223: MOLD does not properly encode some { in strings
================================================================================
Issue is closed, was reported by rebolek and has 14 comment(s).
[status.built] [type.review]
<https://github.com/red/red/issues/3223>

### Expected behavior

Following code should work:

```
>> save %delme read https://gist.githubusercontent.com/rebolek/a335e0a146e52a389e4a51d4a3344d60/raw/37fe0505f1053e370738b0348a7f3e7c2bcef4f0/test
>> load %delme
```

### Actual behavior

It throws an error:

```
*** Syntax Error: invalid value at {)" ]^^/         keep (tmp-series)^^/}
*** Where: do
*** Stack: load
```

### Steps to reproduce the problem

See above. The problem is that in `"{"`, `{` is not properly escaped as `^{`.

### Red version and build date, operating system with version.

Latest Red on Linux, Windows, OSX.


Comments:
--------------------------------------------------------------------------------

On 2018-02-18T04:58:54Z, gltewalt, commented:
<https://github.com/red/red/issues/3223#issuecomment-366492826>

    If you use trim/lines on the file (indirectly of course), save it, and then load it - what result do you get?

--------------------------------------------------------------------------------

On 2018-02-19T13:47:04Z, rebolek, commented:
<https://github.com/red/red/issues/3223#issuecomment-366697519>

    @gltewalt the same error:
    ```
    >> save %delme trim/lines read https://gist.githubusercontent.com/rebolek/a335e0a146e52a389e4a51d4a3344d60/raw/37fe0505f1053e370738b0348a7f3e7c2bcef4f0/test
    >> load %delme
    *** Syntax Error: invalid value at {)" ] keep (tmp-series) ] mal-vector: [ (}
    *** Where: do
    *** Stack: load  
    ```

--------------------------------------------------------------------------------

On 2018-02-23T00:29:25Z, gltewalt, commented:
<https://github.com/red/red/issues/3223#issuecomment-367869747>

    Why does this work?
    
    ```
    >> stuff: read https://gist.githubusercontent.com/rebolek/a335e0a146e52a389e4a51
    == {```^/      mal-scalar: [^/         any whitespace [^/            p:
    >> trim/lines stuff
    == {``` mal-scalar: [ any whitespace [ p: (probe p) "nil" keep ('nil...
    >> save %delme stuff
    >> load stuff
    == [``` mal-scalar: [any whitespace [p: (probe p) "nil" keep ('nil) ...
    ```

--------------------------------------------------------------------------------

On 2018-02-23T07:17:25Z, rebolek, commented:
<https://github.com/red/red/issues/3223#issuecomment-367929758>

    @gltewalt Because you are  loading `stuff`, not `%delme`.

--------------------------------------------------------------------------------

On 2018-02-24T04:57:01Z, gltewalt, commented:
<https://github.com/red/red/issues/3223#issuecomment-368200301>

    Yep. That was silly of me :smile: 

--------------------------------------------------------------------------------

On 2018-03-12T10:15:10Z, dockimbel, commented:
<https://github.com/red/red/issues/3223#issuecomment-372258165>

    The issue boils down to:
    ```
    >> mold "}{"
    == {"}{"}
    >> mold mold "}{"
    == {{"}{"}}
    >> load mold mold "}{"
    == [{"} {"}]
    ```
    while in Rebol:
    ```
    >> mold "}{"
    == {"^}^{"}
    >> mold mold "}{"
    == {{"^^}^^{"}}
    >> load mold mold "}{"
    == {"^}^{"}
    ```
    
    Red tries to use less encoding, but it results in confusing the lexer in some cases like this.
    
    As a workaround, use `load` instead of `read`:
    ```
    >> save %delme load https://gist.githubusercontent.com/rebolek/a335e0a146e52a389e4a51d4a3344d60/raw/37fe0505f1053e370738b0348a7f3e7c2bcef4f0/test
    >> load %delme
    == [``` 
        mal-scalar: [
            any whitespace [
                p: (probe p) "nil" keep ('nil) | "t...
    ```

--------------------------------------------------------------------------------

On 2018-07-23T06:39:31Z, bitbegin, commented:
<https://github.com/red/red/issues/3223#issuecomment-406955285>

    some difference with Rebol:
    In rebol:
    ```
    == "{}{"
    >> mold a
    == {"^{^}^{"}
    >> a: "}{}"
    == "}{}"
    >> mold a
    == {"^}{}"}
    >>
    ```
    fixed in Red:
    
    ```
    >> a: "{}{"
    == "{}{"
    >> mold a
    == {"{}^{"}
    >> a: "}{}"
    == "}{}"
    >> mold a
    == {"^}{}"}
    >> 
    ```
    
    `a: {^{}` will cause syntax error in Rebol, fixed in Red:
    
    ```
    >> a: {^{}
    == "{"
    >> mold a
    == {"^{"}
    >> 
    ```

