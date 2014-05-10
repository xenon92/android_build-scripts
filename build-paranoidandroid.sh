# Build script to compile Paranoid Android 4.0 ROM

clear

echo -e ""
echo -e ""
echo -e "****************  PARANOID ANDROID  ****************"
echo -e ""
echo -e ""


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
patch -p1 < hardware_broadcom_libbt.patch

echo -e ""
echo -e ""
echo -e "Fixing HW Composer issues..."
echo -e ""
echo -e ""
cd ../../../
cd frameworks/native/
git checkout .
patch -p1 < frameworks_native.patch

echo -e ""
echo -e ""
echo -e "Fixing A/V issues..."
echo -e ""
echo -e ""
cd ../av/
git checkout .
patch -p1 < frameworks_av.patch

echo -e ""
echo -e ""
echo -e "Fixing Chromium..."
echo -e ""
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

echo -e ""
echo -e ""
echo -e "Patching complete... Review to see if no errors were there.."
echo -e ""
echo -e ""
echo -e ""
read -p "Press ENTER to continue building the ROM..."
echo -e ""
echo -e ""


# Running the Paranoid Android script
# (replace 'i9082' with your own device)

./rom-build.sh i9082