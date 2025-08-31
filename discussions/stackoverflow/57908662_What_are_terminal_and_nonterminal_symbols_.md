# What are terminal and nonterminal symbols?

**Link:**
<https://stackoverflow.com/questions/57908662/what-are-terminal-and-nonterminal-symbols>

**Asked:** 2019-09-12 14:13:42 UTC

------------------------------------------------------------------------

I am reading Rebol [Wikipedia
page](https://en.wikipedia.org/wiki/Rebol){rel="noreferrer"}.

> \"Parse expressions are written in the parse dialect, which, like the
> do dialect, is an expression-oriented sublanguage of the data exchange
> dialect. Unlike the do dialect, the parse dialect uses keywords
> representing operators and the most important nonterminals\"

Can you explain what are *terminals* and *nonterminals*? I have read a
lot about grammars, but did not understand what they mean. Here is
another
[link](https://en.wikibooks.org/wiki/Rebol_Programming/Language_Features/Parse/Parse_expressions){rel="noreferrer"}
where this words are used very often.

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 64) --- by 9214

Definitions of terminal and non-terminal symbols are not Parse-specific,
but are concerned with grammars in general. Things like
[this](https://en.wikipedia.org/wiki/Terminal_and_nonterminal_symbols){rel="noreferrer"}
wiki page or intro in [Grune\'s
book](https://dickgrune.com/Books/PTAPG_1st_Edition/){rel="noreferrer"}
explain them quite well. OTOH, if you\'re interested in how Red Parse
works and yearn for simple examples and guidance, I suggest to drop by
our dedicated [chat
room](https://gitter.im/red/parse){rel="noreferrer"}.

------------------------------------------------------------------------

\"parsing\" has slightly different meanings, but the one I prefer is
conversion of linear structure (string of symbols, in a broad sense) to
a hierarchical structure (derivation tree) via a formal recipe
(grammar), or checking if a given string has a tree-like structure
specified by a grammar (i.e. if \"string\" belongs to a \"language\").

All symbols in a string are terminals, in a sense that tree derivation
\"terminates\" on them (i.e. they are leaves in a tree). Non-terminals,
in turn, are a form of abstraction that is used in grammar rules - they
group terminals and non-terminals together (i.e. they are nodes in a
tree).

For example, in the following Parse grammar:

    greeting: ['hi | 'hello | 'howdy]
    person:   [name surname]
    name:     ['john | 'jane]
    surname:  ['doe | 'smith]
    sentence: [greeting person] 

-   `greeting`, `person`, `name`, `surname` and `sentence` are
    non-terminals (because they never actually appear in the linear
    input sequence, only in grammar rules);
-   `hi`, `hello`, `howdy` with `john`, `jane`, `doe` and `smith` are
    terminals (because parser cannot \"expand\" them into a set of
    terminals and non-terminals as it does with non-terminals, hence it
    \"terminates\" by reaching the bottom).

```{=html}
<!-- -->
```
    >> parse [hi jane doe] sentence
    == true
    >> parse [howdy john smith] sentence
    == true
    >> parse [wazzup bubba ?] sentence
    == false

As you can see, terminal and non-terminal are disjoint sets, i.e. a
symbol can be either in one of them, but not in both; moreso, inside
grammar rules, only non-terminals can be written on the left side.

One grammar can match different strings, and one string can be matched
by different grammars (in the example above, it could be
`[greeting name surname]`, or `[exclamation 2 noun]`, or even
`[some noun]`, provided that `exclamation` and `noun` non-terminals are
defined).

And, as usual, one picture is worth a thousand words:

[![Parse tree
example](https://i.sstatic.net/fsTgs.png)](https://i.sstatic.net/fsTgs.png){rel="noreferrer"}

Hope that helps.

*Comment by Konstantin Ziubin:* What about +,-,\*,/,(,) signs in
arithmetic expressions, are they terminals or nonterminals? They are not
leaves from AST point of view but they do appear in expression input.

*Comment by 9214:* \@KonstantinZyubin Abstract Syntax Tree is not the
same thing as Concrete Syntax Tree that parser derives. In AST
arithmetic operators are usually nodes grouping operands and other
operators together according to precedence rules, while in CST they
would be leaves as tokens in the input. See an example
[here](https://stackoverflow.com/a/10176731/5889272).

*Comment by chepner:* They are leaves in the *grammar*. You would have a
rule like `expr :: expr '+' expr | expr '-' expr`. Parsing `3 + 3`, you
would need another rule defining `expr` to decide what to do with the
3s, while this rule itself is sufficient for recognizing the `+`; no
additional rule is necessary.

------------------------------------------------------------------------

### Answer (score: 8) --- by AngryJohn

think of it like that

a digit can be 1-9

now i will tell you to write down on a page a digit.

so you know that you can write down 1,2,3,4,5,6,7,8,9

basically the **nonterminal symbol** is \"digit\"

and the **terminals symbols** are the 1,2,3,4,5,6,7,8,9

when i told you to write down on a page a digit you wrote down 1 or 2 or
3 or 4 or 5 or 6 or 7 or 8 or 9

you didn\'t wrote down the word \"digit\" you wrote down the 1 or 2 or
3\....

do you see where i\'m going ?

let\'s try to make our own \"rules\"

let\'s \"create\" a **nonterminal symbol** we will call it \"Olaf\"

Olaf can be a dog (NOTE: dog is **terminal**)

Olaf can be a cat (NOTE: cat is **terminal**)

Olaf can be a digit (NOTE: digit is **nonterminal**)

Now i\'m telling you that you can write down on a page an Olaf.

so that\'s mean that you can write down \"dog\"

you can also write down \"cat\"

you can also write down a digit so that\'s mean you can write down 1 or
2 or 3\...

because digit is **nonterminal symbol** you dont write down \"digit\"
you write down the symbols that digit is referring to which is 1 or 2 or
3 etc\...

in the end only terminals symbols are written on the \"page\"

one more thing i have to say is something that you may encounter one
day, basically when you say \"a **nonterminal** can be something\".

there is a special term for that and that\'s basically called a
\"**production rule**\"(can also be called a \"**production**\")

for example

Olaf can be \"dog\"

Olaf can be \"cat\"

Olaf can be digit

we got 3 productions here in other words we got here 3 definitions of
Olaf

specifications of Programming languages use those ideas quite a lot when
defining a syntax of a language

------------------------------------------------------------------------

## Comments on question
