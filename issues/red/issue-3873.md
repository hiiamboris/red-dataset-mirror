
#3873: Trim does not work as expected for binary! argument
================================================================================
Issue is closed, was reported by loziniak and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3873>

**Describe the bug**
Asuming that `trim` should erase zero bytes from `binary!` values, it's acting differently than with `string!`'s spaces.

Actual:
```
>> trim #{000012340000}
== #{12340000}
>> trim/tail #{000012340000}
== #{}
```
should work similarly as with `string!`:
```
>> trim "   123   "
== "123"
>> trim/tail "   123   "
== "   123"
```

**Platform version (please complete the following information)**
```
Red 0.6.4 for Linux built 25-Mar-2019/12:11:08+02:00 commit #e6c96aa
```



Comments:
--------------------------------------------------------------------------------

On 2019-05-13T17:57:06Z, endo64, commented:
<https://github.com/red/red/issues/3873#issuecomment-491923584>

    Might not be directly related but better fix together with #3663 

--------------------------------------------------------------------------------

On 2019-05-13T21:03:06Z, greggirwin, commented:
<https://github.com/red/red/issues/3873#issuecomment-491985799>

    We clearly needs some tests for `trim` on `binary!` values. I think there are a couple errors in the logic, e.g., when `/tail` is used, but `/head` isn't. It should check against `tail` here in `trim-head-tail`:
    ```
    while [
    				all [head < tail head/value = null-byte]
    			]
    ```
    But if neither refinement is used, it never marks the tail. That is, string has this logic block, which binary lacks entirely:
    ```
    either all [not head? not tail?] [
    ...
    ```

