# INTRO
This small awk script helps to parse [iw](https://wireless.wiki.kernel.org/en/users/documentation/iw) tool output. This is just an example, you can modify it as you like.

iw tool output is not stable and format might change in the future.

### Requirenments
* GNU Awk 4.2.1 or later

Might work with some older versions too.

### Usage
```bash
# iw dev wlan0 scan | awk -f parse.awk
```
Output with test router:
```
A5FEF2C499BB:test-ssid2:OPEN:no:9:43:0d00h00m
039EFACA9A8B:test-ssid2:WPA1WPA2:no:9:33:0d00h00m
038BF3C1988B:test-ssid2:WPA2:no:9:35:0d00h00m
028EF3C2997B:test-ssid2:WPA1WPA2:no:9:35:0d00h03m
```

### Licence
MIT
