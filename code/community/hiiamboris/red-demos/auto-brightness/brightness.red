Red [
	title: "A (Windows-only) demo how to automatically adjust primary display's brightness based on the ambient light amount captured by the default camera"
	needs: view
]

;; https://learn.microsoft.com/en-us/windows/win32/wmicoreprov/wmisetbrightness-method-in-class-wmimonitorbrightnessmethods?redirectedfrom=MSDN
;; https://stackoverflow.com/questions/65707114/how-to-pass-wmic-parameters-for-wmisetbrightness
view [camera 10x10 select 1 rate 1 on-time [shot: copy face/image unview]]
r: g: b: 0
n: shot/size/x * shot/size/y
foreach c shot [
	r: r + c/1
	g: g + c/2
	b: b + c/3
]
;@@ need to calibrate
threshold: 10
power: 1.2
b: max 0 min 100 to integer! r + g + b / 3 / 255 / n ** power * 100 - threshold / (1 - (threshold / 100))
call/shell rejoin [{wmic /namespace:\\root\wmi path WmiMonitorBrightnessMethods where "Active=TRUE" call WmiSetBrightness }b", 0"]
