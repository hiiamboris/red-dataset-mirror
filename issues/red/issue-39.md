
#39: alias does not seem to work
================================================================================
Issue is closed, was reported by meijeru and has 6 comment(s).
[status.tested]
<https://github.com/red/red/issues/39>

I submitted the following program to the compiler

```
int!: alias integer!
s: struct [i [int!]]
```

with this result

```
*** Compilation Error: invalid struct syntax: [int!]
*** in: %tests/mytest.reds
*** at:  [struct [i [int!]]]
```

Same when using `int!` as type for a function argument



Comments:
--------------------------------------------------------------------------------

On 2011-05-19T20:01:11Z, dockimbel, commented:
<https://github.com/red/red/issues/39#issuecomment-1205974>

    Aliased types would probably need more work to be fully supported in the compiler (notably, path notation support, which have never been tested so far with aliased types, so would most probably break the compiler)

--------------------------------------------------------------------------------

On 2011-05-20T21:39:41Z, dockimbel, commented:
<https://github.com/red/red/issues/39#issuecomment-1212539>

    I was too quick to jump on fixing this one. Actually, as described in section 4.5.5 of the specification, ALIAS is reserved for struct! type only. Macros should be used for any other type renaming, like:
    
    `#define int! integer!`
    
    Correct error reporting for such cases was added in latest commit.

--------------------------------------------------------------------------------

On 2011-05-21T16:52:02Z, dockimbel, commented:
<https://github.com/red/red/issues/39#issuecomment-1214905>

    Latest commit should fix completly this issue.

