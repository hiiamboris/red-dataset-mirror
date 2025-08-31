
#4744: Escaped char is never terminated in binary syntax when used in console
================================================================================
Issue is closed, was reported by Oldes and has 16 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/4744>

**Before submitting**
[dedicated chat](https://gitter.im/red/bugs?at=5fce24fe75f7397e29fb1b73)

**Describe the bug**
```red
>> {^/} ;<--- it's ok with string!
== "^/"
>> #{^/} ;<--- but not with binary (enters multi-line input)
{    
(escape) ;<-- one must hit ESC to exit
```
It is possible to load it as:
```red
>> load "#{^/}"
== #{}
```

**Platform version**
commit: dcadff1e895a4d26e831d53667192b4a50c96d2b



Comments:
--------------------------------------------------------------------------------

On 2020-12-07T13:07:47Z, hiiamboris, commented:
<https://github.com/red/red/issues/4744#issuecomment-739907464>

    I still think `^/` syntax has nothing to do with `binary!`.
    In `load "#{^/}"` example, `^/` is interpreted when lexing `string!`, not when lexing `binary!` (which receives a single LF char, not two `^` and `/` chars as input).

--------------------------------------------------------------------------------

On 2020-12-07T14:10:34Z, Oldes, commented:
<https://github.com/red/red/issues/4744#issuecomment-739941573>

    Maybe I should use better char, not a LF. 
    ```red
    >> load "#{^(00)}"
    *** Syntax Error: (line 1) invalid binary at #{}
    *** Where: transcode
    *** Stack: load  
    
    >> #{^(00)}
    {    
    {    
    (escape)
    ```

--------------------------------------------------------------------------------

On 2020-12-07T14:11:40Z, Oldes, commented:
<https://github.com/red/red/issues/4744#issuecomment-739942324>

    I don't say I expect these escaped chars to be supported... I expect that console will throw an error in both cases.

--------------------------------------------------------------------------------

On 2020-12-07T15:58:43Z, Oldes, commented:
<https://github.com/red/red/issues/4744#issuecomment-740008554>

    On the other side... one should be able to copy code like: `#{00} = 2#{0000^-0000}` and paste it into console to see the result.

--------------------------------------------------------------------------------

On 2020-12-07T20:35:06Z, hiiamboris, commented:
<https://github.com/red/red/issues/4744#issuecomment-740164873>

    You will copy a binary tab, not `^-`

--------------------------------------------------------------------------------

On 2020-12-07T22:09:50Z, Oldes, commented:
<https://github.com/red/red/issues/4744#issuecomment-740210386>

    No... if I copy it from source code (which is valid use now) I will have `^-` and not a binary tab.

--------------------------------------------------------------------------------

On 2021-01-18T22:01:42Z, zwortex, commented:
<https://github.com/red/red/issues/4744#issuecomment-762488940>

    The following sequence has the same effect : 
    ```
    a: #{ name: "john" family: "doe" }
    ```
    
    see chat with @hiiamboris for more details
    https://gitter.im/red/bugs?at=600603d58816425540d5df4a

--------------------------------------------------------------------------------

On 2021-03-25T21:30:13Z, Oldes, commented:
<https://github.com/red/red/issues/4744#issuecomment-807526931>

    Another case: type in console `<@` and than hit enter.

