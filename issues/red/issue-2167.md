
#2167: WISH: Have `copy/deep` copy all copyable types by default
================================================================================
Issue is open, was reported by WiseGenius and has 18 comment(s).
[type.task.wish]
<https://github.com/red/red/issues/2167>

Given the following code using `copy/deep`:

```
m1: #(a "1" c #(d 1) e [f 1])
m1/g: make object! [h: 1]
m2: copy/deep m1
m2/a/1: #"2"
m2/c/d: 2
m2/e/f: 2
m2/g/h: 2

o1: make object! [a: "1" c: #(d 1) e: [f 1] g: make object! [h: 1]]
o2: copy/deep o1
o2/a/1: #"2"
o2/c/d: 2
o2/e/f: 2
o2/g/h: 2

b1: [a: "1" c #(d 1) e [f 1] g]
append b1 make object! [h: 1]
b2: copy/deep b1
b2/a/1: #"2"
b2/c/d: 2
b2/e/f: 2
b2/g/h: 2
```

Current result:

```
red>> ?? m1
m1: #(
    a: "2"
    c: #(
        d: 2
    )
    e: [f 1]
    g: make object! [
        h: 2
    ]
)
red>> ?? o1
o1: make object! [
    a: "1"
    c: #(
        d: 2
    )
    e: [f 1]
    g: make object! [
        h: 2
    ]
]
red>> ?? b1
b1: [a: "1" c #(
    d: 2
) e [f 1] g make object! [
    h: 2
]]
```

Desired result:

```
red>> ?? m1
m1: #(
    a: "1"
    c: #(
        d: 1
    )
    e: [f 1]
    g: make object! [
        h: 1
    ]
)
red>> ?? o1
o1: make object! [
    a: "1"
    c: #(
        d: 1
    )
    e: [f 1]
    g: make object! [
        h: 1
    ]
]
red>> ?? b1
b1: [a: "1" c #(
    d: 1
) e [f 1] g make object! [
    h: 1
]]
```



Comments:
--------------------------------------------------------------------------------

On 2016-08-12T07:59:11Z, WiseGenius, commented:
<https://github.com/red/red/issues/2167#issuecomment-239384787>

    So far my observation of the current behaviour for `copy/deep` is that:
    
    If inside a `block!` or an `object!` these types are copied:
    - `block!`
    - `paren!`
    - `string!`
    - `file!`
    - `url!`
    - `path!`
    - `lit-path!`
    - `set-path!`
    - `get-path!`
    - `binary!`
    - `tag!`
    - `email!`
    - `image!`
    
    If inside a `block!` or an `object!` these types are **not** copied:
    - `map!`
    - `object!`
    - `error`
    - `vector!`
    - `hash!`
    - `bitset!`
    
    If inside a `map!` these types are copied:
    - `block!`
    - `paren!`
    - `path!`
    - `lit-path!`
    - `set-path!`
    - `get-path!`
    
    If inside a `map!` these types are **not** copied:
    - `binary!`
    - `string!`
    - `file!`
    - `url!`
    - `tag!`
    - `email!`
    - `image!`
    - `map!`
    - `object!`
    - `error`
    - `vector!`
    - `hash!`
    - `bitset!`

--------------------------------------------------------------------------------

On 2016-08-12T09:03:30Z, WiseGenius, commented:
<https://github.com/red/red/issues/2167#issuecomment-239397007>

    Note: The current behaviour of `o2: make o1 []` is the same as that of `o2: copy/deep o1` for the 19 datatypes listed above.

--------------------------------------------------------------------------------

On 2017-02-20T08:16:40Z, dockimbel, commented:
<https://github.com/red/red/issues/2167#issuecomment-281014028>

    I see a few improvements which could be made for the default behavior of `/deep`, but in the end, the feature you are asking for will be provided by the `/types` refinement for `copy`.

--------------------------------------------------------------------------------

On 2020-04-27T12:30:16Z, Oldes, commented:
<https://github.com/red/red/issues/2167#issuecomment-619955965>

    I think it is not good idea to have by default everything copyable. Better to have it under control with `/types` if needed.

--------------------------------------------------------------------------------

On 2021-03-17T19:39:59Z, hiiamboris, commented:
<https://github.com/red/red/issues/2167#issuecomment-801358034>

    As a reminder, what are we gonna do with maps?
    Right now:
    ```
    >> m: #("b" [] "s" "" "m" #())
    >> put m "o" object []
    >> (first keys-of m) =? (first keys-of mcd)
    == true
    >> (first values-of m) =? (first values-of mc)
    == true
    >> (first values-of m) =? (first values-of mcd)
    == false
    >> (second values-of m) =? (second values-of mcd)
    == true
    >> (third values-of m) =? (third values-of mcd)
    == true
    >> (fourth values-of m) =? (fourth values-of mcd)
    == true
    
    >> mm: make m m
    >> (first values-of m) =? (first values-of mm)
    == true
    >> (first keys-of m) =? (first keys-of mm)
    == true
    ```
    In other words, `copy/deep` only copies value blocks (deeply), all other series are not copied, neither for keys nor for values. Odd. `m/x: "str"` will not be copied but `m/x: ["str"]` will be. `copy` (shallow) and `make` do not copy anything inside at all. To do a deep copy one must recursively reconstruct the whole map manually, value by value.
    
    We should be able to: not only select which types should be copied, but specify a typeset for both keys and values separately. 
    And I would like consistency with other series (e.g. blocks) on `/deep` behavior.

--------------------------------------------------------------------------------

On 2021-03-17T19:57:34Z, Oldes, commented:
<https://github.com/red/red/issues/2167#issuecomment-801381455>

    What about adding something like `as-map keys values` so you could do:
    ```
    as-map keys-of m copy/deep values-of m
    ```

--------------------------------------------------------------------------------

On 2021-03-17T20:03:56Z, Oldes, commented:
<https://github.com/red/red/issues/2167#issuecomment-801393514>

    One year later I still believe that having `copy/deep` to copy everything by default is a bad idea... Soon or later you will try to copy a block with some `face!` inside and with some bad-luck you may end with copying complete system recursively.

--------------------------------------------------------------------------------

On 2021-09-17T12:31:01Z, Oldes, commented:
<https://github.com/red/red/issues/2167#issuecomment-921759871>

    *PING* ... I just shoot myself into a leg when my code expected that maps inside maps are copied while they are not :-/
    
    ```red
    m1: #(a: #(b: "ccc"))
    m2: copy/deep m1
    m1/a/x: 1
    append m1/a/b #"x"
    m1/a   =? m2/a   ;== true
    m1/a/b =? m2/a/b ;== true
    ``` 

--------------------------------------------------------------------------------

On 2021-09-17T16:24:49Z, greggirwin, commented:
<https://github.com/red/red/issues/2167#issuecomment-921925022>

    Thanks for the reminder on this @Oldes. I wrote notes from a use case which also takes `make` into account. My use case was a GUI app, where your dataset of records, which can be edited one at a time could be maps, blocks, or objects. You shouldn't have to change logic, in this context, when changing types. And it should be easy to exchange (scatter/gather) data with UI components correctly.

