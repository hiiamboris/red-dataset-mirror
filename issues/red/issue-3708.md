
#3708: tag literals are lexed differently by compiler/interpreter
================================================================================
Issue is open, was reported by meijeru and has 8 comment(s).
[status.deferred] [type.design] [type.compiler]
<https://github.com/red/red/issues/3708>

**Describe the bug**
The run-time lexer checks the first character of the tag string against `< = >` and `ws` (potentially the widest collection of Unicode whitespace characters, but at least including -- at this writing -- `U+00A0`).
The compile-time lexer checks against `< = >` and `ws-ASCII` which is a smaller collection.

**Expected behavior**
As usual,  consistency between the two lexers is desirable.

**Platform version (please complete the following information)**
```
All
```



Comments:
--------------------------------------------------------------------------------

On 2019-01-05T16:05:14Z, dockimbel, commented:
<https://github.com/red/red/issues/3708#issuecomment-451667400>

    Both lexers have to cop with different types of input (UTF-8 vs string!) and different Parse dialects (R2 vs Red). Moreover, the final list of whitespaces to support at lexer level has not been finalized yet (as it adds significant overhead to the lexer, especially in the run-time one). So, we'll make that consistent once the precise list is decided, and once we move closer to 1.0, with probably a different run-time lexer.

--------------------------------------------------------------------------------

On 2020-03-22T11:30:48Z, 9214, commented:
<https://github.com/red/red/issues/3708#issuecomment-602184948>

    @dockimbel is this something that has been (or can be) addressed by `fast-lexer` branch?

--------------------------------------------------------------------------------

On 2020-07-30T12:10:31Z, 9214, commented:
<https://github.com/red/red/issues/3708#issuecomment-666326663>

    ↑ ping.

--------------------------------------------------------------------------------

On 2020-10-05T11:49:04Z, dockimbel, commented:
<https://github.com/red/red/issues/3708#issuecomment-703580566>

    Whitespaces definitive list has not been decided yet. 

