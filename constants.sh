#!/bin/bash


GREEN='\033[0;32m';
YELLOW='\033[1;33m';
CYAN='\033[0;36m';
NC='\033[0m'; # No Color
BORDER=$(printf '=%.0s' {1..42});


cordova_title=$( echo;echo;printf ${NC}$BORDER;printf "\n\tCordova Setup\n";echo $BORDER; echo )
cordova_description=$( printf "\n\nPlease make sure you have Android Studio and XCode installed\n" )
cordovaopts=(
"Setup Android and iOS"
"Setup Android"
"Setup iOS"
"Exit Cordova Setup"
)
androidopts=(
"Development"
"Release"
"Exit"
)
os_opts=(
"Mac OS X"
"Linux"
"Windows"
)

platforms=(
"Android"
"iOS"
"Exit"
)

prompt=$(printf "\nPick an option and press [enter]: ")
