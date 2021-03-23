# PT Fancyfonter

![total downloads](https://img.shields.io/github/downloads/thecornois/pt-fancyfonter/total.svg)
### PT Fancyfonter is a tool written entirely in [Autohotkey](https://www.autohotkey.com/#keyfeatures) that you can use to, type 𝗯𝗼𝗹𝗱, 𝘪𝘵𝘢𝘭𝘪𝘤𝘪𝘻𝘦𝘥, u̲n̲d̲e̲r̲l̲i̲n̲e̲d̲, and s̶t̶r̶u̶c̶k̶t̶h̶r̶o̶u̶gh text, and also text in 5 𝒐𝒕𝒉𝒆𝒓 𝒻𝑜𝓃𝓉𝓈!

*I use the term "font" loosely however, because these "fonts" were not actually meant to be stylish typefaces for use in everyday text, just different typefaces used for mathematical and technical purposes.*
You can learn more about them [here](https://www.unicode.org/reports/tr25/tr25-15.pdf#%5B%7B%22num%22%3A34%2C%22gen%22%3A0%7D%2C%7B%22name%22%3A%22XYZ%22%7D%2C69%2C274%2C0%5D).


## Usage

<a href="url"><img src="https://imgur.com/aklvfQy.png" align="right" height="234" width="170" ></a> <a href="url"><img src="https://i.imgur.com/Bk2XqMG.png" align="right" height="234" width="170" ></a>

* In the Popup, click the modifier you would like to apply to enable it.

* Click the font you would like to type in to enable it.

* (Optional) Use the assigned 
[hotkey](#Hotkeys)
for a modifier or font to enable it.
#### Note: [Not all modifiers work for each font.](#font-modifier-compatibility-chart)

<br />

### Popup
  You can show the popup by pressing the key combination `Windows + S`, or  you can click the icon in the taskbar.
  
  <a href="url"><img src="https://i.imgur.com/axnh9fR.png" align="center"></a>

  If you do not see it, it should be in the hidden taskbar icons, which you can access by pressing the `^` button in the taskbar.

<br />

## Hotkeys

<a href="url"><img src="https://i.imgur.com/ojCRler.png" align="right" height="290" width="385" ></a>

Click on the hotkey input area, and press your key combination to set a hotkey.

If you made a mistake, you can press the Reset button to reset the hotkey back to its [default value.](#default-hotkeys)

Remember to press "Save Changes" to save your changes.

<br />
<br />
<br />
<br />

## How does it work?

Every letter you type in a different font or in bold or italics using PT Fancyfonter is it's own [Unicode character](https://home.unicode.org/basic-info/overview/) 
(basically, a symbol inside Unicode, a standard for all symbols on the web)

These unicode characters already exist and are not created, so every time you type a bolded or italicized letter, the app looks for the appropriate Unicode character, and sends it.

However, there aren't characters for every combination of modifier and font exist inside Unicode, which is why there are some compatibility limitations with each modifier and font, which you can all find [here](#font-modifier-compatibility-chart).

The underlining is done by sending a "combining low line" character (U+0332) and the strikingthrough is done by sending a "combining long stroke overlay" character (U+0336)
These are found in the [Combining Diacritical Marks block in Unicode](https://www.unicode.org/charts/PDF/U0300.pdf), which you can learn more about [here:](https://www.unicode.org/charts/PDF/U0300.pdf)

# Resource Charts

## Font-modifier compatibility chart:

| Font | Limitations with modifiers |
| ----- | ----------- |
| Default | No limitations |
| 𝐓𝐢𝐦𝐞𝐬 𝐍𝐞𝐰 𝐑𝐨𝐦𝐚𝐧 | Cannot be un-bolded or italicized |
| 𝒞𝓊𝓇𝓈𝒾𝓋𝑒 | Cannot be un-italicized |
| 𝔉𝔯𝔞𝔨𝔱𝔲𝔯 | Cannot be italicized |
| 𝙲𝚘𝚞𝚛𝚒𝚎𝚛 𝙽𝚎𝚠 | Cannot be bolded or italicized |
| 𝔻𝕠𝕦𝕓𝕝𝕖-𝕤𝕥𝕣𝕦𝕔𝕜 | Cannot be un-bolded or italicized |

<br />

## Default Hotkeys:

| Item | Default key combination |
| ----- | ----------- |
| Bold | Alt + B |
| 𝘐𝘵𝘢𝘭𝘪𝘤𝘴 | Alt + I |
| U̲n̲d̲e̲r̲l̲i̲n̲e̲ | Alt + U |
| S̶t̶r̶i̶k̶e̶t̶h̶r̶o̶u̶gh̶ | Alt + S |
| Default Font | Shift + Escape |
| 𝐓𝐢𝐦𝐞𝐬 𝐍𝐞𝐰 𝐑𝐨𝐦𝐚𝐧 | No combination |
| 𝒞𝓊𝓇𝓈𝒾𝓋𝑒 | No combination |
| 𝔉𝔯𝔞𝔨𝔱𝔲𝔯 | No combination |
| 𝙲𝚘𝚞𝚛𝚒𝚎𝚛 𝙽𝚎𝚠 | No combination |
| 𝔻𝕠𝕦𝕓𝕝𝕖-𝕤𝕥𝕣𝕦𝕔𝕜 | No combination |

## License
PT Fancyfonter is available under the Apache License, Version 2.0.
