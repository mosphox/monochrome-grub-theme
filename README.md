# Monochrome GRUB Theme
Well kinda monochrome but whatever. Yet another grub theme here.

## Features

## Install
#### Clone the repo like this
```
git clone https://github.com/mosphox/monochrome-grub-theme.git
```
(Or just download and unzip it anywhere)

#### Get into the folder
```
cd monochrome-grub-theme
```
You might need to add -main at the end if it was downloaded using git clone

#### Run
```
sudo chmod +x install.sh
bash ./install.sh
```
#### Reboot to check if anything changed

## Scaling stuff
- This was designed for a 3200×2000 resolution (16:10 ratio), so the background image might (well, actually will) look a bit squished on 16:9 monitors.
Luckily, there’s a file called background169.png included — use it to replace the original background if you care about aspect ratios and visual dignity.
(Yes, I cropped it for you. You're welcome. Some gratitude would be nice.)

- Logos should work fine as long as your resolution isn’t too small.
They’re aligned pretty much perfectly for 3200×2000, but they might drift slightly on other resolutions — even ones that are close enough.
Hopefully it’s not too bad.

- Fonts are probably the most scale-proof thing in the entire theme.
But hey — if you want to tweak their size, you totally can.
Check the [Replacing Fonts](https://github.com/mosphox/monochrome-grub-theme/edit/main/README.md#replacing-fonts) section below for more details on how to ruin the layout.

## A little note about everything thats written below
This README was mostly written for future me — y’know, just in case I mess something up and have to reinstall everything from scratch.
So yeah, you might find the rest of it a bit over-explained or unnecessarily detailed.<br>
Most of what follows is pretty irrelevant unless you’re into tweaking stuff for fun or you're trying to figure out how something works.<br></br>
So yeah, feel free to skip the rest.<br>
Unless, of course, you want to read it.

## Editing
There’s a theme.txt file inside (obviously), packed with all the stuff that makes this theme tick.<br>

#### Here’s what you might actually want to tweak:

- Change the line "Booting selected OS" to match your GRUB default entry.<br></br>
- Labels are positioned right in the center of the boot menu, so you can align them however you like.
Valid options are "left", "center", and "right" — in case you want your bootloader to express itself.<br></br>
- The terminal box is placed in the center, inside a kinda fading-out frame.
If you’d rather just have a clean black fullscreen terminal, replace this in your theme.txt:<br></br>
  ```
  terminal-font: "DejaVu Sans Mono Regular 22"
  terminal-left: "0%"
  terminal-top: "0%"
  terminal-width: "100%"
  terminal-height: "100%"
  terminal-border: "0"
  ```
- If you want to remove the bright vertical line on the left of the selected menu entry and make the entire selection box monochrome
— just replace select_w.png with select_w.png.bak.<br></br>
- Icons are currently shown at 3/4 of their original size. If you want them bigger, feel free to resize them — just keep in mind the source logos were 64×64 pixels.
Going much bigger than that might make things look... a little cursed.

## Replacing fonts
#### Creating fonts
You can use GRUB’s built-in tool to convert any .ttf font into the .pf2 format it actually understands:
```
grub-mkfont path_to_font.ttf -s font_size -o output_font.pf2
```
There are a bunch of flags you can mess with — just run:
```
grub-mkfont --help
```
I’ve tried playing around with them to make fonts look smoother…
But let’s be real — they all still look kinda crippled.
However, some fonts do come out looking better than others, so experiment a bit.

#### Applying fonts
Once you've generated your precious .pf2 file, just toss it into your theme folder.
GRUB will automatically pick it up when you reinstall the theme using install.sh.

To actually apply the font, reference it by name in your theme.txt file (typically something like "FancyFont Regular 20").
To make things easier, you can list all available fonts and their exact names by opening the GRUB console and running:
```
lsfonts
```

## Icons

## Other stuff explained

#### Labels
There are two labels used in the layout.<br>
The first one doesn’t include the countdown timer (%d), but it still has an id="__timeout__" applied.
That’s on purpose — it makes both labels disappear as soon as you hit any key, even if one of them technically isn’t a timer.

#### Icons
- The included icons have a slightly weird ratio (5:4) — that was intentional, btw.
(Some fancy spacing that couldn’t be done any other way.)<br>
- The icons were originally created using a script, but I’ve redrawn a few of them — specifically Windows, Ubuntu, UEFI, Reboot, and Shutdown — so they actually look nicer than the rest.


## debugging
#### Adding icons to menu entries
Wanna slap some icons onto your boot entries? Totally doable.
Check out the full [GRUB manual](https://www.gnu.org/software/grub/manual/grub/grub.html) if you're feeling brave and want to see everything that’s tweakable.<br></br>
TL;DR:<br>
Just add --class icon_filename_without_extension to your menuentry line.
GRUB will look for an icon with that name inside your theme’s icons/ folder.
```
menuentry "Nuke my PC" --class nuke {
    ...
}
```
Just make sure it exists. GRUB isn’t very forgiving.<br></br>

You can also use this trick to add separators between different sections in your menu.
Just leave a space inside the entry name, like this:
```
menuentry " " {
    true
}
```
It’ll show up as a blank line in the menu — great for splitting things into neat little blocks.
Heads up: it’s still technically selectable (and clickable), but all it does is... nothing.

## Tests and Compatibility
This was created and tested on Ubuntu so this should work in any debian distro. Although the install script should also support Arch installation (in theory) it hasn't been tested out,
so you might actually need to tweak it a little to make things work<br>
Also the theme was originally tested in 2560x1600 VM, still looks fine in this resolution

credits
grub-update















- 

## Features
- This theme was designed for 3200x2000 resolution
