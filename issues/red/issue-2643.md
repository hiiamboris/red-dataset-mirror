
#2643: DOC: Red/System functions may have alias struct! names as types in their specification
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[status.built] [type.documentation]
<https://github.com/red/red/issues/2643>

The current formulation of section 6.1 of the Red/System doc gives the impression that this is not allowed.


Comments:
--------------------------------------------------------------------------------

On 2017-07-28T11:45:11Z, dockimbel, commented:
<https://github.com/red/red/issues/2643#issuecomment-318631461>

    Aliases can be used anywhere, the 4.7.5 section says:
    > Struct! values definitions tend to be quite long, so in some cases, when struct! definitions are required to be inserted in other struct! definitions or in functions specification block, it is possible to use an alias name to reference a struct! definition through the source code.
    
    
    I am not sure if `alias` needs to be added everywhere in all the specs in the document, to show to the readers that aliases can be used in any type declaration, when it is already stated above. Maybe just need to make that above statement more explicit?

