function build
    source build/envsetup.sh
    lunch twrp_cebu-eng
    mka clobber
    mka -j8 recoveryimage
end
