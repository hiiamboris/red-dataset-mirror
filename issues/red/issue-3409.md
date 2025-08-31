
#3409: to-string and form omit the "decoration" for any-word! values , but not for any-path! values
================================================================================
Issue is closed, was reported by meijeru and has 8 comment(s).
[status.built] [status.tested] [test.written] [type.design]
<https://github.com/red/red/issues/3409>

### Expected behavior

`to-string` and `form` should treat `any-word!` and `any-path!` values similarly
### Actual behavior

`form quote :a` => `a` ;; the `:` is left out
`form quote :a/b/c` => `:a/b/c` ;; the `:` is kept

`to-string` does exactly the same; both do this for `get-`, `lit-` and `set-` words and paths.

I plead for consistency, as usual
### Steps to reproduce the problem

Execute in any interpreter
### Red and platform version
```
all
```


Comments:
--------------------------------------------------------------------------------

On 2018-06-08T13:15:24Z, meijeru, commented:
<https://github.com/red/red/issues/3409#issuecomment-395757184>

    A full overview of the behaviour of `to-string form mold` and `mold/all` is found [here](https://gist.github.com/meijeru/f5cf9fccb1f3cf2e9d017c59ebf6f93f) View as HTML.

--------------------------------------------------------------------------------

On 2018-06-09T21:59:25Z, greggirwin, commented:
<https://github.com/red/red/issues/3409#issuecomment-396001574>

    This is interesting. It occurred to me that we should look at how values are round-tripped in conversions. e.g. 
    ```
    >> to file! "a"
    == %a
    >> to string! to file! "a"
    == "a"
    >> to file! mold to file! "a"
    == %%25a
    >> to file! form to file! "a"
    == %a
    ```
    Which came from looking at the code and seeing that the current behavior is by design. `*-word!` types inherit `form/mold` from the base `word!` type, but `*-path!` types do not inherit them from `path!`. They explicitly have their own implementation.
    
    This makes them compatible with R2, but not R3. In R3 you have this behavior:
    ```
    >> form quote :a
    == ":a"
    
    >> form quote :a/b/c
    == ":a/b/c"
    
    >> to get-word! form quote :a
    ** Syntax error: invalid character in: ":a"
    ** Where: to
    ** Near: to get-word! form quote :a
    
    >> to get-path! form quote :a/b/c
    == ::a/b/c
    ```
    Seems we need to think about big picture goals and uses, decide, and document those choices.

--------------------------------------------------------------------------------

On 2019-11-21T20:54:06Z, hiiamboris, commented:
<https://github.com/red/red/issues/3409#issuecomment-557267592>

    @meijeru how about the 1st line in your list: `mold/all ()` returns `"unset"` which is loaded as a function
    Is there an issue about that?

--------------------------------------------------------------------------------

On 2019-11-23T14:22:47Z, meijeru, commented:
<https://github.com/red/red/issues/3409#issuecomment-557801877>

    @hiiamboris Not that I know of.

