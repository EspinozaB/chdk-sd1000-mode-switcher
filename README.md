# Canon SD1000 / IXUS 70 CHDK Mode Switcher

A **CHDK Lua script** for Canon PowerShot SD1000 (IXUS 70) cameras with broken or unreliable mode sliders.  
This lets you switch between **Auto Photo**, **Manual Photo**, **Video**, and **Playback** modes via software.

---

## Features
- Switches between **photo**, **video**, and **playback** modes.
- Supports **custom mode IDs** for scene modes (portrait, fireworks, macro, etc.).
- Uses CHDK’s `capmode` library for precise mode control.
- Works around the broken mode slider common on aging SD1000 units.

---

## Usage

1. Install **CHDK** on your SD (NON SDHC) card (tested on 1.4+).
2. Copy `mode_toggle.lua` into:/CHDK/SCRIPTS/
3. On your camera:
- Enter **Script menu** by using the printer button > Menu > Script
- Select Load the script from file and select the mode_toggle.lua script
- Set parameters in the "SD1000 Mode Switcher":
  - `m`: Mode (0=Auto Photo, 1=Manual Photo, 2=Video, 3=Playback/Library, 4=Custom)
  - `c`: Custom Mode ID (if `m=4`)
  - `d`: Delay between mode changes (default 100 ms)
- Press **Shutter (full press)** to run.

---

##  Example Scene Mode IDs
| Mode | ID | Scene |
|------|----|--------|
| 4 | 6 | Aquarium |
| 4 | 7 | Beach |
| 4 | 10 | Grayscale |
| 4 | 14 | Digital Macro |
| 4 | 18 | Fireworks |
| 4 | 20 | Foliage |
| 4 | 23 | Indoor |
| 4 | 25 | Kids/Pets |
| 4 | 34 | Night |
| 4 | 36 | Portrait |
| 4 | 41 | Snow |
| 4 | 44 | Stitch |
| 4 | 49 | Underwater |

---

## Notes
- Tested on **Canon PowerShot SD1000 / IXUS 70 firmware rev. 101a**.
- Other Digic III models (A570IS, A590IS, etc.) may work with adjusted mode IDs.
- Compatible with **CHDK 1.4 and newer**.
- Licensed under the **MIT License**.

---

## Credits
- Script by Brian Espinoza
- Built using CHDK Lua API and `capmode` module.


