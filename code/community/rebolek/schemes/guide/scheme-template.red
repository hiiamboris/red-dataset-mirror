Red [
	Title: "Scheme template"
	Author: "Boleslav Březovský"
	Note: {
This is template shows how schemes can be written. However, that's not
the only way. The code is organized according to my prefferences and should
be considered as a guide only. You can of course organize your code
differently.
For example, you don't need to keep scheme actions in a separate context
but it certainly simplifies writing the scheme if you do.
	}
]

template-proto: context [

; -- local variables --

	default-port: 9876

; -- support functions --

comment {
subort is the TCP or TLS port used for actual communication. It will be
stored in PORT/EXTRA block.
}

	init-port: func [port /local subport] [
		subport: open rejoin [
			tcp:// port/spec/host #":"
			; decide to use user provided port nmumber or the default one
			any [port/spec/port default-port]
		]
		subport/awake: :awake ; assing the AWAKE function to the subport
		subport/extra: [
			state: none		; storing STATE is a good practice. It allows us
							; to treat the scheme as a state machine where
							; each state leads to next.
			request: none	; REQUEST may be build in multiple steps so
							; it's a good idea to store it and have it
							; accessible.
			response: none	; RESPONSE must be kept somewhere so we can
							; return it on COPY PORT.
		]
		port/extra: reduce [
			quote subport: subport
			quote timeout: 0:0:10	; in the blocking mode we need timeout
									; value, so the scheme won't stuck when
									; the port is not accessible
		]
	]

; -- event handler

comment {
Event handler handles events created by actions. Each time an action is called
(open, copy, insert, close, ...), an event is created and must be handled by
the event handler. You can't call two action without handling action's event.
}

	awake: func [event /local port] [
		port: event/port
		switch event/type [
			connect []
			read []
			wrote []
		]
	]

; -- scheme actions --

comment {
All scheme actions are kept in separate context so they won't override
standard actions. Each action creates an event that must be handled by
the event handler. See above.
}

	scheme: context [
; Here we are defining scheme actions, which means defining action words
; but it's possible we would need to use the original words somewhere
; in our code (COPY, INSERT, ...)
; Therefore, we define SYS as a shortcut to SYSTEM/WORDS and we must be
; VERY CAREFUL to use the SYS prefix each time we use one of the actions
; otherwise we'll end up with hard to track bugs.

		sys: system/words

		open: func [port] [init-port port]

		copy: func [port] [
; Ports can be opened either in blocking or async mode. The difference
; is to use ASYNC flag or use OPEN/ASYNC (which sets the async flag).
; When the port is opened in blocking mode, scheme must handle waiting
; by itself.
			unless find port/flags 'async [wait port/extra/timeout]
		]

		insert: func [port data] []

		close: func [port] []
	]
]

register-scheme make system/standard/scheme [
	name: 'template
	title: "Template scheme"
	actor: template-proto/scheme
]
