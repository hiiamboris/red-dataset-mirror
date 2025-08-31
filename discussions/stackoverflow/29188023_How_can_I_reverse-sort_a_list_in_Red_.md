# How can I reverse-sort a list in Red?

**Link:**
<https://stackoverflow.com/questions/29188023/how-can-i-reverse-sort-a-list-in-red>

**Asked:** 2015-03-21 21:03:48 UTC

------------------------------------------------------------------------

I\'ve been playing with [Red](http://www.red-lang.org/){rel="nofollow"},
and I figured out how to sort a list:

    --== Red 0.5.1 ==-- 
    Type HELP for starting information. 

    red>> list: [1 9 6 8]
    == [1 9 6 8]
    red>> sort list
    == [1 6 8 9]

I\'d like to sort this list backwards. How can I do this? I\'ve tried
various combinations:

    red>> sort !list 
    *** Script error: !list has no value
    *** Where: sort
    red>> !sort list
    *** Script error: !sort has no value
    *** Where: try
    red>> sort reverse list
    == [1 6 8 9]
    red>> sort list reverse
    *** Script error: reverse is missing its series argument
    *** Where: reverse

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 5) --- by earl

SORT has a /reverse refinement, which enables you to achieve what you
want:

    red>> sort/reverse [1 9 6 8]
    == [9 8 6 1]

Also be aware that SORT *modifies* its argument.

You can find out more about how SORT (or any other function) works, by
using the integrated help system:

    red>> help sort

    USAGE:
        sort series  /case  /skip  size  /compare  comparator  /part  length  /all  /reverse  /stable

    DESCRIPTION:
         Sorts a series (modified); default sort order is ascending. 
         sort is of type: action!

    ARGUMENTS:
         series  [series!]

    REFINEMENTS:
         /case => Perform a case-sensitive sort.
         /skip => Treat the series as fixed size records.
             size  [integer!]
         /compare => Comparator offset, block or function.
             comparator  [integer! block! any-function!]
         /part => Sort only part of a series.
             length  [number! series!]
         /all => Compare all fields.
         /reverse => Reverse sort order.
         /stable => Stable sorting.

*Comment by HostileFork says dont trust SE:* \...and for educational
purposes, perhaps worth pointing out the ability to have done it with a
custom compare function that reversed the bias of the comparison:
`sort/compare [1 6 9 8] function [a b] [a > b]`.

------------------------------------------------------------------------

### Answer (score: 3) --- by rebolek

    red>> reverse sort list
    == [9 8 6 1]

It is stack based, so you need to read it from right to left. You can
write it as:

    red>> reverse (sort list)

to imagine it better.

*Comment by HostileFork says dont trust SE:* Noting, of course, that
`sort/reverse list` will be more efficient than `reverse sort list`
(because the process of the sort itself will be in reverse as a single
operation\...)

*Comment by rebolek:* Of course, you are right. I have not checked if
/reverse is already implemented in Red :)

------------------------------------------------------------------------

## Comments on question
