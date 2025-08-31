
#2924: pre-processing directives inside a paren
================================================================================
Issue is closed, was reported by JenniferLee520 and has 0 comment(s).
[status.built] [status.tested] [type.review] [test.written]
<https://github.com/red/red/issues/2924>

```Red
>> expand-directives [ [ #if config/os = 'macOS [1] ] ]   ; no problem in a block
== [[1]]
>> expand-directives [ ( #if config/os = 'macOS [1] ) ]   ; error happens in a paren
*** Script Error: eval does not allow paren! for its code argument
*** Where: eval
*** Stack: expand-directives expand  
```


