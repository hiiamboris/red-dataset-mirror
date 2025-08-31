# Pass Red function pointer to C

**Link:**
<https://stackoverflow.com/questions/47894797/pass-red-function-pointer-to-c>

**Asked:** 2017-12-19 20:35:28 UTC

------------------------------------------------------------------------

I know how to pass a `Red/System` callback to a C function, but is the
same functionality possible to achieve with `Red`? It is possible to
create a `Red/System` wrapper for a `Red` function *at runtime* and pass
it to a C function?

I\'ve already looked at a lot of bindings/code
[here](https://github.com/red/code){rel="nofollow noreferrer"} and
[there](https://github.com/red/red/blob/master/runtime/datatypes/function.reds){rel="nofollow noreferrer"},
but haven\'t found anything that solves my problem.

**Edit:**\
Let\'s say that I\'ve got a simple `Red` function:

    add-numbers: func[a b][a + b]

and I have a `Red/System` function alias:

    callback!: alias function! [a [integer!] b [integer!] return: [integer!]]

Is it possible to somehow convert the above `add-numbers` function to a
`callback!` using a `Red/System` wrapper?

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 2) --- by DocKimbel

You can invoke a Red `function!` from Red/System using the
[#call](http://static.red-lang.org/red-system-specs-light.html#section-16.8){rel="nofollow noreferrer"}
directive. Only simple argument types are auto-converted for you (like
numbers and logic value), for the rest, you need to use the Red runtime
API to construct and place the function\'s arguments on the Red stack,
and to eventually retrieve the returned value.

Using `#call`, you can write wrapper functions in Red/System that can be
passed as callbacks to C functions. Here is [an
example](https://github.com/red/red/blob/master/libRed/libRed.red#L1227){rel="nofollow noreferrer"}
of such wrapper from LibRed\'s source code.

*Comment by nickkoro:* Thank your for your answer. Which values exactly
are auto-converted? Only `number!` and `logic!`?

*Comment by DocKimbel:* `integer!`, `float!` and `logic!`. Other
datatypes have no corresponding counterparts between Red and Red/System,
so cannot be auto-converted.

------------------------------------------------------------------------

### Answer (score: 0) --- by Eran W

You can create a Red function at runtime and pass it to a C function -
(without using Red/System), like this:

    #include "red.h"

    int main() {

        redOpen();

        // redDo("add-numbers: func[a b][a + b]"); // will not work
        redSet(redSymbol("add-numbers"), redDo("func [a b][a + b]"));
        redPrint(redCall(redWord("add-numbers"), redInteger(2), redInteger(3)));

        redClose();
        return 0;
    }

*Comment by nickkoro:* Thank you for your answer, but I cannot use any C
code in my Project.

------------------------------------------------------------------------

## Comments on question

*Comment by HostileFork says dont trust SE:* When asking questions,
please provide a [Minimal, Complete, Verifiable
Example](https://stackoverflow.com/help/mcve).
