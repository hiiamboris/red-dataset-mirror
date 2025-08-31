# Which are the cases that make it hard to distinguish between code and data?

**Link:**
<https://stackoverflow.com/questions/42854953/which-are-the-cases-that-make-it-hard-to-distinguish-between-code-and-data>

**Asked:** 2017-03-17 10:22:47 UTC

------------------------------------------------------------------------

It is said code is data (and vice versa, i.e. homoiconic) in Rebol and
Red. Also, it is said that it\'s impossible to distinguish between the
two. My understanding is that there are 2 cases here:

1.  Determine *with certainty* **code** from a mix of code and data
2.  Determine *with certainty* **data** from a mix of code and data

*mix of code and data* is my name for what outsiders would usually call
Rebol code, and experienced Rebol programmers say is data (there is no
code, only data)

## Motivation

The code vs data distinction make some features in programming languages
easier. For e.g. disassembly was mentioned (sbcl has the `disassemble`
function).

# Question

What are examples of these problematic cases?

## context:

[from chat on March 15, 2017 3:32
PM](https://gitter.im/red/help?at=58c91845dd08b4b859d361a6){rel="nofollow noreferrer"}:
(emphasis mine)

> > Didec: You forget that there is no code in Redbol, only data.
> >
> > Maximvl: well, it\'s same for CL and SBCL complies everything down
> > to native code and since code = data, one can say that there is no
> > data, only code
>
> It is **not** the same in Lisp languages, there *is* a distinction
> between \"code\" and \"data\" \[in Lisp\], as code has to start with a
> *call*. Redbol has no such restriction on code, which makes it very
> different.

also:

> Moreover, contexts and dynamic binding make it way more flexible, but
> at the same time, *translating directly to low-level assembly code,
> like in your CL example, is not possible*.

*Aside: Does this mean Rebol is more homoiconic than Lisp?*

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 1) --- by MarkI

Here\'s one:

    [q]

Outsiders will recognize the Q function and see this as a code block,
while Rebol insiders will know that it must be data because Q is only
called from the top level of the interpreter.

------------------------------------------------------------------------

## Comments on question

*Comment by Caleth:* Your understanding is wrong, there is no \"mix of
code and data\" from which to get code from: it is all data. This is the
same as in (untyped) lambda calculus, where values are functions, E.g.
true is `\x \y -> x`, false is `\x \y -> y` and if is
`\bool \then \else -> bool then else` etc

*Comment by HostileFork says dont trust SE:* \"Does this mean Rebol is
more homoiconic than Lisp\" =\> no.

*Comment by Geeky I:* \@Caleth you can say that, but isn\'t it useful
sometimes to make the distinction? ;) Alternatively you could say from
your example it is all code/functions, no data :p

*Comment by Gregg Irwin:* Whether something is code or data depends on
the context. There may be times where you can lock down the meaning for
a value, but only in context. `Load` a file of Red values and it\'s just
data. `Do` that same file and Red will interpret it. Process it with
another tool and it\'s data again.

*Comment by Geeky I:* \@GreggIrwin so if there is `do` or `reduce` it is
certainly *code* then? (a.k.a. case 1?)

*Comment by Geeky I:* \@GreggIrwin that at least partly answers the
opposite of my question (what makes it easy) `do`, `reduce`, `func` is
almost always followed by code. Should that be a separate question?
