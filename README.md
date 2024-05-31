Tested compile/install on xubuntu 22.04.4 kernel 6.5.0-35 AMD64, not test it work or not.

Install required package and run:
sudo apt-get install build-essential git dkms
sudo ./mkmod.sh

if run mkmod.sh again and got some problem, try run
sudo ./mkmod.sh clean to clean exist DKMS package and build files.
