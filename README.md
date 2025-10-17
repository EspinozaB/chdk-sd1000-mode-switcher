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

1. Install **CHDK** on your SD card (tested on 1.4+).
2. Copy `SD1000_Mode_Switcher.lua` into:/CHDK/SCRIPTS/
3. On your camera:
- Enter **Script menu**
- Load the script
- Set parameters:
  - `m`: Mode (0=Auto Photo, 1=Manual Photo, 2=Video, 3=Playback/Library, 4=Custom)
  - `c`: Custom Mode ID (if `m=4`)
  - `d`: Delay between mode changes (default 100 ms)
- Press **Shutter (full press)** to run.

---

##  Example Scene Mode IDs
| Mode | ID | Scene |
|------|----|--------|
| 6 | Aquarium |
| 7 | Beach |
| 10 | Grayscale |
| 14 | Digital Macro |
| 18 | Fireworks |
| 20 | Foliage |
| 23 | Indoor |
| 25 | Kids/Pets |
| 34 | Night |
| 36 | Portrait |
| 41 | Snow |
| 44 | Stitch |
| 49 | Underwater |

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


