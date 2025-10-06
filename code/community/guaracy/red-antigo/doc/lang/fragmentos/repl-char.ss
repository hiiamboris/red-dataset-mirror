red>> ? char!
     comma      :  #","
     cr         :  #"^M"
     dot        :  #"."
     escape     :  #"^["
     lf         :  #"^/"
     newline    :  #"^/"
     null       :  #"^@"
     slash      :  #"/"
     sp         :  #" "
     space      :  #" "
     tab        :  #"^-"
red>> type? "A"
== string!
red>> type? #"A"
== char!
red>> char? #"^@"
== true
red>> to integer! #"^@"
== 0
red>> to integer! null
== 0
red>> char? null
== true
red>> 