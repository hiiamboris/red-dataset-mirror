Red [
    Title: "index.red"
]

do read http://redlang.red/bootstrap
file: %src/getting-started/index.html
create-bootstrap-page/to-clipboard/to-file file
bootstrap-title/title/to-clipboard/to-file "Welcome to MyMementos.space" file
bootstrap-background-color/color/to-clipboard/to-file "#FF0000" file
bootstrap-navbar/to-clipboard/to-file/brand/menu file "mymementos.space" [
    ["Home" "#"]
    ["About" "#"]
    ["Languages" "#"]
]

