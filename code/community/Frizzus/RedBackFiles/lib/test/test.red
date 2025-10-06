Red [
    Author: "Frizzus"
    Purpose: "A simple unit test framework"
]
; The technical documentation can be found in the ./doc.md
; The use documentation can be found in the ./README.md

STATE: object [
    current_test_func: "default_func"
    current_test_file: "default_test_file"
    nb_test_total: 0
    nb_test_passed: 0

    increment_total: function [
        "Increment the nb_test_total variable"
    ] [
        self/nb_test_total: self/nb_test_total + 1
    ]
    increment_passed: function [
        "Increment the nb_test_passed variable"
    ] [
        self/nb_test_passed: self/nb_test_passed + 1
    ]
]

RED: "^[[31m"
GREEN: "^[[32m"
BLUE: "^[[34m"
YELLOW: "^[[33m"
RESET: "^[[0m"

usage: function [reason [string!]] [
    print reason
    print {
to launch test you need to precise the directory where tests are located.
- the module will only look 1 directory deep
- the module do not support "~" in path

CLI usage : red test.red ./tests_dir

For embeded usage see module's README part "How to start the tests".
    }
]

args_: function [
    "Checking the arguments before launching tests"
    args [block! none!]
    return: [file!]
] [
    if empty? args [ usage "No arguments were found" halt ]
    test_dir: dirize (to-file args/1)
    unless none? (find test_dir #"~") [ 
        usage "The path to test directory is invalid ('~' char not supported)."
        halt
    ]
    unless exists? test_dir [
        usage "The path to test directory is invalid (The directory does not exists)."
        halt
    ]
    return test_dir
]

print_end: function [
    "Print the results of the tests."
    nb_test_total [integer!]
    nb_test_passed [integer!]
    test_dir [string!]
] [
    total: rejoin [ "Number of test made : " nb_test_total ]
    passed: rejoin [ "passed : " GREEN nb_test_passed RESET ]
    failed: rejoin [ "failed : " RED (nb_test_total - nb_test_passed) RESET ]

    print rejoin [ "Results for test the " test_dir " directory." newline ]
    print rejoin [ total tab passed tab failed ]
]

print_beginning: function [
    "Print the start of the tests and the directory that the module will take the test file from"
    test_dir [string!]
] [
    print rejoin [ "Starting tests in directory : " test_dir ]
]

print_test: function [
    "Print a test result on the terminal. Each test is either passed or failed. Each column of the output is separated by a tab character to allow easier manipulation with 'awk'."
    file_name [string!]
    test_name [string!]
    test_message [string!]
    passed? [logic!]
] [
    either passed? [
        result: rejoin [GREEN "passed" RESET]
    ] [
        result: rejoin [RED "failed" RESET]
    ]
    print rejoin [BLUE file_name RESET tab test_name tab result tab test_message]
]

assert: function [
    "Register a test in the test module. If logic_operation is true then the test is passed, if not the test is failed. Message is made to add context to the test."
    message [string!]
    logic_operation [logic! block!]
] [
    ; Check if logic operation is a block!, if it is then check that what inside the block! eval to a logic! value.
    ; If not make the test crash.
    if block? logic_operation [ 
        logic_operation: do logic_operation
        unless logic? logic_operation [
            print rejoin [ "Error at test " state/nb_test_total " at function " state/current_test_func " at file " state/current_test_file]
            print "The argument logic_operation of the assert function does not eval to a logic! value."
            halt
        ]
    ]
    
    state/increment_total
    ; consider the test passed
    if logic_operation [ state/increment_passed ]

    print_test state/current_test_file state/current_test_func message logic_operation
]

func?: function [
    "Test if the input is a block! that define a function and return a logic!"
    input [block!]
    return: [logic!]
] [
    input: copy/deep input
    has_two_block?: parse input [['func | 'function] block! block!]
    if (length? input) == 3 [take/last input]
    has_one_block?: parse input ['does block!]
    return has_two_block? or has_one_block?
]

dotfile?: function [
	"This function takes a file! and check if it's a dot file."
	file [file!]
] [
	str_file: to-string file
	parse str_file [#"." not #"." not #"/" skip any skip]
]

execute_test_file: function [
    "This function takes a file! value, expect this value to be a test file, and launch the tests in that file."
    test_file [file!]
] [
    code: load test_file
    do code
    next_3: []

    repeat i length? code [
        clear next_3
        append/only next_3 code/(i + 1)
        append/only next_3 code/(i + 2)
        append/only next_3 code/(i + 3)

        unless (set-word? pick code i) and (func? next_3) [ continue ]

        STATE/current_test_func: to-string pick code i
		
		if next_3/1 == 'does [
			take/last next_3
		]

        current_function: do next_3
        current_function
    ]

]

; NOT DOCUMENTED
init_: function [
    "This function is the core of the test.red module."
    test_dir [file!]
] [
    print_beginning to-string test_dir

    foreach test_file (read test_dir) [
        ; I don't want to look recursivly for test file.
		; I don't want to look at secret file either.
        if (dir? test_file) or (dotfile? test_file) [ continue ]
		STATE/current_test_file: to-string test_file
        execute_test_file rejoin [ test_dir test_file ]
    ]

    print_end STATE/nb_test_total STATE/nb_test_passed to-string test_dir
]


init_ args_ system/options/args
