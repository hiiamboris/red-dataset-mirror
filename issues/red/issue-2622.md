
#2622: function with lit-word as formal argument behaves differently from Rebol
================================================================================
Issue is closed, was reported by meijeru and has 12 comment(s).
<https://github.com/red/red/issues/2622>

A lit-word formal argument induces non-evaluation of the actual argument, and should therefore also prevent the evaluation of the infix operator expression. Rebol does this, but Red gives an error.

Rebol:
```
>> f: func ['a][2 * a]
>> probe :f
func ['a][2 * a]
>> f 1
== 2
>> f 1 + 2
== 4   ;; not 6!
```
Red:
```
>> f: func['a][2 * a]
== func ['a][2 * a]
>> f 1
== 2
>> f 1 + 2
*** Script Error: + operator is missing an argument
*** Where: catch
```




Comments:
--------------------------------------------------------------------------------

On 2017-05-17T13:59:14Z, meijeru, commented:
<https://github.com/red/red/issues/2622#issuecomment-302098809>

    Related: `quote +` does not work, i.e. operators do not behave like other words. E.g. `quote !` is `!`.

--------------------------------------------------------------------------------

On 2017-07-03T13:55:44Z, dockimbel, commented:
<https://github.com/red/red/issues/2622#issuecomment-312652105>

    Related to #1850.

--------------------------------------------------------------------------------

On 2019-09-27T20:41:54Z, greggirwin, commented:
<https://github.com/red/red/issues/2622#issuecomment-536089733>

    Between Rebol and Red, which behavior is better? Breaking the rule of op! precedence, or stopping you rather than giving you an unexpected result? I vote for the latter.
    
    My view, and let's document this somewhere, is that it's a current limitation. Lit args are...necessary but not easy. They have specific purposes and benefits (big ones), but may be confusing. There's an easy, if imperfect solution: Fix it with language. Tell people that if they're going to use lit args, there are guidelines <create document for this>, and one of them is to always include a type check for the arg. e.g.
    ```
    >> f: func ['w [word!]][2  * w]
    == func ['w [word!]][2 * w]
    >> f 1 + 2
    *** Script Error: f does not allow integer! for its 'w argument
    *** Where: f
    *** Stack: f
    ```
    How does that sound?

--------------------------------------------------------------------------------

On 2019-09-27T20:53:17Z, 9214, commented:
<https://github.com/red/red/issues/2622#issuecomment-536092947>

    > Related: `quote +` does not work, i.e. operators do not behave like other words. E.g. `quote !` is `!`.
    
    This has been fixed (see https://github.com/red/red/issues/3840).

--------------------------------------------------------------------------------

On 2019-09-28T17:47:38Z, meijeru, commented:
<https://github.com/red/red/issues/2622#issuecomment-536210591>

    I refer to the conversation in Gitter red/help chat, and close this issue. 

--------------------------------------------------------------------------------

On 2019-09-28T17:52:28Z, 9214, commented:
<https://github.com/red/red/issues/2622#issuecomment-536210949>

    For the reference, said conversation starts somewhere [here](https://gitter.im/red/help?at=5d8e1f5a66c8b4512228a09d).

