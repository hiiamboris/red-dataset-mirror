Red[]

magic-string: "258EAFA5-E914-47DA-95CA-C5AB0DC85B11"

make-accept-token: func [req-token] [
	enbase/base checksum rejoin [req-token magic-string] 'SHA1 64
]

opcodes: [
	0 continuation
	1 text
	2 binary
	9 ping
	10 pong
]

make-frame: func [] [
	frame: clear #{}
; -- byte 1
	; FIN			1bit
	; RSV1-3		3bit
	; opcode		4bit
; -- byte 2
	; MASK			1bit
	; payload len	7bit

[
	case [
		payload-len = 126 [ext-payload-len: [byte3 byte4]]
		payload-len = 127 [ext-payload-len: [byte3 - byte10]]
	]
		
]

[
	if mask? [
		mask: [byteN - byteN+4]
	]
]

; payload-data

]
