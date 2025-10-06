Red [
	needs: 'view
	author: "Abdullah Yiğiterol"
	version: 0.1
]

dosya: false

view[
	title "SALÇA"
	size 500x600
	button "Yeni" [
		view [
			title "Yeni Red Dosyası"
			dosyaIsmi: field
			text ".red" font-size 16
			button "Oluştur" [
				write rejoin[%projeler/ dosyaIsmi/text ".red"] ""
				dosya: rejoin[%projeler/ dosyaIsmi/text ".red"]
			]
		]
	]
	button "Aç" [
		dosya: request-file
		kodnot/text: read dosya
	]
	button "Kaydet" [
		write dosya kodnot/text
	]
	text 120x20
	button "Çalıştır" [
		do kodnot/text
	]
	button "Derle" return
	kodnot: area 480x550 255.250.205 font-color 220.20.60 font-size 22 bold
]
