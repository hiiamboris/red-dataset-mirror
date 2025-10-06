# parse_args.red documentation
## usage
The help function of your project.
The parse_args module has a default `usage` function.
It's recommanded to rewrite it with a help function meaningfull for your project.

The `usage` function does not need any argument and do not return anything.
There is the output of the default function.
```
This is the default help message.
```

There is an example of overwriting the usage function.
```red
usage: function [] [
    print "Usage : awesome_tool var1 [var2]"
]
```

## set--flag
This function will parse the CLI arguments to extract the corresponding flag. See the beginning of the [./README.md].
This function will create a new logic! word.

It needs 1 arguments :
- `word` [word!] : The name of the CLI argument and the name of the word that will contains this value.

There is an example
```red
set--flag '--verbose
```

If the flag "--verbose" is set on the command line then.
```red
>> ? --verbose
--VERBOSE is a logic! value: true
```

## set--opt
The function will parse and check the CLI arguments to find a corresponding value. See the beginning of the [./README.md].
This function will create a new string! word.
This new created argument is optionnal, if no correponding value is found then `word` will be unset!.

It needs 2 arguments :
- `word` [word!] : The word that will contain the value.
- `check` [block! function!] : A block! or a function! they need to evaluate/return a logic! value. If a function! is used, it needs to accept only one argument of type word!.

There is an example
```red
set--opt 'my_integer [error? try [to integer! my_integer]]
; Or
check_func: function [word [word!]] [
	return error? try [to integer! my_integer]
]
set--opt 'my_integer check_func
```
In this example the `my_integer` word will contains the first integer in the command line arguments.

## check--arg
This is an internal function, it's not meant to be used outside.
This function will check if a value is considered valid.
A value is valid if the `check` argument return true.

It needs 2 arguments : 
- `word` [word!] : The word that will get it's value checked.
- `check` [function! block!] : What will check if the value is valid.

It returns a logic! value.

Example
```red
value: 4
checking: function [word [word!]] [ word > 10 ]
check--arg 'value [ value < 10 ]
; Return true
check--arg 'value :checking
; Return false

check--arg 'value [ 10 ]
; make an error
```
