# Android Compiling Script
#
# This script automates the process of compiling android
# operating system.
#
# Copyright (C) 2014 Shubhang Rathore
#
# This script is specifically for
# CyanogenMod 11



# Get time at the start of the build
res1=$(date +%s.%N)


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

git clone https://xenon92@bitbucket.org/xenon92/android_patches.git patches -b cm-11.0




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


echo -e ""
echo -e "#######################################"
echo -e "#                                     #"
echo -e "#          PATCHING CHROMIUM          #"
echo -e "#                                     #"
echo -e "#######################################"
echo -e ""
cd external/chromium_org/
repo sync .
git am 0*
cd ../../


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


# Remove patches from the source
rm -rf patches


# Clear screen
clear


echo -e ""
echo -e "#######################################"
echo -e "#                                     #"
echo -e "#          BUILD ENVIRONMENT          #"
echo -e "#                                     #"
echo -e "#######################################"
echo -e ""
# Setup environment
. build/envsetup.sh



# Override flags
export KBUILD_BUILD_USER="shubhang"
export KBUILD_BUILD_HOST="neon"

export RELEASE_TYPE=NIGHTLY



echo -e ""
echo -e "#######################################"
echo -e "#                                     #"
echo -e "#           LUNCHING DEVICE           #"
echo -e "#                                     #"
echo -e "#######################################"
echo -e ""
# Lunch device
lunch cm_i9082-userdebug


echo -e ""
echo -e "#######################################"
echo -e "#                                     #"
echo -e "#              COMPILING              #"
echo -e "#                                     #"
echo -e "#######################################"
echo -e ""

# Start compilation
mka bacon
echo -e ""


###### END OF BUILD ######



# Get elapsed time
res2=$(date +%s.%N)
echo "${bldgrn}Total time elapsed: ${txtrst}${grn}$(echo "($res2 - $res1) / 60"|bc ) minutes ($(echo "$res2 - $res1"|bc ) seconds) ${txtrst}"
