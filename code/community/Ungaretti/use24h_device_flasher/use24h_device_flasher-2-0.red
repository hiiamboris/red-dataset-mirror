Red [
	Title: "use24h device flasher"
	Author: A. Ungaretti
	Version 2.0
	Date-released: 23/12/2017
	needs: 'view
	icon: %use24h.ico
	Options: [red-strict-check?: off]                               
	; version 1.2 sends the string "flashing" at 115200 baud
	; version 2.0 adds Sonoff devices support
]

;---------- Functions ----------;

funcGetComPorts: 
; Uses the cmd prompt to obtain the COM ports available
	has[cmdOutput b c i] [                                           ;com-ports is made global
	cmdOutput: ""				                                     ;this will hold the output from cmd as text
	clear cmdOutput    
	com-ports: []                                                    ;this series will contain the COM ports
	clear com-ports 
	call/output "mode" cmdOutput                                     ;writes "mode" at cmd and puts answer in a block "cmdOutput"
	trim/with cmdOutput "-"                                          ;removes all "-" otherwise they are "glued" to COM text
	cmdOutput: split cmdOutput " "                                   ;splits cmdOutput into a series
	foreach i cmdOutput [                                            ;gets the numbers of the ports
		b: copy/part i 3
		if b = "COM" [
			c: copy/part i 4
			append com-ports c
		]
	]
]

funcGetBinFile: 
; selects and uploads the binary file to be flashed
	has[][
	binFileName: request-file/filter ["BIN files" "*.bin"]
	filename: to string! binFileName                                 ; must be a string for manipulation
	filename: find/last/tail filename "/"                            ; the name of the file without path
	fieldFilename/text: copy filename
]

funcCreateNewFile:
; changes the original file's 4th byte according to 
; the memory selected and saves this new file
	has[][
	switch dropMemorysize/text [
		"512K"  [h: 0]
		"256K"	[h: 1]
		"1M"	[h: 2]
		"2M"	[h: 3]
		"4M"	[h: 4]
		"8M"	[h: 8]
		"16M"	[h: 9]
	]
	byte: h * 16 + lowbyte
	poke binFile 4 byte
	write/binary %NewBinary.bin binFile
	view [
		text "NewBinary.bin created" rate 1
		on-time [unview]
	]
	exit
]

funcWrongMem:
; The selected .bin file's 4th byte does not match selection
	has[][
	view [
		below
		h4 200 center "Alert!"
		text 220x100 "The selected file is NOT for the memory size you chose. I can create a proper file if you want. This new file will be called NewBinary.bin and will be saved in the same directory as the original file."
		across
		button " Exit " [unview exit]
		button "Create new file"[
			funcCreateNewFile
			unview
		]
	]
]

funcCheckMem:
; Checks if the selected file's 4th byte matches memory selection
	has[][
	binFile: read/binary  binFileName
	byte: pick binFile 4
	lowbyte: remainder byte 16
	h: byte / 16
	if any [
		(h = 0) and (dropMemorysize/text <> "512K")
		(h = 1) and (dropMemorysize/text <> "256K")
		(h = 2) and (dropMemorysize/text <> "1M") 
		(h = 3) and (dropMemorysize/text <> "2M") 
		(h = 4) and (dropMemorysize/text <> "4M") 
		(h = 8) and (dropMemorysize/text <> "8M")
		(h = 9) and (dropMemorysize/text <> "16M")
		]
		[readyFlag: false
		funcWrongMem]
]


