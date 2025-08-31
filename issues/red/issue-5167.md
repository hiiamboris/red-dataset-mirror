
#5167: Result of multiple parse's `collect` calls without enclosing `collect`
================================================================================
Issue is closed, was reported by Oldes and has 18 comment(s).
[status.dismissed] [type.review]
<https://github.com/red/red/issues/5167>

When used multiple `collect` calls in line without upper `collect` level, the result is:
```red
>> parse [1 2 3][collect keep integer! collect keep integer! collect keep integer!]
== [1 [2] [3]]
```
The second and third `collect` reuses the first `collect` block.
The result should be `[1 2 3]` or `[[1] [2] [3]]` like with:
```red
>> parse [1 2 3][collect [collect keep integer! collect keep integer! collect keep integer!]]
== [[1] [2] [3]]
```
Or it should throw an error.

https://gitter.im/red/parse?at=62d97f0a76cd751a2f595a43




Comments:
--------------------------------------------------------------------------------

On 2022-07-21T21:45:23Z, Oldes, commented:
<https://github.com/red/red/issues/5167#issuecomment-1191965951>

    Also these results are suspicious:
    ```red
    >> parse [1 2 3] [collect [keep integer!] collect [keep 2 integer!]]
    == [1 [[2 3]]] ;= expected [1 [2 3]]
    >> parse [1 2 3] [collect [keep 2 integer!] collect [keep integer!]]
    == [[1 2] [3]] ;= expected [[1 2] 3]
    >> parse [1 1 2 2] [collect [keep 2 integer!] collect [keep 2 integer!]]
    == [[1 1] [[2 2]]] ;= expected [[1 1] [2 2]]
    ```

--------------------------------------------------------------------------------

On 2022-07-22T08:33:57Z, toomasv, commented:
<https://github.com/red/red/issues/5167#issuecomment-1192324296>

    I disagree.
    
    First `collect` creates the top collection block. Everything else collected/kept should be included in this block. Each new `collect` creates a new collection block that will be included in the previous level collection block. Multi-element parts of series are kept as single element, unless `pick` is used. Therefore `collect ... collect keep 2 skip` should result in `[... [[? ?]]]`.
    
    To get what you expect, use proper syntax:
    ```
    >> parse [1 2 3][collect some [collect keep integer!]]
    == [[1] [2] [3]]
    >> parse [1 2 3][collect some [keep copy _ integer!]]
    == [[1] [2] [3]]
    >> parse [1 2 3] [collect [keep integer! keep 2 integer!]]
    == [1 [2 3]]
    >> parse [1 2 3] [collect [keep 2 integer! keep integer!]]
    == [[1 2] 3]
    >> parse [1 1 2 2] [collect [keep 2 integer! keep 2 integer!]]
    == [[1 1] [2 2]]
    ```

--------------------------------------------------------------------------------

On 2022-07-22T08:43:27Z, toomasv, commented:
<https://github.com/red/red/issues/5167#issuecomment-1192332410>

    And it is consistent with [docs](https://github.com/red/docs/blob/master/en/parse.adoc#393-collect): 
    
    > First use of collect allocates a new block that is returned by parse function, any subsequent collect allocates at the tail of its predecessor’s block

--------------------------------------------------------------------------------

On 2022-07-22T09:42:26Z, endo64, commented:
<https://github.com/red/red/issues/5167#issuecomment-1192385766>

    I agree with @toomasv , each `collect` should open a new block and collect into that block.

--------------------------------------------------------------------------------

On 2022-07-22T14:27:43Z, hiiamboris, commented:
<https://github.com/red/red/issues/5167#issuecomment-1192632127>

    I agree with @oldes that this syntax is confusing. And IMO it should be forbidden to close this question.
    Like everyone points out, *there is a correct syntax* that is readable and doesn't require the reader of the rules to have a Parse emulator built in his brain to figure out the result. 
    So why are we allowing *incorrect* syntax? There is zero gain that I see.

--------------------------------------------------------------------------------

On 2022-07-22T19:43:59Z, toomasv, commented:
<https://github.com/red/red/issues/5167#issuecomment-1192884620>

    IMO, the syntax above is not incorrect *per se*, it is incorrect for given purpose/expectation. 

--------------------------------------------------------------------------------

On 2022-07-22T20:09:08Z, hiiamboris, commented:
<https://github.com/red/red/issues/5167#issuecomment-1192900011>

    My only expectation is it should be used by *humans*! ;)
    Then we design for humans.
    If not, skynet will handle it just fine...

--------------------------------------------------------------------------------

On 2022-07-23T08:52:09Z, Oldes, commented:
<https://github.com/red/red/issues/5167#issuecomment-1193089693>

    Here is related issue... when used multiple collects without enclosing one and the second used `set`, than parse ignores the first collect:
    ```red
    >> parse [1 2][collect keep skip collect set x keep skip]
    == true
    >> x
    == [2]
    ```
    is practically same like:
    ```red
    >> parse [1 2][skip collect set x keep skip]
    == true
    >> x
    == [2]
    ```

--------------------------------------------------------------------------------

On 2022-08-21T15:37:05Z, dockimbel, commented:
<https://github.com/red/red/issues/5167#issuecomment-1221569024>

    > Here is related issue... when used multiple collects without enclosing one and the second used set, than parse ignores the first collect.
    
    You are using two conflicting modes: one returns the collected block, the second returns a `true/false` value from `parse`. The first `collect` sets the first mode, then it is overridden by the second `collect`. It works as described in the [documentation](https://github.com/red/docs/blob/master/en/parse.adoc#collect):
    
    > If collect is used without into or after option in any of the rules, parse function will return a block of collected values (see [Parsing modes](https://github.com/red/docs/blob/master/en/parse.adoc#parsing-modes)); if top-level collect is used with set option, parse will return logic! value as usual.
    
    As there is no bug or issue to fix there, I'll close this ticket. Feel free to open a REP ticket with a proposition to improve the way `collect` works.

