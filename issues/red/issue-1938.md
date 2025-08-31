
#1938: Split problem
================================================================================
Issue is closed, was reported by iArnold and has 26 comment(s).
[status.deferred]
<https://github.com/red/red/issues/1938>

`split "1,2,,4" ","`
results in
== ["1" "2" "4"]
When splitting strings when reading csv files there should be a None value at place 3.
With current behaviour information is lost.



Comments:
--------------------------------------------------------------------------------

On 2016-05-26T12:42:01Z, WiseGenius, commented:
<https://github.com/red/red/issues/1938#issuecomment-221859726>

    I would rather expect:
    
    ```
    red>> split "1,2,,4" ","
    == ["1" "2" "" "4"]
    ```

--------------------------------------------------------------------------------

On 2016-05-26T13:35:49Z, iArnold, commented:
<https://github.com/red/red/issues/1938#issuecomment-221872312>

    Quote from Twix commercial: "Try both and pick a side". :smiley_cat: 

--------------------------------------------------------------------------------

On 2016-05-26T14:06:52Z, WiseGenius, commented:
<https://github.com/red/red/issues/1938#issuecomment-221880684>

    Rebol 3:
    
    ```
    >> split "1,2,,4" ","
    == ["1" "2" "" "4"]
    ```
    
    Lisp:
    (Racket):
    
    ```
    > (regexp-split #rx"," "1,2,,4")
    '("1" "2" "" "4")
    ```
    
    (Gulie Scheme):
    
    ```
    Scheme]  (string-split "1,2,,4" #\,)
    ("1" "2" "" "4")
    ```
    
    Python:
    
    ```
    >>> "1,2,,4".split(",")
    ['1', '2', '', '4']
    ```
    
    Ruby:
    
    ```
    > "1,2,,4".split(',')
    => ["1", "2", "", "4"]
    ```
    
    JavaScript:
    
    ```
    > "1,2,,4".split(",");
    [ '1', '2', '', '4' ]
    ```

--------------------------------------------------------------------------------

On 2016-05-26T16:10:51Z, dockimbel, commented:
<https://github.com/red/red/issues/1938#issuecomment-221918188>

    The current `split` implementation is just a 5 minutes coding job and 2 lines of code. It was just provided earlier than planned because it was needed in some scripts. The full `split` implementation will be more in line with the R3 version (~60 LOCs)

--------------------------------------------------------------------------------

On 2016-05-26T19:14:41Z, iArnold, commented:
<https://github.com/red/red/issues/1938#issuecomment-221966740>

    There is also a function split defined in the tests, in red/tests/source/units/parse-test.red
        --test-- "str-cplx5"
            split: function [series [string!] dlm [string! char!] /local value][
              rule: complement charset dlm
              parse series [collect [any [keep copy value some rule | skip]]]
            ]
    so the question also is if the function split in red/environment/functions.red
    split: function [
        "Break a string series into pieces using the provided delimiters"
        series  [any-string!]   "String series to split"
        dlm     [string! char!] "Delimiter as a char or string pattern"
        return: [block!]        "Returns a block of split pieces without the delimiters"
        /local value
    ][
        rule: complement charset dlm
        parse series [collect [any [keep copy value some rule | skip]]]
    ]
    was tested ;-)

--------------------------------------------------------------------------------

On 2016-05-27T10:23:41Z, iArnold, commented:
<https://github.com/red/red/issues/1938#issuecomment-222112859>

    I plainly converted SPLIT from R3 source code into Red:
    
    ``` Red
    split: func [
        {Split a series into pieces; fixed or variable size, fixed number, or at delimiters}
        series [series!] "The series to split"
        dlm [block! integer! char! bitset! any-string!] "Split size, delimiter(s), or rule(s)."
        /into {If dlm is an integer, split into n pieces, rather than pieces of length n.}
        /local size piece-size count mk1 mk2 res fill-val add-fill-val
    ][
        either all [block? dlm parse dlm [some integer!]] [
            map-each len dlm [
                either positive? len [
                    copy/part series series: skip series len
                ] [
                    series: skip series negate len
                    ()
                ]
            ]
        ] [
            size: dlm
            res: collect [
                parse series case [
                    all [integer? size into] [
                        if size < 1 [cause-error 'Script 'invalid-arg size]
                        count: size - 1
                        piece-size: to integer! round/down divide length? series size
                        if zero? piece-size [piece-size: 1]
                        [
                            count [copy series piece-size skip (keep/only series)]
                            copy series to end (keep/only series)
                        ]
                    ]
                    integer? dlm [
                        if size < 1 [cause-error 'Script 'invalid-arg size]
                        [any [copy series 1 size skip (keep/only series)]]
                    ]
                    'else [
                        [any [mk1: some [mk2: dlm break | skip] (keep/only copy/part mk1 mk2)]]
                    ]
                ]
            ]
            fill-val: does [copy either any-block? series [[]] [""]]
            add-fill-val: does [append/only res fill-val]
            case [
                all [integer? size into] [
                    if size > length? res [
                        loop (size - length? res) [add-fill-val]
                    ]
                ]
                'else [
                    case [
                        bitset? dlm [
                            if attempt [find dlm last series] [add-fill-val]
                        ]
                        char? dlm [
                            if dlm = last series [add-fill-val]
                        ]
                        string? dlm [
                            if all [
                                find series dlm
                                empty? find/last/tail series dlm
                            ] [add-fill-val]
                        ]
                    ]
                ]
            ]
            res
        ]
    ]
    
    ```
    
    ``` Red
    split "1||2" "|"
    ```
    
    result is ["1" "" "2"]

