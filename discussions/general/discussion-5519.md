URL: <https://github.com/red/red/discussions/5519>
Date created: 2024-06-30T13:57:35Z

# case and case/all returning values

This is related to issue https://github.com/red/red/issues/5517 , case/all returns _false_ instead of _none_. 
This bug  made me believe that evaluation of **conditions itself** will sort of speak "stay in that block". 

Following that path it's so easy to create wrong mental model about how things work. 
Docs are not clear at all about what actually happens with results of **condition evaluation**.

It might seem trivial to more experienced users, but given the fact Red is a functional language
full of expressions, and also being very much different from practically
everything out there except Rebol :), I think all this makes learning Red much harder than it should be. 

So, just to make things clear and try to put some clear definitions
that will hopefully help newcomers to better understand *case* and *case/all*:

1. *Case* will execute just the first block where corresponding condition is _true_.
   It will stop there, and no further evaluations will be done. If there are no conditions that evaluate to _true_, 
   *case* will return _none_.

2. *Case/all* will execute **each block** where corresponding condition is _true_. 
   If there are no conditions that evaluate to _true_, _case/all_ will return _none_. 

In other words, it's safe to think about _case_ (but not _case all_) as a bunch of if - else if... statements from other languages.
And _case/all_ is basically just a bunch of _if_ statements. (But _Red's if statements_ - as there is no else block in Red's if statement). 

So - is this all correct or am I missing something here?


## Comments

### greggirwin commented at 2024-07-01T19:17:23Z:

We run up against this issue  a lot, because doc strings have to be short to be practical, but we don't have a full ecosystem to link to, with info like https://www.red-by-example.org/#case provides. With some things, no matter how we describe them, they may be confusing. that's where examples really help. Look at `switch` for a close relative of `case`, and how we explain their similarities and differences.

If you can formulate new doc strings for those two funcs that people agree are better than what we have now, which will take some chat time, then you can PR it.

> In other words, it's safe to think about case (but not case all) as a bunch of if - else if... statements from other languages.
And case/all is basically just a bunch of if statements. (But Red's if statements - as there is no else block in Red's if statement).

Yes, that's a good analogy. As an historical side note, Rebol's `if` had an `else` refinement, but it was removed because `either` is the better solution there.

