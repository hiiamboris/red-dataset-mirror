# How to use this test framework
## How to test a module
Let's say that you want to test the following module.
```red
add: func [a b] [ return a + b ]
substract: func [a b] [ return a - b ]
divide: func [a b] [ return a / b ]
```

To test these function will create a new test file `operation.test.red`.
The name of the file does not matters, it's name will be displayed when testing.
To create a test there are some requirements :
- The function must not takes arguments.
- the test function have to use the `assert` function.
- You can use any word `does`, `func`, and `function`.

The `assert` function takes two arguments :
- The first argument is a `string` that will be a message displayed during the tests.
- The second argument is a `logic!` or a `block!` that evaluate to a `logic!`. This is where you will test your functions results against what you're supposed to find.

```red
test_add: function [] [
    assert "Addition between two positive integer." [(add 3 4) == 6]
]

test_substract: does [
    res_test: (substract 4 5) == -1
    assert "Substraction that results to a negative number." res_test
]
```

## How to start the tests
To start the test, you want to evaluate the `test.red` file.
You could do that in a shell script.
```sh
red ./test.red ./test_dir
```
The `~` char is not supported use `$HOME` instead.

Or in some red code.
```red
test_module: load %./test.red
take/last test_module
append test_module %./test_directory/
do test_module
```

## How to set something up before executing test functions
You may want to set things up before executing any tests.
You can simply put code before any function runs.


```red
test_datas: read %./test_sample.csv
test_add_value: 7

test_add: function [] [
    assert [(add 3 4) == test_add_value] "Addition between two positive integer."
]

test_substract: does [] [
    res_test: (substract 4 5) == -1
    assert res_test "Substraction that results to a negative number."
]
```


