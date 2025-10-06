## Introduction

Welcome do Values.

## Modes

Values is front-end agnostic editor. It's core is dialect driven and different sources of dialect and also different targets.
Currently, terminal input and output is supported in form of line oriented modal editor.

* Line oriented - due to current limitations of Red language, it's not possible to implement full editor in console yet, so each action must be entered on separate line with LED - Line Editor Dialect.
* Modal - there are different modes of operation. Currently supported modes are `normal` and `jump`. Basically everything happens in `normal` mode. In `jump` mode, all values are prefixed with two letter prefix to simplify selection.

## Editing

* `i` - insert
* `a` - append

TODO: replace?

Needs subcommand what to insert/append:

* `t<text>` - insert text following "t".
* `f` - insert function.
* `f<name>:<spec>;<body>` - semicolons in body will be replaced by newline, to add comment use two semilocons
* `f<name>;<body>` - function without arguments (DOES-like function)
* `f<name>%<spec>;<body>` - specs are locals (HAS-like function)
* `f<name>:<args>%<locals>;<body>` - specs are constructed from args and locals
* `F<name>:<spec>;<body>` - FUNCTION instead of FUNC

TODO: e - edit

* `e<name>?<text>` - edit function help string (Help string can't contain colon. In such case use f?:<text>)
* `e<name>?<arg>:` - edit help string for argument/refinement
* `e<name>%<locals>` - set locals
* `e<name>%+<local>` - add local arg 
* `e<name>%-<local>` - remove local arg
* `e<name>:<args>` - set args
* `e<name>:<arg>!<type>[<space><arg>!<type>]` - set args with type. Delimit mulitple types with ! : `fmyfn:arg1!block arg2!string!tag`
* `e<name>:+<arg>` - add arg
* `e<name>:-<arg>` - remove arg
* `e<name>:<args>;<code>`

## Selection

* `m` - mark

Mark needs subcommand:

* `c` - clear mark
* `v<index>` - mark value at <index> in data
* `v<index>x<length>` - mark <length> values from <index> in data
* `@<index>` - limit selection to selection <index> only (not index in data)


Navigation:

* `b` - back: select previous value
* `n` - next: select next value

TODO: `B`, `N` - add to selection

## Displaying

* `v` - view

View needs subcommand:

* `s` - view script structure
* `f` - view list of functions
* `f<name>` - view function source
* `o` - view list of objects
* `o<name>` - view object


## Search and replace

* `/<value>` - search for value
* TODO: `%<rule>` - match parse rule 
* `/<type!>` - search for datatype
* TODO: `/*...` - search for all values
* NOTE: Currenlty searches for all values by default
* `/'...` - escape char: `/'*` searches for `*`

## Commenting

* `;` - comments

Comment needs subcommand:

* `;<text>` - add comment to (first) selected value or to actual buffer, when nothing is selected
* `;*<text>` - add comment to actual buffer
* `;<path><text>` - add comment to value at <path> 
* `;<path>` - show comment at <path>

## Disc access

* `:l<name>` - load file <name>
* `:s` - save file
* `:s<name>` - save file <name>

## Macros

Macros are defined by # (it's used in Red's preprocessor, so it's logical choice.)

* `#<name>:<commands>` - record macro
* `#<name>` - run macro
* `#?` - list macros
* `#-<name>` - remove macro

Macro name must start with letter (and maybe number), special chars are reserved for macro commands
Macros are persistent - saved on macro creation, loaded on VE start

## Loading function

Loading function that will report errors with ERROR.
Loading function should get type that has to be loaded.
Something like: LOAD-VALUE data type
It should also break execution, so there wouldn't be check in each call.
So throw/catch should be used.

## View

View consists of three parts:
AREA
STATUS
MESSAGE

AREA: Current value.
STATUS: Info about current value. Currently function.
MESSAGE: result of last command. Is cleared before each command and can be empty.

## Plugins

Plugins can add new functionality to Values. They do it by extending the dialect.
Plugin is a script that is loaded as context and added to plugins. Each plugin has some required fields:

### writing a plugin

```
name: 'plugin-name
version: 0.0.1
ved-rule: [additional dialect here]
```

If you want to use plugin from LED directly, you can add also `led-rule` that is optional.
Because LED dictionary is very limited, start your plugin commands with `_`. Don't start your plugins with a letter,
because most of letters are used by LED and LED's rules have higher priority.
This is currently not enforced, but may be done by default in the future

`led-rule: [rules for led]`

What follows is entirely up to plugin's author. VED comes with few basic plugins, check them for hints how to write them.

## Rendering options

Values allows changing some display options:

* Annotations - Annotations are symblos to show datatype of each value. For words it shows type of word's value.
* Syntax - turn syntax highlighting on/off
* Comments - comments can be attached to each value and their displaying can be turned on/off
* Depth - It's possible to change how many levels of nested blocks will be shown.
