
#3282: Wanted more info on errors output
================================================================================
Issue is closed, was reported by Oleg-N-Cher and has 6 comment(s).
[type.alien]
<https://github.com/red/red/issues/3282>

Dear Red developers,

I'm from Oberon world, and when describing the language Oberon the words "safety" and "reliability" use often. And, believe me, this is not an empty phrase. I tried this morning to interest my colleague with the Red, to which he replied: I need a predictably working tool.

I will illustrate this with just a small example, but I hope that you will take seriously my words. Rebol/Red are languages that at the concept level allow serialization of data into code, as:

```
block: [ print "Hello" ]
do block
```

This approach makes it difficult, or even makes impossible, to check the code for correctness in compile-time. This is what most bothers when developing in old dangerous languages like C. You can get a black screen with a notification that "Access to a memory address that goes beyond the address space of the program has occurred". Well, you understand me. So, I want to say that Rebol and Red, in view of their concept, are not at all relieved of this problem. And we can not solve this so simply.

Another point is dynamic typization, and we can in a part of a program have such an operation, which the user will cause (for example, by clicking of a button), and will run into the fact that there is a mismatch of data types. For example: system/options/args returns a block of strings or "none!" And a program may not take into account the whole variety of types, simply will not be able to handle correctly the all variants and combinations of the data types encountered.

I compiled this program:

```
Red [ needs: view ]

view [
  do [
    foreach arg system/options/args []
  ]
]
```

It works if it is launched with at least one command line argument. And immediately quits without any information, if there are no.

It is imperative that a program must always displays the information about the reasons for its crash. Yes, I've heard about exception handling, and even if it is applicable in this case, we still need to output information always. Even in the release mode. This helps us, the developers, when a user gives us more information about what happened.

Or here is an example of output:

> > red.exe Test.red
> *** Script Error: cannot access args1 in path system/options/args1
> *** Where: foreach
> *** Stack: view layout do-safe 

I do not see here any information about the line in which the error occurred. Why? Such a conclusion about the error can be good if you are writing a script for three lines, but not for large programs.

In the compiled program, any appearance of "print" leads to an immediate termination of the program. Of course, this is not a problem in the debugging mode with console. But a program errors of this kind can appear in the release version, and the user will not have any information about the what happens.


Comments:
--------------------------------------------------------------------------------

