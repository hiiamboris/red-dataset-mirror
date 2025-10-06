Red [
	Title: "use24h device flasher"
	Author: A. Ungaretti
	Version 3.0
	Date-released: 27/06/2018
	needs: 'view
	icon: %use24h.ico
	Options: [red-strict-check?: off]                               
]

;---------- Functions ----------;

funcGetComPorts: 
; Uses Windows' cmd  to obtain the COM ports available
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
	
funcFlashEsp:
; Create and send to cmd a proper command line string to esptool.exe
has[][

	log: ""  ; to log the output of esptool.exe. For debugging.
	command: []
	
	append command "esptool.exe -cp"
	append command validComPort
	append command "-cd nodemcu -ce"
	alert: view/no-wait [
		text "Erasing..."]
	call/shell/output form command log
	unview alert
	clear command
	
	append command "esptool.exe -vv -cd nodemcu -cb"
	either slowspeed/data [append command "115200"][append command "921600"]
	append command "-cp"
	append command validComPort
	append command "-ca 0x00000 -cf"
	case [
		r1/data [append command "use24hESP8266-4M.bin"]
		r2/data [append command "use24hESP8266-1M.bin"]
		r3/data [append command "use24hSONOFF.bin"]
	]
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
]

;----------- Setup--------------;
; Here some variables are initialized. This avoids some issues during compilation
; Also, the function to get the COM port is run.

funcGetComPorts
validComPort: ""


; ----------- View -----------;

view [
	title "use24h Flasher"
	
	text right bold "Serial port:"
	dropComPort: drop-down 70 "Choose:" data copy com-ports
	do [
		if (length? com-ports) = 1 [                            ;if there is only one COM port
			dropComPort/text: pick com-ports 1                         
		]
	]
	button "Scan ports" 70 [
		funcGetComPorts
		dropComPort/data: copy com-ports
		dropComPort/text: pick com-ports 1
	]
	return
	below
	text bold "Choose your board type:"
	r1: radio "NodeMcu 4M (example: Wemos D1 mini)" data on
	r2: radio "NodeMcu 1M (example: Wemos D1 mini lite)"
	r3: radio "SONOFF Basic (warranty will be voided!)"
	
	pad 30x15
	text bold "Options:"
	slowspeed: check "Use reduced flashing speed"

	pad 60x5
	button 70x35 center bold red "Flash it!" [
		validComPort: form dropComPort/text
		either validComPort = "Choose:" [                     ;checks if a COM port was selected
			view [
				title ""
				text "No COM port selected"
				button "OK"[unview exit]
			]
		][
		validComPort: form dropComPort/text
		funcFlashEsp
		]
	]
]




