# rebol \--do and red \--do

**Link:**
<https://stackoverflow.com/questions/46863861/rebol-do-and-red-do>

**Asked:** 2017-10-21 13:43:07 UTC

------------------------------------------------------------------------

Why rebolview \--do \"print 1 + 2\" doesn\'t show result in console ?

Why red \--do \"print 1 +2\" generate an error

    *** Error: cannot access argument file:
    print 1 + 2
    --== Red 0.6.3 ==-- 

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 2) --- by sqlab

Here rebolview shows the result in the console

    3
    >> 
    >> help system        
    SYSTEM is an object of value: 
       version         tuple!    2.7.8.4.3 
       build           date!     6-Jan-2011/22:55:55-8:00 
       ..

but Red does not know the command **\--do**. So it tries to run the file
\--do ..

You can see what Red is supporting at this time e.g. on Linux with

    ./red  -h

------------------------------------------------------------------------

## Comments on question
