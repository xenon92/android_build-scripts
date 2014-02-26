# Basic script to compile Slim ROMs

# Get time of startup
res1=$(date +%s.%N)

# Setup environment
echo -e "${bldblu}Setting up environment"
. build/envsetup.sh

# Lunch device
echo -e ""
echo -e "${bldblu}Lunching device i9082"
lunch

echo -e ""
echo -e "${bldblu}Starting compilation ${txtrst}"

# Start compilation
make otapackage -j4
#mka bacon //command not found error
echo -e ""

# Squisher
./vendor/slim/tools/squisher

# Compute elapsed time
res2=$(date +%s.%N)
echo "${bldgrn}Total time elapsed: ${txtrst}${grn}$(echo "($res2 - $res1) / 60"|bc ) minutes ($(echo "$res2 - $res1"|bc ) seconds) ${txtrst}"
