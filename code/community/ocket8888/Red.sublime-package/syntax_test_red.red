; SYNTAX TEST "Packages/Red/Red.sublime-syntax"

Red []
;^^ keyword.other.native.red

;- Docline
; <- comment.block.documentation.red punctuation.definition.comment.begin.red
;  ^^^^^^^ comment.block.documentation.red


; comment line
; <- comment.line.red punctuation.definition.comment.begin.red
;^^^^^^^^^^^^^ comment.line.red

;@@ TODO fix this garbage
; <- comment.line.todo.red comment.block.documentation.red punctuation.definition.comment.begin.red
;^^ comment.line.todo.red comment.block.documentation.red punctuation.definition.comment.begin.red
;   ^^^^^^^^^^^^^^^^^^^^^ comment.line.todo.red comment.block.documentation.red meta.toc-list.red

comment [
;^^^^^^^^ comment.multiline.red punctuation.definition.comment.begin.red
    This is a comment as well.
;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ comment.multiline.red
]
; <- comment.multiline.red punctuation.definition.comment.end.red

page: read protocol://user:pass@host:port/path/to/resource
;^^^ variable.other.red
;   ^ keyword.operator.assignment.red
;     ^^^^ support.function.red meta.function-call.red
;         ^ meta.function-call.red
;          ^^^^^^^^^^^ string.unquoted.url.red markup.underline.link.red punctuation.definition.string.begin.red meta.function-call.red
;                     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ string.unquoted.url.red markup.underline.link.red meta.function-call.red


bitval: 2#{10010010}
somechar: #"a"
someescapedchar: #"^(del)"
newline: #"\^"
test: does [
    print [read/binary https://red-lang.org]
]
view layout [text: page]
;^^^ keyword.other.native.red
;    ^^^^^^ keyword.other.native.red
;           ^ meta.block.red meta.sequence.red punctuation.section.block.begin.red punctuation.section.sequence.begin.red
;            ^^^^^^^^^^ meta.block.red meta.sequence.red
;                      ^ meta.block.red meta.sequence.red punctuation.section.block.end.red punctuation.section.sequence.end.red


a: func [/extern x integer! y string!] [
; <- meta.function.red entity.name.function.red
;^ meta.function.red keyword.operator.assignment.red
; ^ meta.function.red
;  ^^^^ meta.function.red storage.type.red
;      ^ meta.function.red
;       ^ meta.function.parameters.red meta.group.red punctuation.section.group.begin.red
;        ^^^^^^^ meta.function.parameters.red meta.group.red storage.modifier.red
;               ^ meta.function.parameters.red meta.group.red
;                ^ meta.function.parameters.red meta.group.red variable.parameter.red
;                 ^ meta.function.parameters.red meta.group.red
;                  ^^^^^^^^ meta.function.parameters.red meta.group.red storage.type.red
;                          ^ meta.function.parameters.red meta.group.red
;                           ^ meta.function.parameters.red meta.group.red variable.parameter.red
;                            ^ meta.function.parameters.red meta.group.red
;                             ^^^^^^^ meta.function.parameters.red meta.group.red storage.type.red
;                                    ^ meta.function.parameters.red meta.group.red punctuation.section.group.end.red
;                                     ^ meta.function.red
;                                      ^ punctuation.section.block.begin.red meta.block.red meta.function.red
    print [ y ]
;^^^
;   ^^^^^ meta.function.red meta.block.red support.function.red meta.function-call.red
;        ^ meta.function.red meta.block.red meta.function-call
;         ^ meta.function.red meta.block.red meta.block.red meta.sequence.red punctuation.section.block.begin.red punctuation.section.sequence.begin.red meta.function-call.red
;          ^^^ meta.function.red meta.block.red meta.block.red meta.sequence.red meta.function-call
;             ^ meta.function.red meta.block.red meta.block.red meta.sequence.red meta.brackets.red punctuation.section.block.end.red punctuation.section.sequence.end.red punctuation.section.brackets.end.red
    x
;^^^^ meta.function.red meta.block.red
]
; <- meta.function.red meta.block.red punctuation.section.group.end.red

a: integer!
; <- variable.other.red
;^ keyword.operator.assignment.red
;  ^^^^^^^^ support.type.red

this: "is a string with ^(e)^s^(c)^(a)^p^(e)^(d) chars ^(del)"

here: { We have
        a multilined string}

lets: %"try %quoted %local %files"

unterminatedString: "testquest
;                             ^ string.quoted.double.red invalid.illegal.unterminated-string.red

lineContinuedString: "test \
quest" ;                   ^ source.red string.quoted.double.red punctuation.terminator.line-continuation.red

]
; <- invalid.illegal.stray-block-end.red
