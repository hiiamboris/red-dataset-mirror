
#4062: `help` loses formatting for object 
================================================================================
Issue is closed, was reported by greggirwin and has 10 comment(s).
[status.built] [type.bug] [GUI]
<https://github.com/red/red/issues/4062>

@pekr raised the issue. I confirmed.

Indentation/alignment for `help <object!`> is lost in builds since 26-Aug-2019

**To reproduce**
Use `help` on an object in the console.

**Expected behavior**
```
>> ? help-ctx
HELP-CTX is an object! with the following words and values:
     DOC_SEP             string!       "=>"
     DEF_SEP             string!       ""
     NO_DOC              string!       ""
     HELP_ARG_COL_SIZE   integer!      12
     HELP_TYPE_COL_SIZE  integer!      12
     HELP_COL_1_SIZE     integer!      15
```

**Actual Behavior**
```
>> ? help-ctx
HELP-CTX is an object! with the following words and values:
     DOC_SEP  string!       "=>"
     DEF_SEP  string!       ""
     NO_DOC  string!       ""
     HELP_ARG_COL_SIZE  integer!      12
     HELP_TYPE_COL_SIZE  integer!      12
     HELP_COL_1_SIZE  integer!      15
     RT_MARGIN  integer!      1
```


**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 22-Sep-2019/1:07:34-06:00 commit #f90b1dd
```



Comments:
--------------------------------------------------------------------------------

On 2019-10-05T02:47:46Z, bitbegin, commented:
<https://github.com/red/red/issues/4062#issuecomment-538609899>

    related to https://github.com/red/red/commit/75586f7e71e7659c21d4e7ad6ba10b548aee947e

--------------------------------------------------------------------------------

On 2019-10-05T02:57:06Z, bitbegin, commented:
<https://github.com/red/red/issues/4062#issuecomment-538610462>

    i cherry-pick https://github.com/red/red/commit/4a34c90133a911b046a9845f3ddf843844d31327 , and it works. so, i wait @dockimbel merge fast-lexer branch or push this commit to master now ?

--------------------------------------------------------------------------------

On 2019-10-05T04:09:38Z, greggirwin, commented:
<https://github.com/red/red/issues/4062#issuecomment-538614407>

    If @dockimbel's merge will be in the next week, wait. If it's going to be longer than that, please push the commit so it's in place. Thanks!

--------------------------------------------------------------------------------

On 2019-10-10T02:34:03Z, bitbegin, commented:
<https://github.com/red/red/issues/4062#issuecomment-540305413>

    https://github.com/red/red/commit/c5a77ab6296c368d3f72eba7d0fb0b725e0bb408 merged

--------------------------------------------------------------------------------

On 2019-10-10T14:54:21Z, greggirwin, commented:
<https://github.com/red/red/issues/4062#issuecomment-540625876>

    Thanks!

