
#3843: removal of Parse THEN keyword
================================================================================
Issue is closed, was reported by 9214 and has 2 comment(s).
[status.built] [status.tested] [status.reviewed]
<https://github.com/red/red/issues/3843>

**Describe the bug**
`then` supposed to work as follows: `[a then b | c | d]`
* if `a` fails, backtrack to the beginning of `a` and try `c`
* if `a` matches but `b` fails, backtrack to the beginning of `a` and try  `d` (effectively jumping over `c`)
* if both `a` and `b` match, then whole rule returns success

Instead, in Red it's implemented as:
* if either `a` or `b` fails, backtrack to the beginning of `a` and try `c`
* if `c` fails, backtrack to the beginning of `a` and try `d`

Thus, in Red, `[a then b | c | d]` is equivalent to `[a b | c | d]` and `then` by itself is useless.

**To reproduce**

R3:
```rebol
>> parse [a b]['x then whatever | (probe 1) 'a 'b | Parse won't go here anyways]
1
== true
>> parse [a b]['a then 'x | Parse won't go here anyways | (probe 2) 'a 'b]
2
== true
>> parse [a b c][['a then 'b | Parse won't go here anyways | And won't go here either] 'c]
== true
```

Red:
```red
>> parse [a b]['x then whatever | (probe 1) 'a 'b | Parse won't go here anyways]
1
== true
>> parse [a b]['a then 'x | (probe 1) 'a 'b | Parse is expected to go here but won't]
1
== true
>> parse [a b]['a then 'x | (probe 1) 'x | (probe 2) 'a 'b]
1
2
== true
>> parse [a b]['a 'x | (probe 1) 'x | (probe 2) 'a 'b]
1
2
== true
```
**Expected behavior**

One can argue that Red should follow R3 behavior, but, in the past, `then` was frequently criticized as rather obscure and useless idiom (see [this](https://gitter.im/red/parse?at=5ca2c71dbd70a40d5fde8eaf) discussion in Gitter chat for reference), even though it mimicks conventional `if then else` branching behavior, where position of a failed rule (`1st then 2nd`) decides which out of two alternate branches to pick up.

Moreso, @dockimbel himself mentioned many times that it is improperly implemented and should rather be removed (see [this](https://gitter.im/red/help?at=59d205da7b7d98d30d606143) message and https://github.com/red/red/issues/735). 

Community vote (again, see [this](https://gitter.im/red/help?at=59d205da7b7d98d30d606143) discussion) decided to remove `then` and perhaps reserve it for the future.

**Platform version (please complete the following information)**

Latest version.


Comments:
--------------------------------------------------------------------------------

On 2019-04-18T15:33:18Z, dockimbel, commented:
<https://github.com/red/red/issues/3843#issuecomment-484563476>

    Is there any Rebol code that relies on `then`? I don't remember ever seeing anyone use it in R3 either...
    
    In its current form, `then` seems to have too complicated semantics to be really useful. So, I will proceed with the removal, as proposed by this ticket.

