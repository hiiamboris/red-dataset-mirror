
#2004: Small error in docstring for GET-ENV
================================================================================
Issue is closed, was reported by meijeru and has 0 comment(s).
[status.resolved] [type.review]
<https://github.com/red/red/issues/2004>

```
get-env: make native! [[
 +      "Returns the value of an OS environment variable (for current process)"
 +      var     [any-string! any-word!] "Variable to set"
 +      return: [string! none!]
 +  ]
 +  #get-definition NAT_GET_ENV
 +]
```

The explanation of `var` should be: `"Variable to get"`, rather.



