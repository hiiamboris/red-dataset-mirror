
#2227: Split returns an extraneous empty string when splitting with "^/"
================================================================================
Issue is closed, was reported by PeterWAWood and has 2 comment(s).
[status.dismissed] [type.review]
<https://github.com/red/red/issues/2227>

`split` returns an extraneous empty string when splitting with "^/"

``` text
red>> split "1^/" #"^/"
== ["1" ""]
red>> split "1^/2^/" #"^/"
== ["1" "2" ""]
```

The Rebol equivalent:

``` text
>> parse "1^/" "^/" 
== ["1"]
```



Comments:
--------------------------------------------------------------------------------

On 2017-03-02T17:13:55Z, dockimbel, commented:
<https://github.com/red/red/issues/2227#issuecomment-283716819>

    In Rebol3, the `split` function behaves the same, it is the intended behavior:
    ```
    >> split "1^/" #"^/"
    == ["1" ""]
    
    >> split "1^/2^/" #"^/"
    == ["1" "2" ""]
    ```

