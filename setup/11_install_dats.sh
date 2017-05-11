#!/bin/bash

DATS_VER=$1

echo "Getting DATS for TG"
# Get DATS
cd /opt/crucio
rm -rf DATS*
git clone https://github.com/nvf-crucio/DATS
cd DATS
git checkout $DATS_VER

if [ $DATS_VER = f1da5139b2c1a9134abfb6f304c980cd445c9a38 ]
then
	cd ../
	patch -d DATS/tests/ -p1 < /root/pre-config/dats-patchs/common-patchs/patch/dats/adjust-mempool-for-more-rxtx-desc.patch
	cd /opt/crucio/DATS/dats && patch < remote_control.py.patch && cd -
	# Gettign new patchs for DATS
	cd DATS/
	mv tests/prox-configs/ tests/prox-configs.old/
	rm -rf dats-patchs/
	git clone https://github.com/toandd-viosoft/dats-patchs.git
	cp -r dats-patchs/baremetal-patchs/prox-configs/ tests/
	chmod +x dats.py
fi

