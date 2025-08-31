
#3553: DO FUNCTION! avoids evaluation
================================================================================
Issue is closed, was reported by 9214 and has 26 comment(s).
<https://github.com/red/red/issues/3553>

### Expected behavior
Same as in R2 and R3.
```red
>> do func [x y][x + y] 1 2
== 3
>> do :append [a b c] 'd
== [a b c d]
```

### Actual behavior
```red
>> do func [x y][x + y] 1 2
== 2
>> do :append [a b c] 'd
== d
```
### Steps to reproduce the problem
See above. I recall @dockimbel saying at some point that he is [happy](https://gitter.im/red/help?at=5ab285275f188ccc15df954b) with this intended (?) change, but I believe that it should be reverted, unless there exist strong arguments for its presence. Should `apply` surpass it completely? 

### Red and platform version
```
Red 0.6.3 for Windows built 6-Oct-2018/7:28:28+05:00 commit #dafc828
```


Comments:
--------------------------------------------------------------------------------

On 2018-10-06T19:00:17Z, meijeru, commented:
<https://github.com/red/red/issues/3553#issuecomment-427598346>

    Remember that `do` has exactly one argument.
    
    The current rules for `do` are ([specs section 7.6])(https://github.com/meijeru/red.specs-public/blob/master/specs.adoc#function-code-do-code):
    The built-in function do will evaluate its argument, which may be of any type, as follows:
    * if the argument is a `block!` value, the block will be executed as described in section 7.1
    * if the argument is a ``string!` value, the built-in function load (see section 11.1.1) will be invoked on the string, and do will be invoked on the result
    * if the argument is a `url!` or `file!` value, this should contain a text which is a valid Red program (see section 3); the text string will be obtained by `read` (see section 11.3.1) and the previous step will be taken
    * if the argument is an `error!` value, the error will be raised (see section 12.1.2)
    * otherwise, the argument will be evaluated according to the appropriate rule of section 7
    
    According to the last point a function value is evaluated to a function, but not applied. It would be hard to know how many subsequent expressions to take into account in trying to *apply*  the function rather than *evaluate* it.

--------------------------------------------------------------------------------

On 2018-10-06T19:12:31Z, 9214, commented:
<https://github.com/red/red/issues/3553#issuecomment-427599112>

    In my book `function!` value, once evaluated, eats as many arguments as prescribed in its specification. `do` evaluates its argument, ergo, if its argument is a `function!`, then it should be applied to subsequent expressions, as many as needed. And this is always a fixed-arity case - `do` takes one `function!`, and `function!` takes as many arguments as it needs, again, always a fixed amount.
    
    ```red
    >> block: head insert reduce [func [x y][x + y] 1 2] 'do
    == [do func [x y][x + y] 1 2]
    >> type? second block
    == function!
    >> do block
    == 3
    ```
    
    > According to the last point a function value is evaluated to a function, but not applied
    
    I think you are mistaken here, because in such case any function call will evaluate just to `function!` itself, without any application:
    ```red
    >> add 1 2
    == 2 
    ```
    `add` yields `action!` (_a function value is evaluated to a function_), `1` and `2` yield `integer!`s, the result of last expression is returned.
    
    For sanity check, and to make sure that we're reading the same document, [§ 7.4.1](https://github.com/meijeru/red.specs-public/blob/master/specs.adoc#741-function-type) describes evaluation rules for `function!` datatype:
    
    > If the function does not have any arguments (optional or not), **execute the body of the function to yield the result of the function**.
    
    > If the function has any arguments (optional or not) <...> **Execute the body of the function to yield the result of the function. <...>**
    
    And per [§ 7.6](https://github.com/meijeru/red.specs-public/blob/master/specs.adoc#function-code-do-code):
    
    > The built-in function `do` **will evaluate its argument**, which may be of any type, as follows: <...> otherwise, **the argument will be evaluated according to the appropriate rule of section 7** _**(i.e. § 7.4.1)**_
    
    So, either term "evaluation" is consistent across whole language and Red should follow R2 and R3 behavior, or `do`'s "evaluation" and _just_ "evaluation" somehow differ from one another, and `do` should, for some reason, cease to apply evaluation rules to `function!` (`any-function!` ?) argument.

--------------------------------------------------------------------------------

On 2018-10-06T19:32:10Z, meijeru, commented:
<https://github.com/red/red/issues/3553#issuecomment-427600424>

    Your above text does not come out of Red. The answer 3 is what you would like, perhaps, but what Red gives is 2.
    ```
    >>block: [do func [x y][x + y] 1 2]
    >>do block
    == 2
    ```
    The function *itself*  knows how many arguments to take, but `do` does not. It sees only one argument, the function.

--------------------------------------------------------------------------------

On 2018-10-06T19:37:13Z, 9214, commented:
<https://github.com/red/red/issues/3553#issuecomment-427600759>

    > Your above text does not come out of Red
    
    I beg to differ:
    ```red
    >> about
    Red 0.6.3 for Windows built 6-Oct-2018/7:28:28+05:00 commit #dafc828
    
    >> block: head insert reduce [func [x y][x + y] 1 2] 'do
    == [do func [x y][x + y] 1 2]
    >> type? second block
    == function!
    >> do block
    == 3
    ```

--------------------------------------------------------------------------------

On 2018-10-06T19:39:35Z, meijeru, commented:
<https://github.com/red/red/issues/3553#issuecomment-427600899>

    Curious! 
    ```
    >> about
    Red 0.6.3 for Windows built 2-Oct-2018/5:13:15+02:00 commit #bceaf7c
    
    >> block: [do func [x y][x + y] 1 2]
    == [do func [x y] [x + y] 1 2]
    >> do block
    == 2
    ```

--------------------------------------------------------------------------------

On 2018-10-06T19:42:07Z, meijeru, commented:
<https://github.com/red/red/issues/3553#issuecomment-427601058>

    Should the difference be in your use of `reduce` to construct the block? We are into very subtle questions here.

--------------------------------------------------------------------------------

On 2018-10-06T19:42:14Z, 9214, commented:
<https://github.com/red/red/issues/3553#issuecomment-427601068>

    > The function itself knows how many arguments to take, but do does not. It sees only one argument, the function.
    
    Yes, `do` evaluates its one and the only argument, which is a `function!`. According to evaluation rules, which you yourself rigorously described, `function!` value on evaluation should be executed, and its arguments (if any) should be consumed in the process.

--------------------------------------------------------------------------------

On 2018-10-06T19:43:56Z, 9214, commented:
<https://github.com/red/red/issues/3553#issuecomment-427601176>

    > Should the difference be in your use of reduce to construct the block? We are into very subtle questions here.
    
    Perhaps. Since `func` is a function itself....
    
    In your case `do` evaluates `func` (a `native!`), which itself yields a `function!`. In my case `function!` is already there. `func` on evaluation indeed consumes two of its arguments (spec with body), executes `native!`s body and yields the result, either with or without `do` preceding it. 
    
    This suggests that Red is more consistent than R2 and R3..?

--------------------------------------------------------------------------------

On 2018-10-06T19:54:41Z, meijeru, commented:
<https://github.com/red/red/issues/3553#issuecomment-427601840>

    Looking at the source code, I see that in the default case (last bullet in my spec) which includes functions, *passive evaluation* is prescribed (i.e. for functions, no application). So this is where the design choice resides. I need to adjust (refine) the spec to stress that. Of course we can always make a wish to change it

--------------------------------------------------------------------------------

On 2018-10-06T20:13:25Z, 9214, commented:
<https://github.com/red/red/issues/3553#issuecomment-427603031>

    @meijeru as I said, I think this is an intended design choice, and any such wish will be tossed out in favor of more general `apply` (and because it consistently follows evaluation logic which I described earlier). As such (and since you took a note on this), I'm closing the ticket.

--------------------------------------------------------------------------------

On 2018-10-12T11:57:16Z, 9214, commented:
<https://github.com/red/red/issues/3553#issuecomment-429301450>

    In light of the recent [Gitter discussion](https://gitter.im/red/bugs?at=5bc08579435c2a518e941f09) (also see [here](https://gitter.im/red/help?at=5bb8f4e5c7bf7c3662c6f04b)) I'm reopening the issue. It still buzzes me that this change should be reverted, as R2 and R3 behavior seems to be more simple and consistent. 
    
    ☝️  discussion above should provide enough food for thought.

--------------------------------------------------------------------------------

On 2018-10-12T22:07:03Z, 9214, commented:
<https://github.com/red/red/issues/3553#issuecomment-429476014>

    Quoting Doc response:
    
    > One evolution that R3 started and that Red is continuing is the elimination of variable-arity behaviors. R3 eliminated it in `make` and Red pushed the consistency by forbidding it from `do` too. So, the cases where `do` could consume an arbitrary number of argument values following it are forbidden. The goal was to make R3/Red more easily statically analyzable.
    
    ... except that `do function!` never actually consumes an arbitrary number of arguments. It consumes one argument, which, in turn, consumes fixed number of arguments. Nonetheless, static analysis is a solid argument. I'll wait for @dockimbel's final call.

--------------------------------------------------------------------------------

On 2018-10-19T19:36:14Z, dockimbel, commented:
<https://github.com/red/red/issues/3553#issuecomment-431475341>

    > ... except that do function! never actually consumes an arbitrary number of arguments. 
    
    In Rebol, it does:
    ```
    do func [x y][x + y] 1 2
    ```
    `do` consumes 3 arguments there: a function! value and two integers.
    ```
    do :append [a b c] 'd
    ```
    `do` consumes 4 arguments there: a function! value, a block and a word.
    
    In the following case, `do` only consumes one argument:
    ```
    >> add: func [x y][x + y]
    == func [x y][x + y]
    >> block: reduce [:add 1 2]
    == [func [x y][x + y] 1 2]
    >> do block
    == 3
    ```
    > It consumes one argument, which, in turn, consumes fixed number of arguments.
    ```
    >> func [x y][x + y] 1 2
    == 2
    ```
    `func` only consumes the 2 block arguments here, not the 4 arguments. So when you say "in turn" here, it does not refer to the language evaluation rules, but to a specific behavior of `do`. Therefore, from the user perspective, it's `do` which is consuming all the arguments.

