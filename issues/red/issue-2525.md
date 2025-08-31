
#2525: File and url accept paths, but don't add the /, as Rebol does
================================================================================
Issue is closed, was reported by meijeru and has 4 comment(s).
[status.built] [status.tested] [type.wish] [test.written]
<https://github.com/red/red/issues/2525>

Rebol 2 and 3
```
>> f: %a.b
== %a.b
>> f/c
== %a.b/c
```
Red
```
>> f: %a.b
== %a.b
>> f/c
== %a.bc
```
Red works as the Rebols when f ends in /
The same holds for urls


Comments:
--------------------------------------------------------------------------------

On 2017-04-01T01:37:07Z, qtxie, commented:
<https://github.com/red/red/issues/2525#issuecomment-290884419>

    Related issue: #2165

--------------------------------------------------------------------------------

On 2017-04-01T02:11:45Z, qtxie, commented:
<https://github.com/red/red/issues/2525#issuecomment-290886729>

    Should be working now in interperter. But code below does not work when compiled.
    Code 1:
    ```
    u: %a/b
    probe u/c/1
    ```
    Get error:
    ```
    *** Script Error: path none is not valid for integer! type
    *** Where: probe
    *** Stack: probe
    ```
    Code 2:
    ```
    u: %a/b
    probe u/c/d
    ```
    Get error: 
    ```
    *** Script Error: word! type is not allowed here
    *** Where: probe
    *** Stack: probe
    ```

