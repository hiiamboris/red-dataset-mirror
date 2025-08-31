
#3454: It is possible to define function using malformed specification
================================================================================
Issue is closed, was reported by Oldes and has 14 comment(s).
<https://github.com/red/red/issues/3454>

### Expected behavior
```
>> f: func[a return: [integer!] c /local b][]
*** Some Error: malformed function specification
```
### Actual behavior
```
>> f: func[a return: [integer!] c /local b][]
== func [a return: [integer!] c /local b][]
>> ? f
Func spec couldn't be parsed, may be malformed.
func [a return: [integer!] c /local b][]
```



Comments:
--------------------------------------------------------------------------------

On 2018-07-03T19:18:13Z, greggirwin, commented:
<https://github.com/red/red/issues/3454#issuecomment-402265331>

    Your Expected example should not fail. It's valid syntax, just not used yet. `Function!` checks for set-words in the spec, but not specifically for `return:`.

--------------------------------------------------------------------------------

On 2018-07-09T22:09:25Z, greggirwin, commented:
<https://github.com/red/red/issues/3454#issuecomment-403636264>

    Ah, I skimmed way too fast before. My fault. I see what you mean now.

--------------------------------------------------------------------------------

On 2018-07-09T22:10:08Z, greggirwin, commented:
<https://github.com/red/red/issues/3454#issuecomment-403636439>

    I thought this was a `help` issue, but it's not. 

--------------------------------------------------------------------------------

On 2018-07-09T22:14:36Z, greggirwin, commented:
<https://github.com/red/red/issues/3454#issuecomment-403637387>

    `Validate` in %function.reds does say ";-- temporary mimalist spec checking". 

--------------------------------------------------------------------------------

On 2018-07-09T23:32:00Z, greggirwin, commented:
<https://github.com/red/red/issues/3454#issuecomment-403651848>

    I think I have this fixed. Just working on tests now.

--------------------------------------------------------------------------------

On 2018-07-09T23:32:40Z, greggirwin, commented:
<https://github.com/red/red/issues/3454#issuecomment-403651946>

    The compiler seems to have different checks than the interpreter, and catches things differently. Note that we should sync those up.

--------------------------------------------------------------------------------

On 2018-07-10T02:26:57Z, greggirwin, commented:
<https://github.com/red/red/issues/3454#issuecomment-403679086>

    @Oldes, we clearly need to define func specs more...clearly, per the chat in red/tests with Peter.

