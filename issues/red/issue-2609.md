
#2609: Slight inconsistency in length? bitset
================================================================================
Issue is open, was reported by meijeru and has 12 comment(s).
[type.design]
<https://github.com/red/red/issues/2609>

```
>> length? charset []
== 8
>> length? charset [not]
== 0
>> length? make bitset! #{}
== 0
```
It turns out that a bitset made by `charset` without any bit positions set, does still occupy 8 bits. At first I thought it was not possible to make a bitset of length 0, but there are two ways of doing this, as shown. 


Comments:
--------------------------------------------------------------------------------

On 2020-03-21T12:50:05Z, 9214, commented:
<https://github.com/red/red/issues/2609#issuecomment-602039619>

    `bitset!` can also be constructed from `binary!` and `string!`:
    
    ```red
    >> length? charset []
    == 8
    >> length? charset ""
    == 8
    >> length? charset #{}
    == 0
    ```
    
    A few bitset tests expect `make bitset! #{00}` of length `8` as a result of the first two examples. One can wonder if forbidding bitset of length `0` is more consistent.
    
    Rebol2 behavior:
    ```red
    >> length? make bitset! []
    == 256
    >> length? make bitset! ""
    == 256
    >> length? make bitset! #{}
    == 0
    ```
    
    Rebol3:
    ```red
    >> length? make bitset! []
    == 0
    >> length? make bitset! [not]
    == 0
    >> length? make bitset! ""
    == 8
    >> length? make bitset! #{}
    == 0
    ```
    
    And then there is (in Red):
    ```red
    >> charset [[][[]]]
    == make bitset! #{00}
    >> charset [""[][""[""]]]
    == make bitset! #{00}
    ```
    
    Looking at the code, this nesting is (theoretically) unlimited and each value is processed recursively.
    
    Related: https://github.com/red/red/issues/614.
    
    I'm for modifying the tests and returning 0-length bitset (i.e. *empty* set of bits) in all cases, because the length of `8` is just a by-product of internal 1-byte allocation. I don't see any value in that though, aside from consistency.

--------------------------------------------------------------------------------

On 2020-03-21T12:56:44Z, Haxerking, commented:
<https://github.com/red/red/issues/2609#issuecomment-602040299>

    Yes for sure but when it will be {100} then it overflow as I see in the CMT
    box...
    
    
    Haxer
    
    On Sat, Mar 21, 2020, 6:20 PM Vladimir Vasilyev <notifications@github.com>
    wrote:
    
    > bitset! can also be constructed from binary! and string!:
    >
    > >> length? charset []== 8>> length? charset ""== 8>> length? charset #{}== 0
    >
    > A few bitset tests expect make bitset! #{00} of length 8 as a result of
    > the first two examples. One can wonder if forbidding bitset of length 0
    > is more consistent.
    >
    > —
    > You are receiving this because you are subscribed to this thread.
    > Reply to this email directly, view it on GitHub
    > <https://github.com/red/red/issues/2609#issuecomment-602039619>, or
    > unsubscribe
    > <https://github.com/notifications/unsubscribe-auth/AK44GZ7JQH5J4XGSWALUIQTRISZZNANCNFSM4DISBQNA>
    > .
    >

--------------------------------------------------------------------------------

On 2020-03-21T13:06:39Z, meijeru, commented:
<https://github.com/red/red/issues/2609#issuecomment-602041346>

    What "will be {100}"? There is no binary literal #{100}, one should write #{0100}. And what is the CMT box?

--------------------------------------------------------------------------------

On 2020-03-21T13:07:14Z, 9214, commented:
<https://github.com/red/red/issues/2609#issuecomment-602041411>

    @meijeru ☝️ do you have any thoughts on my recent comment?

--------------------------------------------------------------------------------

On 2020-03-21T13:09:02Z, meijeru, commented:
<https://github.com/red/red/issues/2609#issuecomment-602041595>

    I am for length 0 in all three cases.

--------------------------------------------------------------------------------

On 2020-03-21T18:24:28Z, GiuseppeChillemi, commented:
<https://github.com/red/red/issues/2609#issuecomment-602083315>

    I am for 0 in alle three cases as it is visually coherent with concept of empty content of parens and strings.
    

