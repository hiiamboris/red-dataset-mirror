# Value of local variables in a function seems not be released post function calling in Red/Rebol language

**Link:**
<https://stackoverflow.com/questions/66913801/value-of-local-variables-in-a-function-seems-not-be-released-post-function-calli>

**Asked:** 2021-04-02 02:39:05 UTC

------------------------------------------------------------------------

I construct a function named `find-all` to find all indexes of a given
item in a series by \"recursive\". The first calling of `find-all` gives
the right output. However from the second calling, all outputs are
appended together.

    find-all: function [series found][
    result: [] 
      either any [empty? series none? s-found: find series found]
         [result]
         [append result index? s-found
          find-all next s-found found]
    ]

    ;; test:
    probe find-all "abcbd" "b"   ;; output [2 4] as expected
    probe find-all [1 2 3 2 1] 2  ;; output [2 4 2 4]

Since variables inside a function created with `function` are local, why
does the value of variable `result` is still there during later funtion
callings, which cause the `result` of the sencond calling of `find-all`
does not begin with `[]`? And what is the correct recursive way to
achieve this funciton?

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 3) --- by 9214

The answer is evident if you inspect `find-all` after making these two
calls:

    >> ?? find-all
    find-all: func [series found /local result s-found][
        result: [2 4 2 4] 
        either any [empty? series none? s-found: find series found] 
        [result] 
        [append result index? s-found 
            find-all next s-found found
        ]
    ]

`result` is an [indirect
value](https://stackoverflow.com/questions/66793343/how-does-functions-of-red-rebol-pass-parameters-by-value-or-by-reference),
and its data buffer is stored on a heap. The data gets preserved between
the calls and accumulated, because you do not re-create it with `copy`
--- `result` being local to function\'s context is unrelated to that.

------------------------------------------------------------------------

### Answer (score: 0) --- by lyl

Thanks to \@9214\'s help, especially the description about
`indirect value`. I give a solution like this:

    find-all: function [series found][
      either any [empty? series none? s-found: find series found]
         [[]]
         [append
            reduce [index? s-found]
            find-all next s-found found
        ]
    ]

    ;; test:
    probe find-all "abcbd" "b"   ;; output [2 4] as expected
    probe find-all [1 2 3 2 1] 2  ;; output [2 4] as expected

------------------------------------------------------------------------

## Comments on question
