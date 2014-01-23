echo -e ""
echo -e ""
echo -e "****************CARBON ROM KITKAT 4.4+****************"
echo -e ""
echo -e ""

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

echo -e ""
echo -e ""
echo -e "Fixing bluetooth..."
echo -e ""
echo -e ""
cd hardware/broadcom/libbt/
git checkout .
patch -p1 < fixbluetooth.diff

echo -e ""
echo -e ""
echo -e "Fixing HW Composer issues..."
echo -e ""
echo -e ""
cd ../../../
cd frameworks/native/
git checkout .
patch -p1 < fixhwcissues.diff

echo -e ""
echo -e ""
echo -e "Fixing A/V issues..."
echo -e ""
echo -e ""
cd ../av/
git checkout .
patch -p1 < fixavissues.diff

echo -e ""
echo -e ""
echo -e "Fixing Chromium..."
echo -e ""
echo -e ""
cd ../../
cd external/chromium_org/
git checkout .
patch -p1 < fixchromiumdisablehwcomposer.diff
cd ../../

echo -e ""
echo -e ""
echo -e "Enabling -O3 Optimization flags and Compiling with linaro..."
echo -e ""
echo -e ""
cd build/
git checkout .
# patch -p1 < enableo3optimization.diff
patch -p1 < enablelinaro.diff
cd ../

echo -e ""
echo -e ""
echo -e "Fixing SystemUI double - day of the week - in notification pulldown..."
echo -e ""
echo -e ""
cd frameworks/base
git checkout .
patch -p1 < fixdoubleday.patch
cd ../../

echo -e ""
echo -e ""
echo -e "Removing GooManager.apk from the build..."
echo -e ""
echo -e ""
cd vendor/carbon
git checkout .
patch -p1 < removegoomanager.patch
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
mka carbon
echo -e ""

# Get elapsed time
res2=$(date +%s.%N)
echo "${bldgrn}Total time elapsed: ${txtrst}${grn}$(echo "($res2 - $res1) / 60"|bc ) minutes ($(echo "$res2 - $res1"|bc ) seconds) ${txtrst}"

# Compilation complete
echo -e ""
echo -e ""
echo -e "****************CARBON ROM KITKAT 4.4+****************"
echo -e ""
echo -e "*********************ENJOY THE ROM********************"
echo -e ""
echo -e ""
