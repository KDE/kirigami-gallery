# Kirigami Gallery

Example application 

## Build on Android:
Make sure to install **android-sdk**, **android-ndk** and **android-qt5-arch**, where **arch** should be the same architecture that you aim to deploy.
```sh
mkdir build
cd build
cmake .. \
    -DQTANDROID_EXPORTED_TARGET=kirigami2gallery \
    -DANDROID_APK_DIR=./src/ \
    -DECM_DIR=/path/to/share/ECM/cmake \
    -DCMAKE_TOOLCHAIN_FILE=/usr/share/ECM/toolchain/Android.cmake \
    -DECM_ADDITIONAL_FIND_ROOT_PATH=/path/to/Qt5.X.0/5.X/{arch} \
    -DCMAKE_PREFIX_PATH=/path/to/Qt5.X.0/5.X/{arch}/path/to/Qt5Core \
    -DANDROID_NDK=/path/to/Android/Sdk/ndk-bundle \
    -DANDROID_SDK_ROOT=/path/to/Android/Sdk/ \
    -DANDROID_SDK_BUILD_TOOLS_REVISION=26.0.2 \
    -DCMAKE_INSTALL_PREFIX=/path/to/dummy/install/prefix
```

You need a `-DCMAKE_INSTALL_PREFIX` to somewhere in your home, but using an absolute path.

If you have a local checkout of the breeze-icons repo, you can avoid the cloning of the build dir
by passing also `-DBREEZEICONS_DIR=/path/to/existing/sources/of/breeze-icons`

```
make create-apk-kirigami2gallery
```

`./kirigami2gallery_build_apk/build/outputs/apk/kirigami2gallery_build_apk-debug.apk` will be generated

To directly install on a phone:
```
adb install -r ./kirigami2gallery_build_apk/build/outputs/apk/kirigami2gallery_build_apk-debug.apk
```
To perform this, your device need to be configureted with `USB debugging` and `install via USB` in `Developer options`.

> Some ambient variables must be set before the process: `ANDROID_NDK`, `ANDROID_SDK_ROOT`, `Qt5_android` and `JAVA_HOME`
```
export ANDROID_NDK=/path/to/android-ndk
export ANDROID_SDK_ROOT=/path/to/android-sdk
export Qt5_android=/path/to/android-qt5/5.X.0/{arch}
export PATH=$ANDROID_SDK_ROOT/platform-tools/:$PATH
# adapt the following path to your ant installation
export ANT=/usr/bin/ant
export JAVA_HOME=/path/to/lib/jvm/java-8-openjdk/
```
