Red [
	title:   "Red build tool GUI"
	purpose: "Building the console from sources for newbies"
	author:  @hiiamboris
	license: 'BSD-3
	needs:    View	; CLI
]

#include %redbuildcore.red
#include %../../../common/data-store.red

system/script/header: []
targets: [
	"Windows"
	"WindowsXP"
	"MSDOS"
	"Linux"
	"Linux-musl"
	"Linux-ARM"
	"RPi"
	"Darwin"
	"macOS"
	"Syllable"
	"FreeBSD"
	"NetBSD"
	"Android"
	"Android-x86"
]

ragequit: func [result msgs] [do make error! msgs]
print: func [value [any-type!]] [
	logs/text: form reduce :value
]
display: does [
	unless any [empty? logs/text logs/size = 320x100] [
		logs/size: 320x100
		logs/parent/size: logs/parent/size + 0x100
		logs/parent/parent/size: logs/parent/parent/size + 0x100
	]
]

save-conf: does [
	data-store/save-config to map! to block! object [
		console-type: con-type/text
		target-type:  tgt-type/text
		branch-name:  branch/text
		force-flag:   force?/data
		modules-list: modules/text
		debug-flag:   debug?/data
		rebol-path:   reb-path/text
		source-path:  src-path/text
		output-path:  out-path/text
	]
]

load-conf: function [] [
	unless empty? conf: data-store/load-config [
		; con-type/text:	conf/console-type				;@@ #5008 
		con-type/selected: index? any [find con-type/data conf/console-type []] 
		tgt-type/text:	conf/target-type  
		branch/text:	conf/branch-name  
		force?/data:	conf/force-flag   
		modules/text:	conf/modules-list 
		debug?/data:	conf/debug-flag   
		reb-path/text:	conf/rebol-path   
		src-path/text:	conf/source-path  
		out-path/text:	conf/output-path 
	]
]

view compose/deep [
	title "RedBuildGUI"
	style X: text 0
	panel 3 [
		text "Console type:"
		con-type: drop-list 200 data ["CLI" "GUI"] select 2 react [face/text: pick face/data face/selected]	;-- #1483
		X
		
		text "Target platform:"
		tgt-type: drop-down 200 data targets select (i: any [index? find targets form system/platform 1])
		X
		
		text "Git branch:"
		branch: drop-down 200 data ["master"] select 1
		X
		
		X
		force?: check "Forced checkout?" off
		X
		
		X
		pad 0x-10 text "(OVERRIDES LOCAL CHANGES)"
		X
		
		text "Modules to add:"
		modules: field 200 ""
		X
		
		X
		debug?: check "Debug mode?"
		X
		
		
		text "Rebol path:"
		reb-path: field 200 "rebol"
		button 20 "..." [
			if new: request-file/title/file "Locate rebol executable" "rebol*" [
				reb-path/text: to-local-file new
			]
		]
		
		text "Sources path:"
		src-path: field 200 ""
		button 20 "..." [
			if new: request-dir/title/keep "Locate Red sources" [
				src-path/text: to-local-file new
			]
		]
		
		text "Output path:"
		out-path: field 200 ""
		button 20 "..." [
			if new: request-dir/title/keep "Where to place the binary" [
				out-path/text: to-local-file new
			]
		]
		
		X
		button "BUILD" focus [
			error: try [
				apply 'red-build [
					con-type/text
					/target  yes tgt-type/text
					/debug   debug?/data
					/branch  yes branch/text
					/force   force?/data
					/sources yes clean-path to-red-file src-path/text
					/output  yes clean-path to-red-file out-path/text
					/module  not empty? modules/text  split trim/lines modules/text " "
					/rebol   not empty? reb-path/text  to-red-file reb-path/text
				]
			]
			if error? error [print error]
		]
		X
		
		logs: text 0x0 react [display face/text]
	] on-created [load-conf]
]
save-conf