qemu-system-x86_64 \
    -usb -device usb-tablet \
    -nographic \
    -nodefaults \
    -boot d\
    -cdrom /home/rtry/Downloads/virtio-win-0.1.196.iso \
    -drive file=win10,format=raw \
    -enable-kvm \
    -cpu host,+topoext,hv_relaxed,hv_spinlocks=0x1fff,hv_vapic,hv_time \
    -m 16G \
    -name "Win10" \
    -smp 12,sockets=1,cores=6,threads=2 \
    -vga qxl \
    -monitor stdio \
    -device virtio-net,netdev=vmnic -netdev user,id=vmnic,hostfwd=tcp::5555-:3389 \
    -audiodev pa,id=hda,server=/run/user/1000/pulse/native -device ich9-intel-hda -device hda-micro,audiodev=hda \
    $@
