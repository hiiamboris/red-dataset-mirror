# Understanding Red/System compilation optimizations compared to GCC

**Link:**
<https://stackoverflow.com/questions/29879521/understanding-red-system-compilation-optimizations-compared-to-gcc>

**Asked:** 2015-04-26 15:24:03 UTC

------------------------------------------------------------------------

While reading the [Red
site](http://www.red-lang.org/2011/03/having-fun-with-redsystem.html){rel="nofollow"},
I came across a statement stating that compiling an hello world
Red/System program creates..

> \"\...a 162 bytes ELF binary, while a similar C code would produce a
> 5-6KB binary using Gcc\"

That\'s amazing. Can someone explain/point me to the techniques making
such optimizations possible?

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 1) --- by DocKimbel

It was achieved by having an almost empty runtime library (just a few
syscalls wrappers) and an ELF emitter which would not align sections on
4K page boundaries for optimal loading.

Though, that was true for Red/System
[0.1.0](https://github.com/red/red/releases/tag/v0.1.0){rel="nofollow"},
so in its very early days, not true anymore (now it would be similar to
other compilers). Though we still have a `-r` compilation option for
compiling Red/System code without any runtime, but as nobody uses it, it
might not work anymore (should be easy to fix anyway if someone needs
it, just drop by Red\'s [chat](http://gitter.im/red/red){rel="nofollow"}
and ask for it. ;-))

------------------------------------------------------------------------

## Comments on question

*Comment by HostileFork says dont trust SE:* I don\'t know the official
answer, but what I do know I know from [A Whirlwind Tutorial on Creating
Really Teensy ELF Executables for
Linux](http://www.muppetlabs.com/~breadbox/software/tiny/teensy.html){rel="nofollow noreferrer"}
