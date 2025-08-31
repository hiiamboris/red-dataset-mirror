
#49: WISH: Implement '|' (pipe) operator to allow forward chaining of expressions
================================================================================
Issue is open, was reported by mydoghasworms and has 6 comment(s).
<https://github.com/red/REP/issues/49>

This was previously an issue (feature request) on the red/red repository: https://github.com/red/red/issues/2630

I recently found out that the same feature exists in Elixir and I still think it would be a neat addition to Red. The Elixir feature is explained here, better than I could have explained it:

https://elixirschool.com/en/lessons/basics/pipe-operator/

To explain succinctly (from the above page):

> The pipe operator |> passes the result of an expression as the first parameter of another expression.

The following is from the documentation of the operator:

https://hexdocs.pm/elixir/Kernel.html#%7C%3E/2

I think the idea that the output of an expression can be piped as input to a function promotes more natural reading and coding of a processing chain. Normally, in functional programming, we have to always _prepend_ the next function to process the output of another. By using a pipe construct, the sequence of events can follow reading (and writing) order.

(As the Elixir documentation says, the pipe operator necessarily passes the expression as the first argument of a function call on the right although, as explained below, there could be ways to override this behaviour and specify which parameter of the function should receive the expression through specific syntax).

Below is the original issue text from the red/red issue:

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

On 2019-06-05T08:00:13Z, hiiamboris, commented:
<https://github.com/red/REP/issues/49#issuecomment-498980199>

    @mydoghasworms https://gist.github.com/hiiamboris/5562870578207b120032700ca3566f3f

--------------------------------------------------------------------------------

On 2020-08-19T15:57:34Z, mydoghasworms, commented:
<https://github.com/red/REP/issues/49#issuecomment-676512650>

    > @mydoghasworms https://gist.github.com/hiiamboris/5562870578207b120032700ca3566f3f
    
    Very nice. Sorry, only saw this now!
    
    I also found in the Mozilla Javascript docs a reference to a pipeline operator (|>) like Elixir (albeit experimental - not supported in any browser currently). https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Pipeline_operator
    
    To quote from that page:
    
    > This allows the creation of chained function calls in a readable manner.
    
    I am not saying it's time to jump on the pipe operator bandwagon (because there isn't one yet AFAIK) but I think it's a neat addition to non-OO languages. One of the great effects of OO languages is that it makes code read in the order people think; and coders don't have to always backtrack to think of what to do with a value.

--------------------------------------------------------------------------------

On 2020-08-19T18:46:23Z, hiiamboris, commented:
<https://github.com/red/REP/issues/49#issuecomment-676597220>

    We now have more idiomatic/flexible/fast solutions btw https://codeberg.org/hiiamboris/red-common#general-purpose (stepwise function & macro)

