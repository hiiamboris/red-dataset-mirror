
#2518: even?/odd? are defined on number! but actions for percent! type are missing
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[status.built] [type.review]
<https://github.com/red/red/issues/2518>

```
>> help even?
USAGE:
      even? number
DESCRIPTION:
      Returns true if the number is evenly divisible by 2. 
      even? is of type: action! 
ARGUMENTS:
     number   [number! char!] 
>> even? 2.0
== true
>> even? 200%
*** Script Error: even? does not allow percent! for its number argument
*** Where: even?
```



Comments:
--------------------------------------------------------------------------------

On 2017-04-28T16:56:10Z, greggirwin, commented:
<https://github.com/red/red/issues/2518#issuecomment-298050972>

    I put in a PR for this. 

