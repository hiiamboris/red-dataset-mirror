
#3133: wish: more friendly form binary
================================================================================
Issue is open, was reported by pijoter and has 28 comment(s).
[type.task.wish]
<https://github.com/red/red/issues/3133>

### Expected behavior
>> z: #{098F6BCD4621D373CADE4E832627B4F6}
>> form z
== "098F6BCD4621D373CADE4E832627B4F6"
>> form/part z 10
== "098F6BCD46"

Form function 'returns a user-friendly string representation of a value'; string without #{} will be more user friendly. Actually there is no easy way to get string representation (not conversion) of binary datatype without curly brackets
### Actual behavior
>> form z
== "#{098F6BCD4621D373CADE4E832627B4F6}"
>> form/part z 10
== "#{098F6BCD"
### Steps to reproduce the problem
### Red version and build date, operating system with version.
red 0.63
25-Nov-2017/16:24:59+01:00
Windows 10.0.16299.64


Comments:
--------------------------------------------------------------------------------

On 2017-12-03T15:51:52Z, meijeru, commented:
<https://github.com/red/red/issues/3133#issuecomment-348786863>

    Use `enbase/base <binary> 16` and you get the characters in a string, without `#{ }`.
    
    The "user-friendly" aspect of `form` is in the fact that you can still recognize the resulting string as representing a binary value...

--------------------------------------------------------------------------------

On 2017-12-03T18:06:46Z, endo64, commented:
<https://github.com/red/red/issues/3133#issuecomment-348802001>

    I agree with @pijoter , we already have `mold` for keeping #{ } characters.
    
    Currently there is no difference between `mold` and `form` for `binary!` values, having both output easily would be better:
    
    ```
    >> form #{AA55FF01}
    == "#{AA55FF01}"
    >> mold #{AA55FF01}
    == "#{AA55FF01}"
    ```

--------------------------------------------------------------------------------

On 2017-12-03T18:08:54Z, pijoter, commented:
<https://github.com/red/red/issues/3133#issuecomment-348802131>

    I didn't know that (enbase). Still, usefullnes of having form'ed string representation exactly the same as mold'ed is rather disputable. What can I do with string "#{098F6BCD4621D373CADE4E832627B4F6}"? Any use cases? 
    
    Issue datatype behave differently:
    >> form #100.0.0
    == "100.0.0"
    >> mold #100.0.0
    == "#100.0.0"

--------------------------------------------------------------------------------

On 2017-12-03T21:15:00Z, greggirwin, commented:
<https://github.com/red/red/issues/3133#issuecomment-348815213>

    In many cases, the formed and molded output of a type is the same. However, in this case, it makes sense for `form` to omit the brackets. The current behavior matches R2, but I don't think compatibility there is a priority.

--------------------------------------------------------------------------------

On 2017-12-03T21:34:34Z, meijeru, commented:
<https://github.com/red/red/issues/3133#issuecomment-348816509>

    I would then be looking for a simple definition of the group of types whose values are to be `form`ed into pure strings, leaving out the tokens they have when `mold`ed: in first instance `union series! all-word!` would seem to cover what many people feel is right, but we should except `image!`. This approach implies changes to `form` for `any-path!` `tag!` and `binary!` 

--------------------------------------------------------------------------------

On 2017-12-04T12:33:44Z, dockimbel, commented:
<https://github.com/red/red/issues/3133#issuecomment-348949686>

    Looks like a reasonable wish to me.

--------------------------------------------------------------------------------

On 2017-12-04T17:48:08Z, meijeru, commented:
<https://github.com/red/red/issues/3133#issuecomment-349044185>

    @dockimbel Do you also agree that `any-path!`  and `tag!` should lose their distinctive tokens?  

--------------------------------------------------------------------------------

On 2017-12-05T07:39:33Z, dockimbel, commented:
<https://github.com/red/red/issues/3133#issuecomment-349221419>

    @meijeru I understand you want to define per-typeset rules, but I don't think that would be a useful feature for end users. `print <tag>` should output `<tag>` (as Rebol does). I think we need a better definition of the purpose of `form` in order to define the right set of rules. We also need to decide about incorporating into `form` partially or fully the formatting dialect Gregg is working on.

--------------------------------------------------------------------------------

On 2018-02-22T09:15:46Z, rebolek, commented:
<https://github.com/red/red/issues/3133#issuecomment-367615763>

    There's even worse case of this problem, binary values sometime introduce newlines for better readability, which makes `form` output even less readable:
    
    ```
    >> form checksum "see this" 'sha256
    == {#{^/C087DC0A2F2530FA2BEB5FC844A62184ADAE0DBF250BAFBB36AE177A1F84FE14^/}}
    ```

--------------------------------------------------------------------------------

On 2020-03-31T07:55:25Z, loziniak, commented:
<https://github.com/red/red/issues/3133#issuecomment-606463276>

    > The "user-friendly" aspect of `form` is in the fact that you can still recognize the resulting string as representing a binary value...
    
    It could look like `0xC087DC0A` or `C087DC0Ah` perhaps?
    
    https://en.wikipedia.org/wiki/Hexadecimal#Distinguishing_from_decimal

--------------------------------------------------------------------------------

On 2020-04-01T11:37:18Z, endo64, commented:
<https://github.com/red/red/issues/3133#issuecomment-607197402>

    I prefer a simple string output, hence `C087DC0A` for binary values.

--------------------------------------------------------------------------------

On 2020-04-25T21:10:58Z, greggirwin, commented:
<https://github.com/red/red/issues/3133#issuecomment-619441207>

    > It could look like `0xC087DC0A` or `C087DC0Ah` perhaps?
    
    Definitely not `0x` format, as that's from C. I also vote No to `h` format, as 1) that's easy to add, if for some reason you want to include it, 2) it doesn't work as well for longer values, beyond 4 bytes or so, because it's pushed far out to the right 3) I think, subjectively, it makes it harder to scan, creating a mode and case difference.

--------------------------------------------------------------------------------

On 2020-04-26T08:14:10Z, loziniak, commented:
<https://github.com/red/red/issues/3133#issuecomment-619507037>

    What's wrong in "being fom C"? `0x` prefix is commonly used in cryptocurrency addresses, and I don't know more common/everyday use of hex notation than that.

--------------------------------------------------------------------------------

On 2020-05-07T06:48:01Z, rebolek, commented:
<https://github.com/red/red/issues/3133#issuecomment-625064155>

    "being from C" is a bad excuse, however, there's one more compelling reason: `0x00` can be interpreted as both `pair!` and hex number if we go with `0x` prefix.

