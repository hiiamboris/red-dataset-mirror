
#78: Type names can be redefined, but in function specs and struct members, they are independently recognized
================================================================================
Issue is closed, was reported by meijeru and has 14 comment(s).
<https://github.com/red/red/issues/78>

The parsing of function specs and struct members assumes that integer! etc. have not been redefined. Thus the following program is compiled without errors:

```
integer!: 5 s: struct [i [integer!]]
```

It would perhaps be better to avoid this kind of confusion by including integer! etc. in the list of keywords.



Comments:
--------------------------------------------------------------------------------

On 2011-06-06T19:08:56Z, dockimbel, commented:
<https://github.com/red/red/issues/78#issuecomment-1311139>

    I am not sure that this is necessary, as a variable name and a built-in type identifier are by nature and by implementation, two different objects that cannot interfere one with other. So this statement: <i>The parsing of function specs and struct members assumes that integer! etc. have not been redefined</i> is not accurate, as specs type parsing is not affected by the variables namespaces.

--------------------------------------------------------------------------------

On 2011-06-06T19:57:41Z, meijeru, commented:
<https://github.com/red/red/issues/78#issuecomment-1311431>

    You are right, but to have two different objects with the same name, quite legally, is not conducive to good programming, I think.

--------------------------------------------------------------------------------

On 2011-06-07T10:16:52Z, dockimbel, commented:
<https://github.com/red/red/issues/78#issuecomment-1314857>

    I agree with you on a conceptual level. But if I start chasing perfection both for design and implementation of Red/System, the project is doomed, because I would spend the rest of this year on Red/System, perfecting every single detail, and starting to work on Red probably only in 2012. This is just not possible for me, as "time to market" is critical for this project to reach a momentum and have a future. I guess REBOL3 is a good example of the failure of a long-term, unbounded approach.
    
    So the goal with Red/System is to have a "good enough" tool both in design and implementation to help build Red, but I admit that the frontier is not clear, so edge cases like this issue would help draw the line between what is important and what is accessory. I do not have a definitive answer for this particular issue, what do you think, is this case important enough to be handled now, or could it wait for Red/System re-implementation in Red?
    
    PS: by the way, this case is better handled in Red/System than it is in REBOL2:
    
    ```
    >> integer!: 123
    == 123
    >> inc: func [a [integer!]][a + 1]
    ** Script Error: Invalid argument: integer!
    ** Where: throw-on-error
    ** Near: func [a [integer!]] [a + 1]
    ```

--------------------------------------------------------------------------------

On 2011-06-08T07:08:14Z, meijeru, commented:
<https://github.com/red/red/issues/78#issuecomment-1324974>

    How difficult would it be to check for the limited set of typenames at the point where an assignment is handled? 

--------------------------------------------------------------------------------

On 2011-06-26T17:50:06Z, dockimbel, commented:
<https://github.com/red/red/issues/78#issuecomment-1441939>

    Sorry for not have answered your question before. It would almost be a one-liner.
    
    I took a few weeks to think about the deeper reasons explaining why I am reluctant to do this change: 
    - from a _user_ point of view, I want to keep the keywords list as short as possible (easier to remember), so marking all the datatype names as keyword would be a significant increase to this list size.
    - from a _marketing_ point of view, it will look a little less attractive/elegant to people looking at the language specification for the first time (the shorter the keyword list, the "nicer" it would look like).
    
    So I would keep it as-is for now, unless we discover a side-effect.

--------------------------------------------------------------------------------

On 2011-06-26T18:05:38Z, meijeru, commented:
<https://github.com/red/red/issues/78#issuecomment-1441973>

    It is to be consiedered a feature of Red(/System) then, that the namespace of typenames (built-ins and and aliases taken together) is separate from the variable namespace.

--------------------------------------------------------------------------------

On 2011-07-03T18:03:53Z, dockimbel, commented:
<https://github.com/red/red/issues/78#issuecomment-1493877>

    Note added to explain why type names and variables do not live in the same space, and a warning appended against using type names as variable names.

