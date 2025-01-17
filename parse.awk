#!/usr/bin/env awk -f

$1 ~ /^BSS/ {
    if($2 !~ /Load:/) { #< Escape "BBS Load:" line
        gsub("(\\(.*|:)", "", $2)
        MAC = toupper($2)
        wifi[MAC]["enc"] = "OPEN"
        wifi[MAC]["WPS"] = "no"
        wifi[MAC]["wpa1"] = ""
        wifi[MAC]["wpa2"] = ""
        wifi[MAC]["wep"] = ""
    }
}
$1 == "SSID:" {
    # Workaround spaces in SSID
    FS=":" #< Changing field separator on ":", it should be
           #  forbidded sign for SSID name
    $0=$0
    sub(" ", "", $2) #< remove first whitespace
    wifi[MAC]["SSID"] = $2
    FS=" "
    $0=$0
}
$1 == "capability:" {
    for(i=2; i<=NF; i++) {
        if($i ~ /0x[0-9]{4}/) {
            gsub("(\\(|\\))", "", $i)
            if (and(strtonum($i), 0x10)) 
                wifi[MAC]["wep"] = "WEP"
        }
    }
}
$1 == "WPA:" {
    wifi[MAC]["wpa1"] = "WPA1"
}
$1 == "RSN:" {
    wifi[MAC]["wpa2"] = "WPA2"
}
$1 == "WPS:" {
    wifi[MAC]["WPS"] = "yes"
}
$1 == "DS" {
    wifi[MAC]["Ch"] = $5
}
$1 == "signal:" {
    match($2, /-([0-9]{2})\.00/, m)
    wifi[MAC]["Sig"] = m[1]
}
$1 == "TSF:" {
    gsub("(\\(|d|,)", "", $4)
    match($5, /([0-9]{2}):([0-9]{2}):/, m)
    day = $4
    hour = m[1]
    min = m[2]
    wifi[MAC]["TSF"] = day"d"hour"h"min"m"
}
END {
    printf " {\"%s\":{\"availablenetworks\":\n[ ", interface
    i=0
    for (w in wifi) {
        if (wifi[w]["wep"]) {
            if (wifi[w]["wpa1"] || wifi[w]["wpa2"])
                wifi[w]["enc"] = wifi[w]["wpa1"]wifi[w]["wpa2"]
            else
                wifi[w]["enc"] = "WEP"
        }
        if ( i > 0 ) {
	    print ","
        }
        printf " {\"MAC\":\"%s\",\"SSID\":\"%s\",\"ENC\":\"%s\",\"WPS\":\"%s\",\"CH\":\"%s\",\"SIG\":\"%s\",\"TSF\":\"%s\"}\n ", w, wifi[w]["SSID"], wifi[w]["enc"], \
               wifi[w]["WPS"], wifi[w]["Ch"], wifi[w]["Sig"], wifi[w]["TSF"]
        i=i+1
   }
    print "]\n}\n}\n"
}


