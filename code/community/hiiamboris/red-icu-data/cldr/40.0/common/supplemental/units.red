
    supplementalData [
        version [#number "$Revision$"] 
        unitConstants [
            unitConstant [#constant "lb_to_kg" #value "0.45359237"] 
            unitConstant [#constant "ft_to_m" #value "0.3048"] 
            unitConstant [#constant "ft2_to_m2" #value "ft_to_m*ft_to_m"] 
            unitConstant [#constant "ft3_to_m3" #value "ft_to_m*ft_to_m*ft_to_m"] 
            unitConstant [#constant "in3_to_m3" #value "ft3_to_m3/12*12*12"] 
            unitConstant [#constant "gal_to_m3" #value "231*in3_to_m3"] 
            unitConstant [#constant "gal_imp_to_m3" #value "0.00454609"] 
            unitConstant [#constant "glucose_molar_mass" #value "180.1557" #description {derivation from the mean atomic weights according to STANDARD ATOMIC WEIGHTS 2019 on https://ciaaw.org/atomic-weights.htm}] 
            unitConstant [#constant "item_per_mole" #value "6.02214076E+23"] 
            unitConstant [#constant "gravity" #value "9.80665"] 
            unitConstant [#constant "PI" #value "411557987 / 131002976" #status "approximate"] 
            unitConstant [#constant "G" #value "6.67408E-11" #status "approximate"]
        ] 
        unitQuantities [
            unitQuantity [#baseUnit "candela" #quantity "luminous-intensity" #status "simple"] 
            unitQuantity [#baseUnit "candela-per-square-meter" #quantity "illuminance"] 
            unitQuantity [#baseUnit "candela-square-meter-per-square-meter" #quantity "luminous-flux"] 
            unitQuantity [#baseUnit "kilogram" #quantity "mass" #status "simple"] 
            unitQuantity [#baseUnit "kilogram-per-kilogram" #quantity "mass-fraction"] 
            unitQuantity [#baseUnit "kilogram-per-cubic-meter" #quantity "mass-density"] 
            unitQuantity [#baseUnit "kilogram-per-meter-square-second" #quantity "pressure"] 
            unitQuantity [#baseUnit "kilogram-per-square-second-ampere" #quantity "magnetic-induction"] 
            unitQuantity [#baseUnit "kilogram-meter-per-square-second" #quantity "force"] 
            unitQuantity [#baseUnit "kilogram-square-meter-per-cubic-second" #quantity "power"] 
            unitQuantity [#baseUnit "kilogram-square-meter-per-cubic-second-ampere" #quantity "voltage"] 
            unitQuantity [#baseUnit {kilogram-square-meter-per-cubic-second-square-ampere} #quantity "electric-resistance"] 
            unitQuantity [#baseUnit "kilogram-square-meter-per-square-second" #quantity "energy"] 
            unitQuantity [#baseUnit "kilogram-square-meter-per-square-second-ampere" #quantity "magnetic-flux"] 
            unitQuantity [#baseUnit {kilogram-square-meter-per-square-second-square-ampere} #quantity "electric-inductance"] 
            unitQuantity [#baseUnit "cubic-meter" #quantity "volume"] 
            unitQuantity [#baseUnit "cubic-meter-per-kilogram" #quantity "specific-volume"] 
            unitQuantity [#baseUnit "cubic-meter-per-meter" #quantity "consumption"] 
            unitQuantity [#baseUnit "square-meter" #quantity "area"] 
            unitQuantity [#baseUnit "square-meter-per-square-second" #quantity "dose"] 
            unitQuantity [#baseUnit "meter" #quantity "length" #status "simple"] 
            unitQuantity [#baseUnit "meter-per-second" #quantity "speed"] 
            unitQuantity [#baseUnit "meter-per-square-second" #quantity "acceleration"] 
            unitQuantity [#baseUnit "kilogram-per-square-meter-square-second" #quantity "pressure-per-length"] 
            unitQuantity [#baseUnit {pow4-second-square-ampere-per-kilogram-square-meter} #quantity "electric-capacitance"] 
            unitQuantity [#baseUnit {cubic-second-square-ampere-per-kilogram-square-meter} #quantity "electric-conductance"] 
            unitQuantity [#baseUnit "second" #quantity "duration" #status "simple"] 
            unitQuantity [#baseUnit "second-ampere" #quantity "electric-charge"] 
            unitQuantity [#baseUnit "year" #quantity "year-duration" #status "simple"] 
            unitQuantity [#baseUnit "ampere" #quantity "electric-current" #status "simple"] 
            unitQuantity [#baseUnit "ampere-per-square-meter" #quantity "current-density"] 
            unitQuantity [#baseUnit "ampere-per-meter" #quantity "magnetic-field-strength"] 
            unitQuantity [#baseUnit "kelvin" #quantity "temperature" #status "simple"] 
            unitQuantity [#baseUnit "square-revolution" #quantity "solid-angle"] 
            unitQuantity [#baseUnit "revolution" #quantity "angle" #status "simple"] 
            unitQuantity [#baseUnit "revolution-per-meter" #quantity "wave-number"] 
            unitQuantity [#baseUnit "revolution-per-second" #quantity "frequency"] 
            unitQuantity [#baseUnit "item" #quantity "substance-amount" #status "simple"] 
            unitQuantity [#baseUnit "item-per-kilogram" #quantity "concentration-mass"] 
            unitQuantity [#baseUnit "item-per-cubic-meter" #quantity "concentration"] 
            unitQuantity [#baseUnit "portion" #quantity "portion" #status "simple"] 
            unitQuantity [#baseUnit "bit" #quantity "digital" #status "simple"] 
            unitQuantity [#baseUnit "pixel" #quantity "graphics" #status "simple"] 
            unitQuantity [#baseUnit "pixel-per-meter" #quantity "resolution"] 
            unitQuantity [#baseUnit "em" #quantity "typewidth" #status "simple"]
        ] 
        convertUnits [
            convertUnit [#source "candela" #baseUnit "candela" #systems "metric si"] 
            convertUnit [#source "grain" #baseUnit "kilogram" #factor "lb_to_kg/7000" #systems "ussystem uksystem"] 
            convertUnit [#source "carat" #baseUnit "kilogram" #factor "0.0002" #systems "metric"] 
            convertUnit [#source "gram" #baseUnit "kilogram" #factor "0.001" #systems "metric si"] 
            convertUnit [#source "ounce" #baseUnit "kilogram" #factor "lb_to_kg/16" #systems "ussystem uksystem"] 
            convertUnit [#source "ounce-troy" #baseUnit "kilogram" #factor "0.03110348" #systems "ussystem uksystem"] 
            convertUnit [#source "pound" #baseUnit "kilogram" #factor "lb_to_kg" #systems "ussystem uksystem"] 
            convertUnit [#source "kilogram" #baseUnit "kilogram" #systems "metric si"] 
            convertUnit [#source "stone" #baseUnit "kilogram" #factor "lb_to_kg*14" #systems "uksystem"] 
            convertUnit [#source "ton" #baseUnit "kilogram" #factor "lb_to_kg*2000" #systems "ussystem uksystem"] 
            convertUnit [#source "metric-ton" #baseUnit "kilogram" #factor "1000" #systems "metric"] 
            convertUnit [#source "earth-mass" #baseUnit "kilogram" #factor "5.9722E+24"] 
            convertUnit [#source "solar-mass" #baseUnit "kilogram" #factor "1.98847E+30"] 
            convertUnit [#source "drop" #baseUnit "cubic-meter" #factor "gal_to_m3/128*576" #systems "ussystem"] 
            convertUnit [#source "pinch" #baseUnit "cubic-meter" #factor "gal_to_m3/128*128" #systems "ussystem"] 
            convertUnit [#source "dessert-spoon" #baseUnit "cubic-meter" #factor "gal_to_m3/16*128" #systems "ussystem"] 
            convertUnit [#source "dessert-spoon-imperial" #baseUnit "cubic-meter" #factor "gal_imp_to_m3/16*128" #systems "uksystem"] 
            convertUnit [#source "dram" #baseUnit "cubic-meter" #factor "gal_to_m3/128*8" #systems "ussystem"] 
            convertUnit [#source "teaspoon" #baseUnit "cubic-meter" #factor "gal_to_m3/16*48" #systems "ussystem"] 
            convertUnit [#source "tablespoon" #baseUnit "cubic-meter" #factor "gal_to_m3/256" #systems "ussystem"] 
            convertUnit [#source "fluid-ounce-imperial" #baseUnit "cubic-meter" #factor "gal_imp_to_m3/160" #systems "uksystem"] 
            convertUnit [#source "fluid-ounce" #baseUnit "cubic-meter" #factor "gal_to_m3/128" #systems "ussystem"] 
            convertUnit [#source "jigger" #baseUnit "cubic-meter" #factor "gal_to_m3*3/128*2" #systems "ussystem"] 
            convertUnit [#source "cup" #baseUnit "cubic-meter" #factor "gal_to_m3/16" #systems "ussystem"] 
            convertUnit [#source "cup-metric" #baseUnit "cubic-meter" #factor "0.00025" #systems "metric"] 
            convertUnit [#source "pint" #baseUnit "cubic-meter" #factor "gal_to_m3/8" #systems "ussystem"] 
            convertUnit [#source "pint-metric" #baseUnit "cubic-meter" #factor "0.0005" #systems "metric"] 
            convertUnit [#source "quart" #baseUnit "cubic-meter" #factor "gal_to_m3/4" #systems "ussystem"] 
            convertUnit [#source "liter" #baseUnit "cubic-meter" #factor "0.001" #systems "metric"] 
            convertUnit [#source "quart-imperial" #baseUnit "cubic-meter" #factor "gal_imp_to_m3/4" #systems "uksystem"] 
            convertUnit [#source "gallon" #baseUnit "cubic-meter" #factor "gal_to_m3" #systems "ussystem"] 
            convertUnit [#source "gallon-imperial" #baseUnit "cubic-meter" #factor "gal_imp_to_m3" #systems "uksystem"] 
            convertUnit [#source "bushel" #baseUnit "cubic-meter" #factor "2150.42*in3_to_m3" #systems "ussystem"] 
            convertUnit [#source "barrel" #baseUnit "cubic-meter" #factor "42*gal_to_m3" #systems "ussystem"] 
            convertUnit [#source "dunam" #baseUnit "square-meter" #factor "1000"] 
            convertUnit [#source "acre" #baseUnit "square-meter" #factor "ft2_to_m2 * 43560" #systems "ussystem uksystem"] 
            convertUnit [#source "hectare" #baseUnit "square-meter" #factor "10000" #systems "metric"] 
            convertUnit [#source "point" #baseUnit "meter" #factor "ft_to_m/864" #systems "ussystem uksystem"] 
            convertUnit [#source "inch" #baseUnit "meter" #factor "ft_to_m/12" #systems "ussystem uksystem"] 
            convertUnit [#source "foot" #baseUnit "meter" #factor "ft_to_m" #systems "ussystem uksystem"] 
            convertUnit [#source "yard" #baseUnit "meter" #factor "ft_to_m*3" #systems "ussystem uksystem"] 
            convertUnit [#source "meter" #baseUnit "meter" #systems "metric si"] 
            convertUnit [#source "fathom" #baseUnit "meter" #factor "ft_to_m * 6" #systems "ussystem uksystem"] 
            convertUnit [#source "furlong" #baseUnit "meter" #factor "ft_to_m*660" #systems "ussystem uksystem"] 
            convertUnit [#source "mile" #baseUnit "meter" #factor "ft_to_m*5280" #systems "ussystem uksystem"] 
            convertUnit [#source "nautical-mile" #baseUnit "meter" #factor "1852" #systems "ussystem uksystem"] 
            convertUnit [#source "mile-scandinavian" #baseUnit "meter" #factor "10000" #systems "metric"] 
            convertUnit [#source "100-kilometer" #baseUnit "meter" #factor "100000" #systems "metric"] 
            convertUnit [#source "earth-radius" #baseUnit "meter" #factor "6.3781E6"] 
            convertUnit [#source "solar-radius" #baseUnit "meter" #factor "695700000"] 
            convertUnit [#source "astronomical-unit" #baseUnit "meter" #factor "149597900000"] 
            convertUnit [#source "light-year" #baseUnit "meter" #factor "9460730000000000"] 
            convertUnit [#source "parsec" #baseUnit "meter" #factor "30856780000000000"] 
            convertUnit [#source "second" #baseUnit "second" #systems "si metric ussystem uksystem"] 
            convertUnit [#source "minute" #baseUnit "second" #factor "60" #systems "metric ussystem uksystem"] 
            convertUnit [#source "hour" #baseUnit "second" #factor "3600" #systems "metric ussystem uksystem"] 
            convertUnit [#source "day" #baseUnit "second" #factor "86400" #systems "metric ussystem uksystem"] 
            convertUnit [#source "day-person" #baseUnit "second" #factor "86400" #systems "metric ussystem uksystem"] 
            convertUnit [#source "week" #baseUnit "second" #factor "604800"] 
            convertUnit [#source "week-person" #baseUnit "second" #factor "604800"] 
            convertUnit [#source "month" #baseUnit "year" #factor "1/12"] 
            convertUnit [#source "month-person" #baseUnit "year" #factor "1/12"] 
            convertUnit [#source "year" #baseUnit "year"] 
            convertUnit [#source "year-person" #baseUnit "year"] 
            convertUnit [#source "decade" #baseUnit "year" #factor "10"] 
            convertUnit [#source "century" #baseUnit "year" #factor "100"] 
            convertUnit [#source "ampere" #baseUnit "ampere" #systems "metric si"] 
            convertUnit [
                #source "fahrenheit" 
                #baseUnit "kelvin" 
                #factor "5/9" 
                #offset "2298.35/9" 
                #systems "ussystem uksystem"
            ] 
            convertUnit [#source "kelvin" #baseUnit "kelvin" #systems "metric si"] 
            convertUnit [#source "celsius" #baseUnit "kelvin" #offset "273.15" #systems "metric"] 
            convertUnit [#source "arc-second" #baseUnit "revolution" #factor "1/360*60*60"] 
            convertUnit [#source "arc-minute" #baseUnit "revolution" #factor "1/360*60"] 
            convertUnit [#source "degree" #baseUnit "revolution" #factor "1/360"] 
            convertUnit [#source "radian" #baseUnit "revolution" #factor "1/2*PI" #systems "metric si"] 
            convertUnit [#source "revolution" #baseUnit "revolution"] 
            convertUnit [#source "item" #baseUnit "item"] 
            convertUnit [#source "mole" #baseUnit "item" #factor "item_per_mole" #systems "metric si"] 
            convertUnit [#source "permillion" #baseUnit "portion" #factor "1/1000000"] 
            convertUnit [#source "permyriad" #baseUnit "portion" #factor "1/10000"] 
            convertUnit [#source "permille" #baseUnit "portion" #factor "1/1000"] 
            convertUnit [#source "percent" #baseUnit "portion" #factor "1/100"] 
            convertUnit [#source "karat" #baseUnit "portion" #factor "1/24"] 
            convertUnit [#source "portion" #baseUnit "portion"] 
            convertUnit [#source "bit" #baseUnit "bit"] 
            convertUnit [#source "byte" #baseUnit "bit" #factor "8"] 
            convertUnit [#source "dot" #baseUnit "pixel"] 
            convertUnit [#source "pixel" #baseUnit "pixel"] 
            convertUnit [#source "em" #baseUnit "em"] 
            convertUnit [#source "hertz" #baseUnit "revolution-per-second" #systems "metric si"] 
            convertUnit [#source "newton" #baseUnit "kilogram-meter-per-square-second" #systems "metric si"] 
            convertUnit [#source "pound-force" #baseUnit "kilogram-meter-per-square-second" #factor "lb_to_kg * gravity" #systems "ussystem uksystem"] 
            convertUnit [#source "pascal" #baseUnit "kilogram-per-meter-square-second" #systems "metric si"] 
            convertUnit [#source "bar" #baseUnit "kilogram-per-meter-square-second" #factor "100000" #systems "metric"] 
            convertUnit [#source "atmosphere" #baseUnit "kilogram-per-meter-square-second" #factor "101325"] 
            convertUnit [#source "ofhg" #baseUnit "kilogram-per-square-meter-square-second" #factor "13595.1*gravity"] 
            convertUnit [#source "electronvolt" #baseUnit "kilogram-square-meter-per-square-second" #factor "1.602177E-19"] 
            convertUnit [#source "dalton" #baseUnit "kilogram-square-meter-per-square-second" #factor "1.49241808560E-10"] 
            convertUnit [#source "joule" #baseUnit "kilogram-square-meter-per-square-second" #systems "metric si"] 
            convertUnit [#source "calorie" #baseUnit "kilogram-square-meter-per-square-second" #factor "4.184"] 
            convertUnit [#source "british-thermal-unit" #baseUnit "kilogram-square-meter-per-square-second" #factor "4.184*2267.96185/9" #systems "ussystem uksystem"] 
            convertUnit [#source "foodcalorie" #baseUnit "kilogram-square-meter-per-square-second" #factor "4184" #systems "ussystem uksystem"] 
            convertUnit [#source "therm-us" #baseUnit "kilogram-square-meter-per-square-second" #factor "105480400" #systems "ussystem"] 
            convertUnit [#source "watt" #baseUnit "kilogram-square-meter-per-cubic-second" #systems "metric si"] 
            convertUnit [#source "horsepower" #baseUnit "kilogram-square-meter-per-cubic-second" #factor "ft_to_m * lb_to_kg * gravity * 550" #systems "ussystem uksystem"] 
            convertUnit [#source "solar-luminosity" #baseUnit "kilogram-square-meter-per-cubic-second" #factor "3.828E+26"] 
            convertUnit [#source "volt" #baseUnit "kilogram-square-meter-per-cubic-second-ampere" #systems "metric si"] 
            convertUnit [#source "ohm" #baseUnit {kilogram-square-meter-per-cubic-second-square-ampere} #systems "metric si"] 
            convertUnit [#source "knot" #baseUnit "meter-per-second" #factor "1852/3600" #systems "ussystem uksystem"] 
            convertUnit [#source "g-force" #baseUnit "meter-per-square-second" #factor "gravity"] 
            convertUnit [#source "lux" #baseUnit "candela-per-square-meter" #systems "metric si"] 
            convertUnit [#source "lumen" #baseUnit "candela-square-meter-per-square-meter" #systems "metric si"] 
            convertUnit [#source "ofglucose" #baseUnit "item-per-kilogram" #factor "1000*item_per_mole/glucose_molar_mass"]
        ] 
        unitPreferenceData [
            #draft "contributed" 
            unitPreferences [
                #category "area" 
                #usage "default" 
                unitPreference [#regions "001" ! "square-kilometer"] 
                unitPreference [#regions "001" ! "hectare"] 
                unitPreference [#regions "001" ! "square-meter"] 
                unitPreference [#regions "001" ! "square-centimeter"] 
                unitPreference [#regions "US GB" ! "square-mile"] 
                unitPreference [#regions "US GB" ! "acre"] 
                unitPreference [#regions "US GB" ! "square-foot"] 
                unitPreference [#regions "US GB" ! "square-inch"]
            ] 
            unitPreferences [
                #category "area" 
                #usage "geograph" 
                unitPreference [#regions "001" ! "square-kilometer"] 
                unitPreference [#regions "US GB" ! "square-mile"]
            ] 
            unitPreferences [
                #category "area" 
                #usage "land" 
                unitPreference [#regions "001" ! "hectare"] 
                unitPreference [#regions "US GB" ! "acre"]
            ] 
            unitPreferences [
                #category "concentration" 
                #usage "blood-glucose" 
                unitPreference [#regions {AG AI AO AU BA BG BH BM BN BW BY CA CH CM CN CZ DK DM EE FI FJ GB GD HK HR HU IE IM IS KE KN KW KZ LC LI LT LU LV ME MG MK MO MS MT MU MY MZ NA NL NO NZ OM PG RS RU SE SG SI SK TC TO UA UG VC VG VN VU ZA} ! "millimole-per-liter"] 
                unitPreference [#regions "001" ! "milligram-ofglucose-per-deciliter"]
            ] 
            unitPreferences [
                #category "concentration" 
                #usage "default" 
                unitPreference [#regions "001" ! "item-per-cubic-meter"]
            ] 
            unitPreferences [
                #category "consumption" 
                #usage "default" 
                unitPreference [#regions "001" ! "liter-per-100-kilometer"]
            ] 
            unitPreferences [
                #category "consumption" 
                #usage "vehicle-fuel" 
                unitPreference [#regions "001" ! "liter-per-100-kilometer"] 
                unitPreference [#regions "BR IT JP KR MX MY NL TH TR" ! "liter-per-kilometer"] 
                unitPreference [#regions "US" ! "mile-per-gallon"] 
                unitPreference [#regions "CA GB" ! "mile-per-gallon-imperial"]
            ] 
            unitPreferences [
                #category "duration" 
                #usage "default" 
                unitPreference [#regions "001" ! "day"] 
                unitPreference [#regions "001" ! "hour"] 
                unitPreference [#regions "001" ! "minute"] 
                unitPreference [#regions "001" ! "second"] 
                unitPreference [#regions "001" ! "millisecond"] 
                unitPreference [#regions "001" ! "microsecond"] 
                unitPreference [#regions "001" ! "nanosecond"]
            ] 
            unitPreferences [
                #category "duration" 
                #usage "media" 
                unitPreference [#regions "001" ! "minute-and-second"] 
                unitPreference [#regions "001" ! "second"]
            ] 
            unitPreferences [
                #category "energy" 
                #usage "default" 
                unitPreference [#regions "001" ! "kilowatt-hour"]
            ] 
            unitPreferences [
                #category "energy" 
                #usage "food" 
                unitPreference [#regions "US" ! "foodcalorie"] 
                unitPreference [#regions "001" ! "kilocalorie"]
            ] 
            unitPreferences [
                #category "length" 
                #usage "default" 
                unitPreference [#regions "001" ! "kilometer"] 
                unitPreference [#regions "001" ! "meter"] 
                unitPreference [#regions "001" ! "centimeter"] 
                unitPreference [#regions "US GB" ! "mile"] 
                unitPreference [#regions "US GB" ! "foot"] 
                unitPreference [#regions "US GB" ! "inch"]
            ] 
            unitPreferences [
                #category "length" 
                #usage "focal-length" 
                unitPreference [#regions "001" ! "millimeter"]
            ] 
            unitPreferences [
                #category "length" 
                #usage "person" 
                unitPreference [#regions "001" ! "centimeter"] 
                unitPreference [#regions "CA GB IN US" ! "inch"]
            ] 
            unitPreferences [
                #category "length" 
                #usage "person-height" 
                unitPreference [#regions "001" ! "centimeter"] 
                unitPreference [#regions "CA GB IN US" #geq "3.0" ! "foot-and-inch"] 
                unitPreference [#regions "CA GB IN US" ! "inch"] 
                unitPreference [#regions "AT BE DZ EG ES FR HK ID IL IT JO MY SA SE TR VN" ! "meter-and-centimeter"]
            ] 
            unitPreferences [
                #category "length" 
                #usage "rainfall" 
                unitPreference [#regions "BR" ! "centimeter"] 
                unitPreference [#regions "US" ! "inch"] 
                unitPreference [#regions "001" ! "millimeter"]
            ] 
            unitPreferences [
                #category "length" 
                #usage "road" 
                unitPreference [#regions "001" #geq "0.9" ! "kilometer"] 
                unitPreference [#regions "001" #geq "300.0" #skeleton "precision-increment/50" ! "meter"] 
                unitPreference [#regions "001" #geq "10" #skeleton "precision-increment/10" ! "meter"] 
                unitPreference [#regions "001" #skeleton "precision-increment/1" ! "meter"] 
                unitPreference [#regions "US" #geq "0.5" ! "mile"] 
                unitPreference [#regions "US" #geq "100.0" #skeleton "precision-increment/50" ! "foot"] 
                unitPreference [#regions "US" #geq "10" #skeleton "precision-increment/10" ! "foot"] 
                unitPreference [#regions "US" #skeleton "precision-increment/1" ! "foot"] 
                unitPreference [#regions "GB" #geq "0.5" ! "mile"] 
                unitPreference [#regions "GB" #geq "100.0" #skeleton "precision-increment/50" ! "yard"] 
                unitPreference [#regions "GB" #geq "10" #skeleton "precision-increment/10" ! "yard"] 
                unitPreference [#regions "GB" #skeleton "precision-increment/1" ! "yard"] 
                unitPreference [#regions "SE" ! "mile-scandinavian"] 
                unitPreference [#regions "SE" ! "kilometer"] 
                unitPreference [#regions "SE" #geq "300.0" #skeleton "precision-increment/50" ! "meter"] 
                unitPreference [#regions "SE" #geq "10" #skeleton "precision-increment/10" ! "meter"] 
                unitPreference [#regions "SE" #skeleton "precision-increment/1" ! "meter"]
            ] 
            unitPreferences [
                #category "length" 
                #usage "snowfall" 
                unitPreference [#regions "001" ! "centimeter"] 
                unitPreference [#regions "US" ! "inch"]
            ] 
            unitPreferences [
                #category "length" 
                #usage "vehicle" 
                unitPreference [#regions "GB US" ! "foot-and-inch"] 
                unitPreference [#regions "001" ! "meter"]
            ] 
            unitPreferences [
                #category "length" 
                #usage "visiblty" 
                unitPreference [#regions "001" #geq "0.1" ! "kilometer"] 
                unitPreference [#regions "001" ! "meter"] 
                unitPreference [#regions "DE NL" ! "meter"] 
                unitPreference [#regions "GB US" ! "mile"] 
                unitPreference [#regions "GB US" ! "foot"]
            ] 
            unitPreferences [
                #category "mass" 
                #usage "default" 
                unitPreference [#regions "001" ! "metric-ton"] 
                unitPreference [#regions "001" ! "kilogram"] 
                unitPreference [#regions "001" ! "gram"] 
                unitPreference [#regions "001" ! "milligram"] 
                unitPreference [#regions "001" ! "microgram"] 
                unitPreference [#regions "US GB" ! "ton"] 
                unitPreference [#regions "US GB" ! "pound"] 
                unitPreference [#regions "US GB" ! "ounce"]
            ] 
            unitPreferences [
                #category "mass" 
                #usage "person" 
                unitPreference [#regions "001" ! "kilogram"] 
                unitPreference [#regions "001" ! "gram"] 
                unitPreference [#regions "US" ! "pound"] 
                unitPreference [#regions "US" ! "pound-and-ounce"] 
                unitPreference [#regions "GB" ! "stone-and-pound"] 
                unitPreference [#regions "GB" ! "pound-and-ounce"] 
                unitPreference [#regions "HK" ! "pound-and-ounce"]
            ] 
            unitPreferences [
                #category "mass-density" 
                #usage "default" 
                unitPreference [#regions "001" ! "kilogram-per-cubic-meter"]
            ] 
            unitPreferences [
                #category "power" 
                #usage "default" 
                unitPreference [#regions "001" ! "gigawatt"] 
                unitPreference [#regions "001" ! "megawatt"] 
                unitPreference [#regions "001" ! "kilowatt"] 
                unitPreference [#regions "001" ! "watt"] 
                unitPreference [#regions "001" ! "milliwatt"]
            ] 
            unitPreferences [
                #category "power" 
                #usage "engine" 
                unitPreference [#regions "001" ! "kilowatt"] 
                unitPreference [#regions "US GB" ! "horsepower"]
            ] 
            unitPreferences [
                #category "pressure" 
                #usage "baromtrc" 
                unitPreference [#regions "001" ! "hectopascal"] 
                unitPreference [#regions "IN US" ! "inch-ofhg"] 
                unitPreference [#regions "BR EG GB IL TH" ! "millibar"] 
                unitPreference [#regions "MX RU" ! "millimeter-ofhg"]
            ] 
            unitPreferences [
                #category "pressure" 
                #usage "default" 
                unitPreference [#regions "001" ! "megapascal"] 
                unitPreference [#regions "001" ! "pascal"] 
                unitPreference [#regions "US GB" ! "pound-force-per-square-inch"]
            ] 
            unitPreferences [
                #category "speed" 
                #usage "default" 
                unitPreference [#regions "001" ! "kilometer-per-hour"] 
                unitPreference [#regions "GB US" ! "mile-per-hour"]
            ] 
            unitPreferences [
                #category "speed" 
                #usage "wind" 
                unitPreference [#regions "001" ! "kilometer-per-hour"] 
                unitPreference [#regions "FI KR NO PL RU SE" ! "meter-per-second"] 
                unitPreference [#regions "US" ! "mile-per-hour"]
            ] 
            unitPreferences [
                #category "temperature" 
                #usage "default" 
                unitPreference [#regions "001" ! "celsius"] 
                unitPreference [#regions "US" ! "fahrenheit"]
            ] 
            unitPreferences [
                #category "temperature" 
                #usage "weather" 
                unitPreference [#regions "001" ! "celsius"] 
                unitPreference [#regions "BS BZ KY PR PW US" ! "fahrenheit"]
            ] 
            unitPreferences [
                #category "volume" 
                #usage "default" 
                unitPreference [#regions "001" ! "cubic-meter"] 
                unitPreference [#regions "001" ! "cubic-centimeter"] 
                unitPreference [#regions "US GB" ! "cubic-foot"] 
                unitPreference [#regions "US GB" ! "cubic-inch"]
            ] 
            unitPreferences [
                #category "volume" 
                #usage "fluid" 
                unitPreference [#regions "001" ! "liter"] 
                unitPreference [#regions "001" ! "milliliter"] 
                unitPreference [#regions "US" ! "gallon"] 
                unitPreference [#regions "US" ! "quart"] 
                unitPreference [#regions "US" ! "pint"] 
                unitPreference [#regions "US" ! "cup"] 
                unitPreference [#regions "US" ! "fluid-ounce"] 
                unitPreference [#regions "US" ! "tablespoon"] 
                unitPreference [#regions "US" ! "teaspoon"] 
                unitPreference [#regions "GB" ! "gallon-imperial"] 
                unitPreference [#regions "GB" ! "fluid-ounce-imperial"]
            ] 
            unitPreferences [
                #category "volume" 
                #usage "oil" 
                unitPreference [#regions "001" ! "barrel"]
            ] 
            unitPreferences [
                #category "volume" 
                #usage "vehicle" 
                unitPreference [#regions "US" ! "gallon"] 
                unitPreference [#regions "001" ! "liter"]
            ] 
            unitPreferences [
                #category "year-duration" 
                #usage "default" 
                unitPreference [#regions "001" ! "year"] 
                unitPreference [#regions "001" ! "month"]
            ] 
            unitPreferences [
                #category "year-duration" 
                #usage "person-age" 
                unitPreference [#regions "001" #geq "2.5" ! "year-person"] 
                unitPreference [#regions "001" ! "year-person-and-month-person"] 
                unitPreference [#regions "001" ! "month-person"]
            ]
        ] 
        metadata [
            alias [
                unitAlias [#type "inch-hg" #replacement "inch-ofhg" #reason "deprecated"] 
                unitAlias [#type "liter-per-100kilometers" #replacement "liter-per-100-kilometer" #reason "deprecated"] 
                unitAlias [#type "meter-per-second-squared" #replacement "meter-per-square-second" #reason "deprecated"] 
                unitAlias [#type "millimeter-of-mercury" #replacement "millimeter-ofhg" #reason "deprecated"] 
                unitAlias [#type "part-per-million" #replacement "permillion" #reason "deprecated"] 
                unitAlias [#type "pound-foot" #replacement "pound-force-foot" #reason "deprecated"] 
                unitAlias [#type "pound-per-square-inch" #replacement "pound-force-per-square-inch" #reason "deprecated"] 
                unitAlias [#type "milligram-per-deciliter" #replacement "milligram-ofglucose-per-deciliter" #reason "deprecated"] 
                usageAlias [#type "music-track" #replacement "media" #reason "deprecated"] 
                usageAlias [#type "tv-program" #replacement "media" #reason "deprecated"]
            ]
        ]
    ]

