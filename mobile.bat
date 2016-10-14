adb devices
adb root
adb shell su -c "mount -o rw,remount /";
adb shell su -c "cat /dev/urandom > /sdcard/test";
adb shell su -c "rm /sdcard/test";
adb shell su -c "cat /dev/urandom > /sdcard1/test";
adb shell su -c "rm /sdcard1/test";