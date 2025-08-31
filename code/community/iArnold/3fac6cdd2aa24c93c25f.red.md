# 

**Gist ID:** 3fac6cdd2aa24c93c25f
**Created:** 2016-03-15T19:39:45Z
**Last updated:** 2016-03-15T19:39:46Z

## File: `join.red`

```Red
join: func [
    "Concatenates values." 
    value "Base value" 
    rest "Value or block of values"
][
    value: either series? :value [copy value] [form :value] 
    repend value :rest
]
```

## Comments

No comments.
