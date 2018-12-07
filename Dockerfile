FROM quay.io/quamotion/android-x86-tools AS base

ENV ISO_URL=https://osdn.net/dl/android-x86/android-x86_64-7.1-r2.iso
ENV ISO_FILE=android-x86_64-7.1-r2.iso

WORKDIR /android

# Download the ISO file. You can cache this file locally, to save
# bandwidth
# We don't need the Dockerfile, but COPY fails if there are no files
# to copy (e.g. the iso file doesn't exist). Adding the Dockerfile
# to keep the command happy.
COPY *.iso Dockerfile ./
RUN if [ ! -f $ISO_FILE ]; then wget -nc $ISO_URL -O $ISO_FILE; fi

FROM kubevirt/registry-disk-v1alpha

COPY --from=base /android/*.iso /disk/
