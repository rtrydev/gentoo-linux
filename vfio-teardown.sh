#!/bin/bash

virsh nodedev-reattach pci_0000_26_00_1
virsh nodedev-reattach pci_0000_26_00_0

while [ "$(modprobe -r vfio-pci 2>&1)" = "modprobe: FATAL: Module vfio_pci is in use." ]
do
        sleep 2
done


modprobe amdgpu
