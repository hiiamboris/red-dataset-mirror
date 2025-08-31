# How to read key from keyboad in red/rebol

**Link:**
<https://stackoverflow.com/questions/67016735/how-to-read-key-from-keyboad-in-red-rebol>

**Asked:** 2021-04-09 07:22:52 UTC

------------------------------------------------------------------------

We can get input from console by `input` or `ask`, which means to press
some keys on keyboard and terminate the input by pressing the key
\"Enter\". I\'d like to know if there is a way to get a key input, that
is to say, just press a key on keyboard and then something happens, like
this:

    if read-key = #"a" [do something...] ;;if the key "a" on keyboard is pressed, something is done immediately--not by pressing the key "Enter" after pressing "a".

If no such any-function! like read-way in red/rebol, how to achieve it?

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 2) --- by endo64

On Rebol2 this should work:

    >> console-port: open/binary [scheme: 'console]
    >> pick console-port 1 ; hit space
    == 32

    >> to char! pick console-port 1  ;hit x
    == #"x"

*Comment by lyl:* A good solution! Thank you. And is there a Red
version?

*Comment by 9214:* \@lyl no, Red doesn\'t have ports ATM. Depending on
the task, you may try to hack your way around with View event capturing.

*Comment by lyl:* Thank you alll for these good solution and proposal!

*Comment by lyl:* \@9214 Yes, `on-key` event in View is for this. But
how to present keys combination, for example, `ctrl a` or `ctrl shift a`
or `alt a`?

*Comment by 9214:* \@lyl each event has a set of flags dedicated to
that. See [View
documentation](https://github.com/red/docs/blob/master/en/view.adoc#112-event-datatype){rel="nofollow noreferrer"}.

------------------------------------------------------------------------

## Comments on question

*Comment by 9214:* Does this answer your question? [Is it possible to
detect esc key with ask
function?](https://stackoverflow.com/questions/4233670/is-it-possible-to-detect-esc-key-with-ask-function)
