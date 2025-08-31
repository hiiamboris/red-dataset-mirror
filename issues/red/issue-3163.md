
#3163: bit shift not allowed on binary datatype
================================================================================
Issue is closed, was reported by pijoter and has 14 comment(s).
[type.wish]
<https://github.com/red/red/issues/3163>

### Expected behavior
### Actual behavior
>> shift #{55} 2
*** Script Error: shift does not allow binary! for its data argument
*** Where: shift
*** Stack:  
### Steps to reproduce the problem
### Red version and build date, operating system with version.
>> about
Red for Windows version 0.6.3 built 25-Nov-2017/16:24:59+01:00



Comments:
--------------------------------------------------------------------------------

On 2017-12-24T13:24:42Z, dockimbel, commented:
<https://github.com/red/red/issues/3163#issuecomment-353784139>

    The semantics of `shift` do not play well with series, which have a dynamic size. Such bitshifting operations would be costly on a series. Do you have some use-cases?
    
    If your need is only for 32-bit values, you should rather use integers (they accept an hexadecimal form as input):
    ```
    shift 55h 2
    == 21
    to-hex shift 55h 2
    == #00000015
    ```

--------------------------------------------------------------------------------

On 2017-12-24T18:58:50Z, greggirwin, commented:
<https://github.com/red/red/issues/3163#issuecomment-353798796>

    I have old `shift` and `rotate` mezzanines from R2 (pre-shift availability), that support series. There are a few times I've used them, but not a lot. They *can* be useful when you want to treat a series as a fixed size data structure. `Rotate` is easy because you already have value slots filled. `Shift` is only a little tricky, and mine, IIRC, used a `make-empy-value` sub-func, so blocks would get `none`, binary `0`, and strings `null` inserted in slots that "shifted out". You can also override the empty value. 
    
    That doesn't address this exact ticket, or @pijoter's need, if he needs bit shifting in a binary, which would be at odds with shifting byte values in a binary series.

--------------------------------------------------------------------------------

On 2017-12-24T19:41:35Z, pijoter, commented:
<https://github.com/red/red/issues/3163#issuecomment-353800316>

    Mostly I need shifts for decoding binary data from external sources (gps, data stream from floppy). It's very annoing to convert data to integer first (and then back to binary form). Rebol (at least R2) also support binary datatype shifts.

--------------------------------------------------------------------------------

On 2017-12-26T12:53:21Z, 9214, commented:
<https://github.com/red/red/issues/3163#issuecomment-353965587>

    I proposed this back in summer (actually after working with decoding as @pijoter), but realized that it would be more interesting (maybe even practical!) to have `shift` and `rotate` for all `series!` values.

--------------------------------------------------------------------------------

On 2018-04-25T06:36:37Z, PeterWAWood, commented:
<https://github.com/red/red/issues/3163#issuecomment-384176140>

    Following the introduction of the [Red REP repository for enhancements and wishes](https://gitter.im/red/red?at=5adfeed527c509a7744a3dc8), this issue is being closed.
    
    If you believe that your wish is still valid, please open a new issue for it in the new [red/REP repo](https://github.com/red/REP). It would help if you could include a link to this issue when opening an issue in the REP repository.

--------------------------------------------------------------------------------

On 2020-02-29T20:50:41Z, dockimbel, commented:
<https://github.com/red/red/issues/3163#issuecomment-592993255>

    Rebol does not really support shifting on binaries (R2):
    ```
    >> shift #{8000} 4
    == #{0800}
    >> shift #{8000} 8
    == #{0000}
    ```

--------------------------------------------------------------------------------

On 2020-03-01T19:04:21Z, endo64, commented:
<https://github.com/red/red/issues/3163#issuecomment-593132571>

    It shifts to right each bytes separately:
    ```
    >> shift #{FFFFFF} 7
    == #{010101}
    ```

