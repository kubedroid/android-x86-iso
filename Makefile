docker: android-x86_64-8.1-rc1.iso
	sudo docker build . -t quay.io/quamotion/android-x86-iso:8.1-rc1

android-x86_64-8.1-rc1.iso:
	wget -nc https://osdn.net/dl/android-x86/android-x86_64-8.1-rc1.iso -O android-x86_64-8.1-rc1.iso

run:
	sudo docker run --rm -it quay.io/quamotion/android-x86-iso:8.1-rc1 /bin/bash
