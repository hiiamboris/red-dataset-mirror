# Setting persistent environment variables between multiple \`call\`s in Rebol or Red on Windows

**Link:**
<https://stackoverflow.com/questions/48790877/setting-persistent-environment-variables-between-multiple-calls-in-rebol-or-re>

**Asked:** 2018-02-14 15:36:15 UTC

------------------------------------------------------------------------

Is it possible to set environment variable which would persist between
multiple `call`s?

It is fine when it is part of one `call`, like in:

    >> call/wait/shell {set a=1 & echo a is %a%}
    a is 1

But I would need to have it working between multiple calls, which is
not:

    >> call/wait/shell {set b=2}
    == 0
    >> call/wait/shell {echo b is %b%}
    b is %b%
    == 0

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 3) --- by HostileFork says dont trust SE

Regardless of what language one is using: at a plain mechanical API
level\--from a child process\--it\'s not possible to set environment
variables in the parent process:

<https://stackoverflow.com/a/263068/211160>

You can use SET-ENV to set the variables in the calling process, and the
child process created by CALL will inherit them. In R3-Alpha on Linux:

    >> set-env "FOO" "10"

    >> call "echo $FOO"
    10
    == none

In Red on Windows:

    >> set-env "FOO" "10"

    >> call/shell/output "echo %FOO%" out: ""
    == 0

    >> out
    == "10^/"

If you want environment variables to persist between child process
calls, you could rig some protocol up where the child process returns
information to the parent, that lets it make the SET-ENV modification
for the next CALL to inherit.

------------------------------------------------------------------------

## Comments on question
