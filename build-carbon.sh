# Get time of startup
res1=$(date +%s.%N)


# Patches

# Put the *.patch or *.diff file in the base folder of each indivisual repo
# where the patches need to applied

echo -e ""
echo -e ""
echo -e "Applying patches for Galaxy Grand..."
echo -e ""
echo -e ""

./patches/apply-patches.sh


echo -e ""
echo -e ""
echo -e "Fixing Chromium..."
echo -e ""
echo -e ""
cd external/chromium_org/
repo sync .
git am 0*
cd ../../


echo -e ""
echo -e ""
echo -e "Patching complete... Review to see if no errors were there.."
echo -e ""
read -p "Press ENTER to continue..."
echo -e ""
echo -e ""


# Setup environment
echo -e ""
echo -e ""
echo -e "Setting up build environment..."
echo -e ""
echo -e ""
. build/envsetup.sh


# Lunch device
echo -e ""
echo -e ""
echo -e "Lunching device - i9082"
echo -e ""
echo -e ""
lunch carbon_i9082-userdebug


echo -e ""
echo -e ""
echo -e "Starting compilation..."
echo -e ""
echo -e ""


# Start compilation
make carbon -j4
echo -e ""


# Get elapsed time
res2=$(date +%s.%N)
echo "${bldgrn}Total time elapsed: ${txtrst}${grn}$(echo "($res2 - $res1) / 60"|bc ) minutes ($(echo "$res2 - $res1"|bc ) seconds) ${txtrst}"


# Sleep the laptop
sleep 60
~/suspend-laptop.sh
