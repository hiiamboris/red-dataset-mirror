
#262: Red lexer fails if code includes #"^(00)"
================================================================================
Issue is closed, was reported by PeterWAWood and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/262>

Test Lexer-13 in lexer-test.r fails. Its essence is:

> > lexer/process {Red [] #"^(00)"}
> > **\* Syntax Error: Invalid char! value
> > **\* line: 1
> > **\* at: {#"^@"}



