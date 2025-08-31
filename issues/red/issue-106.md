
#106: alias names are not checked for uniqueness
================================================================================
Issue is closed, was reported by meijeru and has 4 comment(s).
[status.built] [status.tested]
<https://github.com/red/red/issues/106>

The compiler currently accepts duplicate definitions of alias names, and adds them to the list cheerfully. Since this list is a hash, I am not sure which definition will be chosen when the name is used (in a small example it was the first one).

Besides, it would be worthwhile pointing out in the documentation, that alias names form a namespace of their own and that they are "global", i.e. not scoped.



Comments:
--------------------------------------------------------------------------------

On 2011-06-24T10:44:15Z, dockimbel, commented:
<https://github.com/red/red/issues/106#issuecomment-1431614>

    Good points.

--------------------------------------------------------------------------------

On 2011-06-26T15:44:44Z, dockimbel, commented:
<https://github.com/red/red/issues/106#issuecomment-1441622>

    A compilation error is now raised on attempt to define twice an alias with the same name. A note was added also in the specification draft about the separate namespace.

