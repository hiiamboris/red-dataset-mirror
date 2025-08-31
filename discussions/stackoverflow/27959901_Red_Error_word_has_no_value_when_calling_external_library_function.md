# Red: \*\*\* Error: word has no value! when calling external library function

**Link:**
<https://stackoverflow.com/questions/27959901/red-error-word-has-no-value-when-calling-external-library-function>

**Asked:** 2015-01-15 09:05:28 UTC

------------------------------------------------------------------------

I am following the example from the Red documentation here:
[http://static.red-lang.org/red-system-specs.html#section-14](http://static.red-lang.org/red-system-specs.html#section-14){rel="nofollow"}

This is my code:

    Red []

    #import [
       "SDL2.dll" cdecl [
           sdl_init: "SDL_Init" [
               flags [integer!]
               return: [integer!]
           ]
       ]
    ]

    rc: sdl_init 0

When I execute this with the Red interpreter, I get the following error
on the last line:

    *** Error: word has no value!
    *** Error: word has no value!

Compiling with `red -c` gives a more useful error:

    *** Compilation Error: undefined word sdl_init
    *** in file: %/C/temp/red/sdl.red
    *** near: [sdl_init 0]

Obviously the `sdl_init` definied during the import of the library is
out of scope by the time it gets to the last line.

How do you explain the example in the documentation then? If I
initialize `sdl_init` to some arbitrary value prior to the import, it
still retains the same value after the `#import` block.

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 5) --- by kealist

Remember, you are reading the Red/System (The C-like language) spec, not
the Red spec, so the `#import` must be done in Red/System. A couple of
notes:

1.  If you want to reference Red/System within Red there are a couple
    ways:

Make a separate SDL2.reds script with the imports,

    Red/System []
    sdl: context [
        #import [
           "SDL2.dll" cdecl [
               sdl_init: "SDL_Init" [
                   flags [integer!]
                   return: [integer!]
               ]
           ]
        ]
    ]
    rc: sdl_init 0

To use it in Red, use `#include %SDL2.reds` in the script, and you can
make a routine

    #include %SDL2.reds
    initialize: routine ["SDL Initialize" ][
        with sdl [sdl_init 0]
    ]

Or your can use the directives: `#system-global []` or `#system []` - I
don\'t know that this is a good idea for using `#import`, but you can
call the SDL2.reds functions in it.

    #include %SDL2.reds
    #system [with sdl [sdl_init 0]]

2.  There is an SDL1 binding that already exists
    [here](http://red.esperconsultancy.nl/Red-SDL/artifact/c794f67660c943c24a13fc7fe2a79051812a64f3){rel="nofollow"}.
    There are dependencies from other bindings as well though. I have a
    [mirror of all those fossil
    bindings](https://github.com/kealist/RS-fossil-mirror/tree/master/SDL){rel="nofollow"}
    (updated a couple days ago).

------------------------------------------------------------------------

### Answer (score: 5) --- by Peter W A Wood

The document you refer to is the Red/System specification and does not
cover Red. You have actually written a Red/System program. (Apart from
having used a Red\[\] header). It should perform as you expect, if you
compile and run it.

If you want to access an external library from Red you need to use a
routine!, a Red/System function that is called from Red. If you are only
passing integer values between Red and the external function it is quite
straight forward as integer values are automatically \"marshalled\"
between Red and Red/System. (This is not the case with other datatypes).

A Red program that includes a routjne! needs to be compiled and cannot
be run from the Red console at this stage. Once the Red compiler is
self-hosted (Red 2.0), there should be a just-in-time compiler so you
will be able to run such code in the Red console.

------------------------------------------------------------------------

## Comments on question
