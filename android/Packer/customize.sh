#/usr/bin/sh
# Kernel A-Only Installer
# By KeJia

ui_print " "
ui_print "- Install Kernel"
ui_print " "

cd $MODPATH/tools/
chmod +x magiskboot

ui_print "- Extracting 'Boot' Image..."
dd if=/dev/block/by-name/boot of=$MODPATH/boot.img
ui_print "- Unpacking 'Boot' Image..."
./magiskboot unpack $MODPATH/boot.img
ui_print "- Spliting The Kernel Package And Uploading The Kernel..."
./magiskboot split $MODPATH/Image.gz-dtb
ui_print "- Repacking 'Boot' Image..."
./magiskboot repack $MODPATH/boot.img
ui_print "- Flashing 'Boot' Image..."
dd if=new-boot.img of=/dev/block/by-name/boot
ui_print "- Install Successful!"

ui_print " "

ui_print "- Cleaning GPU cache..."
find /data/user_de/*/*/*cache/* -iname "*shader*" -exec rm -rf {} +
find /data/data/* -iname "*shader*" -exec rm -rf {} +
find /data/data/* -iname "*graphitecache*" -exec rm -rf {} +
find /data/data/* -iname "*gpucache*" -exec rm -rf {} +
find /data_mirror/data*/*/*/*/* -iname "*shader*" -exec rm -rf {} +
find /data_mirror/data*/*/*/*/* -iname "*graphitecache*" -exec rm -rf {} +
find /data_mirror/data*/*/*/*/* -iname "*gpucache*" -exec rm -rf {} +
ui_print "- GPU Cache Cleaning Completed."

ui_print " "
