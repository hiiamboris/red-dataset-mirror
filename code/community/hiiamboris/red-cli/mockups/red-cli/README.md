This is an example how to make a multiple command CLI.

It provides a CLI for all `function!`s globally defined except those not supported by the CLI syntax (and there's a lot of those :).

Evaluates, prints the result. It's not very useful in practice, just as a demo.

Examples:
```
$ red-cli cos 3.14159

-0.9999999999964793


$ red-cli load-json [1,2,{"3":4},5,6]

[1 2 #(
    "3" 4
) 5 6]


$ red-cli request-file --help
red cli 4-Dec-2023

Syntax: red-cli request-file [options]

Options:
      --title   <text>
      --file    <name>
      --filter  [list]
      --save
      --multi
      --version        Display program version and exit
  -h, --help           Display this help text and exit


$ red-cli decode-url https://codeberg.org/hiiamboris/red-cli/

make object! [
    scheme: 'https
    user-info: none
    host: "codeberg.org"
    port: none
    path: %/hiiamboris/
    target: %red-cli/
    query: none
    fragment: none
    ref: https://codeberg.org/hiiamboris/red-cli/
]
```

