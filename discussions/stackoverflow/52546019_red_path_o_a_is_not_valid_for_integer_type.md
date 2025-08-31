# red: path o/a is not valid for integer! type

**Link:**
<https://stackoverflow.com/questions/52546019/red-path-o-a-is-not-valid-for-integer-type>

**Asked:** 2018-09-27 22:36:54 UTC

------------------------------------------------------------------------

This code works:

      o: context [
        a: 1
      ]

      o/a

This one doesn\'t:

      o: context [
        a: 1
        return a
      ]
      o
      o/a

> **\* Script Error: path o/a is not valid for integer! type \*** Where:
> catch \*\*\* Stack:

Is there a way to make the second one work ?

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 4) --- by 9214

`return` will force its function to return whatever value is provided.
The thing is that `context` is a function too! So, when you do:

    o: context [
        a: 1
        return a
    ]

`o` word will be set to a returned value from a `context` function,
which takes a block, evaluates it according to `make object! ...`
semantics (see details
[here](https://github.com/meijeru/red.specs-public/blob/master/specs.adoc#code-object-code){rel="nofollow noreferrer"}),
and returns a `1` integer in the process, because that\'s what you\'ve
asked it to do.

I\'m not quite sure what else you\'ve expected in this case. If you want
o set `o` to an actual `object!` \-- just don\'t use `return`.

*Comment by user310291:* I wanted O to return AND be able to call any O
methods.

*Comment by 9214:* i.e. you want `o` to be an integer AND an object at
the same time..?

*Comment by 9214:* Or do you want to set `o` to an object, but return a
value of its `a` field as a result of the whole expression?
`get in o: object [a: 1] 'a` ?

*Comment by user310291:* O is an Object, I want to access a child
implicitely: MSAccess VBA allowed this without requiring explicitely to
name the default child.

------------------------------------------------------------------------

## Comments on question
