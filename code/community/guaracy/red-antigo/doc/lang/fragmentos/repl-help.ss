red>> help insert

USAGE:
    insert series  value  /part  length  /only  /dup  count

DESCRIPTION:
     Inserts value(s) at series index; returns series head.
     insert is of type: action!

ARGUMENTS:
     series  [series! bitset! map!]
     value  [any-type!]

REFINEMENTS:
     /part => Limit the number of values inserted.
         length  [number! series!]
     /only => Insert block types as single values (overrides /part).
     /dup => Duplicate the inserted values.
         count  [number!]

red>>
