FROM ubuntu:kinetic-20220830

# upgrade
RUN apt-get update -y \
  && apt-get upgrade -y

RUN apt-get install -y \
  ssg-base ssg-debderived ssg-debian ssg-nondebian ssg-applications \
  wget unzip \
  libopenscap8
