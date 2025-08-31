
#154: Integer pointer incremented as byte pointer in begin of complex expression
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/154>

```
b: declare pointer! [integer!]
print-hex as-integer b
print-newline
print-hex as-integer b +
    (4 / 4 * 2) +
    3
```

804B293
804B2A1



