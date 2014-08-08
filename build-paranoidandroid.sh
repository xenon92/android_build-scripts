# Android Compiling Script
#
# This script automates the process of compiling android
# operating system.
#
# Copyright (C) 2014 Shubhang Rathore
#
# This script is specifically for 
# Paranoid Android Kitkat ROM



# Clear screen
clear



# Patches

# Put the *.patch or *.diff file in the base folder of each indivisual repo
# where the patches need to applied

echo -e ""
echo -e "#######################################"
echo -e "#                                     #"
echo -e "#          APPLYING PATCHES           #"
echo -e "#                                     #"
echo -e "#######################################"
echo -e ""




echo -e ""
echo -e "#######################################"
echo -e "#                                     #"
echo -e "#         PATCHING BLUETOOTH          #"
echo -e "#                                     #"
echo -e "#######################################"
echo -e ""

cd hardware/broadcom/libbt/
git checkout .
patch -p1 < hardware_broadcom_libbt.patch




echo -e ""
echo -e "#######################################"
echo -e "#                                     #"
echo -e "#       FIXING HWCOMPOSER ISSUES      #"
echo -e "#                                     #"
echo -e "#######################################"
echo -e ""

cd ../../../
cd frameworks/native/
git checkout .
patch -p1 < frameworks_native.patch




echo -e ""
echo -e "#######################################"
echo -e "#                                     #"
echo -e "#           FIXING A/V ISSUES         #"
echo -e "#                                     #"
echo -e "#######################################"
echo -e ""

cd ../av/
git checkout .
patch -p1 < frameworks_av.patch




echo -e ""
echo -e "#######################################"
echo -e "#                                     #"
echo -e "#          PATCHING CHROMIUM          #"
echo -e "#                                     #"
echo -e "#######################################"
echo -e ""

cd ../../
cd external/chromium_org/
git checkout .
patch -p1 < external_chromium_org.patch
cd ../../



# echo -e ""
# echo -e ""
# echo -e "Enabling -O3 Optimization flags and Compiling with linaro..."
# echo -e ""
# echo -e ""
# cd build/
# git checkout .
# patch -p1 < enableo3optimization.diff
# patch -p1 < enablelinaro.diff
# cd ../




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
read -p
echo -e ""


# Running the Paranoid Android script
# (replace 'i9082' with your own device)

./rom-build.sh i9082