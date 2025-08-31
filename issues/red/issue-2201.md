
#2201: map! allows unset! keys and values
================================================================================
Issue is closed, was reported by WiseGenius and has 4 comment(s).
[type.task.wish]
<https://github.com/red/red/issues/2201>

Should `map!`s allow `unset!` for keys?

```
red>> m: #()
== #()
red>> m/(print "Hello, World!"): "Hello, World!"
Hello, World!
== "Hello, World!"
red>> m
== #(
    unset "Hello, World!"
)
```

Should `map!`s allow `unset!` for values?

```
red>> m: #()
== #()
red>> m/("Hello, World!"): print "Hello, World!"
Hello, World!
red>> m
== #(
    "Hello, World!" unset
)
```



Comments:
--------------------------------------------------------------------------------

On 2016-11-03T10:42:24Z, WiseGenius, commented:
<https://github.com/red/red/issues/2201#issuecomment-258110285>

    Looks like `object!`s allow `unset!` values too:
    
    ```
    red>> o: make object! [w: none]
    == make object! [
        w: none
    ]
    red>> o/w: print "Hello, World!"
    Hello, World!
    red>> o
    == make object! [
        w: unset
    ]
    ```
    
    But not when doing it this way:
    
    ```
    red>> o: make object! [w:]
    *** Script Error: w: needs a value
    *** Where: w
    ```

--------------------------------------------------------------------------------

On 2018-06-30T01:02:09Z, greggirwin, commented:
<https://github.com/red/red/issues/2201#issuecomment-401506773>

    I'm going to close this, as I can't see a reason to allow unset for keys, and unset values are currently supported. That may change, as map's design is revisited for what is best when removing keys.

