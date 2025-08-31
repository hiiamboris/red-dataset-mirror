
#336: Coding question: Why is paren/append* defined
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[status.built] [type.review]
<https://github.com/red/red/issues/336>

The `append` action on `paren!` values is defined as inherited from `block!`

Therefore I don't see the use of `paren/append*`



Comments:
--------------------------------------------------------------------------------

On 2012-12-10T14:07:59Z, dockimbel, commented:
<https://github.com/red/red/issues/336#issuecomment-11195230>

    It is a leftover from early paren! implementation. It was probably needed at some point for the construction of literal paren! values, then the compiler was changed to use only block! constructors for any-block! values. So, I will just remove it as no code part depends on it anymore.

