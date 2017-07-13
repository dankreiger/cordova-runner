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
shopt -s extglob


cordova_init(){
  echo
  printf "${YELLOW}Please enter your new project directory name:${NC} "
  read dirname
  echo
  printf "${YELLOW}Please enter your app id (e.g. com.company.projectname):${NC} "
  read projectname
  echo
  printf "${YELLOW}Please enter your app's display title (i.e. ProjectName):${NC} "
  read displayname

  echo;echo;echo
  printf "Running ${CYAN}cordova create $dirname $projectname $displayname${NC}..."
  cordova create $dirname $projectname $displayname
  echo;echo
  printf "Running ${GREEN}Done"

  printf "${CYAN}cordova create $dirname $projectname $displayname${NC}..."
  cp -r !($dirname) $dirname/www/
  cd $dirname
  cordova_setup
}


cordova_setup(){
  echo
  clear
  printf "${CYAN}${cordova_title}${NC}"
  printf "${YELLOW}${cordova_description}${NC}\n\n"

  PS3="$prompt"
  select opt in "${cordovaopts[@]}"; do
    case "$REPLY" in
      1 ) init_android_and_ios; break;;
      2 ) init_android; break;;
      3 ) init_ios; break;;
      4 ) break;;
      *) echo "Invalid option. Please enter 1, 2, 3, or 4.";continue;;
    esac
  done
}

# cordova version needed for CLI
# https://stackoverflow.com/questions/42668185/could-not-find-gradle-wrapper-within-android-sdk-might-need-to-update-your-andr
init_android_and_ios(){
  echo
  cordova platform rm android ios
  cordova platform add android@6.2.2
  cordova platform add ios
  android_environment_menu
  launch_xcode
}

init_android(){
  echo
  cordova platform rm android
  cordova platform add android@6.2.2
  android_environment_menu
}

android_environment_menu(){
  echo
  printf "\n${BORDER}\n\n${CYAN}Would you like to build for android for development or release?${NC}\n\n"
  PS3="$prompt"
  select opt in "${androidopts[@]}"; do
    case "$REPLY" in
      1 ) setup_android_development; break;;
      2 ) setup_android_release; break;;
      3 ) break;;
      *) echo "Invalid option. Please enter 1, 2, or 3.";continue;;
    esac
  done
}

init_ios(){
  echo
  cordova platform rm ios
  cordova platform add ios
  launch_xcode
}

launch_xcode(){
  echo
  open platforms/ios/$displayname.xcodeproj
  if [ $? -eq 0 ]; then
    echo;echo
    echo 'Welcome to Halosonic App iOS'
    printf "${BORDER}\nPlease do your development and release builds inside of XCode\n"
    echo
    echo "XCode instructions: "
    echo
    echo "First time:"
    printf "\n\t- On the top menu bar click Xcode > Preferences > Accounts"
    printf "\n\t- Login to your account"
    printf "\n\t- Click on your account, and in the details section click 'Download all profiles'"
    echo "- Choose your device"
    echo "- Assign the signing team to your profile"
    echo "- Hit the play button to run the app in development"
    echo
  else
    echo 'Something went wrong. Please check your logs.'
    echo 'Please make sure that XCode is installed and that you have valid signing certificates'
    echo;echo
  fi
}


setup_android_development(){
  echo

  cordova run android # cordova run dev build

  if [ $? -eq 0 ]; then
    echo;echo
    echo 'Welcome to your android app'
    echo;echo
  else
    echo 'Something went wrong. Please check your logs.'
    echo 'It might be that you have no android device attached or that you do not have an android emulator installed.'
    printf "run adb devices to make sure you have an authorized device attached, or install an android emulator from Android studio."
    echo;echo
  fi
}

setup_android_release(){
  echo
  read -p "Have you updated the version number in 'config.xml' and 'package.json'? [y/n] " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]
    then

      cordova build android --release # build android release apk file

      if [ $? -eq 0 ]; then
        printf "${GREEN}Release apk has been built.${NC}\n\n"
        echo "Please the new release apk in platforms/build/outputs/apk/android-release.apk to the Google Play Store\n"
        echo;echo;
      else
        echo 'Something went wrong. Please check your logs.'
        echo 'It might be that you have no android device attached or that you do not have an android emulator installed.'
        printf "run ${CYAN}adb devices${NC} to make sure you have an authorized device attached, or install an android emulator from Android studio."
        echo
      fi
    else
      printf "Please update the version number in ${YELLOW}config.xml${NC} and ${YELLOW}package.json${NC}\n"
      echo "Afterwards, do ${CYAN}npm run cordova-android-release${NC} to return to this menu."
    fi
}



clear
echo;echo
printf "${CYAN}Welcome to Cordova App Builder${NC}";echo;echo


cordova_init
