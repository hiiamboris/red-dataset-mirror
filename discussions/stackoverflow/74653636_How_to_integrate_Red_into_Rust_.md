# How to integrate Red into Rust?

**Link:**
<https://stackoverflow.com/questions/74653636/how-to-integrate-red-into-rust>

**Asked:** 2022-12-02 09:39:36 UTC

------------------------------------------------------------------------

Does anyone know how to use `view` from Rust? Do I need to link
`libRed.dll` on Windows? What functions to extern? Must I try to
disassemble it? I'm using compiled Red, not interpreted, so
`libRedRT.lib` isn't a solution, I guess.

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 0) --- by DocKimbel

It seems the Red contributor who started [such binding with
Rust](https://twitter.com/red_lang/status/818367642989785089?s=20&t=g0-uJsQSRHctnEmW7N9orA){rel="nofollow noreferrer"}
deleted his repo (or maybe moved it out of Github).

We have not yet tried interfacing Red with Rust in the core team, but it
should not be difficult to achieve as Red is provided as a library you
can link to C at run-time. All you need is to do is convert the [C
import
definitions](https://github.com/red/red/blob/master/libRed/red.h){rel="nofollow noreferrer"}
for libRed to Rust format. Then you should be able to write a simple
HelloWorld for it, translating the following C code to Rust:

    #include "red.h"

    int main() {
        redOpen();
        redPrint(redString("Hello World!"));
        redClose();
        return 0;
    }

The whole libRed API is described
[there](https://github.com/red/docs/blob/master/en/libred.adoc){rel="nofollow noreferrer"}
and you can find some usage examples from C in the
[tests](https://github.com/red/red/blob/master/tests/libRed/test.c){rel="nofollow noreferrer"}.

EDIT: I have found [another Rust binding for
libRed](https://github.com/hako/libred.rs){rel="nofollow noreferrer"}.

*Comment by Miiao:* I\'ve already checked it, thanks, but couldn\'t find
any information on does it require any additional runtime. While trying
to link `libRed` to my binary using MSVC standard linker, I faced next
problem: looks like functions that I\'m trying to extern refer to other
mysterious symbols (`__imp_redOpen` for `redOpen`, for example), and
linker says \"error LNK2019: unresolved external symbol \_\_imp_redClose
referenced in function {function where I used redClose}\". Hope my text
isn\'t a mishmash.

*Comment by DocKimbel:* LibRed is only available as a shared library,
not as a static library, so you cannot link it statically to your
compiled binary using a linker, you can only load it at run-time.

*Comment by Miiao:* Oh... well, I think I still can use `include_bytes`
anyway. Thank you very much!

------------------------------------------------------------------------

## Comments on question

*Comment by Maciej Łoziński:* You may be interested in
[Redbin](https://github.com/red/docs/blob/master/en/redbin.adoc){rel="nofollow noreferrer"}
format for serde:
[github.com/loziniak/redbin](https://github.com/loziniak/redbin){rel="nofollow noreferrer"}
. It can be helpful when moving data between languages. I use it in
intergating the other way -- [Rust into
Red](https://github.com/loziniak/sn_ffi){rel="nofollow noreferrer"}.
