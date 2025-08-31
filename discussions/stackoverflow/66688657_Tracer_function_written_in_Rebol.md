# Tracer function written in Rebol

**Link:**
<https://stackoverflow.com/questions/66688657/tracer-function-written-in-rebol>

**Asked:** 2021-03-18 09:54:56 UTC

------------------------------------------------------------------------

It is possible in Rebol (Red, R3 Ren-c) to write a function similar to
TRACE that produces the following result:

    foo: func [val1 val2 /local temp] [
           temp: val1 + 5
           val2 + temp
    ]
    bar: func [x /ris 'var "blablalba"][
           if ris [set var "fatto"]
           (foo x 2) + 8
    ]
    trace [foo bar]
    bar/ris 7 yyy

    Enter BAR
       x = 7
       var = yyy
         Enter FOO
           val1 = 7
           val2 = 2
         FOO returned 14
    BAR returned 22

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 2) --- by 9214

At the user-level, the most straightforward approach is to write a
closure-like wrapper that would call tracing hooks you provide before
and after calling the main code, and which then would return the result
of evaluation.

A rough sketch of that idea in Red is as follows:

    frame-of: function [
        func [function!]
        /local
            match
    ][
        parse spec-of :func [
            collect any [
                set match [not quote return: all-word!] keep (to word! match)
                | skip
            ]
        ]
    ]

    report: function [frame [block!]][
        environment: construct collect [forall frame [keep to set-word! frame/1]]
        also environment set environment reduce frame
    ]

    trace: function [
        'target [word!]
        enter   [block!]
        leave   [block!]
    ][
        chain: reduce [
            'do enter
            'set/any quote 'result 'do body-of get target
            'do leave
            quote :result
        ]
        
        new:  func spec-of get target chain
        info: context [
            frame:  bind frame-of get target :new
            name:   target
            result: none
        ]
        
        bind body-of :new info
        set target :new
        exit
    ]

With that in place, you can then:

    enter: [print ['entering name 'with mold/flat body-of report frame]]
    leave: [print [name 'returned result]]

    trace foo enter leave
    trace bar enter leave

Which, for your example, gives:

    >> bar/ris 7 yyy
    entering bar with [x: 7 ris: true var: 'yyy]
    entering foo with [val1: 7 val2: 2 local: false temp: none]
    foo returned 14
    bar returned 22
    == 22

Mind that this is just a PoC. The basic idea is that your original
function gets replaced by an instrumented version, created via a closure
over some internal namespace with debugging info. You can also throw
some Red/System into the mix to gain fine-grained access to runtime
information, like e.g. evaluation stack.

I am leaving pretty-printing with indentation and disabling of tracing
as an exercise for the reader ;)

------------------------------------------------------------------------

### Answer (score: 1) --- by noein

This solution, not very elegant, works on both Red and Rebol and should
meet the demand requirements (I hope I have considered all cases):

    extract-args: func [args-block /local emit result rules w ref] [
        result: copy []
        emit: func [x] [append result x]
        rules: [
            any [
                    /local some [word!]
                |   set w [word! | get-word!] (emit w)
                |   set w lit-word! (emit to-get-word w)
                |   [string! | block!]
                |   set ref refinement! set w [word! | lit-word! | get-word!] 
                        (if ref [emit w])
                |   refinement!
            ]
        ]
        parse args-block rules
        result
    ]

    pretty-print-args: func [spc /wrd] [
        foreach wrd extract-args spc [
                print [**indentation** "  " to-string wrd " = " get wrd]
        ]
    ]

    insert-**result**: func [spc] [
        either find spc quote /local 
            [append spc [**result**]]
            [append spc [/local **result**]]
    ]

    **indentation**: copy ""
    add-1-ind: func [][append **indentation** copy "   "]
    remove-1-ind: func [] [remove/part skip tail **indentation** -3 3]

    my-trace: func [wrds /local w spc bdy bdy' uw] [
        foreach w wrds [
            uw: uppercase to-string w
            spc: copy spec-of get w
            insert-**result** spc
            bdy: body-of get w
            bdy': compose/deep copy [
                add-1-ind
                print [**indentation** "Enter" (uw)]
                pretty-print-args [(spc)]
                set/any '**result** do [(bdy)]
                print [**indentation** (uw) "returned" mold :**result**]
                remove-1-ind
                :**result**
            ]
            set w func spc bdy'
        ]
    ]

Then:

    >> my-trace [foo bar]
    == func [x /ris 'var "blablalba" /local **result**][
        add-1-ind 
    ...

    >> bar/ris 7 yyy
        Enter  BAR
           x  =  7
           var  =  yyy
           Enter  FOO
              val1  =  7
              val2  =  2
           FOO  returned  14
        BAR  returned  22
    == 22
    >> source bar
    bar: func [x /ris 'var "blablalba" /local **result**][
        add-1-ind 
        print [**indentation** "Enter" "BAR"] 
        pretty-print-args [x /ris 'var "blablalba" /local **result**] 
        set/any '**result** do [
            if ris [set var "fatto"] 
            (foo x 2) + 8
        ] 
        print [**indentation** "BAR" "returned" mold :**result**] 
        remove-1-ind 
        :**result**
    ]

------------------------------------------------------------------------

## Comments on question

*Comment by Dave Andersen:* It\'s definitely possible.Boris has a couple
trace functions in [this
repository](https://gitlab.com/hiiamboris/red-mezz-warehouse#general-purpose){rel="nofollow noreferrer"}
that demonstrate incremental evaluation with a callback.
