#build.sh

SDK=$compileEnv

#local run example:SDK=iphoneos5.0

XCODE_PATH=$XCODE_PATH$compileEnv

#local run example:XCODE_PATH=xcodebuild

/usr/libexec/PlistBuddy -c "Set :CFBundleShortVersionString ${NumberVersion}" TIMChat/Info.plist;
/usr/libexec/PlistBuddy -c "Set :CFBundleVersion ${NumberVersion}" TIMChat/Info.plist;

/usr/libexec/PlistBuddy -c "Set :CFBundleShortVersionString ${NumberVersion}" TIMChat/DailyBuild-Info.plist;
/usr/libexec/PlistBuddy -c "Set :CFBundleVersion ${NumberVersion}" TIMChat/DailyBuild-Info.plist;

if [ -e  result ] ;then
rm -r result;
fi
mkdir result

## package begin
set -x
PACKAGE_NAME=IM_iOS_SDK_${MajorVersion}.${MinorVersion}.${FixVersion}
PACKAGE_PATH=result/${PACKAGE_NAME}

mkdir -p ${PACKAGE_PATH}/samples/sample/
cp -rf TIMChat ${PACKAGE_PATH}/samples/sample/
cp -rf TIMChat.xcodeproj ${PACKAGE_PATH}/samples/sample/
cp -rf CommonLibrary ${PACKAGE_PATH}/samples/sample/
cp -rf TIMAdapter ${PACKAGE_PATH}/samples/sample/

mkdir -p ${PACKAGE_PATH}/libs/
cp -rf TIMAdapter/Framework/ImSDK.framework ${PACKAGE_PATH}/libs/
cp -rf TIMAdapter/Framework/QALSDK.framework ${PACKAGE_PATH}/libs/
cp -rf TIMAdapter/Framework/TLSSDK.framework ${PACKAGE_PATH}/libs/
cp -rf TIMAdapter/Framework/IMCore.framework ${PACKAGE_PATH}/libs/
cp -rf TIMAdapter/Framework/IMSDKBugly.framework ${PACKAGE_PATH}/libs/

mkdir -p ${PACKAGE_PATH}/docs/
cp -rf doc/package/* ${PACKAGE_PATH}/

pushd result/
zip -r "${PACKAGE_NAME}.zip" "${PACKAGE_NAME}"
popd

set +x
## package end


$XCODE_PATH -target dailybuild -configuration DailyBuild clean -sdk $SDK

if [ -e  build/DailyBuild-iphoneos/*.ipa ] ;then

cd build/DailyBuild-iphoneos;

cd ..

rm -r *;

cd ..;

fi



#if [ -e  result ] ;then

#rm -r result;

#fi

#mkdir result


currentdate=`date +%Y%m%d`;
appname="TIMChat_v${NumberVersion}_${currentdate}";
$XCODE_PATH -target dailybuild -configuration DailyBuild -sdk $SDK

cp build/DailyBuild-iphoneos/*.ipa result/${appname}.ipa

if ! [ $? = 0 ] ;then
exit 1
fi