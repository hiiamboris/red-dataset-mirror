# How to create a Red/System binding to a function that takes a pointer to a pointer?

**Link:**
<https://stackoverflow.com/questions/20595992/how-to-create-a-red-system-binding-to-a-function-that-takes-a-pointer-to-a-point>

**Asked:** 2013-12-15 15:09:26 UTC

------------------------------------------------------------------------

I was looking at how Red/System hooks up with C library functions from
Windows DLLs, Linux/Android .so shared libraries, and OS/X .dylib, with
the `#import` syntax:

    #import [
        "libc.so.6" cdecl [

            allocate: "malloc" [
                size [integer!]
                return: [byte-ptr!]
            ]

            free: "free" [
                block [byte-ptr!]
            ]

            /* ... */
    ]

Works for all the basic types, but what do you do when a function wants
a pointer to a pointer? For instance, what if you were trying to bind to
something like `getline()`, which has the prototype:

    ssize_t getline(char **lineptr, size_t *n, FILE *stream);

One way of calling this (the way I want to call it\...) is where the
incoming lineptr is not a preallocated buffer, but rather `null`. In
this case, getline allocates the buffer for you and modifies the char\*
so it is no longer null.

As a first try, I did:

    getline: "getline" [
        lineptr [byte-ptr!]       ;-- char **
        n [pointer! [integer!]]   ;-- size_t *
        stream [byte-ptr!]        ;-- FILE *
        return: [integer!]        ;-- ssize_t
    ]

But since there isn\'t such a thing as a `pointer! [c-string!]` or
similar, I don\'t see how to call it. Can I get the address of a
`c-string!` local variable and pass it as a `byte-ptr!` somehow?

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 7) --- by meh.

    Red/System [
        Title: "derp"
    ]

    #import [
        LIBC-file cdecl [
            _fdopen: "fdopen" [
                fd   [integer!]
                type [c-string!]

                return: [pointer! [byte!]]
            ]

            _getline: "getline" [
                line   [pointer! [integer!]]
                n      [pointer! [integer!]]
                stream [pointer! [byte!]]

                return: [integer!]
            ]
        ]
    ]

    getline: func [
        stream  [pointer! [byte!]]
        return: [c-string!]

        /local
            line [integer!]
            n    [integer!]
    ] [
        line: 0
        n:    0

        _getline :line :n stream
        as c-string! line
    ]

    stream: _fdopen 0 "r"
    line:  getline stream

    print line

This works.

*Comment by HostileFork says dont trust SE:* Thanks! This works,
although the return from LIBC\'s getline is the length of the line
retrieved (not the string), so it would be an integer\... you can edit
your answers (I could too). But I\'ll let you do it. :-)

------------------------------------------------------------------------

### Answer (score: 2) --- by kealist

In a world of little Red documentation, one actual [Red/System
Specification
Document](http://static.red-lang.org/red-system-specs.html#section-4.8){rel="nofollow"}
is pretty useful, and that section contains the answer indirectly in
another example:

    p: declare pointer! [byte!]            ;-- char *p;

which would result in:

    getline: "getline" [
        lineptr [pointer! [byte!]]  ;-- *char *
        n [pointer! [integer!]]     ;-- *size_t 
        stream [pointer! [byte!]]   ;-- *char
        return: [integer!]          ;-- ssize_t
    ]

*Comment by HostileFork says dont trust SE:* Good to mention the link. I
guess the main thing I hadn\'t really gotten my head around here was
Red/System\'s application of GET-WORD! to mean \"address-of\".

------------------------------------------------------------------------

## Comments on question
