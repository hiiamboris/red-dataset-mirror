Red [
    Title: "MySQL client"
	Author: "Boleslav Březovský"
	Resources: [
		https://dev.mysql.com/doc/dev/mysql-server/latest/PAGE_PROTOCOL.html
	]
	Notes: [
		Deprecated-commands: [field-list refresh process-info process-kill]
	]
	To-Do: [
		Commands: [change-user set-option]
	]
]

; -- support functions --------------------------------------------------------

print-reply: func [reply /local byte] [
	if reply [
		print "---"
		foreach byte reply [prin either byte > 31 [to char! byte] [#"."]]
		print "^/---"
	]
]

sha1: func [value] [checksum to binary! value 'sha1]

true?: func [value] [not not value]

; -- internal values and settings ---------------------------------------------

user: context [
	name:     "root"
	password: "qtaskdb123"
]

server: context [
	flags:
	salt: none
]

client: context [
	flags:
		none
]

state: 'get-handshake

; -- tables and default values ------------------------------------------------

packet!: make object! [
	length:
	seq-id:
	type:
	payload: none
]

hs!: make object! [
	server-version:
	version:
	thread-id:
	auth-plugin-data:
	capability-flags:
	character-set:
	status-flags:
	auth-plugin-name: none
]

packet:
hs:
length:
value:
payload:
packet: none

client-flags: compose [
	long-password		1		; new more secure passwords
	found-rows			2		; Found instead of affected rows
	long-flag			4		; Get all column flags
	connect-with-db		8		; One can specify db on connect
	no-schema			16		; Don't allow db.table.column
	compress			32		; Can use compression protcol
	odbc				64		; Odbc client
	local-files			128		; Can use LOAD DATA LOCAL
	ignore-space		256		; Ignore spaces before '('
	protocol-41			512		; Use new protocol (was "Support the mysql_change_user()")
	interactive			1024	; This is an interactive client
	ssl					2048	; Switch to SSL after handshake
	ignore-sigpipe		4096	; IGNORE sigpipes
	transactions		8196	; Client knows about transactions
	reserved			16384	; for 4.1.0 only
	reserved2			32768	; deprecated: old flag for 4.1.0 only
	multi-statements	(1 << 16)	; Enable/disable multi-stmt support
	multi-results		(1 << 17)	; Enable/disable multi-results
	ps-multi-results	(1 << 18)	; Multi-results and OUT parameters in PS-protocol
	plugin-auth			(1 << 19)	; Client supports plugin authentication
	connect-attrs		(1 << 20)	; Client supports connection attributes
	plugin-auth-lenenc-client-data
						(1 << 21)	; Enable authentication response packet to be larger than 255 bytes
	can-handle-expired-passwords
						(1 << 22)	; Don't close the connection for a user account with expired password
	session-track		(1 << 23)	; Capable of handling server state change information
	deprecate-eof		(1 << 24)	; Client no longer needs EOF_Packet and will use OK_Packet instead
	optional-resultset-metadata
						(1 << 25)	; The client can handle optional metadata information in the resultset
	zstd-compression-algorithm
						(1 << 26)	; Compression protocol extended to support zstd compression method.
	query-attributes	(1 << 27)	; Support optional extension for query parameters into the COM_QUERY and COM_STMT_EXECUTE packets.
	unknown-flag		(1 << 28)	; NOTE: it's here so the LOAD-FLAGS can work
	capability-extension
						(1 << 29)	; This flag will be reserved to extend the 32bit capabilities structure to 64bits.
	ssl-verify-server-cert
						(1 << 30)	; Verify server certificate
	remember-options	(1 << 31)	; Don't reset the options after an unsuccessful connect.
]

server-flags: [
	status-in-trans ; Is raised when a multi-statement transaction has been
					; started, either explicitly, by means of BEGIN or COMMIT
					; AND CHAIN, or implicitly, by the first transactional
					; statement, when autocommit=off.
	status-autocommit		; Server in auto_commit mode.
	more-results-exists		; Multi query - next query exists.
	query-no-good-index-used
	query-no-index-used
	status-cursor-exists	; The server was able to fulfill the clients request
							; and opened a read-only non-scrollable cursor for
							; a query.
							;
							; This flag comes in reply to COM_STMT_EXECUTE and
							; COM_STMT_FETCH commands. Used by Binary Protocol
							; Resultset to signal that COM_STMT_FETCH must be
							; used to fetch the row-data.
	status-last-row-sent	; This flag is sent when a read-only cursor is
							; exhausted, in reply to COM_STMT_FETCH command.
	status-db-dropped		; A database was dropped.
	status-no-backslash-escapes
	status-metadata-changed	; Sent to the client if after a prepared statement
							; reprepare we discovered that the new statement
							; returns a different number of result set columns.
	query-was-slow
	ps-out-params			; To mark ResultSet containing output parameter values.
	status-in-trans-readonly ; Set at the same time as SERVER_STATUS_IN_TRANS
							; if the started multi-statement transaction is a
							; read-only transaction.
							;
							; Cleared when the transaction commits or aborts.
							; Since this flag is sent to clients in OK and EOF
							; packets, the flag indicates the transaction status
							; at the end of command execution.
	session-state-changed	; This status flag, when on, implies that one of the
							; state information has changed on the server
							; because of the execution of the last statement. 
]

; -- internal functions -------------------------------------------------------

make-flags: func [flags /local out value] [
	out: 0
	foreach flag flags [
		if value: select client-flags flag [out: out or value]
	]
	; TODO: Always add PROTOCOL-41 flag
	out: to binary! out
	probe reverse out
]

load-server-flags: func [flags [binary!] /local out index flag] [
	out: copy []
	flags: reverse enbase/base flags 2
	index: 1
	foreach flag flags [
		if #"1" = flag [append out pick server-flags index]
		index: index + 1
	]
	out
]

load-flags: func [flags [binary!] /local out index flag] [
	print ["FLAGS:" flags]
	out: copy []
	flags: reverse enbase/base flags 2
	index: 1
	foreach flag flags [
		if #"1" = flag [append out pick client-flags index]
		index: index + 2
	]
	out
]

encrypt-password: func [/local hash1 hash2] [
	hash1: sha1 user/password
	hash2: sha1 hash1
	hash1 xor sha1 rejoin [to binary! server/salt hash2]
]

make-handshake: func [/local out] [
	password: encrypt-password
	out: copy #{}
	; -- sequence ID
	append out #{01} ; TODO: This probably should change

	; -- client_flag https://dev.mysql.com/doc/dev/mysql-server/latest/group__group__cs__capabilities__flags.html
	append out make-flags client/flags
	; -- max_packet_size
	append out reverse #{0000FFFF} ; FIXME: just a guess
	; -- character_set https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_character_set.html#a_protocol_character_set
	append out #{2D} ; always UTF8, let's ignore others
	; -- filler
	append/dup out #{00} 23 ; 23x zero byte
	; -- username
	append out user/name
	append out #{00}
	; -- auth_response
;	append out #{00}
	append out 20
	append out password
	; -- auth method TODO: depends on PLUGIN-AUTH flag
	append out "mysql_native_password"
	append out #{00}

	; -- insert length at beginning
	insert out reverse next to binary! (length? out) - 1

	out
]

process-input: func [port data] [
	either data: attempt [load data] [
		data: append clear [] data
		data: process-command data
		insert port data
	] [
		print "****** SYNTAX ERROR"
	]
]

process-command: func [data /local out] [
	out: copy #{}
	parse data [
		'ping	(append out #{0E})
	|	'stats	(append out #{09})
	|	['q | 'quit]	(append out #{01})
	|	'init	(repend out [#{02} value])
	|	'debug	(append out #{0D})
	|	'reset	(append out #{1F})
	|	copy value to end (
			repend out [#{03} form value] ; NOTE: form or mold?
		)
	]
	insert out #{00} ; seq-id
	insert out reverse next to binary! (length? out) - 1
	out
]

parse-handshake: func [data] [
	parse data handshake
	packet: make packet! []
	parse data [
		grab-int24 (packet/length: value)
		grab-int8 (packet/seq-id: value)
		; TODO check length here
		handshake
	]
	probe packet
]

parse-packet: func [data] [
	probe data
	packet: make packet! []
	parse data [
		grab-int24 (packet/length: value)
		grab-int8  (packet/seq-id: value)
		; TODO: check length here
		; TODO: rules depends on request type
		[
			if (state = 'authenticated) text-replyset
		|	ok-packet
		|	err-packet
		|	auth-switch-request ; FIXME: same header as OK packet. What to do?
		]
	]
	probe packet
]

to-bin: func [value [integer!]] [to binary! value]

to-lenenc: func [value [integer!]] [
	case [
		value <= 251	[skip to-bin value 3]
		value <= 65536	[rejoin [#{FC} reverse skip to-bin value - 252 2]]
		value <= 16777216 [rejoin [#{FD} reverse next to-bin value - 253]]
		'else			[rejoin [#{FE} reverse to-bin value - 254 #{00000000}]]
	]
]

; -- parse rules --------------------------------------------------------------

null: #{00}
grab-int32:  [copy value 4 skip (value: to integer! reverse value)]
grab-int24:  [copy value 3 skip (value: to integer! reverse value)]
grab-int16:  [copy value 2 skip (value: to integer! reverse value)]
grab-int8:   [copy value 1 skip (value: to integer! value)]
grab-string: [copy value to null skip (value: to string! value)]
grab-length: [copy value skip (length: to integer! value)]
grab-bool:   [copy value skip (value: #{01} = value)]
grab-length: [grab-int8 (length: value)] ; TODO: this should be lenenc, not int8
grab-lenenc-value: [zz: grab-length zzz: copy value length skip]


handshake: [
	(hs: make hs! [])
	grab-int8         (hs/version: value)
	grab-string       (hs/server-version: value)
	grab-int32        (hs/thread-id: value)
	copy value 8 skip (hs/auth-plugin-data: to string! value)
	skip ; filler
	copy value 2 skip (append hs/capability-flags: copy #{} value)
	copy value skip   (hs/character-set: value) ; TODO: conversion
	copy value 2 skip (hs/status-flags: value)
	copy value 2 skip (append hs/capability-flags value)
	(hs/capability-flags: load-flags reverse hs/capability-flags)
	(server/flags: hs/capability-flags)
	copy value skip   (length: max 13 (to integer! value) - 8)
	10 skip ; reserved
	copy value length skip (append hs/auth-plugin-data to string! value)
	(take/last hs/auth-plugin-data) ; get rid of trailing NULL
	(server/salt: hs/auth-plugin-data)
	grab-string       (hs/auth-plugin-name: value)

	(packet/type: 'handshake)
	(packet/payload: hs)
]

auth-switch-request: [
	#{FE} ; status tag
	(payload: context [plugin-name: plugin-data: none])
	grab-string       (payload/plugin-name: value)
	copy value to end (payload/plugin-data: to string! value)
	(packet/type: 'auth-switch-request)
	(packet/payload: payload)
]

err-packet: [
	#{FF}
	(payload: context [error-code: sql-state-marker: sql-state: error-message: none])
	grab-int16        (payload/error-code: value)
	; we ignore check for protocol-41 here, because we don’t support lower version
	copy value skip   (payload/sql-state-marker: to char! value)
	copy value 5 skip (payload/sql-state: to string! value)
	copy value to end (payload/error-message: to string! value)
	(packet/type: 'error)
	(packet/payload: payload)
]

ok-packet: [
	[#{00} | #{FE}]
	(
		payload: context [
			affected-rows: last-insert-id: status-flags: warnings: info:
			session-state-info: none
		]
	)
	grab-length
	copy value length skip (payload/affected-rows: value) ; TODO: conversion
	grab-length
	copy value length skip (payload/last-insert-id: value) ; TODO: conversion
	; NOTE: No chceck here as we always assume protocol-41
	copy value 2 skip (payload/status-flags: load-server-flags reverse value)
	grab-int16 (payload/warnings: value)
	; TODO: some other stuff here, ignored for now
	to end
	(packet/type: 'ok)
	(packet/payload: payload)
]

lebyte: none
lenenc-int-byte: charset [#"^@" - #"^(FB)"]
lenenc-int: [
	(value: none)
	[
		set lebyte lenenc-int-byte
	|	set lebyte #{FC} copy value 2 skip
	|	set lebyte #{FD} copy value 3 skip
	|	set lebyte #{FE} copy value 8 skip
	]
	(
		value: either value [
			probe value
			if 8 = length? value [clear skip value 4]
			probe value
			(to integer! lebyte) + to integer! reverse value
		] [
			to integer! lebyte
		]
	)
]

count: 0
text-replyset: [
	tt:
	(
		payload: context [
			metadata?:
			column-count:
				none
			columns: copy []
			data: copy []
		]
	)
(print #1)
	[
		if (true? client/flags/optional-resultset-metadata)
		grab-bool (payload/metadata?: value)
	|	break
	]
(print #2)
	lenenc-int (payload/column-count: value)
	[
		if (
			any [
				not client/flags/optional-resultset-metadata
				payload/metadata?
			]
		)
		(count: payload/column-count)
		count column-definition
	|	break
	]
(print #3)
	; TODO: possible EOF packet, but that’s deprecated so ignore it now
	some [
		text-resultset-row
		(append payload/data value)
	]
(print #4)
]

column-definition: [
	(
		column: context [
			catalog: schema: table: org-table: name: org-name: character-set:
			column-length: type: flags: decimals:
				none
		]
	)
	grab-lenenc-value (column/catalog: value)
	grab-lenenc-value (column/schema: value)
	grab-lenenc-value (column/table: value)
	grab-lenenc-value (column/org-name: value)
	grab-lenenc-value (column/name: value)
	#{0c} ; length of fixed fields
	grab-int16 (column/character-set: value)
	grab-int32 (column/column-length: value)
	grab-int8  (column/type: value)
	copy value 2 skip (column/flags: value)
	grab-int8  (column/decimals: value)
	(append payload/columns column)
]

text-resultset-row: [
	#{FB} (value: none)
|	t: grab-lenenc-value (value: to string! value)
]

ws: charset " ^-" ; newline doesn't make sense in prompt

; -- initialization -----------------------------------------------------------

client/flags: [
	long-password
	long-flag
	local-files
	protocol-41
	interactive
	transactions
	reserved2 ; NOTE: is it needed?
	multi-statements
	multi-results
	ps-multi-results
	plugin-auth
;	connect-attrs
	plugin-auth-lenenc-client-data
	can-handle-expired-passwords
	session-track
	deprecate-eof
]


start: [

print "mysql client"
;client: open tcp://172.18.0.2:3306
conn: open tcp://192.168.45.162:3306

conn/awake: func [event /local port] [
	print ["=== Client event:" event/type]
	port: event/port
	switch probe event/type [
		connect [
			; NOTE: Get initial handshake from server
			copy port
		]
		read [
			probe "client read done"
			probe state
			probe port/data
			print-reply port/data
			case [
				state = 'get-handshake [
					parse-handshake port/data
					state: 'got-handshake
					print "--write--"
					insert port probe make-handshake
					print "insert#1"
				]
				state = 'got-handshake [
					packet: parse-packet port/data
					either packet/type = 'ok [
						state: 'authenticated
						cmd: ask "mysql> "
					;	insert port probe send-command parse-input cmd
						process-input port cmd
					] [
						; TODO: Handle error
						close conn
					]
				]
				state = 'authenticated [
					packet: parse-packet port/data
				; TODO: Error handling
					print packet
					cmd: ask "mysql> "
				;	insert port probe send-command parse-input cmd
					process-input port cmd
				]
				'else [
					parse-packet port/data
					close conn
				]
			]
			clear port/data
		; NOTE: CLOSE port here crashes Red with Access violation
		;	close port
		;	return true
		]
		wrote [
			copy port
		;	if state = 'quit [close conn halt]
		]
		close [halt]
	]
	false
]

wait conn
close conn
print "Done"
]
