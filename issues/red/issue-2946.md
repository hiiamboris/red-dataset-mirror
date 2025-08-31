
#2946: REPLACE/DEEP chokes up if its SERIES argument has nested series inside it
================================================================================
Issue is closed, was reported by 9214 and has 6 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2946>

Here I want to remove all `#include <something>` directives in source code:
```Red
replace/deep/all ["insidious string" #include %fancy-lib.red] [#include file!] []
```
* I can't use `parse` pattern as an argument without `/deep` refinement
* But if I use `/deep` refinement the script above results in
```Red
*** Script Error: PARSE - input must be of any-block! type: "insidious string"
*** Where: parse
*** Stack: replace
```
Alternatively:
```Red
>> replace/deep/all ["" word] [word!] []
*** Script Error: PARSE - matching by datatype not supported for any-string! input
*** Where: parse
*** Stack: replace 
```
As @greggirwin pointed out, that's because inside `replace` implementation `into` is used and first string causes a recursive call. Hopefully Gregg will pop up shortly with his quick patch :^)


Comments:
--------------------------------------------------------------------------------

On 2017-07-30T18:23:37Z, greggirwin, commented:
<https://github.com/red/red/issues/2946#issuecomment-318919944>

    The quick patch is `| ahead block! into rule | skip` (adding `ahead block!`) in the `some` parse rule, but I don't think that's enough. Using `/deep` to select the parse option seems problematic. We may need a separate refinement for that, otherwise you can't do a deep replace *without* it being a parse rule as the pattern value.

--------------------------------------------------------------------------------

On 2017-07-31T04:13:49Z, dockimbel, commented:
<https://github.com/red/red/issues/2946#issuecomment-318963096>

    The Parse rule support was not the primary goal, it is just a side-effect of implementing `/deep` using Parse which is faster and less limited than a simple recursive call on `replace` itself.

--------------------------------------------------------------------------------

On 2017-07-31T04:15:00Z, dockimbel, commented:
<https://github.com/red/red/issues/2946#issuecomment-318963244>

    After the fix:
    ```
    >> replace/deep/all ["insidious string" #include %fancy-lib.red] [#include file!] []
    == ["insidious string"]
    ```

