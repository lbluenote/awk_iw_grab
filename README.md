# INTRO
This small awk script helps to parse [iw](https://wireless.wiki.kernel.org/en/users/documentation/iw) tool output. This is just an example, you can modify it as you like.

iw tool output is not stable and format might change in the future.

### Requirenments
* GNU Awk 4.2.1 or later
* jq 1.6 

Might work with some older versions too.

### Usage
```bash
# iw dev wlan0 scan | awk -f -v interface=vlan0 parse.awk
```
Output with test router:
```
{
  "wlan0": {
    "availablenetworks": [
      {
        "MAC": "3618D66D05A8",
        "SSID": "TEST1",
        "ENC": "WPA2",
        "WPS": "no",
        "CH": "13",
        "SIG": "78",
        "TSF": "0d00h00m"
      },
      {
        "MAC": "1618D66D05A8",
        "SSID": "TEST2",
        "ENC": "WPA2",
        "WPS": "no",
        "CH": "13",
        "SIG": "82",
        "TSF": "0d00h00m"
      },
      {
        "MAC": "0618D66D05A8",
        "SSID": "TEST2_Guests",
        "ENC": "WPA2",
        "WPS": "no",
        "CH": "13",
        "SIG": "82",
        "TSF": "0d00h00m"
      },
      {
        "MAC": "58C17AE130C0",
        "SSID": "The TEST3",
        "ENC": "WPA2",
        "WPS": "no",
        "CH": "6",
        "SIG": "86",
        "TSF": "0d00h00m"
      },
      {
        "MAC": "3618D66D0579",
        "SSID": "",
        "ENC": "WPA2",
        "WPS": "no",
        "CH": "1",
        "SIG": "68",
        "TSF": "0d00h00m"
      },
      {
        "MAC": "1618D66D0579",
        "SSID": "TEST2",
        "ENC": "WPA2",
        "WPS": "no",
        "CH": "1",
        "SIG": "73",
        "TSF": "0d00h00m"
      },
      {
        "MAC": "0618D66D0579",
        "SSID": "TEST2_Guests",
        "ENC": "WPA2",
        "WPS": "no",
        "CH": "1",
        "SIG": "58",
        "TSF": "0d00h00m"
      },
      {
        "MAC": "1618D66D0667",
        "SSID": "TEST2",
        "ENC": "WPA2",
        "WPS": "no",
        "CH": "6",
        "SIG": "81",
        "TSF": "0d00h00m"
      },
      {
        "MAC": "0618D66D0667",
        "SSID": "TEST2_Guests",
        "ENC": "WPA2",
        "WPS": "no",
        "CH": "6",
        "SIG": "87",
        "TSF": "0d00h00m"
      },
      {
        "MAC": "586D8F2082A7",
        "SSID": "OMAP_2GHz",
        "ENC": "OPEN",
        "WPS": "yes",
        "CH": "1",
        "SIG": "55",
        "TSF": "0d00h00m"
      }
    ]
  }
}
```

### Licence
MIT
