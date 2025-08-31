# In Red (R2) how to call a function whose name passed by argument?

**Link:**
<https://stackoverflow.com/questions/77354264/in-red-r2-how-to-call-a-function-whose-name-passed-by-argument>

**Asked:** 2023-10-24 17:37:36 UTC

------------------------------------------------------------------------

I have an arbitrary function with multiple arguments, and I want to call
it from command-line like this: `program myfun 7 24 15`

I tried to do it this way:

    myfun Func: [A B C][...]
    ARGS: Probe System/Options/Args
    Print Do [ARGS/1 Remove ARGS]

My way of thinking is that I retrieve command name with ARGS/1, then
remove it from argument list, enclose in a block with the rest of
arguments and evaluate with Do. However, it just returns arguments
without the function name: `7 24 15`. I also tried to copy both values
to different variables, but no luck, and I cannot understand what is
wrong.

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 3) --- by DocKimbel

The main issue is that the last line does not do what you think it
should:

    Do [ARGS/1 Remove ARGS]

will return:

    ["7" "24" "15"]

instead of calling `myfun` function with those arguments. That happens
because `do [args/1]` is not equivalent to `do args/1`:

    >> args: ["myfun" "7" "24" "15"]
    == ["myfun" "7" "24" "15"]
    >> Do [ARGS/1]
    == "myfun"
    >> Do ARGS/1
    *** Script Error: myfun has no value
    *** Where: Do
    *** Near : myfun
    *** Stack:

As you can see, in the first case, `do` is evaluating a block and
returning the last value, so `Args/1` is evaluated to `"myfun"` and
returned by `do`. In the second case, `Args/1` is evaluated to
`"myfun"`, then `"myfun"` is passed as argument to `do`, resulting in
`do` loading that value and evaluating it (resulting in an error in my
case, as I did not define that word).

> However, it just returns arguments without the function name: 7 24 15

Using `print` implies an extra level of evaluation (as `print` reduces
its block of arguments), so you can easily get fooled by the reduced
output. If you use `probe` instead (recommended for debugging), you
would get `["7" "24" "15"]`.

Now to achieve what you want, you can either do it yourself, step by
step or use an existing library.

### Directly coding the solution

Here is an example code:

    Red [File: %program.red]

    to-int: :to-integer
    myfun:  func [a b c][(to-int a) + (to-int b) + (to-int c)]

    args: system/options/args
    print apply to-word args/1 next args

This approach relies on `apply` which will call a function (passed as
word or function value) with a list of arguments (passed as a block of
values). So:

1.  `to-word args/1` fetches and converts the function\'s name to the
    right type.
2.  `next args` creates the list of arguments by skipping the
    function\'s name at first position in the block (no needs to remove
    it, just skipping is simpler).
3.  The arguments are provided as string values by Red, so you have to
    convert them to the right type before use.

### Using a library

The [CLI
library](https://codeberg.org/hiiamboris/red-cli){rel="nofollow noreferrer"}
is doing what you need (and a lot more). Feel free to join us in our
[Chat
room](https://app.gitter.im/#/room/!wUTlqkqOhNGtfQzIsO:matrix.org){rel="nofollow noreferrer"}
if you\'re not there already and ask \@hiiamboris if you need any info
about his CLI library.

Hope this helps.

*Comment by Slavko:* Thanks, this works! While waiting, I have also
found two other ways to do it: by making map! with name handlers and
then calling them with `print get select handlers args`, and doing
`print load form args`. However, the second one doesn\'t work when one
of arguments is an unquoted string.

------------------------------------------------------------------------

### Answer (score: 1) --- by joing

Nice to see newcomers here. In short:

1.  The assignment is \":\". You put it on the wrong token, should be
    `myfun: func [][A B C`
2.  `system/options/args` are a list of strings. Better to have whole
    argument itself as one string. So use `system/options/args`
3.  No neet to rearrange, just call `print do system/options/args`

If \"do\" is called with a string as argument, the string is tokenized
and bound to the global environment before executed.

So try this in a file called test.r

    REBOL [] 
    args: system/options/args
    myfunc: func [ ][ print "from the function" ]
    do probe myfunc

And call it with `rebol test.r myfunc 1 2 3`

------------------------------------------------------------------------

## Comments on question
