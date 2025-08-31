
#1472: Unique case refinement "reversed" for Strings
================================================================================
Issue is closed, was reported by PeterWAWood and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1472>

The `/case` refinement of `unique` seems to work the wrong way around for strings:

```
red>> ? unique

USAGE:
    unique set  /case  /skip  size

DESCRIPTION:
     Returns the data set with duplicates removed. 
     unique is of type: native!

ARGUMENTS:
     set  [block! hash! string!]

REFINEMENTS:
     /case => Use case-sensitive comparison.
     /skip => Treat the series as fixed size records.
         size  [integer!]

red>> unique [a A]
== [a]
red>> unique/case [a A]
== [a A]
red>> unique "aA"
== "aA"
red>> unique/case "aA"
== "a"
```

(This was pointed out to me by Sunanda.)



Comments:
--------------------------------------------------------------------------------

On 2016-01-25T09:31:34Z, qtxie, commented:
<https://github.com/red/red/issues/1472#issuecomment-174447716>

    Related to issue #1481 .

