Red[
	Title: "Redquire - list of packages"
]

http-tools #(
	name: "Red Tools"
	file: %http-tools.red
	source: https://raw.githubusercontent.com/rebolek/red-tools/master/http-tools.red
)
json #(
	name: "JSON"
	file: %json.red
	source: https://raw.githubusercontent.com/rebolek/red-tools/master/codecs/json.red
)
csv #(
	name: "CSV"
	file: %csv.red
	source: https://raw.githubusercontent.com/rebolek/red-tools/master/codecs/csv.red
)
xml #(
	name: "XML"
	file: %xml.red
	source: https://raw.githubusercontent.com/rebolek/red-tools/master/codecs/xml.red
)
ansi-seq #(
	name: "ANSI sequence dialect"
	file: %ansi-seq.red
	source: https://raw.githubusercontent.com/rebolek/red-tools/master/ansi-seq.red
)
github-v3 #(
	name: "Github REST API"
	file: %github-v3.red
	source: https://raw.githubusercontent.com/rebolek/red-tools/master/apis/github-v3.red
	require: [http-tools json]
)
plus #(
    name: "Plugin System"
    file: %plus.red
    source: https://gitlab.com/rebolek/plus/raw/master/plus.red
)