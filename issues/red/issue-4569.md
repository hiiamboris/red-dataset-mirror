
#4569: compiler ignores setting a word to an object
================================================================================
Issue is closed, was reported by 9214 and has 8 comment(s).
[status.built] [status.tested] [type.bug] [type.compiler]
<https://github.com/red/red/issues/4569>

**Describe the bug**
If one instance of a word is bound to function's context, and then another instance with the same spelling is set to an object — magic happens.

**To reproduce**
The script below, once compiled:
```red
Red []

bind 'foo has [foo]['WTF]
foo: object []

probe foo
probe :foo

```
Results in:
```red
WTF
make object! []
```

**Expected behavior**
```red
make object! []
make object! []
```

**Platform version**
a1d1495, W10.


Comments:
--------------------------------------------------------------------------------

On 2020-07-10T20:08:36Z, greggirwin, commented:
<https://github.com/red/red/issues/4569#issuecomment-656867696>

    Good example. :+1:

--------------------------------------------------------------------------------

On 2020-08-24T18:00:26Z, 9214, commented:
<https://github.com/red/red/issues/4569#issuecomment-679278736>

    Another one:
    ```red
    Red []
    
    block: reduce ['foo func [/bar]["Definitely not bar."]]
    foo:  context [bar: does ['bar]]
    print foo/bar
    ```
    When compiled:
    ```red
    Definitely not bar.
    ```

--------------------------------------------------------------------------------

On 2020-10-27T16:12:39Z, dockimbel, commented:
<https://github.com/red/red/issues/4569#issuecomment-717353686>

    @9214 In your second example, the following line:
    ```
    block: reduce ['foo func [/bar]["Definitely not bar."]]
    ```
    has no effect on the rest of the code.
    
    I let you write the regression test(s) for this ticket.

--------------------------------------------------------------------------------

On 2020-10-27T16:22:33Z, 9214, commented:
<https://github.com/red/red/issues/4569#issuecomment-717360400>

    @dockimbel if what you say is true, then the "Definitely not bar." message appears out of nowhere 😉 I expect the compiled code to call `bar` within object `foo`, instead the anonymous function within `block` is called, as if referenced by `block/foo/bar`.

