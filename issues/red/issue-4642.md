
#4642: Agree on casing to avoid confusion
================================================================================
Issue is closed, was reported by 225559 and has 6 comment(s).
<https://github.com/red/red/issues/4642>

In the `github.com/red/red` root directory there are two directories with different casing styles:
- libRed
- quick-test

Either use "camelCase" *or* "hyphen-ing"


Comments:
--------------------------------------------------------------------------------

On 2020-08-26T17:34:51Z, 9214, commented:
<https://github.com/red/red/issues/4642#issuecomment-681022265>

    @maksumic that sounds a bit too pedantic and doesn't provide any rationale for the change. Can you elaborate on what you find confusing?
    
    [`libRed`](https://www.red-lang.org/2017/03/062-libred-and-macros.html) follows the common convention to prepend `lib` prefix to the name of a shared library, which is named `Red` because that's the name of the programming language. Moreso, `lib` suffix is required by the GCC linker (e.g. `gcc -o foo foo.c -lRed` will search for `libRed.so`).
    
    `quick-test` is a testing framework that Red uses, which is written in Rebol/Red and follows the naming convention of the language (lowercase, hyphenated).

--------------------------------------------------------------------------------

On 2020-08-26T17:46:24Z, 225559, commented:
<https://github.com/red/red/issues/4642#issuecomment-681027941>

    I'm new to Red and newcomers usually look at "authoritative" code (like the `github.com/red/red` repo) for styling guidance. Another rationale is consistency. But, I didn't know the GCC linker requires the `lib` prefix.

--------------------------------------------------------------------------------

On 2020-08-26T18:22:45Z, 9214, commented:
<https://github.com/red/red/issues/4642#issuecomment-681046056>

    @maksumic OK, understood. We have the official [coding style guide](https://github.com/red/docs/blob/master/en/style-guide.adoc) which should answer most of your questions. If you need any help getting started with Red, don't hesitate to drop by our [community chat](https://gitter.im/red/red/welcome).

