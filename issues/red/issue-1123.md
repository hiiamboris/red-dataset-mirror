
#1123: RC to accept just file!
================================================================================
Issue is closed, was reported by Oldes and has 4 comment(s).
[status.built] [type.wish]
<https://github.com/red/red/issues/1123>

In the example here: http://www.red-lang.org/2015/04/053-faster-compilation-and-extended.html
is:

```
>> do %red.r
>> rc "-c tests\demo.red"
...
```

which is not what is current result. That looks like:

```
>> do %red.r
No source files specified.
```

Also `rc` could support source file directly, not just string and unnecessary `-c`
I'm creating a pull request with changes.



Comments:
--------------------------------------------------------------------------------

On 2015-04-27T10:19:17Z, Oldes, commented:
<https://github.com/red/red/issues/1123#issuecomment-96598089>

    Now I can do:
    
    ```
    >> do %red.r
    == none
    >> rc %environment/console/console.red
    ```

--------------------------------------------------------------------------------

On 2015-04-27T10:45:39Z, dockimbel, commented:
<https://github.com/red/red/issues/1123#issuecomment-96605868>

    The "No source files specified." is not a problem at all and even actually informs you that the toolchain has loaded properly and is able to run fine.

