#!/bin/bash

#qemu-system-x86_64 -enable-kvm -m 8G -drive file=win10,if=virtio,format=raw,cache=none -vga none -cpu host,hv_relaxed,hv_spinlocks=0x1fff,hv_vapic,hv_time -smp 12,sockets=1,cores=12,threads=1 -device intel-iommu -machine type=q35 -device vfio-pci,host=26:00.0,x-vga=on,multifunction=on -device vfio-pci,host=26:00.1
#    -device usb-host,vendorid=0x1532,productid=0x0101,id=mouse \
#    -device usb-host,vendorid=0x04f2,productid=0x0833,id=keyboard \
#    $@
#    -drive file=win10,format=raw \
#    -boot d \
#    -cdrom /home/rtry/Downloads/Win10_21H1_Polish_x64.iso \
# -monitor stdio
virsh nodedev-detach pci_0000_26_00_0
virsh nodedev-detach pci_0000_26_00_1

qemu-system-x86_64 \
    -nodefaults \
    -boot d\
    -cdrom /home/rtry/Downloads/virtio-win-0.1.185.iso \
    -drive file=win10,format=raw \
    -enable-kvm \
    -cpu host,+topoext,hv_relaxed,hv_spinlocks=0x1fff,hv_vapic,hv_time \
    -m 16G \
    -name "Win10" \
    -smp 12,sockets=1,cores=6,threads=2 \
    -device vfio-pci,host=26:00.0,x-vga=on,multifunction=on \
    -device vfio-pci,host=26:00.1 \
    -object input-linux,id=kbd,evdev=/dev/input/by-id/usb-SINO_WEALTH_Keyboard-event-kbd,grab_all=true \
    -object input-linux,id=mouse,evdev=/dev/input/by-id/usb-SINOWEALTH_Wired_Gaming_Mouse-event-mouse \
    -vga none \
    -monitor stdio \
    -device virtio-net,netdev=vmnic -netdev user,id=vmnic \
    -audiodev pa,id=hda,server=/run/user/1000/pulse/native -device ich9-intel-hda -device hda-micro,audiodev=hda \
    -device ivshmem-plain,memdev=ivshmem \
    -object memory-backend-file,id=ivshmem,share=on,mem-path=/dev/shm/looking-glass,size=32M \
    -usb -device usb-host,vendorid=0x045e,productid=0x02ea \
    -usb -device usb-host,vendorid=0x0d8c,productid=0x0014 \
    $@

virsh nodedev-reattach pci_0000_26_00_0
virsh nodedev-reattach pci_0000_26_00_1
