
#252: #system cannot find #include
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 6 comment(s).
[status.built] [status.tested] [Red/System]
<https://github.com/red/red/issues/252>

```
Red []

#system [
    #include %../C-library.reds
]
```

bash-4.0# red /users/administrator/Red/Red-C-library/examples/test.red

-= Red Compiler =- 
Compiling /users/administrator/Red/Red-C-library/examples/test.red ...

...compilation time:     172 ms

Compiling to native code... 

**\* Loading Error: include file access error: %../C-library.reds 
**\* in file: %../red/runtime/stack.reds 
**\* at line: 97



Comments:
--------------------------------------------------------------------------------

On 2012-10-04T00:45:11Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/252#issuecomment-9127338>

    I'm still experiencing this issue.

--------------------------------------------------------------------------------

On 2012-10-25T17:38:34Z, dockimbel, commented:
<https://github.com/red/red/issues/252#issuecomment-9786730>

    This is related to issue #251, will need it to be fixed first.

--------------------------------------------------------------------------------

On 2013-01-13T02:11:25Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/252#issuecomment-12188435>

    Note that this often is restricted to paths that go one level up. Paths that go multiple relative levels up often work.

