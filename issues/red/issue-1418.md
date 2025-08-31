
#1418: == and strict-equal return true on values of different datatypes
================================================================================
Issue is closed, was reported by WiseGenius and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1418>

The following examples should each return `false`:

```
red>> strict-equal? 0.0 0
== true
red>> -0.0 == 0
== true
red>> +0.0 == 0
== true
red>> 1.0 == 1
== true
red>> ? ==

USAGE:
    value1 ==  value2

DESCRIPTION:
     Returns true if two values are equal, and also the same datatype.
     == is of type: op!

ARGUMENTS:
     value1  [any-type!]
     value2  [any-type!]

REFINEMENTS:
```



