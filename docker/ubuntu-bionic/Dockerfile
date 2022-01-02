FROM ubuntu:18.04

# Upgrade
RUN apt-get update -y \
  && apt-get upgrade -y

# For DoD ansible playbook
RUN apt-get install -y software-properties-common \
  && add-apt-repository --yes --update ppa:ansible/ansible \
  && apt-get install -y ansible

# For openscap
RUN apt-get install -y \
  libopenscap8 \
  ssg-base ssg-debderived ssg-debian ssg-nondebian ssg-applications \
  wget unzip
