
#899: Colons at set-word positions in paths at any position cause path to become set-path
================================================================================
Issue is closed, was reported by hostilefork and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/899>

Red doesn't raise a complaint about this, it just makes the whole thing a set-path:

```
red> p: [a/b:/c]
== [a/b/c:]

red> type? first p
== set-path!
```

Rebol has a weird result:

```
>> p: [a/b:/c]
[a/b:/c]

>> probe type? second first p
== url!
```

Rather than "fix" it to be consistent with Rebol, I propose that "set-words" be disallowed inside path parsing--and that Rebol do the same.  Nothing should stop you from putting them there programmatically...but then special syntax would be needed when they were molded out (along with the entire category of problems of that nature).



