
#3664: Infix operator with lit-word first argument treats second argument wrongly
================================================================================
Issue is closed, was reported by meijeru and has 4 comment(s).
<https://github.com/red/red/issues/3664>

**Describe the bug**
I was inspired by Ren-C to make an infix equivalent of `reflect`: call it `of`. While at it, I decided to try `type of` to replace `type?`. The `of` infix operator needs a lit-word first argument. The second formal argument is a normal word. It turns out that the actual second argument, when it is a word, is not evaluated.

**To reproduce**
```
>> of: make op! func [field value][print type? value] ; minimal example, normal word! argument
== make op! [[field value]]
>> 'type of integer! ;; type needs to be quoted here
datatype ;; correct
>> of: make op! func ['field value][print type? value] ; same example with lit-word first argument
== make op! [['field value]]
>> type of integer! ;; type does not need to be quoted
word ;; integer! is not evaluated
```

**Expected behavior**
The treatment of the second argument should remain unaffected

**Platform version (please complete the following information)**
```
Not platform dependent, I think
```



Comments:
--------------------------------------------------------------------------------

On 2018-12-15T13:31:52Z, 9214, commented:
<https://github.com/red/red/issues/3664#issuecomment-447568639>

    This is a duplicate of https://github.com/red/red/issues/3344.

--------------------------------------------------------------------------------

On 2018-12-15T13:34:19Z, meijeru, commented:
<https://github.com/red/red/issues/3664#issuecomment-447568863>

    Thanks. I will close now. It can be hard to check previous issues. Even the beta feature which looks up related issues did not work here. 

