
#558: Can't iterate over path! & paren!
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/558>

red>> foreach x 'a/b/c [print x]
a
red>> foreach x quote (i + 1) [print x]
i



