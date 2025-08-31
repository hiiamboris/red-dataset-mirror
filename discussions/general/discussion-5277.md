URL: <https://github.com/red/red/discussions/5277>
Date created: 2023-01-28T18:53:28Z

# Incorrect Order of Arithmetic Operations

**Describe the bug**
Incorrect Order of Arithmetic Operations

**To reproduce**
Steps to reproduce the behavior:

>> 2 + 2 * 10
== 40
>> 2 + 2 ** 10
== 1048576
>> 2 * 2 ** 10
== 1048576

**Expected behavior**
Should be:
>> 2 + 2 * 10
== 22
>> 2 + 2 ** 10
== 1026
>> 2 * 2 ** 10
== 2048

**Platform version**
RED: [ branch: "master" tag: #v0.6.4 ahead: 4629 date: 28-Jan-2023/11:28:13 commit: #ec0c31279023590e285fb2e1869380670ee0239f ]
PLATFORM: [ name: "Fedora Linux 37 (Container Image)" OS: 'Linux arch: 'x86_64 version: 6.1.7 build: {#1 SMP PREEMPT_DYNAMIC Wed Jan 18 17:11:49 UTC 2023} ]

## Comments

### hiiamboris commented at 2023-01-28T19:31:26Z:

Quoting the [R2 core manual](http://www.rebol.com/docs/core23/rebolcore-11.html#section-3) which is also relevant for Red here:
> The evaluation of expressions from left to right is independent of the type of operator that is used. For example:
> ```
> print 1 + 2 * 3
> 9
> ```

And:
> In REBOL, rather than requiring users to remember the precedence of operators, you only need to remember the left-to-right rule. More importantly, for advanced code such as expressions that handle expressions (in reflection, for example) you do not need to reorder terms based on precedence. The evaluation order is kept simple.

My personal view is this design just makes the interpreter much faster and simpler, as this way it operates on the data directly, not requiring an [AST](https://en.wikipedia.org/wiki/Abstract_syntax_tree).

When you want the commonly used order you can use `math` function:
```
>> math [2 + 2 * 10]
== 22
>> math [2 + 2 ** 10]
== 1026
>> math [2 * 2 ** 10]
== 2048
```


### dockimbel commented at 2023-01-30T11:08:09Z:

@piotrbajdek 

A few comments:
* The cognitive overload of dozen(s) of precedence rules with sometimes exception(s) is _immense_ compared to the simple left-to-right rule. It takes little time to get used to it as it is becomes quickly intuitive. I think that no Red/Rebol coder would want to come back the [operators precedence-hell](https://en.cppreference.com/w/c/language/operator_precedence). Fortran also has its [own unintuitive exceptions](https://docs.oracle.com/cd/E19957-01/805-4939/6j4m0vn72/index.html) for operators precedence.
* I would argue that it is easier to make mistakes when using precedence-base rules than the single-rule approach we use.
* There are mainstream languages like Forth or Postscript that do not use precedence rules for operators but rather [postfix](https://en.wikipedia.org/wiki/Reverse_Polish_notation) [notation](https://wiki.c2.com/?PostfixNotation). Math teachers, scientists and financial analysts since the 70's often rely on _postfix-notation_ calculators like the HP 11C or [12C](https://www.youtube.com/watch?v=bdTkKKz3MFc), which are both faster and easier to use than classic ones requiring parentheses to mark precedence.

