
#3056: WISH: CATCH/THROW in Parse
================================================================================
Issue is closed, was reported by rgchris and has 2 comment(s).
[type.wish]
<https://github.com/red/red/issues/3056>

Goal: to allow a sub-rule to return a value to the calling rule.

Example:

    ctx-escape: make object! [
        escapes: #(newline: "^/" tab: "^-" foo: "foo")
        rule: [
            #"\" [
                  "n" throw (escapes/newline)
                | "t" throw (escapes/tab)
                | "f" throw (escapes/foo)
            ]
        ]
    ]

    ctx-text: make object! [
        escape: get in ctx-escape 'rule
        chars: complement charset "\"
        rule: [
            any [
                  copy text some chars (probe text)
                | set token catch escape (probe token)
            ]
        ]
    ]

    parse "abc\fdef" ctx-text/rule

In this instance, you have a context dedicated to escape sequences and can return the value associated with a matched sequence without requiring a word external to the two contexts or by copying a portion of the source. There is a little crossover in utility with COLLECT/KEEP, however CATCH/THROW offers a little more versatility.


Comments:
--------------------------------------------------------------------------------

On 2018-04-25T04:51:39Z, PeterWAWood, commented:
<https://github.com/red/red/issues/3056#issuecomment-384160010>

    Following the introduction of the [Red REP repository for enhancements and wishes](https://gitter.im/red/red?at=5adfeed527c509a7744a3dc8), this issue is being closed.
    
    If you believe that your wish is still valid, please open a new issue for it in the new [red/REP repo](https://github.com/red/REP). It would help if you could include a link to this issue when opening an issue in the REP repository.