funcSerialSend:
; This function sends the word "flashing" at 74880 baud to let the device know it is being flashed
	
	has[] [
	serialtext: []
	clear head serialtext
	append serialtext "mode"
	append serialtext validComPort
	append serialtext "BAUD=115200 PARITY=n DATA=8 STOP=1"
	call form serialtext 
	thismoment: now/time/precise
	while [now/time/precise < (thismoment + 00:00:00.300)][]
	;call ""
	clear head serialtext
	append serialtext "echo flashing >"
	append serialtext dropComPort/text
	call form serialtext
	;call ""
	thismoment: now/time/precise
    while [now/time/precise < (thismoment + 00:00:00.800)][]
]

	
funcFlashEsp:
; Flasher for the detailed interface. Uses more options
; Create and send to cmd a proper command line string to esptool.exe
	has[][
	if validComPort = "Choose:" [                                ;checks if a COM port was selected
		view [
			title ""
			text "No COM port selected"
			button "OK"[unview exit]
		]
	]
	funcCheckMem
	either readyFlag [
		log: ""  ; to log the output of esptool.exe. For debugging.
		command: []
		append command "esptool.exe -vv -cd nodemcu -cb"
		append command dropBaudRate/text
		append command "-cp"
		append command validComPort
		append command "-ca 0x00000 -cf"
		append command fieldFilename/text
		alert: view/no-wait [
			text "Flashing..."]
		call/shell/output form command log
		unview alert
		either (find/last log "flush") <> "flush complete^/" [
			view [
				below
				h5 font-color red bold "OOPS! Failed"
				text 200x50 "Check the esptool-ck log below and close this window to change the default options"
				logarea: area 200x300
				do [logarea/text: log]
			]
		]
		[
			view [text "Flash successful!"]
		]
		clear command
		clear log
	][exit]
]

;----------- Setup--------------;
; Here some variables are initialized. This avoids some issues during compilation
; Also, the function to get the COM port is run.

funcGetComPorts
readyFlag: true
lowbyte: 0
h: 0
binfile: ""
binFileName: %use24h_firmware.bin
validComPort: ""

; ----------- Views -----------;

DetailedView: layout [
	title "Use24h Device Flasher"
	h5 font-color red bold center middle "Use24h Device Flasher options:"
	return
	text right bold "Serial port:"
	dropComPort2: drop-down 200 "Choose:" data copy com-ports
	do [
		if (length? com-ports) = 1 [                              ;if there is only one COM port
			dropComPort2/text: pick com-ports 1                         
		]
	]
	button "Scan ports" 70 [
		funcGetComPorts
		dropComPort2/data: copy com-ports
		dropComPort2/text: pick com-ports 1
	]
	return
	text 600x50 "The use24h flasher should detect all the COM ports available automatically. Make sure you select the port your device is connected to."
	return
	text right bold "File to flash:"
	fieldFilename: field 200
	do [fieldFilename/text: "use24h_firmware.bin"]
	button "Browse" 70 [funcGetBinFile]
	return
	text 600x30 {You may choose to flash a firmware other than "use24h_firmware.bin".}
	return
	text right bold "Memory size:" 
	dropMemorysize: drop-down 70 data ["512K" "256K" "1M" "2M" "4M" "8M" "16M"]
	return
	text 600x50 "Most NodeMcu boards come with 4MB of flash memory. If your device has other memory size you should select it. You will be prompted for a firmware fix if it does not match your device."
	return
	do [dropMemorysize/selected: 5 
	dropMemorysize/text: pick (dropMemorysize/data) dropMemorysize/selected]
	text right bold "Baud rate:" 
	dropBaudRate: drop-down 70 data ["9600" "57600" "74880" "115200" "230400" "921600"]
	return
	text 600x30 "Most NodeMcu boards accept a speed of 921600, but if you are having trouble to flash your device, try a lower baud rate."
	return
	do [
		dropBaudRate/selected: 6 
		dropBaudRate/text: pick (dropBaudRate/data)
		dropBaudRate/selected
	]
	return
	pad 250x1
	button 70x35 center bold "Flash it!" [
		validComPort: dropComPort2/text
		funcSerialSend
		funcFlashEsp
		readyFlag: true
	]
]

NoBrainView: layout [
	title "Use24h Flasher"
	
	text right bold "Serial port:"
	dropComPort: drop-down 70 "Choose:" data copy com-ports
	do [
		if (length? com-ports) = 1 [                              ;if there is only one COM port
			dropComPort/text: pick com-ports 1                         
		]
	]
	button "+Options" 60 [
		unview NoBrainView
		view DetailedView
	]

	return
	pad 80x5
	button 70x35 center bold red "Flash it!" [
		validComPort: form dropComPort/text
		funcSerialSend
		funcFlashEsp
		readyFlag: true
	]
]

;-------------  Main --------------------


view NoBrainView

