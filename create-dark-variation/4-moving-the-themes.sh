#!/bin/bash
#
##################################################################################################################
# Written to be used on 64 bits computers
# Author  :  anisbsalah
# Github  :  https://github.com/anisbsalah
##################################################################################################################
##################################################################################################################
#
# DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################

choice=$1

if [[ $# -ne 1 ]]; then

	echo
	echo "Let us rename the folders so they are unique."
	echo "Your name will be added after 'Mint-L-Dark'."
	echo "For example if you type Sun you will get:"
	echo "E.g. Mint-L-Dark-Sun"

	read -erp "How should we name this new theme? First letter is a capital letter (no space but '-') : " choice

	echo "Renaming the folders"

fi

# if there is no hidden folder then make one
[[ -d "$HOME/.themes" ]] || mkdir -p "$HOME/.themes"

cp -rf usr/share/themes/Mint-L-Dark "$HOME/.themes"

# fix for gtk2 sublime text select menu still green
cp ~/.themes/Mint-L-Dark/gtk-2.0/assets/menubar_button.png ~/.themes/Mint-L-Dark/gtk-2.0/menubar-toolbar/menubar_button-dark.png
cp ~/.themes/Mint-L-Dark/gtk-2.0/assets/menubar_button.png ~/.themes/Mint-L-Dark/gtk-2.0/menubar-toolbar/menubar_button.png

cp ~/.themes/Mint-L-Dark/gtk-2.0/assets/toolbar-entry-border-active-bg.png ~/.themes/Mint-L-Dark/gtk-2.0/menubar-toolbar/toolbar-entry-border-active-bg-dark.png
cp ~/.themes/Mint-L-Dark/gtk-2.0/assets/toolbar-entry-border-active-bg.png ~/.themes/Mint-L-Dark/gtk-2.0/menubar-toolbar/toolbar-entry-border-active-bg.png


mv "$HOME/.themes/Mint-L-Dark" "$HOME/.themes/Mint-L-Dark-$choice"

echo "################################################################"
echo "Renaming inside the index.theme"
echo "Mint-L-Dark-$choice"
find "$HOME/.themes/Mint-L-Dark-$choice" -name "index.theme" -type f -exec sed -i 's/'Name=Mint-L-Dark'/'Name=Mint-L-Dark-$choice'/g' {} \;
find "$HOME/.themes/Mint-L-Dark-$choice" -name "index.theme" -type f -exec sed -i 's/'GtkTheme=Mint-L-Dark'/'GtkTheme=Mint-L-Dark-$choice'/g' {} \;
find "$HOME/.themes/Mint-L-Dark-$choice" -name "index.theme" -type f -exec sed -i 's/'MetacityTheme=Mint-L-Dark'/'MetacityTheme=Mint-L-Dark-$choice'/g' {} \;
echo "################################################################"

echo "The themes have been renamed and moved to your home folder"
echo "in the hidden folder .themes"
echo "The folder was created if you did not have one."
echo "If you made a mistake, delete the folders in .themes and run the script again."
echo "Select icon theme with your icon theme manager and enjoy!"
echo