On 2018-03-26T13:55:53Z, dockimbel, commented:
<https://github.com/red/red/issues/3282#issuecomment-376174456>

    Dear Oleg,
    
    > I got acquainted with the language Red only a few days ago, but I already had time to evaluate all its power and dignity
    
    I think you went through a superficial overview of the language, as hinted by many of the points you are trying to make. Red is a deep language and needs to be approached with a mind empty from preconceptions coming from a background knowledge in programming (unless you know Lisp, in which case, you can grasp many deep aspects of Red very quickly).
    
    >  I tried this morning to interest my colleague with the Red, to which he replied: I need a predictably working tool.
    
    Red and Rebol are as predictable as any other language. There is no random behavior nor fuzzy logic in the evaluation of the source code (beyond bugs and yet unimplemented features).
    
    > Rebol/Red are languages that at the concept level allow serialization of data into code [...]
    
    Both are called [homoiconic](https://en.wikipedia.org/wiki/Homoiconicity) languages, code is represented as data, so strictly speaking, there is no code, but only data. Lisp languages implement a similar concept. Oberon does not, therefore, you should take the time to digest this concept (it takes more than a few days to do that if you are unfamiliar).
    
    > This approach makes it difficult, or even makes impossible, to check the code for correctness in compile-time. 
    
    Strictly speaking a compiler just checks for syntax and correctness of the semantics, not [correctness](https://en.wikipedia.org/wiki/Correctness_(computer_science)) in general (the compiler won't check if the implemented algorithm is correct or not, or if your code complies with a specification). I guess the correctness you are referring to is pretty much only the "typing". A compiler can only guess the types in a statically-analyzable language, which is not the case of the Rebol family of languages. According to the few studies around, type errors account for a very little percentage of the errors produced by programmers. The vast majority of errors are logic or algorithmic errors, which compilers can't catch.
    
    > This is what most bothers when developing in old dangerous languages like C. You can get a black screen with a notification that "Access to a memory address that goes beyond the address space of the program has occurred". Well, you understand me. So, I want to say that Rebol and Red, in view of their concept, are not at all relieved of this problem. 
    
    I don't get what problem you are trying to describe here. Comparing C with Rebol or Red is comparing an apple to a tree of oranges, those languages live in extremely different abstraction layers, so any attempt at comparing them will lead nowhere. If your point was about "runtime exceptions", then you should have a deeper look at languages trying to block them all, like Elm or Rust, and see how they handle common cases like division by zero.... A runtime exception is still preferable to a silent error wrecking havoc in your data.
    
    > Another point is dynamic typization, and we can in a part of a program have such an operation, which the user will cause (for example, by clicking of a button), and will run into the fact that there is a mismatch of data types.
    
    I guess you mean "dynamic typing". For the record, Rebol and Red are strongly typed languages with no "variables" like in other languages, but instead using a concept called dynamic binding (words are dynamically bound to contexts). It can look or behave like variables to the untrained eyes, but it's not. Without entering in an age-old debate about the virtues and issues of static typing, I will just say that Rebol and Red are also trying to reduce programming errors, but by tackling a bigger problem, which is code and system complexity. By reducing complexity and elevating the abstraction layer (with very dynamic behaviors), we try to make it easier for humans to write correct programs, that they can read and maintain, because they can be short, simple and readable (at least much more than with other languages). That's our goal.
    
    > I compiled this program:
    ```
    Red [ needs: view ]
    
    view [
      do [
        foreach arg system/options/args []
      ]
    ]
    ```
    > It works if it is launched with at least one command line argument. And immediately quits without any information, if there are no.
    
    It is a very strange program you wrote there, you compile the GUI module (View) and invoke the GUI engine, but provide no GUI description... I guess what you wanted to write was rather:
    ```
    Red [file: %test.red]
    
    foreach arg system/options/args []
    ```
    Now, if you compile that code in release mode and run it you'll get:
    ```
    C:\Dev\Red>test
    *** Script Error: foreach does not allow none! for its series argument
    *** Where: foreach
    *** Stack:
    ```
    
    > It is imperative that a program must always displays the information about the reasons for its crash. Yes, I've heard about exception handling, and even if it is applicable in this case, we still need to output information always. Even in the release mode. This helps us, the developers, when a user gives us more information about what happened.
    
    Your code "quits without any information" because you compiled a GUI program, and we didn't have yet implemented a graphic error reporting for compiled GUI program (in case you didn't notice, Red is at version 0.6.3 and not 1.0).
    
    > I do not see here any information about the line in which the error occurred. Why? Such a conclusion about the error can be good if you are writing a script for three lines, but not for large programs.
    
    There is no accurate definition for "the line in which the error occurred" in Rebol or Red programs. The text representation of a "source code" gets "loaded" and transformed into blocks of values (like lists in Lisp), the notion of "line" of code is pretty much lost there. Moreover, as "code" can be dynamically changed at run-time, the notion of "line" disappears completely. For example:
    ```
    Red []
    
    code: [
        print 1 / _
    ]
    code/4: 0
    
    do code
    ``` 
    will produce when evaluated:
    ```
    *** Math Error: attempt to divide by zero
    *** Where: /
    *** Stack:  
    ```
    Can you give to the developer who wrote that, the exact line where he made an error? As you can see, Red and Rebol are a different kind of beast, with a very different model of programming than the vast majority of languages out there. That said, we have a contingency plan for that, which will be implemented in 0.9.0, and should help improve the location of run-time errors.
    
    > In the compiled program, any appearance of "print" leads to an immediate termination of the program. Of course, this is not a problem in the debugging mode with console. But a program errors of this kind can appear in the release version, and the user will not have any information about the what happens.
    
    Using `print` in a compiled GUI program in release mode leads to a crash, that is a known issue in the 0.6.3 version of Red, and has been fixed in the [0.6.4](https://github.com/red/red/tree/v0.6.4) branch, which should be released very soon.
    
    
    As a last word, I am aware that we are, for now, still lacking a big amount of docs to explain and present the core concepts of Red, which may escape to the developers who are not used to homoiconic languages. Though, we try to compensate that by a strong and constant presence on our Gitter chat rooms, so you are welcome to https://gitter.im/red/welcome or https://gitter.im/red/help for asking any question you want about Red in order to get a better understanding of it and the reasons behind all the choices we made.

--------------------------------------------------------------------------------

On 2018-03-26T21:42:09Z, greggirwin, commented:
<https://github.com/red/red/issues/3282#issuecomment-376321633>

    @Oleg-N-Cher, I can't add better info than what @dockimbel  has already posted, so I'll just add that Red has a great REPL, and as you learn Red, using `help` and `source` there are great tools. Running your programs interpreted, rather than compiling each time, is also a productivity booster.

--------------------------------------------------------------------------------

On 2018-03-27T08:12:58Z, 9214, commented:
<https://github.com/red/red/issues/3282#issuecomment-376436104>

    @Oleg-N-Cher, I have nothing to add on top of @dockimbel's explanation, but want to stress out one thing - please post such debates in our Gitter chat, instead of using Github issue tracker as communication channel. That way you'll not only receive more feedback, but also save @dockimbel's and @greggirwin's valuable time from answering questions which I or any other knowledgeable member of community can handle on their own.
    
    Red and Rebol have steep learning curves, not because they're complex, but because they require you to give up on all the baggage and habbits you brought from other languages, and un-learning is the hardest thing to do.

