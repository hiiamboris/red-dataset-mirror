
#4566: compiler error: "attempt to redefine existing function name"
================================================================================
Issue is closed, was reported by 9214 and has 2 comment(s).
<https://github.com/red/red/issues/4566>

**Describe the bug**
Redefining already-existing function under specific circumstances leads to an error message from the compiler.

**To reproduce**
Compile the script below:
```red
Red []

foo: does []
foo: 1
foo: does []
```

```red
*** Compilation Error: attempt to redefine existing function name:

*** in file: ...
*** at line: 1
*** near: [
    f_foo: func [/local ctx saved] [
        ctx: (as red-context! ((as series-buffer! ctx||414/value) +
        saved: ctx/values
        ctx/values: as pointer! [integer!] stack/arguments
        stack/mark-func-body words/_body
        stack/reset
        unset/push
        stack/unwind-last
        ctx/values: saved
    ]
    f_keep: func [/local ctx saved ~v ~only] [
        ctx: (as red-context! ((as series-buffer! ctx||459/value) +
        saved: ctx/values
        ctx/values: as pointer! [integer!] stack/arguments
        ~v: type-check ts||8 0 stack/arguments
        ~only: ~v + 1
        stack/mark-func-body words/_body
        stack/reset
        stack/mark-native ~either
        stack/push ~only
        either logic/true? [
            stack/reset
            stack/mark-native ~append
            word/get-local ctx||196 2
            stack/push ~v
            actions/append* -1 2 -1
            stack/unwind
        ] [
            stack/reset
            stack/mark-native ~append
            word/get-local ctx||196 2
            stack/push ~v
            actions/append* -1 -1 -1
            stack/unwind
        ]
        stack/unwind
        stack/reset
        stack/push
        ~v
        stack/unwind-last
        ctx/values: saved
    ]
]
```

**Expected behavior**
Successful compilation.

**Platform version**
 363d45c, W10.



Comments:
--------------------------------------------------------------------------------

On 2020-07-09T16:01:01Z, hiiamboris, commented:
<https://github.com/red/red/issues/4566#issuecomment-656212339>

    It's an old one: https://github.com/red/red/issues/2207

