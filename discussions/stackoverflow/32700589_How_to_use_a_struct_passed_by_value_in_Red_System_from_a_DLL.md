# How to use a struct passed by value in Red/System from a DLL

**Link:**
<https://stackoverflow.com/questions/32700589/how-to-use-a-struct-passed-by-value-in-red-system-from-a-dll>

**Asked:** 2015-09-21 16:51:48 UTC

------------------------------------------------------------------------

I have some c code that looks like this:

    extern "C" __declspec(dllexport) inline sfVector2f __cdecl sf_vector_create(
        float x, float y
    ) {
        std::cout << "x: " << x << " y: " << y << std::endl;
        sfVector2f vec = {x,y};  // just a struct of two floats
        return vec;
    }

    extern "C" __declspec(dllexport) inline void __cdecl test(
        sfSprite* sprite, sfVector2f wtf
    ) {
        std::cout << wtf.x << " " << wtf.y << std::endl;
        sfSprite_setPosition(sprite, wtf);
    }

I invoke it from reds like this:

> vec: sf-vector-create as float32! 100.0 as float32! 100.0 test
> mario-sprite vec

When I invoke this in reds, I get garbled results\... why?

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 3) --- by Jacob Good1

The C code is returning the vec struct on stack instead of returning a
struct pointer. So in R/S, I guess you get back only the first entry of
the struct. R/S does not yet support passing structs by value. But you
can retrieve the rest of the values by some clever use of
system/stack/\* accessors to get a pointer on the beginning of the
struct. Something like this should work:

    sf-vector-create as float32! 100.0 as float32! 100.0
    p: as byte-ptr! system/stack/top
    vec: as vector! p - size? vector!

*(Answer from
[\@DocKimbel](https://stackoverflow.com/users/2081311/dockimbel))*

------------------------------------------------------------------------

## Comments on question

*Comment by Dan Lowe:* Please post the code instead of a link to the
code.
