
#4192: FUNC native does not copy the spec block as FUNCTION does
================================================================================
Issue is open, was reported by Oldes and has 10 comment(s).
[type.design]
<https://github.com/red/red/issues/4192>

Current behaviour:
```
>> s1: [a b] s2: [a b] f1: func s1 [] f2: function s2 [] append s1 'c append s2 'c
== [a b c]
>> :f1
== func [a b c][] ;<------------ WRONG!
>> :f2
== func [a b][]
```

The reason is, that [`func` native](https://github.com/red/red/blob/6b6fdf753643dbead6fe67364cd3ffb39b2de80f/runtime/natives.reds#L417) does not copy the spec block like [`function` native does](https://github.com/red/red/blob/6b6fdf753643dbead6fe67364cd3ffb39b2de80f/runtime/natives.reds#L434)

Related to: https://github.com/red/red/issues/3171


Comments:
--------------------------------------------------------------------------------

On 2019-12-19T11:25:53Z, Oldes, commented:
<https://github.com/red/red/issues/4192#issuecomment-567450938>

    `has` is ok:
    ```
    >> s3: [a b] f3: has s3 [] append s3 'c :f3
    == func [/local a b][]
    ```

--------------------------------------------------------------------------------

On 2019-12-19T17:11:08Z, greggirwin, commented:
<https://github.com/red/red/issues/4192#issuecomment-567578900>

    The others all call `func` internally, so it could be done there. Also note that the specs are not deep copied. 
    ```
    >> s3: [a [integer!] b] f3: has s3 [] append s3 'c :f3
    == func [/local a [integer!] b][]
    >> append s3/2 float!
    == [integer! float!]
    >> :f3
    == func [/local a [integer! float!] b][]
    ```
    
    I have to guess this was all intentional, for performance reasons, but it's certainly dangerous. I've never heard of anyone exploiting or hitting this in Rebol, but that's not a good reason to allow it. The performance hit, e.g. on startup, could be measurable, especially if deep copying is done. 
    
    One of those things that would be hard to do by accident, but that could have serious consequences. The reverse argument is that we still have `do` in Red, so it's not like we can say this will solve everything in that regard. It could also be a configuration option in the future, if needed.

--------------------------------------------------------------------------------

On 2019-12-19T20:06:10Z, 9214, commented:
<https://github.com/red/red/issues/4192#issuecomment-567642755>

    `function` must copy its spec for obvious reasons:
    ```red
    >> spec: [a b]
    == [a b]
    >> body: [c: 'd]
    == [c: 'd]
    
    >> foo: func spec body
    == func [a b][c: 'd]
    >> function spec body
    == func [a b /local c][c: 'd]
    
    ;; without copying
    >> spec
    == [a b /local c]
    >> spec-of :foo
    == [a b /local c]
    ```
    
    >  it's certainly dangerous
    
    Modifying spec is dangerous for `native!`s and `routine!`s only, as it breaks their interface and wreaks havoc.
    
    ```red
    >> clear spec-of :as-ipv4
    == []
    >> as-ipv4 1 3 3 7
    ```
    
    For all other functions spec block is used mainly for reflection and `form`ing with `mold`ing; `clear`ing it or appending junk bears no effect whatsoever.

--------------------------------------------------------------------------------

On 2020-08-04T13:53:01Z, 9214, commented:
<https://github.com/red/red/issues/4192#issuecomment-668609590>

    `function` and `has` clone provided spec to preprocess it, and then call `func`. If we add `copy` to `func`, that would mean double-copying. Tricky. Part of me thinks that modification of spec/bodies should be under the purview of Secure dialect/sub-system.

--------------------------------------------------------------------------------

On 2020-10-14T00:44:59Z, greggirwin, commented:
<https://github.com/red/red/issues/4192#issuecomment-708086486>

    What if we note this as a design choice, so people are aware and can take action accordingly. That is, if you're sharing specs, _you_ decide if you need to copy them or not. We can even add the behavior to the doc strings for the args.

