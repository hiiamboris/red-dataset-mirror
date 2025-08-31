
#2448: Redefinition of the #define should at least cause warning
================================================================================
Issue is closed, was reported by Oldes and has 2 comment(s).
[status.built] [status.tested] [type.wish]
<https://github.com/red/red/issues/2448>

Currently when used `#define` of the same type, there is no warning and just the first one is used.

```
Red/System []
#define TEST(x) [print [x lf]] 
#define TEST(x) [print [x x lf]] 
TEST(1)
```

Above code compiles with success and result is `1`, not `11`.

I think that there should be visual warning or error else it could lead to hard to find compilation issues.


Comments:
--------------------------------------------------------------------------------

On 2017-02-23T07:44:23Z, dockimbel, commented:
<https://github.com/red/red/issues/2448#issuecomment-281918970>

    Good suggestion.

