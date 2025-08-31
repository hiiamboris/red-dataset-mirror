
#3185: DOC: Red/System docs say struct! may not contain pointer to float!
================================================================================
Issue is closed, was reported by meijeru and has 0 comment(s).
[status.built] [type.documentation]
<https://github.com/red/red/issues/3185>

The definition in 4.7.1. restricts field types to pointer! to integer! or byte!. This does not correspond to reality, pointer! [float!] and pointer! [float32!] are accepted by the compiler.


