#!/bin/bash

virsh nodedev-detach pci_0000_26_00_0
virsh nodedev-detach pci_0000_26_00_1

while [ "$(modprobe -r amdgpu 2>&1)" = "modprobe: FATAL: Module amdgpu is in use." ]
do
        sleep 2
done

modprobe vfio-pci
