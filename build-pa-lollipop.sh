# Android Compiling Script
#
# This script automates the process of compiling android
# operating system.
#
# Copyright (C) 2014 Shubhang Rathore
#
# This script is specifically for
# Paranoid android Lollipop



# Clear screen
clear



# Patches

# Put the *.patch or *.diff file in the base folder of each indivisual repo
# where the patches need to applied


# Cloning patches
echo -e ""
echo -e "#######################################"
echo -e "#                                     #"
echo -e "#          CLONING PATCHES            #"
echo -e "#                                     #"
echo -e "#######################################"
echo -e ""

git clone https://github.com/xenon92/android_patches.git patches -b pa-lollipop

# If 'patches' folder already exists, pull latest commits for it
cd patches
git pull
cd ..

# Syncing few repos
echo -e ""
echo -e "#######################################"
echo -e "#                                     #"
echo -e "#            SYNCING REPOS            #"
echo -e "#                                     #"
echo -e "#######################################"
echo -e ""

cd packages/apps/SamsungServiceMode
git pull
cd ../../../

cd hardware/samsung
git pull
cd ../../



# Applying patches
echo -e ""
echo -e "#######################################"
echo -e "#                                     #"
echo -e "#          APPLYING PATCHES           #"
echo -e "#                                     #"
echo -e "#######################################"
echo -e ""

# Using a different script to appy ptaches
./patches/apply-patches.sh



# Review the aove patch merges before continuing.
# If any errors, resolve them before moving ahead with the 
# compilation of the ROM.
echo -e ""
echo -e "#######################################"
echo -e "#                                     #"
echo -e "#          PATCHING COMPLETE          #"
echo -e "#                                     #"
echo -e "#      REVIEW & CHECK FOR ERRORS      #"
echo -e "#                                     #"
echo -e "#######################################"
echo -e ""
echo -e ""
echo -e "#######################################"
echo -e "#                                     #"
echo -e "#       PRESS ENTER TO CONTINUE       #"
echo -e "#                                     #"
echo -e "#######################################"
echo -e ""
read -p ""
echo -e ""



# Clear screen
clear


export KBUILD_BUILD_USER="shubhang"
export KBUILD_BUILD_HOST="neon"


# Running the Paranoid Android script
# (replace 'i9082' with your own device)

./rom-build.sh i9082



###### END OF BUILD ######
