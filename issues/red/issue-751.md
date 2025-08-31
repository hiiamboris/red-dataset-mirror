
#751: Too large "integer!" literals are interpreted as "float!"
================================================================================
Issue is closed, was reported by rmn64k and has 10 comment(s).
[status.built] [status.tested] [type.bug] [Red/System]
<https://github.com/red/red/issues/751>

Too large `integer!` literals should cause an error but are instead converted to `float!`.
This example program prints `4.587245897644e+35`.

```
Red/System []
foo: 458724589764398757698437598437598347 
print [foo lf]
```



Comments:
--------------------------------------------------------------------------------

On 2014-04-01T15:25:18Z, qtxie, commented:
<https://github.com/red/red/issues/751#issuecomment-39218682>

    @rmn64k Red/System use Rebol 'load to tokenize the source code.Because Rebol 'load convert the big number to float!, I think we can do nothing to output this syntax error unless we do the lexing by ourselves.

--------------------------------------------------------------------------------

On 2014-04-01T15:36:48Z, dockimbel, commented:
<https://github.com/red/red/issues/751#issuecomment-39220189>

    @qtxie Right, Rebol's LOAD is the limitation, but it was put there just for the bootstrapping. As Red/System was meant to be a dialect of Red, I wonder if we couldn't replace it with `lexer/process` from Red's compiler now? If it works fine, we could even gain Unicode support for Red/System identifiers. :-)

--------------------------------------------------------------------------------

On 2018-12-06T16:34:40Z, hiiamboris, commented:
<https://github.com/red/red/issues/751#issuecomment-444936980>

    This one has regressed: the output now is `4.58725e+035`

--------------------------------------------------------------------------------

On 2019-09-14T19:41:25Z, dockimbel, commented:
<https://github.com/red/red/issues/751#issuecomment-531507786>

    New fix pushed.

--------------------------------------------------------------------------------

On 2019-09-15T07:39:26Z, hiiamboris, commented:
<https://github.com/red/red/issues/751#issuecomment-531542659>

    @dockimbel you can uncomment https://github.com/red/red/blob/fc202572458b6e9e19b4fe11ee9f1c79d54fcb43/system/tests/source/compiler/regression-test-rsc.r#L1178-L1185

