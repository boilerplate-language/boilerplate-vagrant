#!/bin/bash

apt-get update -y
apt-get upgrade -y

# For DoD ansible playbook
apt-get install -y software-properties-common
add-apt-repository --yes --update ppa:ansible/ansible
apt-get install -y ansible

# For openscap
apt-get install -y \
  ssg-base ssg-debderived ssg-debian ssg-nondebian ssg-applications \
  libopenscap8 \
  wget unzip
