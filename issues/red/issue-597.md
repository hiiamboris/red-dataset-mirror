
#597: Self-modifying rules
================================================================================
Issue is closed, was reported by kealist and has 4 comment(s).
[type.wish] [status.wontfix]
<https://github.com/red/red/issues/597>

Self-modifying rules are not currently supported in PARSE.   Here is an example of trying to use a self-modifying rule:

```
rule-1: [
    "red" |
    copy w to end (insert rule-1 compose [(w) |]) reject
]

rule-2: [
    "red" |
    "blue" |
    copy w to end (insert rule-2 compose [(w) |]) reject
]

s: "blah"
print parse s rule-1
print parse s rule-2
```

Currently this results in inconsistent behavior:

```
false
true
```

and probing the blocks gives expected behavior:

```
["blah" | "red" | copy w to end (insert rule-1 compose [(w) |]) reject]
["blah" | "red" | "blue" | copy w to end (insert rule-2 compose [(w) |]) reject]
```



Comments:
--------------------------------------------------------------------------------

On 2013-12-06T20:45:28Z, kealist, commented:
<https://github.com/red/red/issues/597#issuecomment-30027829>

    Without the 'REJECT (replace with the string "FAIL"), it ends up in an infinite loop

--------------------------------------------------------------------------------

On 2015-04-21T12:23:19Z, dockimbel, commented:
<https://github.com/red/red/issues/597#issuecomment-94775021>

    Relates to issue #1087.
    
    The fix for issue #1087 allows self-modifying rules, but still your examples above will produce an infinite loop as they push the paren! value in front of Parse's cursor each time.
    
    ```
    Before paren evaluation:
    ["red" | copy w to end (insert rule-1 compose [(w) |]) reject]
                           ^-- parse position
    After paren evaluation:
    ["blah" | "red" | copy w to end (insert rule-1 compose [(w) |]) reject]
                             ^-- parse position
    ```
    
    Even if the cursor points to a `to end` expression, the paren that follows is still evaluated, creating an endless loop.
    
    So, self-modifying rules are fine as long as you modify them _right_ from the current parsing position, else, it becomes much more tricky to control. ;-)

