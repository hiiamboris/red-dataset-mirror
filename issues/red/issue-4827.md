
#4827: Parse range treats integer value as invalid 
================================================================================
Issue is closed, was reported by greggirwin and has 6 comment(s).
[status.resolved] [type.design]
<https://github.com/red/red/issues/4827>

R2
```
parse [1] [any [1 1 1]]
;== true
val: 1
;== 1
parse [1] [any [1 1 val]]
;== true
```
Red:
```
parse [1] [any [1 1 1]]
;*** Script Error: PARSE - invalid rule or usage of rule: 1
;*** Where: parse
;*** Stack:  

parse [1] [any [1 1 quote 1]]
;== true

val: 1
;== 1
parse [1] [any [1 1 quote val]]
;== false
parse [1] [any [1 1 val]]
;*** Script Error: PARSE - invalid rule or usage of rule: 1
;*** Where: parse
;*** Stack:
```

Expected behavior:

Treat value, after min/max range limits, to be treated literally.

Gitter chat: https://gitter.im/red/parse?at=6026ca94428d9727dd70c0a9 (see @toomasv comments)

`to/thru` also don't match ints literally, neither did R2, but I haven't thought through that all yet.

## RED & PLATFORM VERSION
RED: [ branch: "master" tag: #v0.6.0 ahead: 7461 date: 9-Feb-2021/17:31:32 commit: #18bc5f7468c71d04f3b229cf426fa7326fc672e3 ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19042 ]





Comments:
--------------------------------------------------------------------------------

On 2021-02-14T17:37:22Z, toomasv, commented:
<https://github.com/red/red/issues/4827#issuecomment-778811411>

    IMO it is not a bug but by design. From blog article introducing parse:
    
    > The Parse rules can be made from:
    > ...
    >    **integer** value : specify an iterated rule with a fixed number or a range of iterations.
    
    Different behavior will introduce ambiguities/uncertainties; e.g. are two integers meant to be exact iteration + literal integer or min-max range?; why use `quote <int>` after one integer and just `<int>` after two integers; what if you want/need use two successive ranges? 
    
    Of course these questions can be resolved in different way, but then it is change of design, not elimination of a bug.

--------------------------------------------------------------------------------

On 2021-02-14T17:56:48Z, greggirwin, commented:
<https://github.com/red/red/issues/4827#issuecomment-778814396>

    Good points @toomasv. Thanks for weighing in.

--------------------------------------------------------------------------------

On 2021-08-24T17:49:56Z, dockimbel, commented:
<https://github.com/red/red/issues/4827#issuecomment-904850664>

    > Different behavior will introduce ambiguities/uncertainties; e.g. are two integers meant to be exact iteration + literal integer or min-max range?; why use quote <int> after one integer and just <int> after two integers; what if you want/need use two successive ranges?
    
    That's correct, it would be ambiguous to allow such syntax. Use `quote` to match an integer literally.

