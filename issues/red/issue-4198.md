
#4198: [Parse] KEEP PICK PAREN! semantics is undefined
================================================================================
Issue is closed, was reported by 9214 and has 4 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/4198>

**Describe the bug**

Title. `keep pick <expression>` in Parse is allowed but has no effect.

**To reproduce**

```red
>> parse [][collect keep pick ('a)]
== []
>> parse [][collect keep pick ([a b])]
== []
```

**Expected behavior**

Per discussion with @dockimbel, it should be the same as `keep <expression>`:

```red
>> parse [][collect keep pick ('a)]
== [a]
>> parse [][collect keep pick ([a b])]
== [[a b]]
```

**Platform version (please complete the following information)**

The latest build, all platforms.



Comments:
--------------------------------------------------------------------------------

On 2022-08-01T17:30:56Z, gurzgri, commented:
<https://github.com/red/red/issues/4198#issuecomment-1201503270>

    Current `keep pick ([ ... ])` behaviour has the following asymmetry:
    
    ```Red
    >> collect [parse [] [(keep [value]) (keep/only [block])]] ;== [value [block]]
    ```
    ```Red
    >> parse [] [collect [keep pick ([value]) keep ([block])]] ;== [[value] [block]]
    ```
    
    The latter offers no way to collect the values of a block instead of keeping the block as a value.

--------------------------------------------------------------------------------

On 2022-08-05T16:24:21Z, dockimbel, commented:
<https://github.com/red/red/issues/4198#issuecomment-1206632475>

    Implemented!

