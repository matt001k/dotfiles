#!/bin/bash
# Select the Nerd Font from https://www.nerdfonts.com/font-downloads
# Testing with ShellCheck

echo "[-] Download The Nerd fonts [-]"
echo "#######################"
echo "Select Nerd Font"
value()
{
    selection=$1
    echo "Starting download $font_name nerd font"

    if [ "$(command -v curl)" ]; then
        echo "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/$font_name.zip"
        curl -OL "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/$font_name.zip"
        echo "creating fonts folder: ${HOME}/.fonts"
        mkdir -p  "$HOME/.fonts"
        echo "unzip the $font_name.zip"
        unzip "$font_name.zip" -d "/usr/local/share/fonts/$font_name/"
        fc-cache -fv
        echo "done!"

    elif [ "$(command -v wget)" ]; then
        echo "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/$font_name.zip"
        wget "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/$font_name.zip"
        echo "creating fonts folder: ${HOME}/.fonts"
        mkdir -p  "$HOME/.fonts"
        echo "unzip the $font_name.zip"
        unzip "$font_name.zip" -d "/usr/local/share/fonts/$font_name/"
        fc-cache -fv
        echo "done!"

    else

        echo "We cannot find the curl and wget command. First, install the curl and wget command, one of them."

    fi
}
arg=$1
if [ -n "$arg" ]; then
    value $arg
else
    fons_list=("Agave" "AnonymousPro" "Arimo" "AurulentSansMono" "BigBlueTerminal" "BitstreamVeraSansMono" "CascadiaCode" "CodeNewRoman" "ComicShannsMono" "Cousine" "DaddyTimeMono" "DejaVuSansMono" "FantasqueSansMono" "FiraCode" "FiraMono" "Gohu" "Go-Mono" "Hack" "Hasklig" "HeavyData" "Hermit" "iA-Writer" "IBMPlexMono" "InconsolataGo" "InconsolataLGC" "Inconsolata" "IosevkaTerm" "JetBrainsMono" "Lekton" "LiberationMono" "Lilex" "Meslo" "Monofur" "Monoid" "Mononoki" "MPlus" "NerdFontsSymbolsOnly" "Noto" "OpenDyslexic" "Overpass" "ProFont" "ProggyClean" "RobotoMono" "ShareTechMono" "SourceCodePro" "SpaceMono" "Terminus" "Tinos" "UbuntuMono" "Ubuntu" "VictorMono")
    PS3="Enter a number: "
    select font_name in "${fons_list[@]}" "Quit";
     do
        if [ -n "$font_name" ]; then
            value $font_name
        else
            echo "Select the vaild $font_name nerd Font, just type number"
            continue;
        fi
    done
fi
