
#647: Interpreter thinks '1 is a lit-word!, compiler knows better
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/647>

-=== Red Console alpha version ===-
(only ASCII input supported)

red>> type? quote '1
== lit-word!



Comments:
--------------------------------------------------------------------------------

On 2014-02-07T14:02:39Z, dockimbel, commented:
<https://github.com/red/red/issues/647#issuecomment-34438501>

    This fix, like all the other fixes on the runtime lexer, are _quick'n dirty_ fixes while waiting for the runtime lexer rewrite attempt using PARSE rules.

