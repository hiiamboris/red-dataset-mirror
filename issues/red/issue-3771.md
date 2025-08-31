
#3771: Inside a function macros expand only once
================================================================================
Issue is closed, was reported by lepinekong and has 6 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3771>

**Describe the bug**
expand-directives command expand when macro §include below is called twice INSIDE a function.

**To reproduce**
Steps to reproduce the behavior:
create src/test.red with

```
Red [
    Title: ""
]

#macro §include: func[param>source][
    new-line load param>source true ; new-line block true will insert a new line in block (not in a string which uses newline)
]

f: function [][

§include %imports/file1.inc
§include %imports/file2.inc
]

```


and the 2 include files  %imports/file1.inc and %imports/file2.inc:


```
test1: true

```

and


```
test2: false

```


Run build.red

```
Red [
    Title: ""
]

~output-file: %test.red
src-expanded: expand-directives load %src/test.red
write (~output-file) mold/only src-expanded

```


It outputs:

```

Red [
    Title: ""
] 
    .html-gen: function [] [
        test1: true 
        §include %imports/file2.inc
    ]

```


**Expected behavior**

```
Red [
    Title: ""
] 
    .html-gen: function [] [
        test1: true 
        test2: false
    ]


```



**Platform version (please complete the following information)**
Red 0.6.3 for Windows built 18-Jun-2018/14:11:17+01:00 commit #6753157




Comments:
--------------------------------------------------------------------------------

On 2019-02-04T14:35:39Z, hiiamboris, commented:
<https://github.com/red/red/issues/3771#issuecomment-460271079>

    Good find @lepinekong ☻ :+1: 
    Next time please take your time to reduce your example, otherwise it becomes time consuming for the team to reproduce the issue.
    Like this:
    ```
    >> expand-directives [#macro m: func [x][x]  m [1 2] m [3 4] [m [5 6] m [7 8]] m [9 10]]
    == [1 2 3 4 [5 6 m [7 8]] 9 10]    ;<-- inside a block macro expands only once
    ```
    
    @lepinekong You can currently work around this issue using parse-based macro syntax:
    `#macro ['§include file!] func [s e][new-line load s/2 true]`

--------------------------------------------------------------------------------

On 2019-02-04T16:25:41Z, 9214, commented:
<https://github.com/red/red/issues/3771#issuecomment-460312971>

    # TL;DR
    
    Named macro that:
    * resides at the head of nested block / paren (nesting level does not matter) 
    * is followed by at least one macro (named or pattern-matching)
    * results in insertion of more than one value at expansion site
    
    will prevent expansion of all subsequent macros (either named or pattern-matching) at the same nesting level.
    
    ### Hypothesis
    
    The culprit is somewhere in Parse-related logic of registered named macros, most likely caused by `insert/part` [here](https://github.com/red/red/blob/master/utils/preprocessor.r#L180) or `change/part` [here](https://github.com/red/red/blob/master/utils/preprocessor.r#L234) and saved position misalignment, as in:
    ```red
    >> block: [[a b][c d]]
    == [[a b] [c d]]
    >> position: next block
    == [[c d]]
    >> head insert block take block
    == [a b [c d]]
    >> position
    == [b [c d]] ; inserted value "peeked" into saved series; perhaps [[c d]] was expected
    ```
    
    This conjecture is supported by another observation:
    ```red
    >> expand [#macro ['w skip] func [s e][change/part s [! !] e s] #macro m: func [x][x] w a m b]
    preproc: matched [w a] 
    preproc: eval macro [change/part s [! !] e s]
    preproc: == [! ! m b]
    preproc: eval macro [m b]
    preproc: == b
    [! ! m b b]
    == [! ! m b b]
    
    >> expand [#macro ['w skip] func [s e][change/part s [! !] e s] #macro m: func [x][x] w a w b]
    preproc: matched [w a] 
    preproc: eval macro [change/part s [! !] e s]
    preproc: == [! ! w b]
    preproc: matched [w b] 
    preproc: eval macro [change/part s [! !] e s]
    preproc: == [! !]
    [! ! w b ! !]
    ```

--------------------------------------------------------------------------------

On 2019-08-14T19:00:35Z, dockimbel, commented:
<https://github.com/red/red/issues/3771#issuecomment-521375426>

    The issue is caused by a premature exit from root preprocessor rule after the macro is applied, because the input position does not move and an `any` iterator is used. Parse in Red treats such case as a potential infinite loop, so it will exit from `any`. 

