#!/bin/bash

. /.env

mkdir -p .tmp/ reports/

pushd .tmp
  # https://public.cyber.mil/stigs/scap/
  if [ ! -e $STIG_FILE_NAME.xml ]; then
    wget https://dl.dod.cyber.mil/wp-content/uploads/stigs/zip/$STIG_FILE_NAME.zip -O stig.zip
    unzip stig.zip
    rm -f stig.zip
  fi

  # https://public.cyber.mil/stigs/supplemental-automation-content/
  if [ ! -e ansible-$TARGET_OS/enforce.sh ]; then
    mkdir -p ansible-$TARGET_OS
    pushd ansible-$TARGET_OS
      wget https://dl.dod.cyber.mil/wp-content/uploads/stigs/zip/$ANSIBLE_FILE_NAME.zip -O ansible.zip
      unzip ansible.zip
      unzip ${TARGET_OS}STIG-ansible.zip
      rm -f ansible.zip
      rm -f ${TARGET_OS}STIG-ansible.zip
    popd
  fi
popd

oscap info .tmp/$STIG_FILE_NAME.xml

oscap xccdf eval \
  --profile MAC-1_Public \
  --report reports/report-$TARGET_OS-stig.html \
  .tmp/$STIG_FILE_NAME.xml
