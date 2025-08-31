
#3404: DOC: docstring of EXIT says "returning no value", should say "unset" if anything
================================================================================
Issue is closed, was reported by meijeru and has 20 comment(s).
<https://github.com/red/red/issues/3404>

### Expected behavior

Type of result of evaluating a function should be indicated, e.g. in the docstring 
### Actual behavior

EXIT yields the unset value, but the docstring says "no value"
### Steps to reproduce the problem

`help exit`
### Red and platform version
all


Comments:
--------------------------------------------------------------------------------

On 2018-05-31T13:42:47Z, meijeru, commented:
<https://github.com/red/red/issues/3404#issuecomment-393534100>

    See discussion [May 31, 2018 2:57 PM](https://gitter.im/red/help?at=5b0ff13eba1a351a68db70d7)

--------------------------------------------------------------------------------

On 2018-05-31T19:10:08Z, greggirwin, commented:
<https://github.com/red/red/issues/3404#issuecomment-393644457>

    The current doc string matches Rebol. I think it's better the way it is, as saying it "returns unset!" will be more technically specific, but not more helpful.

--------------------------------------------------------------------------------

On 2018-05-31T20:54:40Z, meijeru, commented:
<https://github.com/red/red/issues/3404#issuecomment-393676707>

    Indicating that no value is returned is only helpful if there is an overall statement somewhere (that is moreover internalized by the users) that the evaluation of any expression MUST yield some value and therefore, "no value" is a misnomer for "unset value".

--------------------------------------------------------------------------------

On 2018-06-01T08:42:56Z, rebolek, commented:
<https://github.com/red/red/issues/3404#issuecomment-393812603>

    @meijeru if you can come up with short description, then let's change it, but otherwise I agree with @greggirwin that it's not going to be more helpful.

--------------------------------------------------------------------------------

On 2018-06-01T11:58:20Z, endo64, commented:
<https://github.com/red/red/issues/3404#issuecomment-393859035>

    In that manner, do we need to change the error messages too? I don't think this change worth.
    
    ```
    >> f: does [exit]
    >> x: f
    *** Script Error: x: needs a value
    >> set/any 'x f
    >> x
    *** Script Error: x has no value
    ```

--------------------------------------------------------------------------------

On 2018-06-01T13:59:25Z, meijeru, commented:
<https://github.com/red/red/issues/3404#issuecomment-393889280>

    The above opinions confirm that "no value" is felt to be a user-friendly/non-technical expression for the unset value. However, the existence of the `unset!`  datatype and the unset value cannot be totally hidden from the user. How are we going to solve this conundrum?

--------------------------------------------------------------------------------

On 2018-06-01T16:10:39Z, greggirwin, commented:
<https://github.com/red/red/issues/3404#issuecomment-393928987>

    It's something that people don't need to know about right away. Some may never even understand it fully. It's the same situation as binding/scope and datatype actions. There is a user experience side whose job it is to hide some (many) of these details. Or, as in the case of function specs, to hide the details of how they work behind a mental image that lets people use them without understanding how they really work.
    
    There's no "solving it" as long as we have `unset!`, and I don't see that going away. It is useful, in addition to easing some implementation details (while making others more complicated). What we can do is discuss `Special Values` in more detail. In most user docs we can use "no value" terminology, lightly note that internally it's called `unset!`, and say "If you encounter this, from `exit`, or by evaluating an empty block or paren, you can uset `set/any` and `get/any` to avoid errors. But you shouldn't *use* them intentionally. Don't try to hold on to them and pass them around. Just be aware they exist. Oh, and they're especially handy when printing to the console, because they leave the output clean, void of an `== ...` result, where you just want to show data."

--------------------------------------------------------------------------------

On 2018-06-01T18:37:12Z, meijeru, commented:
<https://github.com/red/red/issues/3404#issuecomment-393972485>

    @greggirwin I like the wording of your second paragraph. Worth conserving in the Wiki somewhere...

--------------------------------------------------------------------------------

On 2018-06-01T22:27:19Z, greggirwin, commented:
<https://github.com/red/red/issues/3404#issuecomment-394025687>

    Thanks @meijeru. I'll add notes to the unset! wiki page and we can go from there.

--------------------------------------------------------------------------------

On 2018-06-01T22:29:08Z, greggirwin, commented:
<https://github.com/red/red/issues/3404#issuecomment-394025990>

    Added a reference to this ticket as well.

