
#2630: FEATURE REQUEST: Implement '|' (pipe) operator to allow forward chaining of expressions
================================================================================
Issue is closed, was reported by mydoghasworms and has 10 comment(s).
[type.wish]
<https://github.com/red/red/issues/2630>

It would be nice to have a pipe operator ("|") as part of the language to "pipe" the output from an expression to the input of a function. This provides for a "forward chaining" of expressions, that arguably lends greater expressiveness to the language, and is natural and intuitive to users of the command line.

This might be useful only for the console (consider e.g. the "?" function), but I imagine that for scripting it could also be practical.

The reason for having this is that when coding, and thinking about what to do with the result of an expression, you normally have to go back and prepend the function to the beginning.

So instead of having

```
sort read/lines %list.txt
```
you could have

```
read/lines %list.txt | sort
```

While this can easily be considered for functions that have a single argument (like `sort`), it becomes a question of which parameter to pipe into if a function takes more than one argument, though by convention it could perhaps be the last argument of a function.

Another example, using such an assumed convention, could be

```
read/lines %words.txt | sort | write/lines %sorted.txt
```
instead of

```
write/lines %sorted.txt sort read/lines %words.txt
```

This obviously wouldn't work for something like `foreach`, but maybe there is a way to indicate to which parameter an expression must be piped to? What about an optional name after the pipe, like so:

```
read/lines %words.txt |series foreach line [print line]
```

Or maybe a number to indicate the position of the argument, like `|2`.

And then, with just the pipe on its own, have it passed to the "conventional" (or _default_) argument.


Comments:
--------------------------------------------------------------------------------

On 2017-04-26T14:58:43Z, 9214, commented:
<https://github.com/red/red/issues/2630#issuecomment-297435910>

    Interesting, I thought `|` could be used to replace bulky `comment { ... }` syntax, mostly for literate programming tricks 😀 
    ```
    >> | Dear Red, please | print "123" | for me, thank you! |
    == 123
    ```
    
    Anyway, wouldn't `|` pipe conflict with `|` in `parse` then used inside rule? I guess not, but then it's up to designing decision.

--------------------------------------------------------------------------------

On 2017-04-26T23:59:59Z, maximvl, commented:
<https://github.com/red/red/issues/2630#issuecomment-297574173>

    I would say this should be part of `shell` dialect, where you could use not only pipe but environment variables, IO redirection, globs and basically emulate the good parts of the shell.
    
    This will actually be a nice thing to have your Red program being easily extendable by shell-like scripts.

--------------------------------------------------------------------------------

On 2017-04-27T06:18:09Z, dockimbel, commented:
<https://github.com/red/red/issues/2630#issuecomment-297622179>

    > This provides for a "forward chaining" of expressions, that arguably lends greater expressiveness to the language, and is natural and intuitive to users of the command line.
    
    Your examples show that such additional syntax is *less* expressive, as it does not change anything to the computation, while adding a new syntax and new evaluation rules to the language.
    
    `|`, `|series` and `|2` are valid words in Redbol, they cannot denote anything else than what any other word would.
    
    The Red REPL cannot be the system shell, as both syntactic and semantic rules are different, and even conflicting. Creating a `shell` dialect, as proposed by @maximvl would be a more natural solution for Red.
    
    Moreover, we have some plans for a possible `|` function after 0.7.0, for stream-oriented processing (and compatible with the rest of the syntactic and semantic rules).

--------------------------------------------------------------------------------

On 2017-04-28T08:34:31Z, mydoghasworms, commented:
<https://github.com/red/red/issues/2630#issuecomment-297941060>

    @dockimbel @maximvl Yes, I agree perhaps it may make a nice addition to to a `shell` dialect, and perhaps that is where built-ins like `dir` and `pwd` will move to?
    
    Perhaps I am not entirely correct in saying it is more expressive (however one interprets expressiveness to mean), but I think it can help with readability a lot; the reason being that people read in the order they think (from left-to-right or right-to-left) by saying "first this happens, then that happens). A big hurdle for me when looking at FP, coming from an OO language like Ruby, is that when I want to implement the next step in a sequence of steps, I have to go back and prepend a function call to the beginning of a sequence of calls. In OO, what was nice is that I can just say '.' and then the next step in the execution, taking the output from the previous method call and immediately calling the next.
    
    Using the "pipe" method provides a flow that follows the train of human thought, which could help writing and reading code (because you don't have to either **a)** remember what we are ultimately doing by putting the calls in a "stack" in our own mind or **b)** go back and see what we were doing again), but simply follow the execution in a (humanly) natural, consequential way.
    
    For scripting, I think it would still be nice.

--------------------------------------------------------------------------------

On 2018-04-25T05:12:30Z, PeterWAWood, commented:
<https://github.com/red/red/issues/2630#issuecomment-384162702>

    Following the introduction of the [Red REP repository for enhancements and wishes](https://gitter.im/red/red?at=5adfeed527c509a7744a3dc8), this issue is being closed.
    
    If you believe that your wish is still valid, please open a new issue for it in the new [red/REP repo](https://github.com/red/REP). It would help if you could include a link to this issue when opening an issue in the REP repository.

