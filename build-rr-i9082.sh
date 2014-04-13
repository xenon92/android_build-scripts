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
# patch -p1 < fixhwcissues.diff
# patch -p1 < fixscreenshots.patch
patch -p1 < fix_all_native_hwc_issues.patch

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
echo -e "Using squisher..."
echo -e ""
echo -e ""
cd build
git checkout .
patch -p1 < usesquisher.patch
cd ../

echo -e ""
echo -e ""
echo -e "Patching complete... Review to see if no errors were there.."
echo -e ""
read -p "Press ENTER to continue..."
echo -e ""
echo -e ""


./build-rr.sh
