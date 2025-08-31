
#367: Rule that characters following # in issue should make up a word, isn't enforced 
================================================================================
Issue is closed, was reported by meijeru and has 10 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/367>

Rebol allows issues of the form `#1` whereas Red does not. The test is missing.

```
#1
-= Red Compiler =-
Compiling red/tests/mytest.red ...
*** Red Compiler Internal Error: Script Error : add-symbol expected name argument of type: word
*** Where: comp-literal
*** Near:  [add-symbol value: load form value] 
```



Comments:
--------------------------------------------------------------------------------

On 2013-01-04T13:48:42Z, dockimbel, commented:
<https://github.com/red/red/issues/367#issuecomment-11883221>

    Good catch!

--------------------------------------------------------------------------------

On 2013-01-04T21:26:11Z, meijeru, commented:
<https://github.com/red/red/issues/367#issuecomment-11900499>

    This does not enforce `word!` content, this allows any Rebol-valid issue and refinement to pass. It is a choice...

--------------------------------------------------------------------------------

On 2013-01-04T21:29:18Z, dockimbel, commented:
<https://github.com/red/red/issues/367#issuecomment-11900624>

    Do you think it would be better to have more restrictive syntactic rules for issue! and refinement! in Red compared to Rebol? I find the possibility of having /1, /2, /3 or #123 useful.

--------------------------------------------------------------------------------

On 2013-01-04T23:17:14Z, PeterWAWood, commented:
<https://github.com/red/red/issues/367#issuecomment-11904485>

    One of the REBOL systems that I works on uses extensive use of numeric issues. For example, the project number is stored as an issue! eg #00000575. This data is stored on REBOL blocks. The blocks are parsed to select data from them. I believe one reason for using #issue! is being able to parse by datatype.

--------------------------------------------------------------------------------

On 2013-01-05T09:45:46Z, meijeru, commented:
<https://github.com/red/red/issues/367#issuecomment-11912190>

    I'm fine with issues having the same lexical range as in Rebol. As to refinements, see http://curecode.org/rebol3/ticket.rsp?id=733 for a discussion about using `/1` etc. in a function definition and -call. Carl proposed there to treat refinements more strictly, but my latest copy of Rebol 3 doesn't do that.

