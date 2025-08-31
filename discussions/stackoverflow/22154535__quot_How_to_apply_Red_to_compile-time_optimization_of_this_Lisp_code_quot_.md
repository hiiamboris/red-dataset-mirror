# &quot;How to apply Red to compile-time optimization of this Lisp code?&quot;

**Link:**
<https://stackoverflow.com/questions/22154535/how-to-apply-red-to-compile-time-optimization-of-this-lisp-code>

**Asked:** 2014-03-03 18:35:28 UTC

------------------------------------------------------------------------

This is a pattern of optimization in Lisp code that I want to achieve in
Red:

    (defmacro compute-at-compile (x)
      `(+ ,(* pi 2) ,x))

    (macroexpand '(compute-at-compile 1))
    ; => (+ 6.283185307179586 1)

How do I express this in Red? (I realize it may not be possible in
today\'s implementation, I\'m wondering about how one would express the
code at the language level to get such an optimization. Would it require
special markup in the source, or would it be automatic like Lisp?)

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 2) --- by kealist

Trying to extend my answer to maybe cover another idea that may help you
find what you are looking for.

**Red/System**

From my understanding, the Red/System `#define` directive can help with
optimization (in reducing function calls). Here is a similar example in
Red/System. Within Red, it would require using within `#system` or
`#system-global`directive.

    #define COMPUTE(x) (3.13159 * 2.0 + x)

    b: COMPUTE(1.0)
    print b

Processing the macro should result in:

    b: (3.13159 * 2.0 + 1.0)
    print b

and results

    7.26318

Math between types isn\'t defined yet, so you\'ll run into issues
multiplying/adding `float!` and `integer!` (hence the above use of
float!)

**Red/Rebol**

You can also take a look at `compose` as a higher level way to optimize
your code writing. I am unsure of the effect in terms of optimizing
speed. What compose does is take a block and evaluate whatever is in
parenthesis and not evaluate other elements in the block.

See the Rebol2 help definition for `compose`

    >> help compose
    USAGE:
        COMPOSE value /deep /only    

    DESCRIPTION:
         Evaluates a block of expressions, only evaluating parens, and returns a block.
         COMPOSE is a native value.    

    ARGUMENTS:
         value -- Block to compose (Type: any)    

    REFINEMENTS:
         /deep -- Compose nested blocks
         /only -- Inserts a block value as a block

This may be what you\'re looking for in terms of building expressions

    red>> x: 1
    == 1
    red>> compose [3 + 2 + (x)]
    == [3 + 2 + 1]

An example from the Rebol2 documentation:

    >> probe compose [time: (now/time) date: (now/date)]
    [time: 12:48:53 date: 5-Mar-2014]
    == [time: 12:48:53 date: 5-Mar-2014]

*Comment by Jacob Good1:* Do you also have a Rebol example by any
chance? Thanks for the Red answer.

*Comment by kealist:* Red/System is a C-like language. I am not the
expert on this but after a little reading, I decided to suggest
`compose` because it may be more what you are looking for to reduce
repetition in code writing.

------------------------------------------------------------------------

## Comments on question

*Comment by Jacob Good1:* Common Lisp is a dialect of Lisp as well. The
way the macro is expressed or what dialect is used seems to me, to be
irrelevant.

*Comment by C. K. Young:* I agree that the dialect in use is irrelevant
for your specific question (except that Scheme macros are different,
heh), but, fewer people object to CL code being tagged as \"Lisp\" than
Clojure (or Scheme or Arc), just judging by the number of Clojure/Scheme
posts on SO where the OP tagged with
[lisp](https://stackoverflow.com/questions/tagged/lisp) only to have it
be untagged by (mainly) CL posters. This is why I converted your code to
CL rather than, say, Scheme (which is my primary language, and at which
I\'m much more adept than CL).

*Comment by C. K. Young:* In any case, Common Lisp, Scheme, Clojure, and
Arc are vastly different from each other (in the same way that C++,
Perl, Java, JS, and PHP are vastly different, despite those languages
having a C-style syntax (`for (...; ...; ...)`, curly-braces for blocks,
etc.)), and it\'s probably best to label your code\'s language
correctly. In particular, I would generally avoid labelling Scheme,
Clojure, or Arc code as \"Lisp\".

*Comment by Jacob Good1:* Being more specific is a good idea. I kept it
generically Lisp since the macros in each Lisp are very similar(not the
same, but about like the difference of a for loop in the various
c-inspired languages), anyway, point taken\... I will be more specific.
