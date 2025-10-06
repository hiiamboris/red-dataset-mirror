Red [
  Title:   "Hosts Editor"
  Author:  "me"
  Needs:   'View
  Purpose: {
    edit the hosts files
    block sites, remove distractions
    at least try, but fail
  }
]

hostsPath: %"C:\Windows\System32\drivers\etc\hosts"
hostsContents: read hostsPath

view/flags [
  title "Hosts Editor"
  below
  
  source: area #13181E 900x800 no-border hostsContents font [
    name: font-fixed
    size: 14
    color: hex-to-rgb #9EBACB
  ]

  save: button "Save" [
    write hostsPath source/text
  ] 
] [resize]
