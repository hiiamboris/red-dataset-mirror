do load %../../lib/parse_args/parse_args.red

set--flag-test: does [
	system/options/args: [ "--verbose" "-v" "verbose" "filler" "verbose"]

	; I'm checking if the flag has been deleted in the CLI by comparing the length of the arguments before and after using the function.
	assert "Set flag with two dashes." [
		args_len: length? system/options/args
		set--flag '--verbose 
		arg_deleted?: (length? system/options/args) == (args_len - 1)
		--verbose and arg_deleted?
	]
	unset '--verbose

	assert "Set flag with one dash" [
		args_len: length? system/options/args
		set--flag '-v 
		arg_deleted?: (length? system/options/args) == (args_len - 1)
		-v and arg_deleted?
	]
	unset '-v

	assert "Set flag with the first occurence in the command line" [
		args_len: length? system/options/args
		set--flag 'verbose
		arg_deleted?: (length? system/options/args) == (args_len - 1)
		is_verbose?: (take/last system/options/args) == "verbose"
		verbose and arg_deleted? and is_verbose?
	]
	unset 'verbose

	assert "Set flag not present in the CLI argument" [
		args_len: length? system/options/args
		set--flag 'not_present
		arg_deleted?: (length? system/options/args) == (args_len - 1)
		not (not_present or arg_deleted?)
	]
	unset 'not_present
]
