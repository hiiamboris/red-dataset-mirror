
#2104: Some brackets don't match properly
================================================================================
Issue is closed, was reported by WiseGenius and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2104>

In some situations, the console behaves as though brackets/parenthesis are still open, not letting the line execute:

Examples:

```
red>> [{}]
== [""]
red>> [{{}}]
[
```

```
red>> ({})
== ""
red>> ({{}})
(    
```

```
red>> [{[{}]}]
== ["[{}]"]
red>> [{({})}]
[    
```

```
red>> ({({})})
== "({})"
red>> ({[{}]})
(    
```



Comments:
--------------------------------------------------------------------------------

On 2016-07-11T08:38:42Z, x8x, commented:
<https://github.com/red/red/issues/2104#issuecomment-231674184>

    This one too:
    
    ```
      [}
    [    ]
    [    }
    [    
    ```

--------------------------------------------------------------------------------

On 2016-07-11T10:23:51Z, dockimbel, commented:
<https://github.com/red/red/issues/2104#issuecomment-231697342>

    @x8x Such issue is already logged in #1995.

