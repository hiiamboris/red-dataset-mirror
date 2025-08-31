
#3085: UNSETting some of the OP!s wreaks havoc on console
================================================================================
Issue is closed, was reported by 9214 and has 6 comment(s).
[status.deferred]
<https://github.com/red/red/issues/3085>

### Red version
I've checked both Windows (Wine) and Linux versions, latest build as of this report:
```Red
>> about
Red for Windows version 0.6.3 built 21-Oct-2017/23:57:00+05:00
```
```Red
>> about
Red for Linux version 0.6.3 built 21-Oct-2017/23:57:07+05:00
```
### Steps to reproduce the issue
* The smallest and most devastating example is the following line used in GUI Windows console (I can't check it on Mac since I don't have one :neckbeard:) which works fine in CLI version:
```Red
unset '=
```
After that REPL session is completely inoperable and console can be closed only with process killing.

* Another way to reproduce this issue is (both in CLI and GUI versions):
```Red
unset '+
```
And the result is:
```Red
>> unset '+
>> form 1
*** Script Error: + has no value
*** Where: do
*** Stack: load 
>> ; what?
*** Script Error: + has no value
*** Where: do
*** Stack: load 
```
Interestingly, if you'll try to enter a `block!` or `paren!` in any form (both as an argument or completely separate value), console will silently crash. Example would be:
```Red
>> unset '+
>> []
```



Comments:
--------------------------------------------------------------------------------

On 2017-10-21T22:32:52Z, gltewalt, commented:
<https://github.com/red/red/issues/3085#issuecomment-338436926>

    Same with `unset '<` or `unset '>` except `[]` does not crash the console.

--------------------------------------------------------------------------------

On 2017-10-22T08:27:03Z, 9214, commented:
<https://github.com/red/red/issues/3085#issuecomment-338460553>

    Just remembered, `unset '=` behavior looks identical to `unset 'system` :wink: (my feet are ok :gun:)

--------------------------------------------------------------------------------

On 2017-11-09T09:05:49Z, dockimbel, commented:
<https://github.com/red/red/issues/3085#issuecomment-343090980>

    The core words used by the console code are not protected for now, that will come with the introduction of `protect/unprotect` functions in 0.8.0. I don't see what we can do in the meantime, besides avoiding redefining those core words.

