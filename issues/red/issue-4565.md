
#4565: compiler does not recognize some CHAR! values as valid
================================================================================
Issue is closed, was reported by 9214 and has 16 comment(s).
[status.built] [status.tested] [type.review] [test.written]
<https://github.com/red/red/issues/4565>

**Describe the bug**
The compiler chokes on some of the `char!` literals as syntactically invalid. Possibly related: https://github.com/red/red/issues/2870.

**To reproduce**
Compile the script below:
```red
Red [] #""
```
```red
*** Syntax Error: Invalid issue! value
*** in file: ...
*** line: 1
*** at: {""}
```

Non-exhaustive list of other `char!` literals that trigger the same error: `#"^()" #"^(A)"`.

**Expected behavior**
I expect the script to be compiled and `#""` to represent NUL character as it does in the interpreter.

**Platform version**
37366bb, W10.


Comments:
--------------------------------------------------------------------------------

On 2020-07-09T18:54:32Z, greggirwin, commented:
<https://github.com/red/red/issues/4565#issuecomment-656294535>

    I think `#""` should be an error, always. I doubt it will break any old R2 code, and R3 doesn't allow it, but mainly it's an exception that makes no sense because a character always has to be something. Admittedly, in C contexts it's a string terminator, but still not a zero width character. :^) Same for `#"^()"`. The part in the parens has to define a codepoint. `#"^(A)"` _could_ work, as it's a valid hex number. The downside is that it's then inconsistent with `AAh` notation in Red, where at least 2 digits are required. That opens another question, but I don't think we need to support that syntax for codepoints. I'm mixed on it in general for Red, but it's very useful in R/S. So, for Red it's nice that `(A)` is like `^A`, but it may be more consistent to require at least 2 digits. Maybe @meijeru will weigh in.

--------------------------------------------------------------------------------

On 2020-07-09T19:02:32Z, meijeru, commented:
<https://github.com/red/red/issues/4565#issuecomment-656298074>

    The one-hexdigit problem has been solved by the fast lexer now, therefore issue #2671 may be closed. I think the argument from hex number notation (`AAh`) is irrelevant since that notation is to be replaced anyhow. Therefore 1 to 6 hex-digits inside the parens is a good rule for me. As for `#""`, I am in agreement that it should be an error, both in compiler and interpreter.

--------------------------------------------------------------------------------

On 2020-07-09T20:45:42Z, 9214, commented:
<https://github.com/red/red/issues/4565#issuecomment-656342612>

    https://github.com/red/red/blob/4e9d770c92c629a94f0235a4b62181a0ff6f40cc/runtime/lexer.reds#L1271

--------------------------------------------------------------------------------

On 2020-07-09T22:50:37Z, greggirwin, commented:
<https://github.com/red/red/issues/4565#issuecomment-656388414>

    Seems `#""` only appears in ~8 tests in the Red code base.
    
    @dockimbel can we remove this null char shortcut, or do you have a strong reason to keep it? 

--------------------------------------------------------------------------------

On 2020-07-09T22:57:18Z, greggirwin, commented:
<https://github.com/red/red/issues/4565#issuecomment-656390369>

    `#"^()"` doesn't appear anywhere, even in tests. `scan-escaped-char` doesn't have a special check for it, so `load-char` might be the place to make it clear that's an error too.

--------------------------------------------------------------------------------

On 2020-07-09T23:01:46Z, 9214, commented:
<https://github.com/red/red/issues/4565#issuecomment-656391654>

    ```red
    >> rebol/version
    == 2.7.8.3.1
    
    >> #""
    == #"^@"
    
    >> #"^()"
    ** Syntax Error: Invalid char -- #"^()"
    ** Near: (line 1) #"^()"
    ```
    
    ```red
    >> rebol/version
    == 2.101.0.3.1
    
    >> #""
    ** Syntax error: invalid "char" -- {#""}
    ** Near: (line 1) #""
    
    >> #"^()"
    == #"^@"
    ```

--------------------------------------------------------------------------------

On 2020-07-10T03:18:04Z, greggirwin, commented:
<https://github.com/red/red/issues/4565#issuecomment-656457800>

    I don't know what that means @9214. R3 allows it, yes, but R2 does not. My point is that it isn't used anywhere in Red today and I don't think we need to support it. Can you think of a reason we should?

--------------------------------------------------------------------------------

On 2020-09-25T09:33:42Z, dockimbel, commented:
<https://github.com/red/red/issues/4565#issuecomment-698829168>

    @greggirwin The only reason it's in Red is for Rebol compatibility. I don't see any good reason to support it in general. It may be a handy shortcut for null characters (that we don't seem to need anywhere), but it is also a confusing literal.