--------------------------------------------------------------------------------

On 2016-05-27T20:49:49Z, iArnold, commented:
<https://github.com/red/red/issues/1938#issuecomment-222250007>

    ``` Red
    split: func [
        {Split a series into pieces; fixed or variable size, fixed number, or at delimiters}
        series [series!] "The series to split"
        dlm [block! integer! char! bitset! any-string!] "Split size, delimiter(s), or rule(s)."
        /into {If dlm is an integer, split into n pieces, rather than pieces of length n.}
        /local size piece-size count mk1 mk2 res fill-val add-fill-val
    ][
        either all [block? dlm parse dlm [some integer!]] [
            map-each len dlm [
                either positive? len [
                    copy/part series series: skip series len
                ] [
                    series: skip series negate len
                    ()
                ]
            ]
        ] [
            size: dlm print size print  all [integer? size into]
            res: collect [
                parse series case [
     ;               all [integer? size into] [print into
                     integer? size [print into
                        if size < 1 [cause-error 'Script 'invalid-arg size]
                        count: size - 1
                        piece-size: to integer! round/down divide length? series size
                        if zero? piece-size [piece-size: 1]
                        [
                            count [copy series piece-size skip (keep/only series)]
                            copy series to end (keep/only series)
                        ]
                    ]
                    integer? dlm [print "int"
                        if size < 1 [cause-error 'Script 'invalid-arg size]
                        [any [copy series 1 size skip (keep/only series)]]
                    ]
                    'else [print "'else"
                        [any [mk1: some [mk2: dlm break | skip] (keep/only copy/part mk1 mk2)]]
                    ]
                ]
            ]
            fill-val: does [copy either any-block? series [[]] [""]]
            add-fill-val: does [append/only res fill-val]
            case [
                all [integer? size into] [print res
                    if size > length? res [
                        loop (size - length? res) [add-fill-val]
                    ]
                ]
                'else [
                    case [
                        bitset? dlm [
                            if attempt [find dlm last series] [add-fill-val]
                        ]
                        char? dlm [
                            if dlm = last series [add-fill-val]
                        ]
                        string? dlm [
                            if all [
                                find series dlm
                                empty? find/last/tail series dlm
                            ] [add-fill-val]
                        ]
                    ]
                ]
            ]
            res
        ]
    ]
    split/into "123456789012345678" 6
    ```
    
    Trying this on try.rebol.nl
    Strange thing now is that into has a value of false! even though the refinement was used!

--------------------------------------------------------------------------------

On 2016-05-28T08:21:28Z, iArnold, commented:
<https://github.com/red/red/issues/1938#issuecomment-222296829>

    I found out into is true but within the collect there is also a into word. So to fix this an extra split-into works fine. I'll add some tests and try to make a PR.

--------------------------------------------------------------------------------

On 2016-05-28T10:27:52Z, dockimbel, commented:
<https://github.com/red/red/issues/1938#issuecomment-222301568>

    @iArnold `split` features need to be discussed first (as Gregg started in red/mezz). Moreover, your above code is not respecting Red coding style, contains wrong code that will crash at runtime and dependencies to functions which are not yet implemented. Please don't submit any PR!

--------------------------------------------------------------------------------

On 2016-05-28T10:30:57Z, dockimbel, commented:
<https://github.com/red/red/issues/1938#issuecomment-222301676>

    I am closing this ticket as the current `split` implementation is temporary and there won't be any fix for that until we get the final `split` function implemented.
    
    @greggirwin We can resume the discussions about it in red/mezz.

--------------------------------------------------------------------------------

On 2016-05-28T17:18:31Z, iArnold, commented:
<https://github.com/red/red/issues/1938#issuecomment-222319425>

    Current split is causing problems I need solved. Thanks again for support/response. OK with resume discussion in red/mezz.

--------------------------------------------------------------------------------

On 2016-06-28T14:00:40Z, ghost, commented:
<https://github.com/red/red/issues/1938#issuecomment-229057703>

    @dockimbel We'll wait then till the final version :-)

--------------------------------------------------------------------------------

On 2016-06-28T14:04:48Z, iArnold, commented:
<https://github.com/red/red/issues/1938#issuecomment-229058943>

    @Arie-vw That is why there was an improved version accepted https://github.com/red/red/pull/1987

