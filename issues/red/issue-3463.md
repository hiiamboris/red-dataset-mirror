
#3463: make path! <spec> is insufficiently constrained
================================================================================
Issue is closed, was reported by meijeru and has 22 comment(s).
<https://github.com/red/red/issues/3463>

### Expected behavior
`type? load mold make path! <spec>` should be `path!` when `<spec>` conforms to the rules for path components, and give an error otherwise
### Actual behavior
```
>> type? load mold make path! [a b]
== path!
>> type? load mold make path! [a]
== word!
>> type? load mold make path! []
== block!
>> type? load mold make path! [1 2 3]
== date!
```
In other words, using `make` one may produce `path!` values that cannot be properly evaluated as paths. The case of single or zero compenent paths has been discussed already, but the paths starting with an integer are even more problematic.
### Steps to reproduce the problem
execute above code
### Red and platform version
```
all
```


Comments:
--------------------------------------------------------------------------------

On 2018-07-26T10:16:04Z, bitbegin, commented:
<https://github.com/red/red/issues/3463#issuecomment-408049537>

    so `make path! []` and `make path! [1 2 3]` should give an error?

--------------------------------------------------------------------------------

On 2018-07-26T12:36:05Z, meijeru, commented:
<https://github.com/red/red/issues/3463#issuecomment-408082504>

    For me yes. Others may argue that in certain dialects there is a use for such strange paths, but for me, blocks would serve that purpose equally well.

--------------------------------------------------------------------------------

On 2018-07-27T02:00:02Z, bitbegin, commented:
<https://github.com/red/red/issues/3463#issuecomment-408288367>

    but i also think "1/2/3" can be useful for some situations. 

--------------------------------------------------------------------------------

On 2018-07-27T02:27:32Z, greggirwin, commented:
<https://github.com/red/red/issues/3463#issuecomment-408292331>

    R2 throws an error but R3 does not. I don't know that we can have a hard and fast, universal about load/mold being exact inverses, as some questions may still be open on design. e.g. if we wanted to use path syntax for unit values (`1/mm`, `20/km/h`) that would conflict. We *do* need to know what the rules are, and what's dangerous or ambiguous. `Mold/all` when available, may solve the biggest problem here.
    
    I vote for keeping things as they are, at this point.

--------------------------------------------------------------------------------

On 2018-07-27T04:28:39Z, dockimbel, commented:
<https://github.com/red/red/issues/3463#issuecomment-408307962>

    `1/2/3` is already a `date!` value, so cannot be used to represent a path:
    ```
    >> 1/2/3
    == 1-Feb-2003
    ```

--------------------------------------------------------------------------------

On 2018-07-27T05:15:45Z, greggirwin, commented:
<https://github.com/red/red/issues/3463#issuecomment-408313817>

    So, in Red, do we define a hard and fast, universal rule about load/mold being exact inverses? Put another way, knowing it's possible to produce something that doesn't do that, do we block all other uses? The 3 number case is unique in its conflict with dates. 
    
    Do we lock things down, or fix it with language and say "Here's how this works. You've been warned." ? 
    In some ways it's a question of when we catch the problem. e.g.
    ```
    >> load mold to issue! "%"
    *** Syntax Error: invalid issue! at "#%"
    *** Where: do
    *** Stack: load  
    ```
    And, an unrelated, much uglier question...do we want to keep that date format? I know. I know. It's so common. I'm afraid we may be stuck with it.

--------------------------------------------------------------------------------

On 2018-07-27T05:20:30Z, greggirwin, commented:
<https://github.com/red/red/issues/3463#issuecomment-408314407>

    As even more of a Devil's Advocate (it's late and I'm feeling ornery), what's the shortest way to *intentionally* create a date of the form mm/dd/yyyy or yyyy/mm/dd, given 3 values?

--------------------------------------------------------------------------------

On 2018-07-27T08:24:17Z, dockimbel, commented:
<https://github.com/red/red/issues/3463#issuecomment-408349015>

    > So, in Red, do we define a hard and fast, universal rule about load/mold being exact inverses? Put another way, knowing it's possible to produce something that doesn't do that, do we block all other uses? 
    
    That's a big question. Having a fully symetrical `load` and `mold` would mean forbidding a lot of possible values that would not have a proper literal representation. My current position is that the syntactic rules should not restrict the possible space for allowed values, because then building composite values can become very difficult and would put some new burden on the users. Moreover, it might be very costly and/or very complex to implement such restrictions, and it also would look like an artificial limitation of the language semantics. Though, I am aware that such option is also not fully satisfying, there's a missing piece we need to add there.
    
    Redbin will provide a fully re-loadable representation of the Red values, but in binary format, not in human-readable format, because that would not be doable (the Rebol's construction syntax cannot cover all the properties of each datatype, like binding for example).

--------------------------------------------------------------------------------

On 2018-08-03T23:57:27Z, greggirwin, commented:
<https://github.com/red/red/issues/3463#issuecomment-410404221>

    @meijeru, given @dockimbel's comment, can we close this ticket, and make notes of what we need to address in docs?

--------------------------------------------------------------------------------

On 2018-08-04T09:49:02Z, meijeru, commented:
<https://github.com/red/red/issues/3463#issuecomment-410437672>

    I suppose so, but some of these considerations should not only go into the docs, but also inform the design of the construction syntax.

--------------------------------------------------------------------------------

On 2018-08-04T15:56:26Z, greggirwin, commented:
<https://github.com/red/red/issues/3463#issuecomment-410458805>

    Sure. Thanks.

