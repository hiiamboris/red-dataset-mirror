Red []

#include %../../cli.red

red-cli: context collect [										;-- collect all funcs that CLI can support
	pos: sws: to block! system/words
	while [pos: find/tail pos function!] [
		fun: :pos/-1
		if all [
			'help <> :pos/-2									;-- help is reserved for the script itself
			attempt [cli/internal/prepare-spec :pos/-1]			;-- ignore all funcs incompatible with CLI
		][
			keep to set-word! :pos/-2
			keep/only to get-path! reduce ['system 'words to word! :pos/-2]
		]
	]
]

set/any 'result cli/process-into red-cli
print ["^/" mold :result]
