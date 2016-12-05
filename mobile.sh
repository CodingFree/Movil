adb devices
adb root
echo Remontando...
adb shell su -c "mount -o rw,remount /";
echo "Sobreescribiendo interna"
adb shell su -c "cat /dev/urandom > /sdcard/test";
adb shell su -c "rm /sdcard/test";
echo "Sobreescribiendo externa"
adb shell su -c "cat /dev/urandom > /sdcard1/test";
adb shell su -c "rm /sdcard1/test";
echo "Completado"