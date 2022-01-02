#!/bin/bash

# ref https://access.redhat.com/documentation/ja-jp/red_hat_enterprise_linux/8/html/security_hardening/scanning-the-system-for-vulnerabilities_vulnerability-scanning

TARGET_OS=ubuntu1604

mkdir -p info/ reports/

ls -al /usr/share/xml/scap/ssg/content > info.txt
ls /usr/share/xml/scap/ssg/content | xargs -I{} oscap info /usr/share/xml/scap/ssg/content/{} >> info.txt

oscap oval eval \
  --report reports/report-$TARGET_OS-oval.html \
  /usr/share/xml/scap/ssg/content/ssg-$TARGET_OS-oval.xml

oscap xccdf eval \
  --profile standard \
  --report reports/report-$TARGET_OS-xccdf.html \
  /usr/share/xml/scap/ssg/content/ssg-$TARGET_OS-ds.xml

# -----------------------------------------------------------------------------
# 
# PCI-DSS for cpe:/o:centos:centos:8
# 
# -----------------------------------------------------------------------------

oscap xccdf eval \
  --profile pci-dss \
  --report reports/report-$TARGET_OS-xccdf.html \
  /usr/share/xml/scap/ssg/content/ssg-$TARGET_OS-ds.xml

# oscap xccdf eval \
#   --profile standard \
#   --report reports/report-centos8-xccdf.html \
#   /usr/share/xml/scap/ssg/content/ssg-centos7-ds.xml

# -----------------------------------------------------------------------------
# 
# STIG for cpe:/a:redhat:openjdk
# 
# -----------------------------------------------------------------------------

oscap oval eval \
  --report reports/report-$TARGET_OS-oval.html \
  /usr/share/xml/scap/ssg/content/ssg-$TARGET_OS-oval.xml

oscap xccdf eval \
  --profile stig \
  --report reports/report-jre-xccdf.html \
  /usr/share/xml/scap/ssg/content/ssg-jre-ds.xml
