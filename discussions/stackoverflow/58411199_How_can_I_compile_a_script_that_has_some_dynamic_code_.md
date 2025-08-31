# How can I compile a script that has some dynamic code?

**Link:**
<https://stackoverflow.com/questions/58411199/how-can-i-compile-a-script-that-has-some-dynamic-code>

**Asked:** 2019-10-16 10:30:31 UTC

------------------------------------------------------------------------

I want to compile this script:

    Red [File: %b.red]
    context [
        a: 123
        hidden: 999
        set 'global-exports context [
            export-a: a
        ]
    ]
    probe global-exports

But I get an error when trying to compile it with
`$ ./red-13oct19-a4ee537c -r b.red`:

    *** Red Compiler Internal Error: Script Error : Invalid path value: global-exports 
    *** Where: register-object 
    *** Near:  [objects/context/global-exports: make object! [
    a: none
    hidden: none
    ]] 

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 2) --- by Maciej Łoziński

In general, you can wrap dynamic code with `do [...]` function, which
treats a block of code like data and uses an interpreter to launch it at
runtime:

    Red [File: %b.red]
    context [
        a: 123
        hidden: 999
        do [   ;-- the code inside is run by interpreter at runtime
            set 'global-exports context [
                export-a: a
            ]
        ]
    ]
    probe get 'global-exports   ;-- dynamic retrieval

You also have to retrieve values dynamically, unless you initialize it
statically (e.g. `global-exports: none`) somewhere earlier.

In this particular case also exchanging `context` with `make object!`
will be sufficient:

    Red [File: %b.red]
    context [
        a: 123
        hidden: 999
        set 'global-exports make object! [
            export-a: a
        ]
    ]
    probe global-exports

Compiling dynamic code [will be possible with JIT
compiler](https://github.com/red/red/issues/924#issuecomment-55394824){rel="nofollow noreferrer"},
which is planned in future, but not before Red version 1.0.

(thanks \@9214 and \@hiiamboris for the ideas [on red/help gitter
chat](https://gitter.im/red/help?at=5da6d96639d0c70757bb4447){rel="nofollow noreferrer"})

------------------------------------------------------------------------

## Comments on question
