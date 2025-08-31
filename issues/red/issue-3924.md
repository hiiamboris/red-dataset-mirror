
#3924: attempt with exit corrupts console environment
================================================================================
Issue is open, was reported by endo64 and has 4 comment(s).
[type.bug]
<https://github.com/red/red/issues/3924>

**Describe the bug**

`exit` or `return` in `attempt` 
 without `safer` refinement breaks attempt function and corrupt console environment.

**To reproduce**

```
>> attempt [a: 10 exit]
*** Script Error: invalid argument: [a: 10 exit]
*** Where: catch

>> probe :attempt
console
== console

>> attempt [1 / 0]
== [1 / 0]
```

**Expected behavior**

No corruption.

**Platform version (please complete the following information)**

```
latest nightly build
```



Comments:
--------------------------------------------------------------------------------

On 2019-06-25T21:19:50Z, meijeru, commented:
<https://github.com/red/red/issues/3924#issuecomment-505627043>

    See also #3362

--------------------------------------------------------------------------------

On 2020-07-09T21:49:13Z, hiiamboris, commented:
<https://github.com/red/red/issues/3924#issuecomment-656367966>

    And https://github.com/red/red/issues/4202, though compiled.

