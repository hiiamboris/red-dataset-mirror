# How to use the module
## How to create arguments

An **argument** is a value passed to the CLI.
An **option** is an optional value passed to the CLI.
A **flag** is a value that will activate or deactivate a certain behavior.

Let's explain how it works with an example.
The application will expect 1 argument, 1 option argument and 2 flags :
- url : A valid http/https url
- file : A valid path to a file
- --verbose : Is the application will output more data
- --safe : Is the application will try to be safer

There is how you define these arguments.
```red
set--arg 'url [url? to-url url]
set--opt 'file check_file_func
set--flag '--verbose
set--flag '--safe
```

For `set--arg` and `set--opt` you need :
- A variable name as a first argument
- Either a `block!` type or a `func!`, both of them have to return a `bool!`. This second argument is there to check if the value passed correspond to what you expect the value to be, if not the variable will be assigned a none! value.

Arguments are mandatory, options and flags aren't.
An empty arguments will make the program exit, empty options and flags won't.

If you check your argument with a `block!` then the variable name will be available in the `block!`. This variable will contain every CLI argument to check them one by one.
If you check your argument with a function then your function has to have one argument of type string!. This argument will be the CLI argument given by the user.
```red
set--arg 'url [url? to-url url]
; url is available in "[url? to-url url]".

set--opt 'file check_file_func
check_file_func: function [user_input [string!]] [
	; Checking the argument
]
```
For `set--flag` you only need the name of the flag.
If the name of the flag you set is present in the CLI args then this flag will be set to true.
If not it will be set to false.

## How does the module assign command line args to applications args

Each argument and options will take the first valid value they will encounter.
Let's say that we have thoses CLI arguments :
- /home/user/.bashrc
- http://localhost
- https://localhost

This is how our CLI will assign the variables : 
- /home/user/.bashrc (file)
- http://localhost (url)
- https://localhost

If we have two url in our CLI as the following code
```red
set--arg 'url [url? to-url url]
set--arg 'url2 [url? to-url url2]
set--opt 'file check_file_func
```
Then the argument `url` will choose first it's value : 
- /home/user/.bashrc (file)
- http://localhost (url)
- https://localhost (url2)

## If there is too much arguments
When a CLI argument is parsed it is removed from `system/options/args`.
If there is too much arguments then `system/options/args` length will be greater than 0.


## The help function
To work properly the module will expect the programmer to create a `usage` function.
The module will execute the function if one of the arguments is wrong.
If you don't have this function the program will execute a default `usage` function. It won't be very helpfull though.
