#!/bin/bash
TGTD="ch343"
BRANCH=""
if ! [ -z "${1}" ]; then BRANCH=${1}; fi
if [ "${1}" = "clean" ]; then
  TGTM=$(dkms status ${TGTD}|awk -F'[,|:]' '{print $1}')
  if ! [ -z "${TGTM}" ]; then
    sudo systemctl stop vmware
    TGTS=`echo ${TGTM}|sed 's/\//-/g'`
    sudo dkms uninstall ${TGTM}
    sudo dkms remove ${TGTM}
    sudo modprobe -r ch343
    sudo rm -rf /usr/src/${TGTS}
    sudo depmod -a; exit; fi; exit; fi
echo "branch is: "${BRANCH}
if ! [ -d "${TGTD}" ]; then
git clone https://github.com/WCHSoftGroup/ch343ser_linux.git ${TGTD}
cp -f kmod_Makefile ${TGTD}/Makefile
git config --global --add safe.directory $(pwd)/${TGTD}
cd ${TGTD}
cd ..
fi
sudo make dkms --file=Makefile KVER=$(uname -r) -C ${TGTD}
