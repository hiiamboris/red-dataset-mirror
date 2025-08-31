
#4389: make bitset! 0 does not work
================================================================================
Issue is closed, was reported by meijeru and has 14 comment(s).
<https://github.com/red/red/issues/4389>

**Describe the bug**
There exist "empty "bitsets, i.e. bitsets of length 0. In analogy with `series!` values, one should be able to make a bitset of length 0 by `make bitset! 0`. However this gives an error. It is true that one can make such a bitset by `make bitset!  #{ }`. Still, it is an unnecessary lack of consistency.

**To reproduce**
```
>> make bitset! 0
*** Script Error: value out of range: 0
>> make bitset! make binary! 0
== make bitset! #{}
```
**Expected behavior**
```
>> make bitset! 0
== make bitset! #{}
```


**Platform version (please complete the following information)**
```
all
```



Comments:
--------------------------------------------------------------------------------

On 2020-04-08T08:35:00Z, meijeru, commented:
<https://github.com/red/red/issues/4389#issuecomment-610828559>

    See also #2609 and #4378

--------------------------------------------------------------------------------

On 2020-04-08T12:46:57Z, 9214, commented:
<https://github.com/red/red/issues/4389#issuecomment-610938319>

    > In analogy with series! values
    
    `bitset!` is not a `series!`, so this analogy does not hold.

--------------------------------------------------------------------------------

On 2020-04-08T13:31:41Z, meijeru, commented:
<https://github.com/red/red/issues/4389#issuecomment-610961387>

    If it were a `series!` value, it would not be an analogy! The whole point about an analogy is that they are unequal but comparable in properties. I also want to invoke the principle of least surprise.

--------------------------------------------------------------------------------

On 2020-04-08T21:23:28Z, greggirwin, commented:
<https://github.com/red/red/issues/4389#issuecomment-611202211>

    Analogies aside, @9214 is there a reason _not_ to do this?

--------------------------------------------------------------------------------

On 2020-04-08T21:29:54Z, 9214, commented:
<https://github.com/red/red/issues/4389#issuecomment-611204958>

    @greggirwin last time I checked it seemed that empty bitset is a bug, since at least 1 byte must be allocated internally (you might think of it as a limitation). If it's literally empty then that means there's some memory overlap.

--------------------------------------------------------------------------------

On 2020-04-08T22:21:18Z, greggirwin, commented:
<https://github.com/red/red/issues/4389#issuecomment-611224504>

    If we need to allocate space, we just do. Like `make block! 0`. My question stands. Is there a reason not to support this? It should auto-expand if needed in any case.
    ```
    >> bs: make bitset! make binary! 0
    == make bitset! #{}
    >> bs/0: 1
    == 1
    >> bs
    == make bitset! #{80}
    ```

--------------------------------------------------------------------------------

On 2020-04-10T10:38:06Z, endo64, commented:
<https://github.com/red/red/issues/4389#issuecomment-611978449>

    Empty bitsets and `empty?` on bitsets are supported on R2, just to note:
    
    ```
    R2> empty? make bitset! 0
    == true
    ```

