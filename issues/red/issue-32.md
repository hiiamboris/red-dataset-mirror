
#32: In function spec, argument identifier that is set-word! is not caught
================================================================================
Issue is closed, was reported by meijeru and has 0 comment(s).
[status.tested] [type.bug]
<https://github.com/red/red/issues/32>

I inadvertently typed `result: [integer!]` instead of `return: [integer!]` in a function spec. This was taken as an additional argument, leading to spurious execution errors. Incidentally, the error message was also not very helpful: instead of "missing argument" it said "datatype not allowed".



