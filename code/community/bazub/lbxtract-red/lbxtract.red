Red [
	Title:      "LBX file resource extractor"
	Author:     "Vasyl Zubko"
	File:       %lbxtract.red
	Version:    1.0
	Tabs:       4
	Rights:     "Copyright (C) 2019 Vasyl Zubko. All rights reserved."
	License:    "Blue Oak Model License - https://blueoakcouncil.org/license/1.0.0"
	About:      {
		Reads and extracts data from the proprietary LBX file format used in
		some Simtex/Microprose games, namely Master of Magic and Master of Orion. NOTICE! Master of Orion 2
		is not supported, as it doesn't really conform to the specs of LBX as the other two games do.
		Description of LBX internals was found here - http://www.shikadi.net/moddingwiki/LBX_Format
	}
	Usage:      "Run the script from within the same folder where LBX files are located"
]

lbxfile: object [
	name: none
	num-files: none
	nm: none
	signature: none
	sign-contents: none
	contents-info: none
	offsets: []
	file-names: []
	file-descriptions: []
	file-contents: []

	scan: function [fpath] [
		lbx: read/binary fpath
		self/name: pick split to string! fpath "." 1
		offs: []
		namedescs: []

		parse lbx [
			start:
			copy num-files 2 skip (self/num-files: to integer! reverse num-files)
			copy signature 4 skip
			(unless self/signature = #{ADFE0000} [cause-error 'user 'message ["Not a valid LBX file"]])
			copy contents-info 2 skip
			collect set offs [num-files keep 4 skip]
			:start 512 skip
			;-- SPECIAL CASE: (MOM) SOUNDFX.LBX and INTROSFX.LBX have less names and descriptions than they have files
			(switch/default self/name [
				"SOUNDFX" [self/nm: num-files - 3]
				"INTROSFX" [self/nm: num-files - 4]
			][
				self/nm: num-files
			])
			collect set namedescs [nm keep 32 skip]
		]

		foreach o offs [append self/offsets (to integer! reverse o)]
		;-- SPECIAL CASE: (MOM) CMBTSND.LBX and NEWSOUND.LBX have no namedesc section, files begin at offset 512 instead
		if any [self/name = "CMBTSND" self/name = "NEWSOUND"] [clear namedescs]
		foreach nd namedescs [
			append self/file-names replace/all to string! copy/part nd 8 "^@" ""
			append self/file-descriptions replace/all to string! copy/part at nd 10 31 "^@" ""
		]

		check-sign-typical: (copy/part at lbx ((first self/offsets) + 1) 4)
		check-sign-special: (copy/part at lbx ((first self/offsets) + 17) 4)

		case [
			check-sign-typical = #{2D00436F} [self/sign-contents: "drv"]
			;check-sign-typical = #{52494646} [self/sign-contents: "wav"]
			check-sign-special = #{43726561} [self/sign-contents: "voc"]
			check-sign-special = #{464F524D} [self/sign-contents: "xmi"]
		]

		comment {SPECIAL CASE: (MOM) Both VOC and XMI files have 16 bytes of preceeding wrapper description
		that needs to be skipped for actual files to be usable}
		if (self/sign-contents = "voc") or (self/sign-contents = "xmi") [
			repeat offset length? self/offsets [
				poke self/offsets :offset (self/offsets/:offset + 16)
			]
		]

		while [not tail? self/offsets] [
			either not none? second self/offsets [
				st: first self/offsets
				sk: (second self/offsets) - (first self/offsets)
				parse lbx [
					st skip
					copy cont sk skip
					(append file-contents cont)
				]
			][
				st: first self/offsets
				parse lbx [
					st skip
					copy cont to end
					(append file-contents cont)
				]
			]
			self/offsets: next self/offsets
		]
		self/offsets: head self/offsets
	]

	extract: has [extract-dir filename] [
		extract-dir: rejoin [%EXTRACTED/ :self/name "/"]
		unless exists? extract-dir [
			make-dir/deep extract-dir
			repeat c self/num-files [
				;-- SPECIAL CASE: (MOM) SNDDRV.LBX has sound drivers at start and 2 XMI files at the end, so the type is mixed
				if self/name = "SNDDRV" [
					if any [c = (self/num-files - 1) c = self/num-files] [
						self/sign-contents: "xmi"
					]
				]
				either not none? self/file-names/:c [
					filename: copy to-file rejoin [extract-dir :c "_" self/file-names/:c "_"
					(replace/all self/file-descriptions/:c [" " | "/" | "," | ">" | "*" | "?"] "_") "." self/sign-contents]
				][
					filename: copy to-file rejoin [extract-dir :c "_" self/file-names/:c "_" self/file-descriptions/:c "." self/sign-contents]
				]
				write/binary filename self/file-contents/:c
		   ]
		]
	]
]

foreach file read %./ [
	if %.lbx = suffix? file [
		lbx: make lbxfile []
		lbx/scan file
		lbx/extract
	]
]