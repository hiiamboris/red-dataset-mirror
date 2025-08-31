
#2872: WISH: include functions defined in execution context in separate file
================================================================================
Issue is closed, was reported by 9214 and has 2 comment(s).
[type.wish]
<https://github.com/red/red/issues/2872>

Wish #2847 follow-up: aside from macros, I wish I can also include `#do [...]` functions from execution context:
```Red
Red [File: %macro.red]

#do [answer: does [42]]
```
```Red
Red [File: %main.red]

#include %./macro.red
probe #do keep [answer]
```
Currently result is:
```Red
*** Preprocessor Error in #do
*** Script Error: answer has no value
*** Where: ???
*** Stack: expand-directives expand do-safe
*** Throw Error: no catch for throw: halt-request
*** Where: throw
*** Stack: expand-directives expand do-safe
```


Comments:
--------------------------------------------------------------------------------

On 2018-04-25T06:22:59Z, PeterWAWood, commented:
<https://github.com/red/red/issues/2872#issuecomment-384173541>

    Following the introduction of the [Red REP repository for enhancements and wishes](https://gitter.im/red/red?at=5adfeed527c509a7744a3dc8), this issue is being closed.
    
    If you believe that your wish is still valid, please open a new issue for it in the new [red/REP repo](https://github.com/red/REP). It would help if you could include a link to this issue when opening an issue in the REP repository.

