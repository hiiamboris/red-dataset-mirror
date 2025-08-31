
#2862: minor inconsistency in accepted types in make date! vs make time!
================================================================================
Issue is closed, was reported by meijeru and has 0 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/2862>

Both allow a `block!` value as argument, but `make time!` actually also accepts a `paren!` or `hash!` value, while `make date!` does not.


