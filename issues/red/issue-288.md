
#288: Formal args of parametrized macros are not constrained to (non key-)words
================================================================================
Issue is closed, was reported by meijeru and has 4 comment(s).
[status.built] [status.tested] [type.bug] [Red/System]
<https://github.com/red/red/issues/288>

It is possibe to use reserved keywords as args. It is also possible to specifiy other literals (numbers, strings) as args, but these are ignored in the arg list and used literally in the body, without warning.

```
#define a(b not) [b + not] print a(1 2) ; prints 3

#define a(b 5) [b + 5] print a(1 2) ; prints 6, not 3

#define a(b "c") [b + "c"] print a(1 2) ; error in code-generation (adding an integer to a string)
```



Comments:
--------------------------------------------------------------------------------

On 2012-11-01T20:42:51Z, dockimbel, commented:
<https://github.com/red/red/issues/288#issuecomment-9995101>

    Good catch, again!

--------------------------------------------------------------------------------

On 2012-11-04T14:55:22Z, dockimbel, commented:
<https://github.com/red/red/issues/288#issuecomment-10051243>

    A proper loader error is now raised.

