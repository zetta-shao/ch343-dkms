#!/bin/bash
TGTM=`dkms status vmware-host-modules|cut -f1 -d','`
if ! [ -z "${TGTM}" ]; then ./mkmod.sh clean; fi
./mkmod.sh
