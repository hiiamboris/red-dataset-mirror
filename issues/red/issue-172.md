
#172: Typed functions don't pass aliases
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 14 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/172>

The type passed for an alias is still type-struct! so detecting aliases doesn't work.

Actually, I still need to be able to test for a generic struct! type, whether alias or not, otherwise some code would have to explicitly handle many more cases. Alias IDs need to be some sort of subtype of struct!.



Comments:
--------------------------------------------------------------------------------

On 2011-09-08T14:29:41Z, dockimbel, commented:
<https://github.com/red/red/issues/172#issuecomment-2040213>

    The current rule is to pass `type-struct!` ID for a variable declared using `struct!` and the alias ID for a variable declared using an alias.
    
    It seems to work as expected here:
    
    ```
    handle!: alias struct! [value [integer!]]
    s: declare handle!
    
    probe: func [
        [typed] count [integer!] list [typed-value!]
    ][
        until [
            print [list/type lf]
            list: list + 1
            count: count - 1
            zero? count
        ]
    ]
    probe [1 "r" s 123]
    ```
    
    outputs:
    
    ```
    2
    4
    1006
    2
    ```
    
    Alias ID values are > 1000.
    
    So I don't see any issue there.
    
    About your request for being able to test for a generic struct! type, it can be added easily.

--------------------------------------------------------------------------------

On 2011-09-08T20:10:32Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/172#issuecomment-2044079>

    In my code type-struct! is still passed instead of the alias code, but I can't continue with it until #173 is fixed.

--------------------------------------------------------------------------------

On 2011-09-08T22:46:38Z, dockimbel, commented:
<https://github.com/red/red/issues/172#issuecomment-2045997>

    From commit [2ec8fc62](https://github.com/dockimbel/Red/commit/2ec8fc62ced5737a4e7e70c94cd3ae29a183ca35), you can now test all following cases:
    - struct! type strictly: `type = type-struct!`
    - aliased struct!: `type = <alias-name>`
    - struct! type or alias: `any-struct? type`
    
    Note that `any-struct!` is a macro defined as:`#define any-struct?  [1000 <=]`

--------------------------------------------------------------------------------

On 2011-09-09T19:41:42Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/172#issuecomment-2055005>

    Thanks. I've incorporated those enhancements, but this is another bug that disappears when you strip down the code to an example, so I've checked in extra debugging in the binding that prints the type code of arguments to the window function. Please try something like this:
    
    ```
    #include %GTK.reds
    gtk-begin
    gtk-view window icon "icon.png"
    ```
    
    It should pass the code for the gdk-image! alias, but it shows that the generic type-struct! is passed instead.

--------------------------------------------------------------------------------

On 2011-09-09T21:04:43Z, dockimbel, commented:
<https://github.com/red/red/issues/172#issuecomment-2055773>

    Thanks, I can now reproduce the issue.

--------------------------------------------------------------------------------

On 2011-09-09T21:25:08Z, dockimbel, commented:
<https://github.com/red/red/issues/172#issuecomment-2055947>

    The `typed` attribute really requires a full set of unit tests for all possible ways to pass a value as argument. I am letting this ticket opened until the tests are written.

--------------------------------------------------------------------------------

On 2011-09-09T22:34:08Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/172#issuecomment-2056468>

    The behaviour is still the same for me.

