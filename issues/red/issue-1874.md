
#1874: Calling a function with a refinement in a react block gives script errors
================================================================================
Issue is closed, was reported by PeterWAWood and has 4 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/1874>

I have a function with a refinement:

``` Red
Red [
    File: %validate.red
]

validate: func [
    sn          [string! none!]
    /default
        def     [float!]
    /local      n 
][
    either float! <> attempt [type? to float! sn] [
        n: either default [def] [0.0]
    ][
        n: to float! sn
    ]
    n
]
```

It loads and runs correctly from the console:

``` text
red>> do %validate.red
== func [sn [string! none!] /default def [float!] /local n][either...
red>> validate/default "abcd" 10.0
== 10.0
```

But when it is called with the refinement from within a `react` block, there is a script error on loading.
The script:

``` Red
Red [
    Needs: 'View
    File: %refinement.red
]

do %validate.red

view [
        f: field 100
        text 100 react [
            n: validate/default f/text 10.0
            face/text: form n
        ]   
]
```

The script error:

``` text
red>> do %refinement.red
*** Script error: unsupported type in validate/default get-path
*** Where: get
```



Comments:
--------------------------------------------------------------------------------

On 2016-05-02T10:30:44Z, PeterWAWood, commented:
<https://github.com/red/red/issues/1874#issuecomment-216192661>

    If I remove the refinement from both the validate function and the react block. The script works as expected.

--------------------------------------------------------------------------------

On 2016-05-02T19:58:39Z, meijeru, commented:
<https://github.com/red/red/issues/1874#issuecomment-216344703>

    I suppose this has to do with the way react blocks are analysed. See line 652 of `view.red`. But the `attempt` should prevent the script error ?!?

