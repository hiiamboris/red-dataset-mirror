# test.red documentation
## usage
A simple function that will print a help message if an error occurs.

It need one argument :
- `reason` [string!] : A message to add context to the error, it help the user figuring thigs out.

Output.
```red
>> usage "No arguments were found."
No arguments were found.
to launch test you need to precise the directory where tests are located.
- the module will only look 1 directory deep
- the module do not support "~" in path

CLI usage : red test.red ./tests_dir

For embeded usage see module's README part "How to start the tests".
```

## args_
The function that will get the arguments from the CLI and check them.

This test module only want one argument. If there is more than one, only the first is taken into account.
It has to be the path to the test directory.
- It should not be empty.
- It should not use the `~` char to indicate home directory, use `$HOME` instead.
- It should point to an existing directory and not a file.

## STATE
The STATE object regroup important data for the module to work.
- `current_test_func` [string!] : The current function the module is testing.
- `current_test_file` [string!] : The current test file the module is querying.
- `nb_test_total` [integer!] : The total number of test executed.
- `nb_test_passed` [integer!] : The total number of passed test executed.

### increment_total
Increment the `nb_test_total` variable.

### increment_passed
Increment the `nb_test_passed` variable.

## print_test
This function is handling the printing of each test.

It needs several infos :
- `test_file` [string!] : The name of the test file the test is in.
- `test_name` [string!] : The name of the function the test is in.
- `test_message` [string!] : A message defining what the test is testing.
- `passed?` [logic!] : Has the test passed or failed ?

The output looks like this.
```red
>> print_test "test_file" "test_name" "test_message" true
test_file	test_name	passed	test_message
```
There is one tab character between each column. This has been made to allow easier extraction with 'awk'.

## print_beginning
This function will print before the tests begin.
It will print what directory the module will consider as the "test directory".

It needs one argument :
- `test_dir` [string!] : The path to the directory containing tests files.

Output.
```red
>> print_beginning "./test"
Starting tests in directory : ./test
```

## print_end
This function will print the results of the tests.
The result of the tests consist of the number of test made, the number of test passed, the number of test failed and what directory has been the target of the module.

It needs 3 arguments :
- `nb_test_total` [integer!] : The total number of tests.
- `nb_test_passed` [integer!] : The number of test passed.
- `test_dir` [string!] : The path to the directory containing tests files.

Output.
```red
>> print_end 10 4 "./test"
Results for test the ./test directory.

Number of test made : 10	passed : 4	failed : 6
```

## assert
The assert function's goal is to register a test in the module.
The assert function is in charge for several task :
- It counts how many test have been made by incrementing `state/nb_test_total`.
- It counts how many test have been passed by incrementing `state/nb_test_passed`.
- It calls the print_test function.

The function needs 2 arguments :
- `message` [string!] : A message that will be printed to the user, it add context to the current test.
- `logic_operation` [logic! block!] : The actual boolean test that will decide if a test pass or fail.

There is an example in the [./README.md] document part "How to test a module".

### Errors
If the `logic_operation` does not evaluate to a logic! value, then the test crashes.
```red
>> assert "message" ["test"]
Error at test 3 at function default_func at file ./default_test_file.red
The argument logic_operation of the assert function does not eval to a logic! value.
(halted)
```

## func?
This function's goal is there to help parsing the test file.

The function need 1 argument :
- `input` [block!] : The code snippet that will be tested.

The function return a logic! value.

The function will test the block! value to see if it can define a function.
The words `func`, `function` an `does` are accepted.
```red
func? [ func "test" ["test"] ] => false
func? [ repeat i 3 [print i] ] => false
func? [ make object [] ] => false
func? [ func [] [print "test"] ] => true
func? [ does [print "test"] ] => true
func? [ does [] [] [] ] => false
```
Which means it will return true when input is a block! that defines a function.

## execute_test_file
This function will load and test a whole file.
To see how to construct a test file go to the [./README.md] part "How to test a module".

### Step by step explanation
Do not hesitate to read this part with the source code displayed.

```red
code: load test_file
do code
```
Loading the file into the `code` word.
`code` now contains a block! that represents the file.
In the next line the function is executing the code of the test file to execute any instruction the user may have wrote. See [./README.md] part "How to set something up before executing test functions".

```red
repeat i length? code [
    ...
]
```
For every token in `code` we will execute instructions.

```red
clear next_3
append/only next_3 code/(i + 1)
append/only next_3 code/(i + 2)
append/only next_3 code/(i + 3)
```
With this code we want to extract what could be a function!.
We want to get three following tokens and append them into a block! `next_3`.
It will allows the function to check if the tokens corresponds to a function!.
The `clear` function is here to avoid appending the whole file to the variable.
If you want to modify this part, check "Why `append/only` function ?".

```red
unless (set-word? pick code i) and (func? next_3) [continue]
```
This line is a checkpoint to filter what is a function! and skip to the next iteration if it's not a function!.
This kind of code is accepted
```red
function_name: function [] [print "test"]
function_name2: does [print "test"]
```
This kind of code is not
```red
variable: 3
either true [print "true"] [print "false"]
```

```red
STATE/current_test_func: to-string pick code i 
```
Updates the `current_test_func` variable to the current function name.
It's used by `print_test` function to display in what file the test is.
(`print_test` will be executed if there is an `assert` function in the test function.)

```red
if next_3/1 == 'does [
	take/last next_3
]
```
The `func` and `function` native! values needs two arguments, however the `does` native! value only needs one argument.
This if statement is there to resize the `next_3` variable if the test function is defined using the `does` word.

```red
 current_function: do next_3 
 current_function
```
Defines a new word `current_function` that is holding our current test function.
Then we execute the test function.
And the function continue to the next iteration and go through the whole file.

#### Why `append/only` function ?
There is different ways we could have append the three tokens into `next_3`.
```red
next_3: [(pick code i + 1) (pick code i + 2) (pick code i + 3)]

next_3: [code/(:i + 1) code/(:i + 2) code/(:i + 3)]

next_3: []
append next_3 code/(i + 1)
append next_3 code/(i + 2)
append next_3 code/(i + 3)
```

However it will not produce the output I need.
```red
; The input
[test_func: function	[]	[print "test"]]
i	    i+1		i+3	i+4

; The output produced
[function	    print "test"]
i+1	    i+2	    i+3

; The output I need
[function   []	    [print "test"]]
i+1	    i+2	    i+3
```

With the `append/only` function I get what i want.

## dotfile?
The `dotfile?` function checks if the file is a secret file (file that begin with a dot).

The function takes one argument :
- `file` [file!] : the file to check

The function return a `logic!` value, `true` if the file is a dotfile or `false` if it's not.
