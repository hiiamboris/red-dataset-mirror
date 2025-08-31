
#3554: [Parse] lax matching of ANY-WORD! values
================================================================================
Issue is open, was reported by 9214 and has 8 comment(s).
[type.design]
<https://github.com/red/red/issues/3554>

### Expected behavior
```red
>> parse [a 'a]['a 'a]
== false
>> parse [a 'a]['a quote 'a]
== true
```
### Actual behavior
```red
>> parse [a 'a]['a 'a]
== true
>> parse [a 'a]['a quote 'a]
== true
````
### Steps to reproduce the problem
See above.
### Red and platform version
```
Red 0.6.3 for Windows built 6-Oct-2018/7:28:28+05:00 commit #dafc828
```


Comments:
--------------------------------------------------------------------------------

On 2018-10-06T18:04:50Z, 9214, commented:
<https://github.com/red/red/issues/3554#issuecomment-427594558>

    Possibly related: https://github.com/red/red/issues/3483, https://github.com/red/red/issues/3029

--------------------------------------------------------------------------------

On 2019-12-02T14:21:26Z, 9214, commented:
<https://github.com/red/red/issues/3554#issuecomment-560416479>

    It's even worse. Given `parse [<input>][quote <rule>]`:
    ```red
    input 	rule 	result
    ----------------------
    word 	word 	true
    word 	'word 	true
    word 	:word 	true
    word 	word: 	true
    'word 	word 	true
    'word 	'word 	true
    'word 	:word 	true
    'word 	word: 	true
    :word 	word 	true
    :word 	'word 	false
    :word 	:word 	true
    :word 	word: 	true
    word: 	word 	true
    word: 	'word 	false
    word: 	:word 	true
    word: 	word: 	true
    ```
    
    The problem is that `quote <any-word!>` does **not** enforce `COMP_STRICT_EQUAL` comparator (both types and symbols are checked for equality) and uses the same comparator as plain `lit-word!` matching: more permissive `COMP_STRICT_EQUAL_WORD` (only symbols are checked for `lit-word! / word!` or `word! / lit-word!` cases, for other pairings it's the same as `COMP_STRICT_EQUAL`).
    
    And another problem is this: `quote <any-word!>` simply **cannot** enforce `COMP_STRICT_EQUAL`, because that implies case-sensitive comparison reserved for `case` keyword and `/case` refinement.
    
    ---
    
    This is what I expect:
    
    * For normal matching (i.e. `parse ... [<any-word!>]`). Row - input, column - rule:
    
    | | | | | |
    |:-:|:-:|:-:|:-:|:-:|
    | normal | `w` | `'w` | `:w` | `w:` |
    | `w` | x | o | x | x |
    | `'w` | x | x | x | x |
    | `:w` | x | x | x | x |
    | `w:` | x | x | x | x |
    
    In fact, only `lit-word!` match can happen, the rest are special Parse keywords and should be handled by `quote`.
    
    * For `parse ... [quote <any-word!>]`:
    
    | | | | | |
    |:-:|:-:|:-:|:-:|:-:|
    | quote | `w` | `'w` | `:w` | `w:` |
    | `w` | o | x | x | x |
    | `'w` | x | o | x | x |
    | `:w` | x | x | o | x |
    | `w:` | x | x | x | o |
    
    And this is the current state of affairs:
    
    | | | | | |
    |:-:|:-:|:-:|:-:|:-:|
    | normal | `w` | `'w` | `:w` | `w:` |
    | `w` | x | o | x | x |
    | `'w` | x | o | x | x |
    | `:w` | x | x | x | x |
    | `w:` | x | x | x | x |
    
    | | | | | |
    |:-:|:-:|:-:|:-:|:-:|
    | quote | `w` | `'w` | `:w` | `w:` |
    | `w` | o | o | o | o |
    | `'w` | o | o | o | o |
    | `:w` | o | x | o | o |
    | `w:` | o | x | o | o |

--------------------------------------------------------------------------------

On 2019-12-02T20:06:26Z, greggirwin, commented:
<https://github.com/red/red/issues/3554#issuecomment-560559106>

    Nice analysis @9214.  :+1:

--------------------------------------------------------------------------------

On 2022-05-15T11:34:42Z, hiiamboris, commented:
<https://github.com/red/red/issues/3554#issuecomment-1126916944>

    I keep writing `ahead word! 'word` instead of `'word` everywhere because of this :D

