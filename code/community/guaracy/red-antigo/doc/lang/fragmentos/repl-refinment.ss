red>> help trim

USAGE:
    trim series  /head  /tail  /auto  /lines  /all  /with  str

DESCRIPTION:
     Removes space from a string or NONE from a block or object. 
     trim is of type: action!

ARGUMENTS:
     series  [series! object! error! map!]

REFINEMENTS:
     /head => Removes only from the head.
     /tail => Removes only from the tail.
     /auto => Auto indents lines relative to first line.
     /lines => Removes all line breaks and extra spaces.
     /all => Removes all whitespace.
     /with => Same as /all, but removes characters in 'str'.
         str  [char! string! integer!]
red>> 

