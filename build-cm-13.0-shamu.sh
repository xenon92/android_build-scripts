# Android Compiling Script
#
# This script automates the process of compiling android marshmallow
# operating system.
#
# Copyright (C) 2015 Shubhang Rathore
#
# This script is specifically for
# Nexus 6 CyanogenMod 13



# Get time at the start of the build
res1=$(date +%s.%N)


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
source build/envsetup.sh



# Override flags
export KBUILD_BUILD_USER="shubhang"
export KBUILD_BUILD_HOST="xenon92"

export RELEASE_TYPE=NIGHTLY



echo -e ""
echo -e "#######################################"
echo -e "#                                     #"
echo -e "#           LUNCHING DEVICE           #"
echo -e "#                                     #"
echo -e "#######################################"
echo -e ""
# Lunch device
lunch cm_shamu-userdebug


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

