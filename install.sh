#!/bin/bash
# Monochrome GRUB Theme Installer

echo "###############################################################"
echo "#                                                             #"
echo "#                                                             #"
echo "#         Monochrome GRUB Theme Installation Sequence         #"
echo "#           Because looking good starts at boot time.         #"
echo "#                                                             #"
echo "#                                                             #"
echo "#   This theme was designed for 3200x2000 resolution.         #"
echo "#   It should work fine on anything close, especially 16:10.  #"
echo "#   If you're on some cursed 16:9 setup, the background       #"
echo "#   might get squished. Crop it manually or embrace chaos.    #"
echo "#                                                             #"
echo "#   Fonts are chunky by design. On 1080p or below, expect     #"
echo "#   drama. And maybe broken layout.                           #"
echo "#                                                             #"
echo "#   Icons for Windows, Ubuntu, and UEFI were redrawn nicely.  #"
echo "#   The rest - slapped through a script and barely touched.   #"
echo "#   If they look weird — that's on you now.                   #"
echo "#                                                             #"
echo "#                                                             #"
echo "#   DISCLAIMER:                                               #"
echo "#                                                             #"
echo "#   I'm seriously suggesting you read this script before      #"
echo "#   typing in your root password and smashimg enter.          #"
echo "#   I wouldn't trust myself either.                           #"
echo "#                                                             #"
echo "#   In theory, it installs the theme and lets your PC boot    #"
echo "#   afterward. In practice? Who knows.                        #"
echo "#                                                             #"
echo "#   The one semi-reassuring fact: most of this script was     #"
echo "#   shamelessly stolen from a theme that actually did work.   #"
echo "#                                                             #"
echo "#   So yeah — run it at your own risk. Or don’t.              #"
echo "#   Not running it is definitely safer.                       #"
echo "#                                                             #"
echo "#                                                             #"
echo "#                                                             #"
echo "#           Made by mosphox and their dark-hearted assistant  #"
echo "#             (that's actually how ChatGPT called himself :)  #"
echo "#                                                             #"
echo "###############################################################"

echo ""

echo "[sudo] Summon your root powers. Prove you're worthy."
sudo -v || { echo "Sudo rejected you. The gods remain silent."; exit 1; }

echo ""

THEME_NAME="monochrome"
THEME_DIR="/boot/grub/themes"
THEME_PATH="$THEME_DIR/$THEME_NAME/theme.txt"
GRUB_CONFIG="/etc/default/grub"
BACKUP="$GRUB_CONFIG.bak"

if [ ! -d "$THEME_NAME" ]; then
  echo "Where is the '$THEME_NAME' folder, mortal? It’s not here."
  echo "Did you summon this script in the wrong directory?"
  exit 1
fi

if [ -d "$THEME_DIR/$THEME_NAME" ]; then
  echo "An old theme lingers in $THEME_DIR..."
  echo "Purging the sins of the past..."
  sudo rm -rf "$THEME_DIR/$THEME_NAME"
fi

echo ""

echo "Delivering the sacred Monochrome theme to GRUB’s temple..."
sudo mkdir -p "$THEME_DIR"
sudo cp -r "$THEME_NAME" "$THEME_DIR/" || { echo "The theme resisted installation. Uncooperative pixels."; exit 1; }
echo "It is done. The theme rests in place."

echo ""

echo "Forging a backup of /etc/default/grub. Just in case chaos wins."
sudo cp "$GRUB_CONFIG" "$BACKUP"

echo ""

echo "Scouring past GRUB_THEME declarations with fire and sed."
sudo sed -i '/^GRUB_THEME=/d' "$GRUB_CONFIG"

sudo sed -i -e '$a\' "$GRUB_CONFIG"
echo "GRUB_THEME=\"$THEME_PATH\"" | sudo tee -a "$GRUB_CONFIG" > /dev/null
echo "Inscribed Monochrome's name into GRUB’s sacred scroll."

echo ""

echo "Summoning GRUB from the void..."
if command -v update-grub &> /dev/null; then
  sudo update-grub
elif command -v grub-mkconfig &> /dev/null; then
  sudo grub-mkconfig -o /boot/grub/grub.cfg
else
  echo "Alas, no grub updater was found. You’re flying manual now."
  exit 1
fi

echo ""
echo "✨ Installation complete. Monochrome has claimed your GRUB."
echo "   Reboot and face the quiet superiority of your new GRUB."
echo ""
read -n 1 -s -r -p "Press any key to return to your mortal desktop..."
echo ""
