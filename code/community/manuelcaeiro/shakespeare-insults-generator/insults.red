Red [
    needs: 'view
    file: insults.red
    Author: "manuelcaeiro"
]

col1: ["Away, you" "Come, you" "Thou" "You poor"]
col2: [" peevish" " grizzled" " greasy" " jaded" " waggish" " purpled" " rank" 
      " saucy" " vacant" " yeasty"]
col3: [" clay-brained" " dog-hearted" " evil-eyed" " lily-livered" " mad-bred" 
      " onion-eyed" " paper-faced" " rump-fed" " shag-eared" " white-livered"]
col4: [" three-inch fool" " canker blossom" " clot pole" " hedge-pig" " dogfish" 
      " egg-shell" " nut-hook" " pantaloon" " rabbit-sucker" " snipe younker"]
      
ins: [random/only col1 random/only col2 "," random/only col3 "," random/only col4 "!"]
view [
     size 750x100 
     title "Shakespearean insult generator for kids" 
     below center button "Insult me!" [phrase/text: form rejoin ins] phrase: text 725x35 font-size 20 center
]

